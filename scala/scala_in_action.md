### MUltiline
```scala
val multiline = """This is a
                    multi line
                    string"""
// to remove margin
val multiline = """This is a
                    multi line
                    string""".stripMargin
```
stripMargin removes the leading whitespaces.

### String interpolation
```scala
val name = "Nihao"
s"My name is $name"
```

Prepending `f` to any string literal allows the creation of simple formatted
strings, similar to `printf`.

```scala
println(f"$name%s is $height%2.2f meters tall")
```

Predef is wrapping java.lang.String to another type called
scala.collection.immutable.StringLike.

### xml literal
```scala
val book = <book>
               <title>Scala in Action</title>
               <author>Boo</author>
           </book>
```
Scala converts the xml literal to a scala.xml.Elem type object. You can put
valid Scala code inside curly braces {}, within the xml tags.

```scala
val code = "1"
val alert = <alert priority={code}>{new java.util.Date()}</alert>
```

Situations where you want to declare a variable without assigning a value
because you don't yet know the value. `_` is used to assign a default value.

For strings, the default value is null.

```scala
var x: String = _
// here _ == null
```

### Lazy evaluation
```scala
var a = 1
lazy val b = a + 1

a = 5
println(b) // prints 6 instead of 2
```

`lazy` is only allowed with vals.

### Variable extraction
```scala
val first :: rest = List(1, 2, 3)
// first = 1
// rest = List(2, 3)
```

### Functions
Return type of Scala function is optional because Scala infers the return type
of a function automatically.

```scala
def haha() = {"boo"}
```

Significance of = after the method signature isn't only to separate the
signature from the method body but also to tell the Scala compiler to infer the
return type of your function. If you omit that, Scala won't infer your return type.

```scala
def haha() {println("boo")}
```
Unit in Scala is like void in Java.

If the function has side effects, the common convention is to use "()" even
though it isn't required.

### Type inference in function
```scala
def toList[A](value: A) = List(value)

toList(1) // returns a list of ints
toList("haha") // returns a list of string
```

### Array
```scala
val array = new Array[String](3)
```

### For comprehension
The for comprehension comes in two flavours: imperative form (for loop does not
return anything) and functional form.

In functional form, you tend to work with values rather than execute statements,
and it does return a value.

```scala
for {a <- aList; b <- bList } yield a + b
```

Instead of printing a + b, you are returning the value of the addition from the
loop using the yield keyword. You are using the same aList and bList instances
in the loop control, and it returns the result as a List.

```scala
val result = for {a <- aList; b <- bList } yield a + b
```

### Pattern Matching
```scala
val x = haha match {
    case 1 => println("Boo")
    case _ => println("default")
}
```

```scala
val x = haha match {
    case s: String => println("String")
    case l: List[_] => println("list")
    case _ => println("default")
}
```


```scala
// infix style
List(1, 2, 3, 4) match {
   case f :: s :: rest => List(f, s)
}
```

```scala
// guard close
num match {
    case within10 if within10 <= 10 => println("within 0 to 10")
    case within100 if within100 <= 100 => println("within 100")
    case hundredTo200 if 100 to 200 contains hundredTo200 => println("yahoo")
}
```

### Exception Handling
```scala
try {
    //do something
} catch {
    case e: IllegalArgumentException => e.getMessage
}
```

## OOP in Scala
```scala
class MongoClient(val host: String, val port: Int)


val client = new MongoClient("127.0.0.1", 123)

client.host
client.port
```

```scala
class Boo(
    var address: String,
    val haha: String
)
```

When parameters are prefixed with var, Scala creates mutable instance variables.
The val and var prefixes are optional, and when both of them are missing, they
are treated as private instance values, not accessible to anyone outside the class.

```scala
class MongoClient(host: String, port: Int)


val client = new MongoClient("127.0.0.1", 123)

client.host // error
client.port // error
```

Use private in the constructor so that scala does not generate accessors by
default.

```scala
class MongoClient(private val _host: String) {
    def host = _host
}
```

val and var == getter method created
var == setter method

### Overload a constructor
```scala
class MongoClient(val host: String) {
    def this() = this("127.0.0.1")
}
```
To overload a constructor, name it this followed by parameters.

Because of Scala's nature, you can write code inside the class like a script.

```scala
class MyScript(host: String) {
    require(host != null, "Have to provide a hostname")
}
```

### Adding setter methods
```scala
def age =  _age // getter
def age_=(newAge: Int) = { _age = newAge } // setter

p.age = 3
```

### Extending a class
To extend or inherit a superclass, you have to use the extends keyword.

```scala
class MongoClient(val host: String, val port: Int) extends Mongo(host, port) {
    require(host != null, "You have to provide a host name")
    def this() = this("127.0.0.1", 27017)
}
```

From that example, you can see that you can also inline the definition of the
primary constructor of a superclass. Drawback is you can no longer validate the
parameters of the primary constructor before handing it over to the superclass.

### Packaging
A package is a special object that defines a set of member classes and objects.

```scala
package com {
    package huh {
        class xxx
}
```

But it's better to define a top level package to avoid confusion.

Scala package declaration doesn't have to match the folder structure of your
filesystem. You are free to declare multiple packages in the same file.

### Scala imports
To import everything:
```scala
import com.mongodb._
```

You can also use import anywhere. Advantage: lexically scoped inside the block
it is defined.

To import members of a class:
```scala
import java.lang.System._
```

Similar to static import in java.

### Aside
```scala
package monads { class IOMonad }
package io {
    package monads {
        // won't work since imports are relative
        class Console { val m = new monads.IOMonad }

        // will work
        class Console { val m = new _root_.monads.IOMonad }
    }
}
```

e.g java.sql.Date and java.util.Date <== they are confusing

```scala
import java.util.Date
import java.sql.{Date => SqlDate}
```

You can also hide a class using import with the help of an underscore:

```scala
import java.sql.{Date => _}
```

static is replaced by a singleton object.

```scala
object Boo {
    def p(x: Any) = println(x)
    def apply(x: Any) = println(x)
}

Boo.p(123)
Boo(1234) // will call the apply method
```

In Scala, both a class and an object can share the same name. When an object
shares a name with a class, it's called a companion object, and the class a
companion class.

```scala
class DB private(val under: Any) {}
object DB { def apply(x: Any) = new DB(123) }
```

private here makes the constructor private. Only the companion object can call
that constructor.


### Mixin with Scala traits
A trait is like an abstract class meant to be added to other classes as a mixin.

A mixin is a class that provides certain functionality that could be used by
other classes. You can also view a trait as an interface with implemented methods.


Abstract class: you can have constructor parameters
Traits: can't take any constructor parameters.

In Scala it is possible to declare abstract fields like abstract methods that
need to be inherited by subclasses.

```scala
trait ReadOnly {
    val underlying: MongoDBCollection

    def name = underlying getName
}

trait Administrable extends ReadOnly {
    def drop: Unit = underlying drop
}

trait Updatable extends ReadOnly {
    def +=(doc:DBObject): Unit = underlying save doc
}

class DBCollection(override val underlying: MongoDBCollection)
                    extends ReadOnly

new DBCollection(xxx)
new DBCollection(xxx) with Admistrable
new DBCollection(xxx) with Administrable with Updatable
```

Traits and ruby modules are very similar. Trait mixin is checked at compile
time.


### Class linearization
Diamond problem

           Any

         AnyRef

        ReadOnly

 Updatable    DBCollection

    UpdatableCollection

Invoking one of the find methods on UpdatableCollection will result in an
ambigous class because you could reach the ReadOnly trait from 2 different
paths. Scala solves this problem using class linearization. Linearization
specifies a single linear path for all the ancestors of a class, including both
the regular superclass chain and the traits.

Resolves method invocation by first using right-first, depth-first search and
then removing all but the last occurence of each class in the hierarchy.

Linearization puts the trait first after the class because it's the rightmost
element and then removes duplication.

UpdatableCollection -> Updatable -> DBCollection -> ReadOnly -> AnyRef -> Any

#### Stackable Traits
Using with.

When creating a trait you can't tell how your trait will get used and who will
be above you. All you know is that it has to be of a type that your trait
extends. The interpretation of super in traits is dynamically resolved in Scala.

### Case Class
When the Scala compiler sees a case class, it automatically gnerates boilerplate
code so you don't have to do it.

```scala
case class Person(firstName: String, lastName: String)
```

What you'll get:
- Scala prefixes all the parameters with val, and that will make them public value.
- Both equals and hashCode are implemented for you based on the given parameters
- Compiler implements toString -> returns class name and its parameters
- Each case class has a method named copy that allows you to easily create a
  modified copy of the class's instances
- A companion object is created wit hthe appropriate apply method, which takes
  the same arguments as declared in the class
- Compiler adds a method called unapply, which allows the class name to be used
  as an extractor for pattern matching
- A default implementation is provided for serialization

You're allowed to prefix the parameters to the case class with var if you want
both accessors and mutators. Scala defaults it to val because it encourages
immutability.

A case class can extend other classes, including trait and case classes. When
you declare an abstract case class, Scala won't generate the apply method in the
companion object. makes sense since you can't create an instance of an abstract
class.

You can also create case objects that are singleton and serializable.

```scala
trait Boolean
case object Yes extends Boolean
case object No extends Boolean
```

```scala
sealed trait QueryOption
case object NoOption extends QueryOption

case class Sort(sorting: DBObject, anotherOption: QueryOption)
        extends QueryOption

case class Skip(number: Int, anotherOption: QueryOption)
        extends QueryOption

case class Limit(limit: Int, anotherOption: QueryOption)
        extends QueryOption
```

A sealed modifier stops everyone from extending the trait, except for classes
that are in the same source file.

```scala
case class Query(q: DBObject, option: QueryOption = NoOption) {
    def sort(sorting: DBObject) = Query(q, Sort(sorting, option))
    def skip(skip: Int) = Query(q, Skip(skip, option))
    def limit(limit: Int) = Query(q, Limit(limit, option))
}
```

here each method creates a  new instance of a query object with an appropriate
query option to provide a fluent itnerface:

```scala
var rangeQuery = // it's a DBOject
var richQuery = Query(rangeQuery).skip(20).limit(10)
```

One of the most common reasons for creating case classes is the pattern-matching
feature that comes free with case classes.

```scala
case class Person(firstName: String, lastname: String)

val p = Person("Matt", "w")

p match {
    case Person(first, last) => println(">>> " + first + last)
}
```

We have extracted the first and last names from the object using pattern
matching. Under the hood, Scala handles this pattern matching using a method
called unapply.

If you had to handcode it:

```scala
object Person {
    def apply(firstName: String, lastName: String) = {
        new Person(firstname, lastName)
    }
    def unapply(p: Person): Option[(String, String)] =
            Some[(p.firstName, p.lastName)]
}
```

Sometimes instead of unapply, another method called unapplySeq could get
generated if the case class parameters end with a repeated parameter (variable
argument).

You can also use pattern mathching in for comprehension

```scala
val people = List(// full of Person() objects)

for(Person(first, last) <- people) yield first + ", " + last
```

When it comes to overload methods, you have to specify the return type;
otherwise, the code won't compile. You have a similar limitation for recursive
method calls.


### Named and default arguments and copy constructors

```scala
// named
val p = Person(lastName = "lastname", firstName = "firstname")
```


#### Named arguments and inheritance

```scala
trait Person { def grade(years: Int): String }
class SalesPerson extends Person { def grade(yrs: Int) = "Senior" }

val s = new SalesPerson
s.grade(yrs=1) // pass
s.grade(years=1) // fails
```

If you force the type variable to Person, then you can use years as a named argument.

```scala
val s: Person = new SalesPerson
s.grade(years=1)


// expression in named argument
s.grade(years={val x = 10; x + 1})
```

#### Default arguments
```scala
def sort(haha: String = "boo") = "hihi"
```

One of the interesting uses of default arguments in Scala is in the copy method
of case classes. Every case class has an additional method called copy to create
a modified instance of the class. This method isn't generated if any member
exists with the same name in the class or in one of its parent classes.

```scala
val skipOption = Skip(10, NoOption)

val skipWithLimit = skipOption.copy(anotherOption = Limit(10, NoOption))

case class Skip(number: Int, anotherOption: QueryOption) extends QueryOption {
    def copy(number: Int = number, anotherOption: QueryOption = anotherOption) =
    { Skip(number, anotherOption) }
}
```

The copy method is using a named argument to specify the parameter that you'd
like to change.

You can pick and choose the parameter value you want to change during the copy.
If no parameters are specified, copy will create another instance with the same
values.

== method same as calling the equals method.

== defined in scala.Any

### Modifiers
private, protected

private: only accessible in an enclosed class, its companion object, or a
companion class.

In Scala, you can qualify a modifier with a class or a package name.

```scala
package outerpkg.innerpkg

class Outer {
    class Inner {
        private[Outer] def f() = "This is f"
        private[innerpkg] def g() = "This is g"
        private[outerpkg] def h() = "This is h"
    }
}
```

The f method can appear anywhere with the Outer class, but not outside it. The
method g is accessible anywhere within the outerpkg.innerpkg. h method can
appear anywhere within outerpkg and its subpackages. Useful for unit tests in
the same pkg.


Scala also lets you qualify the private modifier with this: private[this]. In
this case, it means object private. And object private is only accessible to the
object in which it is defined. (???)

When members are marked with private without a qualifier, they are called
class-private.

The protected modifier is applicable to class member definitions. It's
accessible to the defining class and its subclasses. Also accessible to a
companion object of the defining class and companion objects of all the subclasses.

Like private, you can qualify the protected modifier with class, package, and this.


#### Overrride
the override modifier is mandatory when you override a concrete member
definition from the parent class. Can be combined with an abstract modifier ->
means that the member in question must be mixed with a class that provides the
concrete implementation.

```scala
trait DogMood {
    def greet
}

trait AngryMood extends DogMood {
    override def greet = {
        println("Bark")
        super.greet
    }
}
```

Problem with this code is super.greet. Can't invoke it since it's abstract. But
super calls are important if you want your trait to be stackable so that it can
get mixed in with other traits. In cases like these, you can mark a method with
abstract override, which means it should be mixed in with some class that has
the concrete definition of the greet method.

```scala
trait AngryMood extends DogMood {
    abstract override def greet = {
        println("bark")
        super.greet
    }
}
```

#### sealed
A little different from the final modifier, sealed can be overriden as long as
the subclasses belong to the same source file. Common pattern when you want to
create a defined set of subclasses but don't want others to subclass it.

### Value classes: Objects on a diet
Scala allows user-defined value classes that extend AnyVal. Value classes are a
new mechanism to avoid runtime allocation of the objects.

To create a value class you need to abide by some important rules:

- Class must have exactly one val parameter (vars not allowed)
- Parameter type may not be a value class
- Class can not have any auxiliary constructors
- class can only have def members, no vals or vars
- Class cannot extend any traits, only universal traits

Value classes allow you to add extension methods to a type without the runtime
overhead of creating instances.

```scala
class Wrapper(val name: String) extends AnyVal {
    def up() = name.toUpperCase
}

val w = new Wrapper("hey")
w.up()
```
At runtime, the expression will be optimized to the equivalent of a method class
on a static object Wrapper.up$extendion("hey").

Behind the scenes the Scala compiler has generated a companion object for the
value class and rerouted the w.up() calls to the up$extension method in the
companion object.

```scala
// equivalent implementation
object Wrapper {
    def up$extension(_name: String) = _name.toUpperCase
}
```

A value class can only extend a universal trait, one that extends Any. Universal
traits can only have def members and no initialization code:

```scala
trait Printable extends Any {
    def p() = println(this)
}


// OH HEY: you can even use with in constructor type!? who knew!
case class Wrapper(val name: String) extends AnyVal with Printable {
    def up() = name.toUpperCase
}

val w = Wrapper("Hey")
w.p()
```

### Implicit Conversion with implicit classes
Implicit conversion is a method that takes one type of parameter and returns
another type.

```scala
val someInt: Int = 2.3 // fails
implicit def double2Int(d: Double): Int = d.toInt
val someInt: Int = 2.3 // succeeds
```

When the compiler encounters a type error, it doesn't immediately give up;
instead, it looks for any implicit conversions that might fix the error. The
compiler will also throw an error if there is ambiguity in an implicit
resolution: more than one implicit conversion is found that matches the given
criteria.


One of the common uses of implicit conversion is to add extension methods to
existing types.

e.g

```scala
val oneTo10 = 1 to 10

// what if we want to create a range of numbers using the --> method?
val oneTo10 = 1 --> 10
```

This will fail since there is no --> method defined for Int. We can easily fix
this by following 2 simple steps:

- Create a type that has a --> method defined for the Int type.
- Provide an implicit conversion

```scala
class RangeMaker(left: Int) {
    def -->(right: Int) = left to right
}

val range: Range = new RangeMaker(1). -->(10)
```

Here the left operand becomes the constructor parameter and the right operand
the parameter to the --> method.

```scala
implicit def int2RangeMaker(left: Int): Range = new RangeMaker(left)
```

By default, the Scala compiler always evaluates expressions from left to right.
So the expression is translated to 1.-->(10). Since there is no --> method
defined for Int, the Scala compiler will look for implicit conversion that can
convert Int to some type that defines the --> method. In this case, the compiler
will use the int2RangeMaker method by passing 1 as parameter, then 10 as
parameter to the --> method.

Since implicit conversions is so commonly used by libraries and applications,
Scala provides implicit classes.

It reduces boilerplate code.

```scala
implicit class RangeMaker(left: Int) {
    def -->(right: Int): Range = left to right
}
```

Behind the scenes, the compiler will "desugar" the implicit class into a simple
class and an implicit conversion method, as we did earlier. Implicit classes
must have a primary constructor with one argument.

We can avoid runtime cost of creating an additional instance of RangeMaker by
using value classes:

```scala
implicit class RangeMaker(val left: Int) extends AnyVal {
    def -->(right: Int): Range = left to right
}
```

Implicit conversion is a very powerful language feature, but overusing it can
reduce the readability and maintenance of the code base.


### Scala class hierarchy

Root class is scala.Any

Any defines AnyVal and AnyRef. All values that are represented by an object in
the JVM are a subclass of AnyRef.

Every user-defined scala class also inherits from a trait called
scala.ScalaObject.

AnyRef is mapped to java.lang.Ojbect in the JVM.

Subclasses for AnyVal -> scala takes advantage of java primitive types for
efficiency, but converts them to objects when required by the scala application.


Views are implicit type converters that allow Scala to convert from Char to Int
to Long and so on.

Scala.Null is the subtype of all reference  types, and its only instance is the
null reference.

The only way to create an instance of Null is by assigning null to an instance.

```scala
val x: Null = null
```

Because it's subclassed from AnyRef, you can't assign null to any value type in
Scala

```scala
val x: Int = null // will fail
```

scala.Nothing is at the bottom of the Scala hierarchy, and it's a subtype of
everything in Scala. You can't create an instance of Nothing.


## Functional Data Structures
Scala collections: immutable and mutable

Option is a collection type in Scala. Option contains a maximum of one element.
It represents one of two possible values: None and Some.

None means no value and Some represents some value. By returning Option from a
method, you can communicate that the method might not return a value at all
times.

You'll create a function that will return the index position of an element in a
list. It also needs to work for all kinds of lists. The list could contain
integers, longs or strings. How can you build a function that works for all
types of lists.

```scala
def position[A](xs: List[A], value: A): Int = xs.indexOf(value)
```

Even though you can explcitly the type value for the type parameter, it's
optional. Scala type inference determines the value of the type parameter based
on the arguments passed to the function.

Currently your position functions returns -1  when there's no matching element.
Here, instead of returning the Int result, you'll return  a new type that
clearly expresses the behaviour of hte method. You'll create a container called
Maybe that will wrap the result.

```scala
def position[A](xs: List[A], value: A): Maybe[Int] = {
    val index = xs.indexOf(value)
    if(index != -1) Just(index) else Nil
}

sealed abstract class Maybe[+A] {
    def isEmpty: Boolean
    def get: A
}

final class Just[A](value: A) extends Maybe[A] {
    def isEmpty = false
    def get = value
}

case object Nil extends Maybe[Nothing] {
    def isEmpty = true
    def get =  throw new NoSuchElementException("Nil.get")
}
```

### Type variance with covariance and contravariance
When using type parameters for classes or traits, you can use a + sign along
with the type parameter to make it covariant.

Covariance allows subclasses to override and use narrower types than their
superclass in covariant positions such as the return value. Here Nil is a
subclass of Maybe.

Because the A type of Maybe is covariant, you can return a narrower type from
its subclasses.


The opposite of covariance is contravariance. In the case of covariance, the
subtyping can go downward, but in contraconvariance, subtypes go upward.

e.g
```java
Object[] arr = new int[1];
arr[0] = "hello, there!";
```
You can end up assigning  the string to an integer array. Java catches those
errors at runtime, Scala does that at compile time.

A  type parameter is invariant when it's neither covariant nor contravariant.

Scala uses - to denote contravariance.

```scala
trait Function1[-P, +R] {...}

// P: parameter, R: return

val addOne: Function1[Any, Int] = {x: Int => x + 1}
```
pg 98: still confusing, so read!


### Lower and upper type bounds
Type parameters may be constrained by type bound.

e.g The position function in the following listing throws an exception if you
invoke get method on the Nil object:

```scala
val xs = List("one", "two")

position(xs, "two").get // returns 1

position(List(), "two").get
// throws exception
```

Better to pass a default value in case the element isn't found. You can add a
new method to the Maybe abstract class that will take a default callback:

```scala
sealed abstract class Maybe[+A] {
    def isEmpty: Boolean
    def get: A
    def getOrElse(default: A): A = {
        if(isEmpty) default else get
    }
}
```

If you try to compile this code, you'll get a compiler error. Because A is a
covariant type, Scala does not allow the covariant type as an input parameter.
Same for contravariant.

You could solve this problem in 2 ways: make the Maybe class an invariant and
lose all the subtyping with Just and Nil, or use type bound.

Scala provides 2 types of type bound: lower and upper. An upper type bound T <:
A declares that type variable T is a bustype of type A, and A is the upper bound.

```scala
def defaultToNull[A <: Maybe[_]](p: A) = {
    p.getOrElse(null)
}
```

A is contrained to one of the subtyps of Maybe. Because Maybe takes a type
parameter, you have to declare the type parameter when defining the upper type
bound. If you don't care about the type parameter, you can use the _ placeholder
as in the last example.

```scala
sealed abstract class Maybe[+A] {
    def isEmpty: Boolean
    def get: A
    def getOrElse[B >: A](default: B): B = {
        if(isEmpty) default else get
    }
}

final case class Just[A](value: A) extends Maybe[A] {
    def isEmpty = false
    def get = value
}

case object Nil extends Maybe[scala.Nothing] {
    def isEmpty = true
    def get = throw new NoSuchElementException("Nil.get")
}
```

The getOrElse method returns the value contained by Just or the default value
when it's empty. Because the default value is taken as a parameter, you have to
set the lower bound to A to satisfy the contravariant rule.

Just and Nil are the 2 subclasses that represent success and error situations.

```scala
// position is just a method that return an object of type Maybe
position(List(), "something").getOrElse(-1) // -1

position(List("one", "two", "three"), "three").getOrElse(-1) // three
```


### Higher Order functions
A function is called higher order if it takes a function as an argument or
returns a function as a result.

map: this method allows you to build a new list by applying a function to all
     elements of a given list

```scala
List(1, 2, 3) map { (x: Int) => x + 1 }

List(1, 2, 3) map { _ + 1 }

def addOne(num: Int) = num + 1

List(1, 2, 3) map addOne
```

In the first case, you are passing an anonymous function that takes x as a
parameter and adds 1 to it.

In the second case you are using a function literal, where a placeholder
represents the parameter.

In the last example, you are passing an existing function without referring to
hte parameters that are passed between the map function and the addOne function.
This is a good exaple of pointfree-style programming and functional composition.
It is also an example of a call-by-name invocation, where the parameters of the
function are wrapped inside another function.

An example where a function returns another function.

```scala
def addOne(num: Int) = {
    def ++ = (x: Int) => x + 1
    ++(num)
}
```

Here the nested function ++ returns another function that takes Int as a
parameter and returns Int.

How can you implement a function like map that works for any type of list? You
have a couple of ways to implement the map function - one uses recursion and the
other uses a for-comprehension.

```scala
def map[A, B]](xs: List[A], f: A => B): List[B] = {
    xs match {
        case List() => Nil
        case head :: tail => f(head) :: map(tail, f)
    }
}
```

YOu could also use for-comprehension and yield.

Another interesting method defined for List is flatMap. Method builds a new
collection by applying a function to all elements of this list and concatenating
the result.

```scala
class List[+A] { ...
    def flatMap[B](f: A => GenTraversableOnce[B]): List[B]
}
```

GenTraversableOnce represents all collection types that could be iterated either
sequentially or in parallel.

flatMap adds the ability to flatten a collection of collections into a single collection.

e.g

```scala
List("one", "two", "") flatMap { _.toList }
// List(o, n, e, t, w, o)

List("one", "two", "") map { _.toList }
// List[List[Char]] = List(List(o,n,e), List(t,w,o), List())
```

```scala
def flatten[B](xss: List[List[B]]): List[B] = {
    xss match {
        case List() => Nil
        case head :: tail => head ::: flatten(tail)
    }
}

def flatMap[A, B](xs: List[A])(f: A => List[B]): List[B] = {
    flatten(map(xs, f))
}
```

The ::: is another method defined for List that appends the contents of one List
to another.

Also:

```scala
def flatMap[A, B](xs: List[A])(f: A => List[B]): List[B]
```

This is called currying.


### Difference between a lambda and a closure
A lambda is an anonymous function - a function without a name.

Closure: Keeps track of the environment in which it's created.

Downside of using a recursive solution is that it can throw a stack overflow
error on large datasets. Alternative is to use tail recurstion.

In tail recursion your perform your calculation first and then execute the
recursive call by passing the result of the current step to the next step.


### Using foldLeft and foldRight
These 2 operations allow you to perform binary operations on all the elements of
the List.

Avoid foldRight as much as possible as it uses recursion and can potentially
throw a stack overflow error.

The foldLeft method applies a binary operator to a start value and all elements
of a List going from left to right.

```scala
List(1, 2, 3, 4).foldLeft(0) { _ + _ } \\ 10
List(1, 2, 3, 4).foldLeft(0) { (a, b) => a + 1 } \\ 4


def exists[A](xs: List[A], e: A) = xs.foldLeft(false)((a, x) => a || (x == e))
```

### Building your own function objects
A function object is an object that you can use as a function. To treat an
object as a function object, all you have to do is declare an apply method.

<object>(<arguments>) === <object>.apply(<arguments>)

When declaring function objects, it's a good idea to extend one of the Function
traits defined in the Scala library. In Scala, you could for example use Function1.

1 stands for "function with one parameter".

```scala
object ++ extends Functions1[Int, Int] {
    def apply(p: Int): Int = p + 1:w
}

// equivalent to
val ++ = (x: Int) => x + 1

// can also use

def ++ extends (Int => Int) {
    def apply(p: Int): Int = p + 1
}
```
(Int => Int) is the shorthand notation of Function1.

```scala
map(List(10, 20, 30), ++)
```

When passing an existing function as a parameter, Scala creates a new anonymous
function object with an apply method, which invokes the original function. This
is called eta-expansion.

Function traits also lets you compose 2 functions to create a new function.

```scala
val addOne: Int => Int = x => x + 1
val addTwo: Int => Int = x => x + 2
val addThree = addOne compose addTwo
// addOne(addTwo(x))
```

### Scala Collection Hierarchy
Part of scala.collection.
scala.collection.mutable
scala.collection.immutable

Scala automatically import immutable collections, but you have to explicitly
import mutable collection types.

Iterable trait provides the implementation of foreach that you learned in the
last section and it exposes a new abstract method called iterator.

```scala
Iterable(1, 2, 3, 4, 5) dropRight 2 // List(1, 2, 3)
Iterable(1, 2, 3, 4, 5) takeRight 2 // List(4, 5)
```

### Working with List and ListBuffer
Elements in a sequence are indexed, and they are indexed from 0 to length - 1,
where length is the number of elements in the sequence collection.

If the sequence is mutable like ListBuffer, then along with the apply method it
offers an update method. As assignment is turned into an update method call.

```scala
import scala.collection.mutable.ListBuffer
val buf = ListBuffer(1.2, 3.4, 5.6)
buf.update(2, 20)
```

#### Working with Set and SortedSet
```scala
val frameworks = Set("Lift", "Akka", "Scalaz")
frameworks contains "Lift" // true
frameworks("Lift") // true
```

To add or remove elements to or from an immutable Set, use + or -. Using this
for a mutable Set will also create a new Set. A better way to change mutable
Sets is using the  += and -= methods.

One interesting subtrait of Set is SortedSet.

#### Working with Map and Tuple
Unlike other collections, a Tuple is a heterogeneous collection where you can
store various types of elements.

```scala
val m = Map((1, "1st"), (2, "2nd"))

m(1)
m(3) // error
```

The better way to retrieve a value associated with a key is to use the get
method defined in Map. Instead of returning the value, it wraps the value in a
container called Option.

Option : => List with one element.

#### Under the hood of for-comprehension
pg 118

#### Working with lazy collections: views and streams

Converint a strict collection to a nonstrict collection with views.

```scala
List(1, 2, 3, 4, 5).view.map(_ + 1).head
```

Calculation is deferred until you invoke head on it.

The nonstrict method of processing collection elements is a useful and handy way
to improve performance, especially when the operation is time-consuming.

Class Stream implements lazy lists in Scala where elements are evaluated only
when they are needed. Stream is like a list, in which elements are stored in 2
parts, head and tail. The tail for Stream isn't computed until it's needed.

```scala
List("zero", "one").zip(Stream.from(0))
```


## Functional Programming
