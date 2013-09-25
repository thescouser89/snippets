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


