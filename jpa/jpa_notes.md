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

pg 39
