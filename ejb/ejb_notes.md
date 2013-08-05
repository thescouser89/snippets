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

