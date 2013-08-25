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
