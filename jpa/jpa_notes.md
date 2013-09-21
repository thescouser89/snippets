To turn your class into an Entity that can be persisted, you need to annotate
the class with `@Entity`. It is just a marker annotation to indicate to the
presistence engine that the class is an entity.

Second annotation that we need to add is `@Id`.


```java
@Entity
class Emplyee {
    @Id private int Id;
    ...
}
```

User can annotate either the field or the getter method.

The fields in the entity are automatically made persistable by virtue of their
existence in the entity. Default mapping and loading configuration values apply
to these fields and enable them to be persisted when the object is persisted.

You might ask where did the fields get mapped, and where does it get persisted
to?

@Entity can take a name parameter

`@Entity(name="Emp")`

In practice this is seldom specified because it gets defaulted to be the
unqualified  name of the entity class.

The default name of the table used to store any given entity type is the name of
the entity. If we have specified the name of the entity, that will be the
default table name; if we have not, the default value of the entity will be used.

So it will be stored in table EMPLOYEE.

When no columns are explicitly specified, the default column is used for a field
of for a property, which is the name of the field or property itself.


## Entity Manager
An API call needs to be invoked before an entity actually gets persisted to the
database. This API is implemented by the entity manager and encapsulated almost
entirely within a single interface calssed EntityManager. Until an entity
manager is used to actually create, read, or write an entity, the entity is
nothing more than a regular Java object.

When an entity manager obtains a reference to an entity, the object is said to
be managed by the entity manager.

The set of managed entity instances within an entity manager at any given time
is called its persistence context. Only one Java instance with the same
persistent identity may exist in a persistence context at any time. For example,
if an Employee with a persistent identity of 158 exists in the persistence
context, then no other Employee object with its id set to 158 may exist within
that same persistence context.

Entity mangers are configured to be able to persist or mange objects, read, and
write to a given database, and be implemented by a particular persistence
provider.

It is the provider that supplies the backing implementation engine for the
entire Java Persistence API.


All entity managers come from the factories of type `EntityManagerFactory`. The
configuration for an entity manager is templated from the `EntityManagerFactory`
that created it, but it is defined seperately as a persistence unit.

Persistence units are named to allow differentiation of one EntityManagerFactory
from another.

Persistence creates EntityManagerFactory (configured by persistence unit) --> EntityManger


## Obtaining an Entity Manager
```java
EntityManagerFactory emf =
        Persistence.createEntityManagerFactory("EmployeeService")

EntityManager emf = emf.createEntityManager();

// to persist
Employee emp = new Employee(158);
em.persist(emp);

// to find
Employee emp = em.find(Employee.class, 158);

// to remove
Employee emp = em.find(Employee.class, 158);
em.remove(emp);

// update an entity
Employee emp = em.find(Employee.class, 158);
emp.setSalary(emp.getSalary() + 1000);
// we don't ask the entity manager to save it, persistence provider tracks those
// changes
```

Name of persistence unit is "EmployeeService".

## Transactions
```java
em.getTransaction().begin();
createEmployee(158, "John Doe", 45000);
// this create a new employe object, then calls em.persist
em.getTransaction().commit();
```

## Queries
Java Persistence Query Language (JPQL)

A query is implemented in code as a Query or TypedQuery object. They are
constructed useing the EntityManager as a factory.

A query can be defined either statically or dynamically. A static query is
defined in either annotation or XML metadata.

A dynamic query can be issued at runtime by supplying the JPQL query criteria.

```java
TypedQuery<Employee> query = em.createQuery("SELECT e FROM Employee e", Employee.class);

List<Employee> emps = query.getResultList();
```

## Persistence Unit
Put it in persistence.xml

```xml
<persistence>
    <persistence-unit name="EmployeeService"
                    transaction-type="RESOURCE_LOCAL">
        <class>examlpes.model.Employee</class>
        <properties>
            <property name="javax.persistence.jdbc.driver"
                value="org.apache.derby.jdbc.ClientDriver"/>
            <property name="javax.persistence.jdbc.url"
                value="jdbc:derby://localhost:1527/EmpServDB;create=true'/>"
            <property name="javax.persistence.jdbc.user" value="APP"/>
            <property name="javax.persistence.jdbc.password" value="APP"/>
        </properties>
</persistence>
```


# Enterprise Applications

Session, MD beans, and entities beans.

Most of the container services available to session beans are also available to
servlets. As a result, many web apps today sidestep EJBs entirely, going
directly from servlets to the database.

## Session beans
Designed to encapsulate business services.

:: Stateless :: Stateful :: Singleton

Interaction with a stateless session bean begins at the start of a business
method call and ends when the method call completes.

Business operations on a stateful session bean can maintain state on the bean
instance across calls.

Singleton session beans => all clients share the same singleton bean instance.
State on a singleton session bean also raises issues of concurrency that need to
be taken into consideration when deciding whether or not to use this stype of
session bean.

Clients never interact directly with a session bean instance. Acts as a  proxy.
This decoupling of client from bean allows the server to intercept method calls
in order to provide the services required by the bean, such as transaction
management.

## Defining a stateless session bean

A session bean is defined in two parts

- zero or more business interfaces that define what methods a client can invoke
  on the bean

- a class that implements these interfaces, called the bean class, which is
  marked with the @Stateless annotation.

When the server encounters the @Stateless annotation, it knows to treat the bean
class as a session bean. It will configure the bean in the EJB container and
make it available for use by other components in the application. @Stateless is
defined in javax.ejb or javax.annotation

e.g
```java
public interface HelloService {
    public String sayHello(String name);
}

@Stateless
public class HelloServiceBean implements HelloService {
    public String sayHello(String name) {
        return "Hello, " + name;
    }
}
```

The no-interface was introduced in EJB 3.1 to make it simpler to define a local
session bean and for clients to access local session beans.
No-interface view is available only for local session beans.

Caveats:
- Needs a no-arg constructor
- Static fields should not be used, because of bean redeployment issues


## Lifecycle callbacks
The server decides when to create and remove bean instances. The application has
no control over when or even how many instances of a particular stateless
session bean are created or how long they will stay around.

To allow both the server and the bean to achieve their initialization
requirements, EJBs support lifecycle callback methods that are invoked by the
server at various points in the bean's lifecycle.

For stateless session beans: PostConstruct, PreDestroy

Server will invoke PostConstruct as soon as it has completed initializing all
the container services for the bean. It replaces the constructor.
Server invokes PreDestroy callback immediately before the server releases the
bean instance to be garbage-collected. Any resources that require explicit
shutdown should be released during PreDestroy.

## Remote Business interfaces
So far, we have only discussed session beans that use a local business
interface. Local in this case means that a dependency on the session bean can be
declared only by JavaEE components that are running together in the same
application server instance. It is not possible to use a session bean with a
local interface from a remote client, for example.

Marking an interface as being remote is equivalent to habing it extend the
`java.rmi.Remote` interface. The reference to the bean that gets acquired by a
client is no longer a local reference on the server but a Remote Method
Invocation stub that will invoke operations on the session bean from across the
network.

Making an interface remote has consequences both in terms of performance and how
arguments to business methods are handled. It might result in network overhead.

Arguments to methods on remote interfaces are also passed by value instead of
passed by reference.

## Stateful session beans
Sometimes  clients need to issue multiple requests to a servic and have each
request be able to access or consider the results of previous requests. Stateful
session beans are designed to handle this scenario by providing a dedicated
service to a client that starts when the client obtains a reference to the bean
and ends only when the client chooses to end the conversation.

Example is the shopping cart of an e-commerce application. Over the span of the
user session, the client adds or removes items from the shopping cart, which
maintains state specific to the client. Then, when session is complete, the
client completes the purchase, causing the shopping cart to be removed.

Stateful session beans offer a superset of functionality available in stateless
session beans. Features in stateless session beans such as remote interfaces
apply equally to stateful session beans.


### Defining a stateful session bean

```java
public interface ShoppingCart {
    public void addItem(String id, int quantity);
    public void removeItem(String id, int quantity);
    public Map<String, Integer> getItems();
    public void checkout(int paymentId);
    public void cancel();
}

@Stateful
public class ShoppingCartBean implements ShoppingCart {
    private HashMap<String, Integer> items = new HashMap<String, Integer>();

    public void addItem(String item, int quantity) {
        Integer orderQuantity = items.get(item);

        if(orderQuantity == null) {
            orderQuantity = 0;
        }

        orderQuantity += quantity;
        items.put(item, orderQuantity);
    }
    // ...

    @Remove
    public void checkout(int paymentId) {
        // store items to database
    }

    @Remove
    public void cancel() {}
}
```

Methods marked with @Remove will be used to end the conversation with the bean.
After one of these methods has been called, the server will destroy the bean
instance, and the client reference will throw an exception if any further
attempt is made to invoke business methods. Every stateful session bean must
define at least one method marked with the @Remove annotation.

### Lifecycle Callbacks
Stateful session beans have two additional callbacks to allow the bean to
gracefully handle passivation and activation of hte bean instance.

Passivation is the process by which the server serializes the bean instance so
that it can either be store offline to free up resources or replicated to
another server in a cluster.

Activation is the process of deserializing a passivate sesison bean instace and
making it active in the server again.

Passivation allows the server to reclaim resources while preserving the session
state.

Before a bean is passivated, the server will invoke the PrePassivate callback.
The bean uses this callback to prepare the bean for serialization, usually by
closing any live connections to other server resources. The PrePassivate method
is identified by the @PrePassivate marker annotation.

After a bean is activated, the server will invoke the PostActivate callback. The
bean must reacquire any connections to other resources that the business methods
of the bean might be depending on. Identified by the @PostActivate marker annotation.


## Singleton session beans
Two of the most common criticisms of the stateless session bean have been the
perceived overhead of bean pooling and the inability to share state via static
fields.

Singleton session bean attempts to provide a solution to both concerns, by
providing a single shared bean instance that can both be accessed concurrently
and used as a mechanism for shared state.


They share the same lifecycle callbacks as a stateless session bean.

Singleton can be created eagerly during application initializaion and exist
until the application shuts down. Once created, it will continue to exist until
the container removes it, regardless of any exceptions that occur during
business method execution.

The long life and shared instance of the singleton session bean make it the
ideal place to store common application state, whether read-only or read-write.

To safeguard access to this state, the singleton session bean provides a number
of concurrency options depending on the needs of the application developer.
Methods can be completely unsynchronized for performance, or automatically
locked and managed by the container.

```java
@Singleton
public class HitCounter {
    int count;
    public void increment() { ++count; }
    public void getCount() { return count; }
    public void reset() { count = 0; }
}
```

Unlike stateless session bean, there is state in the form of the count field.
But unlike the stateful session bean, there is no @Remove annotation to identify
the business methods that will complete the session.

By default, the container will manage the synchronization of the business
methods to ensure that data corruption does not occur. That means all access to
the bean is serialized so that only one client is invoking a business method on
the instance at any time.

Lifecycle it tied to the lifecycle of the overall application. The container
determines the point when the singleton isntance gets created unless the bean
includes the @Startup annotation to force eager initialization when the
application starts.

When multiple singleton session beans depend on one another, the container needs
to be informed of the order in which they should be instantiated. This is
accomplished via the @DependsOn annotation on the bean class, which lists the
names of other singleton session beans that must be created first.

Lifecycle callbacks for singleton session beans are the same as for stateless
session beans.

### Singleton Concurrency
Singleton session beans can use container-managed or bean-managed concurrency.
The default is container-managed, which corresponds to a write lock on all
business methods. All business methods are serialized so that only one client
can access the bean at any given time.

Of course, not all business methods change the sate of the bean. Those that do
not can be safely run in a concurent fashion without affection the overall
integrity of the bean. If there is not danger of corrupting the bean state
through concurrent access, the @Lock(LockType.READ) annotation can be used to
declare that such access is safe and places a read lock on the method.

If placed on the bean class, @Lock(LockType.READ) switches the default business
method behaviour from write locks to read locks. If placed on a business method,
it overrides the class default. For beans that default to read locks,
@Lock(LockType.WRITE) can be used on business methods to override the default
behaviour and gain write lock semantics.

Developers should always use the @Lock annotation and avoid the synchronized
keyword.

Conceptually, the bean can be thought of as having a single lock on the
instance. Multiple readers are allowed to proceed concurrently, but as soon as a
write lock is acquired, all other clients block until the write operation completes.

For those who wish to have fine-grained control over concurrency, the singleton
bean can be configured to use bean-managed concurrency via the:
`@ConcurrencyManagement(ConcurrencyManagentType.BEAN)` annotation on that bean class.

This disables the container-managed concurrency and relies on the developer to
use the appropriate Java concurrency primitives to ensure data safety. The @Lock
annotation has no effect for bean-managed concurrency.

Case when it is useful: when singleton session bean has no state, bean-managed
concurrency will yield better performance.


## Message-Driven Beans

So far we have been looking at components that are typically synchronous in
nature. Client invokes a method through the business interface, and the server
completes that method invocation before returning control to the client.

However, in some cases, it is not necessary for the client to wait for a
response from the server. We want the client to be able to issue a request and
continue while the server processes the request asynchronously.

The MDB is the EJB component for asynchronous messaging. Clients issue requests
to the MDB using a messaging system such as JMS. These requests are queued and
eventually delivered to the MDB by the server. The server invokes the business
interface of the MDB whenever it receives a message sent from a client.

### Defining a Message-Driven Bean
When defining a session bean, the developer usually creates a business
interface, and the bean class implements it. In the case of MDBs, the bean class
implements an interface specific to the messaging system the MDB is based on.
For JMS message-driven beans, the business interface is
javax.jms.MessageListener, which defines a single method: onMessage().

The @MessageDriven annotation marks the class as an MDB. The activation
configuration properties, defined using the @ActivationConfigProperty
annotations, tell the server the type of messaging system and any configuration
details required by that system. The MDB will be invoked only if the JMS message
has a property named RECIPIENT in which the value is ReportProcessor.

Whenever the server receives a message, it invokes the onMessage() method with
the message as the argument. Because there is no synchronous connection with a
client, the onMessage() method does not return anything.

```java
@MessageDriven(
        activationConfig = {
            @ActivationConfigProperty(propertyName="destinationType",
                                      propertyValue="javax.jms.Queue"),
            @ActivationConfigProperty(propertyName="messageSelector",
                                      propertyValue="RECIPIENT='ReportProcessor'")
        })
public class ReportProcessorBean implements javax.jms.MessageListener {
    public void onMessage(javax.jms.Message message) {}
}
```

## Servlets
Servlets are the oldest and most popular technology introduces as part of the
JavaEE platform. They are the foundation for technologies such as JSP and the
backbone of web frameworks such as JSF.

Because of its reliance on the HTTP protocol, the Web is inehrently a stateless
medium.

Servlets solve the problem of conversational state with the session. Not to be
confused with the session bean, the HTTP session is a map of data associated
with a session id. When the application requests that a session be created, the
server generates a new id and returns an HTTPSession object that the application
can use to store key/value pairs of data. It then uses techniques such as
browser cookies to link the session id with the client, trying the two together
into a conversation.

Using the HTTP session effectively is an important element of servlet
development.  Assuming the user has logged in, the servlet stores the user id in
the session, making it available for use in all subsequent requests by the same
client.

```java
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            String userId = request.getParamenter("user");
            HttpSession session = request.getSession();
            session.setAttribute("user", userId)
        }
}
```

## Dependency Management
Business logic of a JavaEE component is not always self-contained. The
implementation depends on toher resources hosted by the application server. This
might include JDBC data source, or JMS message queue, or application-defined
resources such as a session bean or entity manager for a specific persistence unit.

To manage these dependencies, Java EE components support the notion of referencs
to resources that are defined in metadata for the component.

A reference is a named link to a resource that can be resolved dynamically at
runtime from within application code or resolved automatically by the container
when the component instance is created.

A reference consist of two parts, a name and a target. The name is used by
application code to resolve the reference dynamically, whereas the server uses
target information to find the resource teh application is looking for.

The type of resource to be located determines the type of information required
to match the target.

A reference is declared using one of those annotations: @Resource, @EJB,
@PersistenceContext, or @PersistenceUnit. These annotations can be placed on a
class, field, or setter method. The choice of location determines the default
name of the reference, and whether or not the server resolves the reference automatically.

### Dependency Lookup
First strategy for resolving dependencies in application code is callded
dependency lookup. Traditional form of dependency management in Java EE, in
which the application code is responsible for using the Java Naming and
Directory Interface (JNDI) to look up a named reference.

All the resource annotations support an attribute called `name` that defines the
name of the reference.

When the resource annotation is placed on the class definition, this attribute
is mandatory. If the resource annotation is placed on a field or a setter
method, the server will generate a default name.

When using dependency lookup, annotations are typically placed at the class
level, and the name is explicitly specified.

Role of the name is to provide a way for the client to resolve the reference
dynamically. Every Java EE application server supports JNDI, and each component
has its own locally scoped JNDI naming context called the environment naming context.

The name of the reference is bound into the environment naming context, and when
it is looked up using the JNDI API, the server resolves the reference and
returns the target of the reference.

e.g

DeptServiceBean has declared a dependency on a session bean using the @EJB
annotation and give it the name audit. The `beanInterface` element of the @EJB
annotation references the business interface of the session bean that the client
is interested in.

In the PostConstruct callback, the audit bean is looked up and stored in the
audit field.

The Context and InitialContext interfaces are both defined by hte JNDI API.

The prefix "java:comp/env/" that was added to the reference name indicates to
the server that the environment naming context should be searched to find the reference.

```java
@Stateless
@EJB(name="audit", beanInterface=AuditService.class)
public class DeptServiceBean implements DeptService {
    private AuditService audit;

    @PostConstruct
        public void init() {
            try {
                Context ctx = new InitialContext();
                audit = (AuditService) ctx.lookup("java:comp/env/audit");
            } catch (NamingException e) {
                throw new EJBException(e);
            }
        }
}
```

## Dependency Injection
In a nutshell, dependency lookup is when an object finds a way to
create/instantiate/lookup its own dependencies (such as a private property).

Dependency injection is when the same object is provided the dependency by some
DI framework.


When a resource annotation is placed on a field or setter method, two things
occur. First, a resource reference is declared just as if it had been placed on
the bean class, and the name for that resourec will be bound into th environment
naming context when the component is created. Second, the server does the lookup
automatically on your behalf and sets the result into the instantiated class.

THis process of automatically lookup up is called dependency injection because
the server is said to inject the resolved dependency into the class.

#### Field Injection
Injecting a dependency into a field means that after the server looks up the
dependency in the environment naming context, it assigns the result directly
into the annotated field of the class.

```java
@Stateless
public class DeptServiceBean implements DeptService {
    @EJB AuditService audit;
}
```

If you are planning on unit testing, you need either to add a setter method or
make the field accessible to your unit tests to manually satisfy the dependency.

#### Setter Injection
Involves annotating a setter method instead of a class field. The server will
invoke the annotated setter method with the result of the lookup.

```java
@Stateless
public class DeptServiceBean implements DeptService {
    private AuditService audit;

    @EJB
    public void setAuditService(AuditService audit) {
        this.audit = audit;
    }
}
```

This style of injection allows for private fields, yet also works well with unit
testing.

## Declaring Dependencies
Each annotation has a name attribute for optionally specifying the reference
name for the dependency.

### Referencing a Persistence Context
```java
@Stateless
public class EmployeeServiceBean implements EmployeeService {
    @PersistenceContext(unitName="EmployeeService")
    EntityManager em;
}
```

After the warnings of using a state field in a stateless session bean, you might
be wondering how this code is legal. What is actually getting injected is not an
entity manager isntance but rather a container-managed proxy that acquires and
releases persistence contexts on behalf of the application code.

### Referencing a Persistence Unit

```java
...
@PersistenceUnit(unitName="EmployeeService")
private EntityManagerFactory emf;
private EntityManager em;

@PostConstruct
public void init() {
    em = emf.createEntityManager();
}
```

EntityManagerFactory is not used very often since injected entity managers are
easier to acquire and use. However, there are important differences between the
entity managers returned from the factory and the ones provided by the server in
response to the @PresistenceContext annotation.

## Referencing Enterprise JavaBeans
When a component needs to access an EJB, it declares a reference to that bean
with the @EJB annotation. Target of this reference type is typically a session
bean.

MDB have no client interface, so they cannot be accessed directly and
cannot be injected.

In the rare case that two session beans implement the same business interface,
then the beanName element can also be specified to identify the session bean by
its name.

```java
@Stateless
public class DeptServiceBean implements DeptService {
    @EJB(beanName="AuditServiceBean")
    AuditService audit;
}
```

## Referencing Server Resources
The @Resource annotation is a catchall reference for all resource types that
don't correspond to one of the types described so far.

It is used to define references to resource factories, message destinations,
data sources, and other server resources. Only additional element is
resourceType, which allows you to specify the type of resource if the server
can't figure it out automatically.

e.g if you want to inject something of type Object, the server won't know you
wanted a data source instead.


```java
@Stateless
public class DeptServiceBean implements DeptService {
    @Resource
    SessionContext context;
    AuditService audit;

    @PostConstruct
        public void init() {
            audit = (AuditService) context.lookup("audit");
        }
}
```

## Transaction Management
Applications that use persistence require careful attention to issues of
transaction management. When transactions start, when they end, and how they
entity manager participates in container-managed transactions are all essential
topics for developers using JPA.

A transaction is an abstraction that is used to group together a series of
operations. Once grouped together, the set of operations is treated as a single
unit, and all of the operations must proceed or non of them can succeed.

Summary of transaction properties:
- Atomicity
- Consistency: the result at end of transaction adheres to a set of rules that
               define acceptability of the data
- Isolation: Changes made within a transaction are visible only to the
             transaction that is making the changes
- Durability: Changes made within a transaction endure beyond the completion of
              the transaction

A transaction that meets all these requirements is said to be an ACID transaction.

Transactions actually exist at different levels within the enterprise
application server.

Lowest and most basic transaction is at the level of the resource, which in our
discussion is assumed to be a relational database fronted by a DataSource interface.

This is called a resource-local transaction and is equivalent to a database
transaction. These types of transactions are manipulated by interacting directly
with the JDBC DataSource that is obtained from the application server.
Resource-local transactions are used much more infrequently than container transactions.


The broader ocntainer transaction uses the Java Transaction API (JTA) that is
available in every compliant Java EE application server.

Containers typically add their own layer on top of the JDBCDataSource to perform
functions such as connection management and pooling that make more efficient use
of the resources and provide a seamless integration with the
transaction-management system.

### Transaction Demarcation
Every transaction has a beginning and an end. Transactions can be completed in
one of two ways.

THey can be commited, or rolled back, indicating the changes should be
discarded.

The act of causing a transaction to either begin or complete is termed
transaction demarcation.

Resource-local transactions are always demarcated explicitly by the application,
whereas container transactions can either be demarcated automatically by the
container or by using a JTA interface that supports application-controlled demarcation.

EJBs can use either container-managed transactions or bean-managed transactions.

Servlets are limited to the somewhat poorly named bean-managed transaction.

Default transaction management style for an EJB component is container-managed.

The @TransactionManagement annotation should be specified on the session or MDB
class to configure an EJB to have its transacions demarcated one way or the other.

The TransactionManagementType enumerated type defines BEAN and CONTAINER.


```java
@Stateless
@TransactionManagement(TransactionManagementType.BEAN)
public class ProjectServiceBean implements ProjectService {}
```

### Container-Managed Transactions
Most common way to demarcate transactions is to use container-managed
transactions, which spare the application the effort and code to begin and
commit transactions explicitely.

Transaction requirements are determined by metadata on session and
message-driven beans and are configurable at the granularity of method execution.

For example, a session bean can declare that whenever any specific method on
that bean gets involved, the container must ensure that a transaction is started
before the method begins. Container would be responsible for commiting the
transaction after the completion of the method.

Transaction attributes choices:

MANDATORY: transaction is expected to have already been started and be active
when the method is called. Seldom used.

REQUIRED: most common case is which a method is expected to be in a transaction.
Container provides a guarantee that a transaction is active for the method. If
one is already active, it is used; if one does not exist, a new transaction is
created for the method execution.

REQUIRES_NEW: when the method always need to be in its own transaction; method
should be commited or rolled back independently of methods further up the call
stack. It could lead to excessive transaction overhead.

SUPPORTS: Methods marked with supports are not dependent on a transaction, but
will tolerate running inside one if it exists. This is an indicator that no
transactional resources are accessed in the method.

NOT_SUPPORTED: cause the container to suspend the current transaction if one is
active when the method is called. Implies that the method does not perform
transactional operations, but might fail in other ways that could undesirably
affect the outcone of a transaction. Not commonly used.

NEVER: method marked to never support transactions will cause the container to
throw an exception if a transaction is active when the method is called. Seldom
used. Can be used in development to catch transaction demarcation errors.

The transaction attribute for a method can be indicated by annotating a session
or message driven bean with @TransactionAttribute annotation.

Annotating the bean class will cause the transaction attribute to apply to all
of business methods in the class.

Default attribute of REQUIRED will be applied.

```java
@Stateful
public class ShoppingCartBean implements ShoppingCart {
    @TransactionAttribute(TransactionAttributeType.SUPPORTS)
        public void addItem(String item, Integer quantity) {
            verifyItem(item, quantity);
        }
}
```

### Bean-Managed Transactions
Bean class is assuming the responsibility to begin and commit the transactions
whenever it deems it's necessary. Penalty is that they do not get propagated to
methods called on another BMT bean. Generally not recomended.


## MDB Sender

```java
@Stateless
public class EmployeeServiceBean implements EmployeeService {
    @Resource Queue destinationQueue;
    @Resource QueueConnectionFactory factory;

    public void generateReport() {
        try {
            QueueConnection connection = factory.createQueueConnection();
            QueueSession session = connection.createQueueSession(false, 0);
            QueuseSender sender = session.createSender(destinationQueue);

            Message message = session.createTextMessage("12345");
            message.setStringProperty("RECIPIENT", "ReportProcessor");

            sender.send(message);
            sender.close();
            session.close();
            connection.close();
        } catch (JMSException e) {

        }
    }
}
```

# Object-Relational Mapping
Persistence annotations can be applied at 3 different levels: class, method, and
field.

The mapping annotations can be categorized as being in 2 categories: logical
annotations and physical annotatoins.

Logical -> Describe the entity model from an object modeling view.

Physical -> concrete data model in the database. They deal with tables, columns,
constraints, etc


@Transient --> You don't want this field to be persistent

You can explicitly mark the default access mode (field, property) for the class
by using `@Access(AccessType.FIELD)`.

### Mapping to a table
```java
@Entity
@Table(name="EMP")
public class ...
```

You can also name a database schema or catalog. The schema name is commonly used
to differentiate one set of tables from another and is indicated by using the
schema element.

```java
@Entity
@Table(name="EMP", schema="HR")
public class ...
```

Some databases support the notion of a catalog.

```java
@Entity
@Table(name="EMP", catalog="HR")
public class ...
```

### Mapping Simple types
Primitive, wrapper classes of primitive java types.
Byte and character array types 
Large numeric types (BigInteger, BigDecimal)
String
Java temporal types: java.util.Date, java.util.Calendar
JDBC temporal types: java.sql.Date, java.sql.Time, java.sql.Timestamp
Enumerated types
Serializable objects

#### Column mappings

```java
@Entity
public class ... {
    @Column(name="EMP_ID")
    private int id;
}
```

#### Lazy Fetching
LAZY means that the provider might defer loading the state for that attribute
until it is referenced.
The default is to load all basic mappings eagerly.

```java
@Entity
public class ... {
    @Basic(fetch=FetchType.LAZY)
    @Column(name="EMP_ID")
    private int id;
}
```

#### Large objects
objects that are very large (gigabyte range).

Database columns that can store these types of large objects require special
JDBC calls to be accessed from Java. To signal to the provider that it should
use the LOB methods when passing and retrieving this data, addition annotation
is added (@Lob)

```java
...
@Lob @Column(name="PIC")
private byte[] picture;
```

CLOB == character large objects
BLOB == binary large object

BLOB == byte[], Byte[],

CLOB == char[], Character[]

The provider is responsible for making this distinction based on the type of the
attribute being mapped.

#### Enumerated types
```java
public enum EmployeeType {
    FULL_TIME_EMPLOYEE,
    PART_TIME_EMPLOYEE,
    CONTRACT_EMPLOYEE
}

@Entity
public class ... {
    private EmployeeType type;
}
```
It will be mapped by their ordinal number.

If an enumarated type changes however, we have  aproblem.
Solution is to store the name of hte value as a string instead of storinng the
ordianl. This would isolate us from any changes in declaration and allow us to
add new types without having to worry about the existing data.

We can do this by adding an @Enumerated annotation on the attribute, and
specifying a value of STRING.

```java
...
@Enumerated(EnumType.STRING)
private EmployeeType type;
```

THis solution however wil leave the data vulnerable to changes in the name of
the values.

In general, storing the ordinal will be hte best and most efficient way to store
enumerated types as long as the likelihood of additional values inserted in the
middle is not high. New values could still be added on the end of the type
without any negative consequences.

#### Temporal types
These types are the set of time-based types that can be used in persistent state
mappings.

The java.sql types are completely hassle-free. The 2 java.util however need
additional metadata. This is done by annotating them with @Temporal and
specifying the JDBC type as a value of the TemporalType enumerated type.
DATE, TIME and TIMESTAMP

```java
@Entity
public class Employee {
    @Temporal(TemporalType.DATE)
    private Date startDate;
}
```

#### Transient state
Attributes that are not intended to be persistent.

### Mapping the primary key
Identifier generation: Use @GeneratedValue to automatically generate an id.

Four id generateion strategies: AUTO, TABLE, SEQUENCE, IDENTITY

Book then talks about the strategies.


### Relationships

#### Directionality
When each entity points to the other, the relationship is bidirectional. If only
one entity has a pointer to hte other, the relationship is said to be
unidirectional.

A relationship from an employee to the project that they work would be bidirectional.

An employee and its address would likely be modeled as a unidirectional
relationship because the address is not expected to ever need to know its
resident.

In some cases, unidirectional relationships in the object model can pose a
problem in the database model.

When it comes to actually discussing it in concrete terms, it makes sense to
think of every bidrectional relationship as a pair of unidirectional relationships.


### Cardinality
Employee Department example, many employees work in one department

Many to one relationship

Employee Project example, many employees work on many projects.

Many to many

### Ordinality
A role can be further specified by determining whether or not it might be
present at all. This is called the ordinality and serves to show whether the
target entity needs to be specified when the source entity iscreated.


Mappings:
- Many to one
- One to one
- One to many
- Many to many

### Many to one mappings
Employee Department example. Relationship is unidirectional. Employee has an
attribute called department that will contain a reference to a single Department
instance.

```java
@ManyToOne
private Department department;
```


## Using join columns
Holding a key of another key in another table is called a forein key.

In JPA, we call them join columns, and the @JoinColumn annotation is the primary
annotation used to configure these types of columns.

One side will have the join column in the table. That side is called the owning
side.

@JoinColumn always defined on the owning side of the relationship.

To specify the name of the join column, the name element is used.

@JoinColumn(name="DEPT\_ID")

If no @JoinColumn annotation accompanies the many-to-one mapping, a default
column name will be assumed

```java
@ManyToOne
@JoinColumn(name="DEPT_ID")
private Department department;
```

### One-to-one mappings
Employee and parking space example

Almost the same as many to one mapping. Except that only one instance of the
source entity can refer to the same target entity instance. That translates into
a uniqueness constraint on the source foreign key column.

```java
@OneToOne
@JoinColumn(name="PSPACE_ID")
private ParkingSpace parkingSpace;
```


### Bidirecional one-to-one mapping
Target has a relationship back to the source entity. 

e.g Employee <-> Parking space

```java
// employee part covered on top ^^

// parking space part
@OneToOne(mappedBy="parkingSpace")
private Employee employee;
```

mappedBy is needed to refer to the parkingSpace attribute in the Employee class.


### One-to-many mappings
Department <-> Employee

When a relationship is bidirectional, there are always 2 mappings, one for each
direction. A bidirectional one-to-many always implies a many-to-one mapping back
to the source.

When a source entity has an arbitrary number of target entities stored in its
collection, there is no scalable way to store those references i nthe database
table that it maps to. Instead, it must let the tables of the entities in the
collection have foreign keys back to the source entity table. This is why the
one-to-many associateion is almost always bidirectional and never the owning side.

```java
// Department class
@OneToMany(mappedBy="department")
private Collection<Employee> employees;
```

Failing to specify mappedBy element in the @OneToMany will cause the provider to
treat it as a unidirectional one-to-many relationship that is defined to use a
join table.

### Many-to-Many mappings
Employee and Project

```java
// employee class
@ManyToMany
private Collection<Project> projects;

// project class
@ManyToMany(mappedBy="projects")
private Collection<Employee> employees;
```

For many-to-many, there are no join columns on either side of the relationship.
The only way to implement a many-to-many relationship is with a separate join
table. Consequence of not having any join columns in either of the entity tables
is that there is no way to determine which side is the ownter of the
relationship. We must pick one of the 3 entitites to be the owner.

if we pick one side to be the owner, the inverse side must use the mappedBy
element to identify the owning attribute.

### Using Join tables
A join table consists simply of 2 foreign key or join columns to refer to each
of the 2 entity types in the relationship.

#######################################################################################
The join table for the relationship, if not defaulted, is specified on the owning side. 
#######################################################################################

All ManyToMany relationships require a JoinTable. The JoinTable is defined using
the @JoinTable annotation and <join-table> XML element. The JoinTable defines a
foreign key to the source object's primary key (joinColumns), and a foreign key
to the target object's primary key (inverseJoinColumns). Normally the primary
key of the JoinTable is the combination of both foreign keys.A

```java
@ManyToMany
@JoinTable(name="EMP_PROJ",
            joinColumns=@JoinColumn(name="EMP_ID"),
            inverserJoinColumns=@JoinColumn(name="PROJ_ID"))
private Collection<Project> projects;
```

In our example, we fully specified the names of the join table and its columns
because this is the most common case. But if we were generating the database
schema from the entities, we would not actually need to specify this information.

When no @JoinTable annotation is specified on the owning side, then a default
join table named <Owner>\_<inverse> is assumed.


### Unidirectional collection mapping
Unidirection one-to-many

Employee -> Phone

Similarly, when one side of a many-to-many relationship does not have a mapping
to the other, it is a unidirectional relationship. The join table must still be
used.

```java
// EMPLOYEE
@OneToMany
@JoinTable(name="EMP_PHONE",
           joinColumns=@JoinColumn(name="EMP_ID"),
           inverseJoinColumns=@JoinColumn(name="PHONE_ID"))
private Collection<Phone> phones;
```

### Lazy Relationships
At the relationship level, lazy loading can be a big boon to enhancing
performance. It can reduce the amount of SQL that gets executed.

Defaults:
Single-valued relationship -> fetched eagerly
Collection-valued relationship -> lazily loaded

```java
@OneToOne(fetch=FetchType.LAZY)
private ParkingSpace parkingSpace;
```

### Embedded Objects
An embedded object is one that is dependent on an entity for its identity. It
has no identity on its own. but is merely part of the entity state that has been
carved off and stored in a separate java object hanging off of the entity.

The street, city, state and zip_code columns combine logically to form the
address. In the object model, ths is an excellent candidate to be abstracted
into a separate address embedded type instead of listing each attribute on the
entity class.

```java
@Embeddable
public class Address {
    private String street;
    private String city;
    private String state;
    private String zip;
}

@Entity
public class Employee {
    @Embedded private Address address;
}
```

When the provider presists an instance of Employee, it will access the
attributes of the Address object just as if they were present on the entity
instance itself.


An Address class could be reused in both Employee and Company entities. 

How sharing will be possible if the 2 entity tables have different column names
for the same field.

```java
public class Employee {
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name="state", column=@Column(name="PROVINCE"))
        @AttributeOverride(name="zip", column=@Column(name="POSTAL_CODE"))
    })
    private Address address;
}
```
