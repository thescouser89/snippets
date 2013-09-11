## To print
```scala
println("hello, world")
```

## Define variables
```scala
val msg = "Hello world"

val msg2: String = "Hello"
```
This shows type inference. Scala figures out the types.

`val` is for constants, `var` is for variables. In most cases, you will use `val`

## Define functions
```scala
def max(x: Int, y: Int): Int = {
    if (x > y) x
    else y
}
```
Scala compiler cannot infer function parameter types. Sometimes the compiler
will require you to specify the result type of a function. If the function is
recursive, you must explicitly specify the function's result type.

in the case of max, the compiler will infer it.

```scala
def greet() = println("Hello world")
```
Unit is greet's result type. It indicates the function returns no interesting
value. Unit is similar to Java's void (and Java's void is mapped to Unit)

## Standard input
Command line arguments to a Scala script are available via Scala array called
`args`.

```scala
println("Hello" + args(0) + "world")
```

## Comments
starts with `/* */` or `//`

## Loops and conditionals
```scala
var i = 0
while (i < args.length) {
    if (i != 0)
        print(" ")
    print(args(i))
    i += 1
}
```
println()

## Interate with foreach
```scala
args.foreach(arg => println(arg))
```
You are passing in a function literal (arg => println(arg)) that takes one
parameter named arg.

If you prefer to specify the type:
```scala
args.foreach((arg: String) => println(arg))
```

A better way to do it though is:
```scala
args.foreach(println)
```

```scala
for(arg <- args)
```

The `arg` is a `val`, not a `var`. For each element of the args array, a new arg
val will be created and initialized to the element value, and the body of the
`for` will be executed.

## new
In Scala, you can instantiate objects, or class instances using `new`. When you
instantiate an object in Scala, you can _parameterize_ it with values and types.
Parameterization means 'configuring' an instance when you create it. You
parameterize an instance with values by passing objects to a constructor in
parantheses.

```scala
val big = new java.math.BigInteger("12345")
```

```scala
val greetStrings = new Array[String](3)
greetStrings(0) = "Hello"
greetStrings(1) = ", "
greetStrings(2) = "world"

for (i <- 0 to 2)
    print(greetStrings(i))
```

`0 to 2` is equivalent to `0.to(2)`. This syntax only works if you explcitly
specify a receiver of the method call.

## Arrays
Arrays are simply instances of classes like any other class in Scala. When you
apply parantheses surrounding variables, Scala will transform it into an
invocation of a method named `apply` on that variable.

`greetStrings(i)` will get transformed into `greetStrings.apply(i)`.

Similarly, when an assignment is made to a variable with parantheses and one or
more arguments, the transformer will call the `update` method.

`greetStrings(0) = "hello"` is equivalent to `greetStrings.update(0, "hello")`

More concise way of creating arrays:

```scala
val numNames = Array("zero", "one", "two")
```
THe compiler infers the type to be Array[String]

This is actually a factory method called `apply`, it is defined on the Array
companion object. Java equivalence => calling a static method `apply` on class
Array.

For an immutable sequence of objects that share the same type you can use
`Scala's` List class. Scala's List are always immutable. They behave like Java's
strings.

```scala
val x = List(1, 2, 3)
```

List has a method called `:::`, for list concatenation.

```scala
val oneTwo = List(1, 2)
val threeFour = List(3, 4)

val oneFour = oneTwo ::: threeFour
```

Method `::` (named cons) prepend a new element at the beginning of an existing
list, are returns the resulting list.

```scala
val twoThree = List(2, 3)
val oneTwoThree = 1 :: twoThree
```

Note: `::` is a method to the right operand. So this method is actually applied
to twoThree.

Rule: If a method name ends with a colon (`:`), the method is invoked to its
right operand.

`1 :: oneToThree === oneToThree.::(1)`

`Nil` is specified as an empty list. One way to create a list is:

```scala
val haha = 1 :: 2 :: 3 :: Nil
```

Append to list: use the `+` method. THis is rarely used since using this method
grow linearly with the size of the list, whereas `::` is constant time. Option
to append efficiently is to use `::` with `reverse`.

```scala
val haha = List(1, 2, 3)
haha(2) // returns 3

haha.count(s => s.length == 4) // counts the number of string whose length is 4

haha.drop(2) // return the haha list without first 2 elements List(3)

haha.dropRight(2) // returns List(1)

haha.exists (s => s == "until") // determine whether string 'until' exists in list

haha.filter( s => s.length == 4 ) // returns new List whose items have string length of 4

haha.forall( s => s.endsWith("l") ) // determine if each string in list finishes with 'l'. returns a boolean

haha.foreach(s => println(s)) // execute a println statement for each item in list


haha.head

haha.last

haha.init // all but last element
haha.tail // all but first

haha.map(s => s +'y')

haha.remove(s => s.length == 4)

haha.reverse

haha.sort((s, t) => s.charAt(0).toLower < t.charAt(0).toLower)
```

## Tuples
Tuples are immutable but can contain different types of objects.

```scala
val pair = (99, "haha")
println(pair._1)
println(pair._2)
```

The type is `Tuple2[Int, String]`. Actual type depends on number of items.

Why you can't use pair(0) to access elements: the apply method always return the
same type, but for a tuple, each element might be of a different type. Tuples
also start with 1 since it is  a tradition set by other languages for tuples.

## Sets and maps
List: immutable, arrays: mutable.

Scala also provide mutable and immutable alternatives for sets and maps.

```scala
var jetSet = Set("boeing", "airbus")
jetSet += "Lear"
println(jetSet.contains("Cessna"))
// this is immutable
```

Set -- scala.collection.{immutable|mutable}.Set -> scala.collection.{immutable|mutable}.HashSet

If you want to use a mutable set:

```scala
import scala.collection.mutable.Set
val x = Set("1", "2", "3")
movieSet += "haha"
println(movieSet) // 1, 2, 3, haha
```

### Maps
Mutable and immutable, Map -> HashMap

```scala
import scala.collection.mutable.Map

val maps = Map[Int, String]()

treasureMap += (1 -> "Go to island")
println(treasureMap(1))
```

[Int, String] is required because the constructor does not pass any values,
therefore the scala compiler can't infer the type.


## Read lines from a file
```scala
import scala.io.Source

if (args.length > 0) {
    for (line <- Source.fromFile(args(0)).getLines())
        println(line.length + " " + line)
} else {
    Console.err.println("Please enter filename")
}
```
getLines method returns an Iterator[String], which provides one line for each
iteration, excluding the end of line character.

## Classes and objects
```scala
class Haha {
    var sum = 0
    private var x = 1

    def add(b: Byte): Unit = {
        sum += b
    }
    // or
    def add2(b: Byte): Unit = sum += b

    // or
    def add3(b: Byte) { sum += b }
    // only use this ^^ if it returns Unit

    def checkSum(): Int = {
        return ~(sum & 0xFF) + 1
    }
}

val x = new Haha
x.sum = 4
x.x // won't compile
```

### Singleton objects
Classes in Scala cannot have static members. Instead, Scala has singleton objects.

```scala
object Haha {
    private val cache = Map[String, Int]()

    def calculate(s: String): Int =
        if (cache.contains(s))
            cache(s)
        else {
            ...
        }
}

Haha.calculate("Boo")
```
When a singleton object shares the same name with a class, it is called the
class's companion object. YOu must define both the class and the companion
object in the same source file. A class and its companion object can access each
other's private members.

One difference between classes and singleton objects is that singleton objects
can't take parameters.

A singleton object that does not share the same name with a companion class is
called a standalone object.

```scala
import Haha.calculate

object Summer {
    def main(args: Array[String]) {
        for(arg <- args) {
            println(arg + calculate(arg))
        }
    }
}
```

Save the file as Summer.scala. However, in scala, you can name the file anything
you want. However, this is not recommended.

Scala also comes with a compiler daemon called `fsc`:
```
fsc Summer.java
```

Scala provides a trait, scala.Application:

```scala
object Summer extends Application {
    for() {
        ...
    }
}
```

You just need to put your code inside the object. You can't use this trait if
you want to access `args`. You need an explicit main method is multi-threaded.

## Basic types and operations

### Symbol literals
```scala
'identifer
val s = 'symbol
def upgrade(r: Symbol) {}
```

### indexOf
```scala
s indexOf('o', 5)
5: index to start searching for 'o'
```

Prefix: method name before object (e.g -7, !found)
Postfix: method after object (e.g 7 toLong)
```scala
-2.0 === 2.0.unary_-

^^ the actual method name
```
+, -, ! and ~ can be used as prefix operators.

In Scala, you can leave off the empty () if desired. Convention is to leave the
parantheses if method has side effects.(like println)

```scala
s.toLowerCase == s toLowerCase
```

## Functional objects
Objects that do not have any mutable states.

e.g Rational

val oneHalf = new Rational(1, 2)

```scala
class Rational(n: Int, d: Int) {
    require(d != 0)
    val numer: Int = n
    val denom: Int = d // 1
    override def toString = n + "/" + d

    def add(that: Rational): Rational =
                             new Rational(
                                numer * that.denom + that.numer * denom,
                                denom * that.denom
                                     )
}
```
n and d are class parameters.

require is a precondition that says d must not be zero. If not true, require
will throw an IllegalArgumentException.

The class parameters seem to be private. So you have to add 1.

Self reference: this

### Auxiliary constructors
Alternate constructors

```scala
val y = new Rational(3) // 3/1

...


class Rational(n: Int, d: Int) {
    def this(n: Int) = this(n, 1)
```

### Private fields and methods
```scala
private val g = ...
private def ...

def + (x: Rational) = ...
```

The * method will bind more tightly than the + method.

You can do method overloading.

r * 2 is not the same as 2 * r, because of the way the * method is defined.
You can solve this by using the implicit keyword:
You can create an implicit function that converts integers to rational numbers.
```scala
implicit def intToRational(x: Int) = new Rational(x)
```

implicit keyword tells the compiler to apply it to a number of situations.

## Built-in control structures

```scala
def haha(x: Long, y: Long): Long =
    if (y == 0) x else haha(y, x % y)
```

### for
Iterate through collections
```scala
for (file <- fileshere)
```
file <- fileshere known as a generator. In each iteration, a new val named file
is generated with an element value.

Filtering

```scala
for (file <- fileshere if <condition>) // notice the lack of ()
```

Nested Iterations

```scala
for (file <- fileshere if <condition>; line <- fileLines(file if <condition>)) // notice the lack of ()
```

If you prefer, you can use curly braces instead of parantheses to surround the
generators and filters. One advantage to using curly braces is that you can
leave off some of the semicolons that are needed when you use parantheses.


### Mid stream variable bindings
```scala
for {
    file <- filesHere
    if file.getName.endsWith(".scala")
    line <- filesLines(file)
    trimmed = line.trim
    if trimmed.matches(pattern)
} println(file +": "+ trimmed)
```

### Producing a new collection
```scala
def scalaFiles =
for {
    file <- filesHere
    if file.getName.endsWith(".scala")
} yield file
```

scalaFiles will be Array[File]

## Exception Handling
### Throw exceptions
```scala
throw new IllegalArgumentException
```
throw is an expression that has a result type.

```scala
val half =
 if (n%2 == 0)
     n/2
 else
     throw new RuntimeException("n must be even")
```

A throw has type Nothing.

### Catching exceptions
```scala
import java.io.FileReader
import java.io.FileNotFoundException
import java.io.IOException

try {
    val f = FileReader("input")
} catch {
    case ex: FileNotFoundException => // handle missing file
    case ex: IOException => // handle IO exception
} finally {
    f.close()
}
```

## Match exceptions
```scala
val firstArg = if (args.length > 0) args(0) else ""

val friend =
firstArg match {
    case "salt" => "booo"
    case "chips" => "haha"
    case _ => "huh"
}
```

No breaks and continue in Scala.
However, if you really want it,
```scala
import scala.util.control.Breaks._
breakable {
    while(true) {
        ...
        if(...) break
    }
}
```

Notes on for:

for () yield { <lots> of expression and last item is the return value } or
for () yield <variable> or
for {} yield {}
for {} yield <variable>


## Functions and Closures
You can nest functions, just like in Python.

### Function literal
```scala
val increase = (x: Int) => x + 1
increase(3)
```

Short form:
```scala
someNumbers.filter((x) => x > 0) // you can leave off the parameter type
// or
someNumbers.filter(x => x > 0) // you can leave off the parameter type
```

### Placeholder syntax
To make a function literal even more concise, you can use underscores as
placeholders.
```scala
someNumbers.filter(_ > 0)

val f = (_: Int) + (_: Int)

someNumbers.foreach(println _)
```

### Partially applied functions
someNumbers.foreach(println _)

A partially applied function is an expression in which you don't supply all the
arguments needed by the function.
```scala
def sum(a: Int, b: Int, c: Int) = a + b + c
val a = sum _

a(1,2 ,3) // equivalent to a.apply(1, 2, 3)

val  b = sum(1, _: Int, 3)

b(2)
```

The scala compiler instantiates a function value that takes the three integer
parameters missing from the partially applied function expression, sum _, and
assigns a reference to the new function value.

### Closures
```scala
var more = 1
val addMore = (x: Int) => x + more
```

```scala
val someNumbers = List(1, 2, 3)
var sum = 0

someNumbers.foreach(sum += _)
```

```scala
// a function that returns another function
def makeIncreasr(more: Int) = (x: Int) => x + more

val x = makeIncreasr(10)

x(5) // returns 15
```

## Special function call forms
varargs
```scala
def echo(args: String*) =
    for (arg <- args) println(arg)

echo("hello", "hi", "hi")

val arr = Array("hello", "world")

echo(arr: _*) // splat in ruby
```

Named arguments
```scala
def speed(distance: Float, time: Float): Float = 
    distance / time

speed(distance = 100, time = 5)
```

Default parameter values
```scala
def printTime(out: java.io.PrintStream = Console.out) =
    out.println("time = "+ System.currentTimeMillis())
```

## Tail recursion
Functions which call themselves as their last action are tail recursive. Scala
compiler detects that and replaces it with a jump back to the beginning of the
function, after updating the function parameters with new values.

```scala
// not tail recursion
def boom(x: Int) = 
    if ...
    else boom(x - 1) + 1


// tail recursion
def boom(x: Int) = 
    if ...
    else boom(x - 1) 
```

## Control Abstraction
Higher Order functions: functions that take functions as parameters.

```scala
def filesMatching(query: String,
        matcher: (String, String) => Boolean) = {
            for(file <- filesHere; if matcher(file.getName, query))
                yield file
}

def filesEnding(query: String) =
    filesMatching(query, _.endsWith(_))


def filesContaining(query: String) =
    filesMatching(query, _.contains(_))

def filesRegex(query: String) =
    filesMatching(query, _.matches(_))
```

(fileName: String, query: String) => fileName.endsWith(query_)


```scala
// shorter form
def filesMatching(query: String,
        matcher: String => Boolean) = {
            for(file <- filesHere; if matcher(file.getName))
                yield file
}

def filesEnding(query: String) =
    filesMatching(_.endsWith(query))


def filesContaining(query: String) =
    filesMatching(_.contains(query))

def filesRegex(query: String) =
    filesMatching(_.matches(query))
```

## Simplifying client code
```scala
def containsNeg(nums: List[Int]) = nums.exists(_ < 0)
def containsOdd(nums: List[Int]) = nums.exist (_ % 2 == 1)
```

## Currying
```scala
def curriedSum(x: Int)(y: Int) = x + y

def curriedSum2(x: Int) = (y: Int) => x + y

curriedSum(1)(2)

val onePlus = curriedSum(1)_
onePlus(2)
```

## Writing new control structures
```scala
def twice(op: Double => Double, x: Double) = op(op(x))

twice(_ + 1, 5)
// answer is 7.0
```

In any method invocation in Scala in which you're passing in exactly one
argument, you can opt to use curly braces to surround the argument instead of
parentheses.

```scala
println{ "hello" }
```

Purpose is to be able to write this:
```scala
def withPrintWriter(file: File)(op: PrintWriter => Unit) {
    val writer = new PrintWriter(file)
    try {
        op(writer)
    } finally {
        writer.close()
    }
}

val file = new File("date.txt")

withPrintWriter(file) {
    writer => writer.println(new java.util.Date)
}
```

## By-name parameters
```scala
val assertionsEnabled = true

// use that syntax instead of:
def boolAssert(predicate: => Boolean) =
    if(assertionsEnabled && !predicate)
        throw new AssertionError

boolAssert(5 > 3)

// instead of that:
def boolAssert2(predicate: () => Boolean) =
    if(assertionsEnabled && !predicate)
        throw new AssertionError

boolAssert2(() => 5 > 3)


def boolAssert3(predicate: Boolean) =
    if(assertionsEnabled && !predicate)
        throw new AssertionError
```


difference between boolAssert and boolAssert3:

For boolAssert3(5 > 3), condition 5 > 3 is evaluated `before` the call to
boolAssert3.

By contrast, the condition is not evaluated before the call.

So running:
```scala
boolAssert(x/0 == 0) // that won't yield an exception
boolAssert3(x/0 == 0) // will throw and exception
```

# Composition and Inheritance

Composition means one class hold a reference to another.

e.g Create a library for building and rendering 2D layout elements. Each element
will represent a rectangle filled with text. For convenience, the library will
provide factory methods named "elem" that construct new  elements from passed
data.

```scala
elem(s: String): Element
```

```scala
val column1 = elem("hello") above elem("***")
val column2 = elem("***") above elem("world")
column1 besides column2

// prints
// hello ***
// *** world
```

## Abstract class
```scala
abstract class Element {
    def contents: Array[String]
    def height: Int = contents.length
    def width: Int = if (height == 0) 0 else contents(0).length
}

// Note.
// Instead of
def height(): Int
// we use
def height: Int
```

## Extending classes
```scala
class ArrayElement(conts: Array[String]) extends Element {
    def contents: Array[String] = conts
}
```
scala.AnyRef == java.lang.Object


### Overriding methods and fields
Fields and methods belong to the same namespace. In Scala it is forbidden to
define a field and a method with the same name in the same class.

### Defining parametric fields
You can combine parameter and field in a single parametric field definition:

```scala
//Instead of:
class ArrayElement(conts: Array[String]) extends Element {
    val contents: Array[String] = conts
}

class ArrayElement (
    val contents: Array[String]
) extends Element {}
```

### Invoking superclass constructors
```scala
class LineElement(s: String) extends ArrayElement(Array(s)) {
    override def width = s.length
    override def height = 1
}
```

### Using override modifiers
Scala requires such a modifier for all members that override a concrete member
in a parent class. Modifier is optional if a member implements an abstract
member with the same name.

Rule provides useful information for the compiler that helps avoid hard-to-catch
errors and make systems evolution safer.

### Declaring final members
Same as in java...

### Implementing above, beside, and toString
```scala
def above(that: Element): Element =
    new ArrayElement(this.contents ++ that.contents)
```

`++` operation concatenates two arrays.


# Scala Hierarchy
Every class inherits from a common superclass named `Any`. Methods defined in
Any are universal methods. Scala also defines Null and Nothing.

Value classes are defined as abstract and final. You cannot instantiate them
(new Int).

Unit corresponds to Java's void type.


## Int
```scala
43 max 45
1 until 5
1 to 5
3.abs
(-3).abs
```

Methods min, max, until, to, and abs are all defined in a class
scala.Runtime.RichInt, and there is implicit conversion from class Int to RichInt.

The other subclass of the root class Any is AnyRef.  This is the base class of
all reference classes in Scala. AnyRef is in fact just an alias for class
java.lang.Object.

Scala classes are different from Java classes in that they all inherit from a
special marker trait called ScalaObject.

## How primitives are implemented
Scala integers are stored in the same way as Java: 32 bit words. Scala uses the
backup class java.lang.Integer whenever an Integer needs to be seen as a Java object.
(toString)

Integers of type Int are converted transparently to 'boxed integers' of type
java.lang.Integer whenever necessary.


Java '==' (compare if two objects point to the same object), is equal to 'eq'

```scala
x eq y
x neq y
```

## Bottom types
scala.Null and scala.Nothing

They handle some corner cases of Scala's object-oriented type system in a
uniform way.

Class Null is the type of the `null` reference. Null is not compatible with
value types. (no val i: Int = null) Null is a subclass of every reference class
(every class that itself inherits from AnyRef).

One use of Nothing is that it signals abnormal termination.

```scala
def error(message: String): Nothing = 
    throw new RuntimeException(message)
```

Because Nothing is a subtype of every other type, you can use methods like error
in very flexible ways.

```scala
def divide(x: Int, y: Int): Int = 
 if (y != 0) x/y
 else error("Can't divide by zero")
```


# Traits
A trait encapsulates method and field definitions, which can then be reused by
mixing them into classes. Unlike class inheritance, in which each class must
inherit from just one superclass, a class can mix in any number of traits.

Two common ways they are useful:
- Widening thin interfaces to rich ones
- Defining stackable modifications

```scala
trait Philosophical {
    def philosophize() {
        println("haha")
    }
}
```

It has the default superclass of AnyRef. Once a trait is defined, it can be
mixed in to a class using either `extends` or `with` keywords. Scala programmers
mix in rather than inherit from them.

```scala
class Frog extends Philosophical {
    override def toString = "green"
}
```

You can use the extends keyword to mix in a trait; in that case you implicitly
inherit the trait's superclass. Methods inherited from a trait can be used just
like methods inherited from a superclass.

A trait also defines a type.

```scala
val phil: Philosophical = frog
```

If you wish to mix traits with superclass:
```scala
class Animal
trait HasLegs

class Frog extends Animal with Philosophical with HasLegs {
    override def toString = "green"
}
```

You can do anything in a trait definition that you can do in a class definition,
with only two exceptions.

- A trait cannot has class parameters, parameters passed to the primary
  constructor of a class

- In classes, super is statically bounded, in traits, they are dynamically
  bounded.

## Thin versus rich interfaces
One major use of traits is to automatically add methods to a class in terms of
methods the class already has. Traits enrich a thin interface, making it into a
rich interface.

Java interfaces are more often thin than rich.

To enrich an interface using traits, simply define a trait with a small number
of abstract methods - the thin part of the trait's interface - and a potentially
large number of concrete methods, all implemented in terms of abstract methods.
Then you can mix the thin portion of the interface, and end up with a class that
has all of the rich interface available.


## The Ordered trait
```scala
class Rational(n: Int, d: Int) extends Ordered[Rational] {
    // ...
    def compare(that: Rational) = 
        (this.numer * that.denom) - (that.numer * this.denom)
}
```

This version of Rational mixes in the Ordered trait. You need to define a
compare method for comparing two objects.

## Traits as stackable modifications
Traits let you modify the methods of a class, and they do so in a way that
allows you to stack those modifications with each other.

```scala
trait Doubling extends IntQueue {
    abstract override def put(x: Int) { super.put(2 * x) }
}

val queue = new IntQueue with Doubling
```

## To trait or not to trait
If behaviour will not be reused, then make it a concrete class.

If it might be reused in multiple, unrelated objects, make it a trait.

If you want to inherit from it in *Java* code, use an abstract class.

If you plan to distribute it in compiled form, you might lean towards an
abstract class. Issue is that when a trait gains or loses a member, any classes
that inherit from it must be recompiled.


# Packages and Imports
## Putting code in packages
You can place code into named packages in Scala in 2 ways. First, you can place
the contents of an entire file into a package by putting a package clause at
the top of the file.

```scala
package haha.hoho
class Navigator
```

Other way:
```scala
package haha.hoho {
    class Navigator
}
```

You can part different parts of a file in different packages.

## Concise access
```scala
package haha {
    package hoho {

        class Navigator {
            val map = new StarMap
        }

        class StarMap


            package tests {
                class NavigatorSuite
            }
    }
    class Ship {
        val nav =  new hoho.Navigator
    }

    package fleets {
        class Fleet {
            def addShip() { new Ship }
        }
    }
}
```

## Imports
```scala
import haha._ // same as in java import haha.*
import haha.ImportantClass._ // static import in java
```

We don't use * since * is a valid operator in scala.

In scala, imports may appear anywhere, may refer to objects, and let you rename
and hide some of the imported members.

```scala
import Fruits.{Apple, Orange} 
// import just members Apple and Orange from object Fruits

import Fruits.{Apple => McIntosh, Orange}
// import 2 members Apple and Orange, rename Apple to McIntosh
// original name => new name

import Fruits.{Pear => _, _}
// import all members of Fruits except Pear
```

## Implicit imports
```scala
import java.lang._
import scala._
import Predef._
```

Predef contains many definitions of types, methods, and implicit coversions that
are commonly used on Scala programs.

## Access modifiers
Private members are treated similarly to Java.

Every member not labeled private or protected is public. There is no explicit
modifier for public members.


### Scope of protection
A modifier of the form `private[X]` or `protected[X]` means that access is
private or protected 'up to' X, where X designates some enclosing package, class
or singleton object.

Finally, Scala also has an access modifier that is even more restrictive than
private. A definition labeled private[this] is accessible only from within the
same object htat contains the definition. Such a definition is called object-private.

??

## Package objects
Each package is allowed to have one package object. ???


[ Skipped assertions and unit testing ]

# Case classes and Pattern matching

