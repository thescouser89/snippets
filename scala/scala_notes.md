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
168 explain use of curly braces {} in for, and continue with trimeed variable
thingy
