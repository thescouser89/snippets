# EJB 3
Three types of EJB components:
- Session beans
- Message-driven beans
- Entities

Session and message-driven beans are used to implement business logic in an EJB
application, and entities are used for persistence.

# Example Program
ActionBazaar -> bidding on an item and ending with ordering the item won.

The bidding and ordering processes are implemented as session beans
(PlaceBidBean and PlaceOrderBean), and the billing process is implemented as an
MDB since it is triggered by a message sent from PlaceOrderBean instead of a
direct user request.

All three of the processes persist data. The PlaceBidBean needs to add a bid
record to the database. Similarly, the PlaceOrderBean must add an order record.
Alternatively, the OrderBillingMDB updates the order record to reflect the
results of the billing process.

These database changes are performed through two entities in the JPA-managed
persistence tier - the Bid and Order entities. While the PlaceBidBean uses the
Bid entity, the PlaceOrderBean and OrderBillingMDB use the Order entity.

# Stateless beans
They are used to model actions or processes that can be done in one shot, such
as placing a bid on an item in our ActionBazaar scenario.

```java
import javax.ejb.Stateless;

@Stateless
public class PlaceBidBean implements PlaceBid {
    public Bid addBid(Bid bid) {
        return save(bid);
    }
}

// In another file...
import javax.ejb.Local;

@Local
public interface PlaceBid {
    Bid addBid(Bid bid);
}
```

From StackOverflow, difference between @Local and @Remote:
```
In the initial versions of the EJB specification, EJBs were "assumed" to be
remote components and the only way to invoke them was to make a remote call,
using RMI semantics and all the overhead it implies (a network call and object
serialization for every method call). EJB clients had to pay this performance
penalty even when collocated in the same virtual machine with the EJB
container.

Later, Sun realized most business applications were actually not distributing
EJBs on a different tier and they fixed the spec (in EJB 2.0) by introducing
the concept of Local interfaces so that clients collocated in the same virtual
machine with the EJB container can call EJBs using direct method invocation,
totally bypassing RMI semantics (and the associated overhead).
```

@Local annotation tells the container that the PlaceBid EJB can be accessed
locally through the interface.

Servlet code:
```java
import javax.ejb.EJB;
public class PlaceBidServlet extends HttpServlet {
    @EJB
    private PlaceBid placeBid;
    public void service(...) {
        ...
        placeBid.addBid(bid);
    }
}
```
The @EJB annotation works in any component that is registered with the Java  EE
container, usch as a servlet or JSF backing bean.

# Stateful beans
Statefull session beans guarantee that a client can expect to set the internal
state of a bean and count on the state being maintained between any number of
method calls.

PlaceOrderBean:: add items to order -> Specify shipping info -> Specify billing
info -> Review and confirm order <== Needs to be stateful

```java
@Stateful
public class PlaceOrderBean implements PlaceOrder {
    ...
    @Remove
    public Long confirmOrder() {
        ...
    }
}

// interface
@Remote
public interface PlaceOrder {
    ...
}
```

With @Remove, we tell the container that there is no longer a need to maintain
the bean's session with the client after the confirmOrder method is invoked. If
we didn't tell the container what method invocation marks the end of the
workflow, the container could wait for a long time until it could safely
time-out the session.

# MDB
MDBs process indirect messages. Messaging has numerous uses, including system
integration, asynchronous processing, and distributed system communication.
Messaging involves communication between two separate processes, usually across
different machines.

Java EE makes messaging robust by adding a reliable middleman between the
message sender and receiver. The reliable middleman is called a messaging
destination, powered by message-oriented middleware. Java EE standardizes
messaging through a well-known API, JMS, upon which MDBs are heavily dependent.


The PlaceOrderBean accomplishes aynchronous or 'out-of-process' order billing by
generating a message in the confirmOrder method to request that the order
billing be started in parallel. As soon as this billing request message is sent
to the messaging middleman, the confirmOrder method returns with the order
confirmation to the user.

```java
import javax.jms.*;
import javax.ejb.Stateful;
import javax.ejb.Remove;
import javax.annotation.Resource;

@Stateful
public class PlaceOrderBean implements PlaceOrder {
    @Resource(name="jms/QueueConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(name="jms/OrderBillingQueue")
    private Destination billingQueue;
    ...
    @Remove
    public Long confirmOrder() {
        ...
        billOrder(order);
    }

    private billOrder(Order order) {
        try {
            Connection connection = connectionFactory.createConnection();
            Session session = connection.createSession(false,
                                Session.AUTO_ACKNOWLEDGE);
            MessageProducer producer = session.createProducer(billingQueue);
            ObjectMessage message = session.createObjectMessage();
            message.setObject(order);
            producer.send(message);
            producer.close();
            session.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```
The end result of the code is that the newly created Order object is sent as a
message to a JMS destination named jsm/OrderBillingQueue. The name parameter
values specify what resources are bound to the EJB's environment naming context.
Then the PlaceOrderBean establishes a connection to the JMS provider, and
creates a session and a message producer.

Messageproducer.send does not wait for a receiver to receive the message on the
other end. Because the messaging server guarantees that the message will be
delivered to anyone interested in the message, this is just fine. The ordering
bean doesn't even know who picks up and processes its message; it simply knows
the message destination!

Place Order stateful EJB --> Order Billing Queue --> Order Billing MDB

OrderBillingMDB's sole purpose is to attempt to bill the bidder for the total
cost of an oder, including the price of the items in the order, shipping,
handling, insurance costs. The Order object passed inside the message sent by
the PlaceOrder EJB contains a BillingInfo object. This object tells
OrderBillingMDB how to bill the customer. The MDB notifies both the bidder and
seller of the results of the billing attempt.

```java
import javax.ejb.MessageDriven;
import javax.ejb.ActivationConfigProperty;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;

@MessageDriven(
    activationConfig = {
        @ActivationConfigProperty(
            propertyName="destinationName",
            propertyValue="jms/OrderBillingQueue")
    }
)
public class OrderBillingMDB implements MessageListener {
    public void onMessage(Message message) {
        try {
            ObjectMessage objectMessage = (ObjectMessage) message;
            Order order = (Order) objectMessage.getObject();

            // check bill information
        }
    }
}
```
Like stateless beans, MDBs are not guaranteed to maintain state. Instead of
implementing a remote or local business interface, MDBs implement the
javax.jms.MessageListener interface.

# JPA
The PlaceBid EJB's addBid method references the hidden save method to persist
the Bid object to the database.

```java
@Entity
@Table(name="BIDS")
public class Bid implements Serializable {
    ...
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="BID_ID")
    public Long getBidID() {
        return bidID;
    }
}
```

The @Entity annotation signifies the fact that the Bid class is a JPA entity.

Let's see the save method in PlaceBidBean now...
```java
@PersistenceContext(unitName="actionBazaar")
private EntityManager entityManager;

private Bid save(Bid bid) {
    entityManager.persist(bid);
    return bid;
}
```

The theory behind session beans centers on the idea that each request by a
client to complete a distinct business process is completed in a session. A
session is a connection between a client and a server that lasts for a finite
period of time.

A typical stateful application is the module that a bidder uses to register
himself in the ActionBazaar application.

Session beans are the only EJB components that are invoked directly by clients.
A client can be a web application component (servlet, JSP, JSF, etc), a
command-line application, or a Swing GUI desktop application.

What makes session beans special?

Because session beans are specifically meant to handle client requests, they
must support a high degree of concurrency safely and robustly.

Timer services are EJB's version of lightweight application schedulers. Those
services allow us to easily turn a session bean into a recurring or nonrecurring
scheduled task.

Session bean alternative is Spring.

# Session beans: the basics
## Anatomy
