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


pg 69

