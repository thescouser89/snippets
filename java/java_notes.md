<nav id="insert_nav_document">
<h1>Table Of Contents</h1>
<ul>
  <li><a href="#random-notes">Random Notes</a></li>
  <li><a href="#introduction-to-objects">Introduction to Objects</a></li>
  <ul>
    <li><a href="#terminology">Terminology</a></li>
    <li><a href="#where-storage-lives">Where storage lives</a></li>
    <li><a href="#java-se5-autoboxing">Java SE5 autoboxing</a></li>
    <li><a href="#static-keyword">Static keyword</a></li>
    <li><a href="#first-compilation">First compilation</a></li>
    <li><a href="#comments-and-embedded-documentation">Comments and embedded documentation</a></li>
    <ul>
      <li><a href="#syntax">Syntax</a></li>
      <li><a href="#embedded-html">Embedded HTML</a></li>
      <li><a href="#tags">Tags</a></li>
      <li><a href="#some-example-tags">Some example tags</a></li>
    </ul>
  </ul>
  <li><a href="#operators">Operators</a></li>
  <ul>
    <li><a href="#auto-incrememnt-and-decrement">Auto Incrememnt and Decrement</a></li>
    <li><a href="#beware-of-equals">Beware of equals</a></li>
    <li><a href="#short-circuiting">Short-circuiting</a></li>
    <li><a href="#literals">Literals</a></li>
    <li><a href="#exponential-notation">Exponential notation</a></li>
    <li><a href="#shifts">Shifts</a></li>
    <li><a href="#ternary-if-else-operator">Ternary if-else operator</a></li>
    <li><a href="#controlling-execution">Controlling Execution</a></li>
  </ul>
  <li><a href="#initialization-and-cleanup">Initialization and Cleanup</a></li>
  <ul>
    <li><a href="#method-overloading">Method overloading</a></li>
    <ul>
      <li><a href="#distinguishing-overloaded-methods">Distinguishing overloaded methods</a></li>
      <ul>
        <li><a href="#overloading-with-primitives">Overloading with primitives</a></li>
        <li><a href="#overloading-on-return-values">Overloading on return values</a></li>
      </ul>
      <li><a href="#this">this</a></li>
      <li><a href="#fluent-api">Fluent API</a></li>
      <li><a href="#calling-constructors-from-constructors">Calling constructors from constructors</a></li>
    </ul>
    <li><a href="#cleanup-finalization-and-garbage-collection">Cleanup: finalization and garbage collection</a></li>
    <ul>
      <li><a href="#the-termination-condition">The termination condition</a></li>
    </ul>
    <li><a href="#member-initialization">Member Initialization</a></li>
    <ul>
      <li><a href="#specifying-initialization">Specifying initialization</a></li>
      <li><a href="#constructor-initialization">Constructor initialization</a></li>
      <li><a href="#order-of-initialization">Order of initialization</a></li>
    </ul>
    <li><a href="#static-data-initialization">static data initialization</a></li>
    <ul>
      <li><a href="#explicit-static-initialization">Explicit static initialization</a></li>
      <li><a href="#non-static-instance-initialization">Non-static instance initialization</a></li>
    </ul>
    <li><a href="#array-initialization">Array initialization</a></li>
    <li><a href="#variable-argument-lists">Variable argument lists</a></li>
    <li><a href="#enumerated-types">Enumerated types</a></li>
  </ul>
  <li><a href="#access-control">Access Control</a></li>
  <ul>
    <ul>
      <li><a href="#collision">Collision</a></li>
    </ul>
    <li><a href="#static-import">Static import</a></li>
    <li><a href="#package-access">Package access</a></li>
    <li><a href="#inheritance">Inheritance</a></li>
    <ul>
      <li><a href="#initializing-the-base-class">Initializing the base class</a></li>
    </ul>
    <li><a href="#overriding">Overriding</a></li>
    <li><a href="#upcasting">Upcasting</a></li>
    <li><a href="#final-keyword">Final keyword</a></li>
    <ul>
      <li><a href="#blank-finals">Blank finals</a></li>
      <li><a href="#final-arguments">Final arguments</a></li>
      <li><a href="#final-methods">Final methods</a></li>
      <li><a href="#final-and-private">Final and private</a></li>
    </ul>
  </ul>
  <li><a href="#polymorphism">Polymorphism</a></li>
  <ul>
    <ul>
      <li><a href="#method-call-binding">Method-call binding</a></li>
      <li><a href="#pitfall-fields-and-static-methods">Pitfall: fields and static methods</a></li>
    </ul>
    <li><a href="#constructors-and-polymorphism">Constructors and polymorphism</a></li>
    <li><a href="#inheritance-and-cleanup">Inheritance and cleanup</a></li>
    <li><a href="#behaviour-of-polymorphic-methods-inside-constructors">Behaviour of polymorphic methods inside constructors</a></li>
    <li><a href="#covariant-return-types">Covariant return types</a></li>
    <li><a href="#abstract">Abstract</a></li>
  </ul>
  <li><a href="#interfaces">Interfaces</a></li>
  <ul>
    <li><a href="#extending-an-interface-with-inheritance">Extending an interface with inheritance</a></li>
    <li><a href="#inner-class">Inner Class</a></li>
    <ul>
      <li><a href="#the-link-to-the-outer-class">The link to the outer class</a></li>
      <li><a href="#using-the-.this-and-.new">Using the .this and .new</a></li>
      <li><a href="#inner-classes-and-upcasting">Inner classes and upcasting</a></li>
    </ul>
    <li><a href="#anonymous-inner-classes">Anonymous Inner classes</a></li>
    <li><a href="#nested-class">Nested class</a></li>
    <ul>
      <li><a href="#reaching-outward-from-a-multiply-nested-class">Reaching outward from a multiply-nested class</a></li>
    </ul>
    <li><a href="#why-inner-classes?">Why inner classes?</a></li>
    <li><a href="#closures-and-callbacks">Closures and Callbacks</a></li>
    <li><a href="#can-inner-classes-be-overridden?">Can inner classes be overridden?</a></li>
    <ul>
      <li><a href="#local-inner-classes">Local Inner classes</a></li>
      <li><a href="#inner-class-identifiers">Inner class identifiers</a></li>
    </ul>
  </ul>
  <li><a href="#holding-your-objects">Holding your objects</a></li>
  <ul>
    <li><a href="#generics-and-type-safe-containers">Generics and type-safe containers</a></li>
    <li><a href="#basic-concepts">Basic Concepts</a></li>
    <li><a href="#adding-groups-of-elements">Adding groups of elements</a></li>
    <ul>
      <li><a href="#printing-containers">Printing containers</a></li>
    </ul>
    <li><a href="#list">List</a></li>
    <li><a href="#iterator">Iterator</a></li>
    <ul>
      <li><a href="#linked-list">Linked list</a></li>
      <li><a href="#stack">Stack</a></li>
      <li><a href="#set">Set</a></li>
      <li><a href="#map">Map</a></li>
      <li><a href="#queue">Queue</a></li>
      <li><a href="#priority-queue">Priority Queue</a></li>
    </ul>
    <li><a href="#foreach-and-iterators">foreach and iterators</a></li>
    <li><a href="#summary">Summary</a></li>
  </ul>
  <li><a href="#error-handling-with-exceptions">Error Handling with Exceptions</a></li>
  <ul>
    <li><a href="#catching-an-exception">Catching an exception</a></li>
    <li><a href="#creating-your-own-exceptions">Creating your own exceptions</a></li>
    <li><a href="#the-exception-specification">The exception specification</a></li>
    <li><a href="#catching-any-exception">Catching any exception</a></li>
    <li><a href="#the-stack-trace">The Stack Trace</a></li>
    <li><a href="#rethrowing-an-exception">Rethrowing an Exception</a></li>
    <li><a href="#exception-chaining---keep-the-information-about-the-originating-exception---">Exception chaining - Keep the information about the originating exception --</a></li>
    <li><a href="#standard-java-exceptions">Standard Java exceptions</a></li>
    <li><a href="#runtime-exception">Runtime Exception</a></li>
    <li><a href="#performing-cleanup-with-finally">Performing Cleanup with finally</a></li>
    <li><a href="#pitfall--the-lost-exception">Pitfall -the lost exception</a></li>
    <li><a href="#exception-restrictions">Exception Restrictions</a></li>
  </ul>
  <li><a href="#strings">Strings</a></li>
  <ul>
    <li><a href="#overloading-'+'-vs-stringbuilder">Overloading '+' vs StringBuilder</a></li>
    <li><a href="#formatting-output">Formatting output</a></li>
    <li><a href="#the-formatter-class">The Formatter class</a></li>
    <ul>
      <li><a href="#format-specifiers">Format Specifiers</a></li>
    </ul>
    <li><a href="#regular-expressions">Regular Expressions</a></li>
    <ul>
      <li><a href="#basics">Basics</a></li>
      <li><a href="#quantifiers">Quantifiers</a></li>
      <li><a href="#pattern-and-matcher">Pattern and Matcher</a></li>
    </ul>
  </ul>
  <li><a href="#type-information">Type Information</a></li>
</ul>
</nav>
# Random Notes
- [need to work on Closures callbacks and framework thingy]
- Fields and static methods are resolved at runtime, whereas normal methods at
  runtime.
- need to finish generics section

- All numeric types in Java are signed.

- IMPORTANT NOTE ON FOR LOOP

There are two types of elements in your class:
Fields
: Data members - an object of any type that you can talk
  to via its reference, or a primitive type.

Methods
: member functions

```java
for (init-expression ; cond-expression ; loop-expression) {
    statement;
}
```
First the init-expression is executed once.The the cond-expression is evaluated
before it continues to the statement. At the end the loop-expression is
executed.

Makes no difference if you do i++ or ++i. The latter is preferable as it is
sometimes more efficient (eg looping with iterators that are not pointers) and
never less efficient.

When you make a particular request to an object, that method is called. This
process is usually summarized by saying that you "send a message" to an object,
and the object figures out what to do with that message.


# Introduction to Objects
`Booch: An object has state, behavior and identity.`

## Terminology
State
: Internal data

Behavior
: Methods

Identity
: Each object has a unique address in memory

Composition
: referred to as a "has-a" relationship, as in A car has an engine.

Is-a relationship
: Pure substitution (overriding methods only)

Is-like-a
: You add more methods to the super class. The new type has the interface of the
  old type but is also conatins other methods, so you can't really say it's
  exactly the same.

Early Binding
: The compiler generates a call to a specific function name, and the
  runtime system revolves this call to the absolute address of the code to
  be executed.

Late Binding (Used in OOP)
: When you send a message to an object, the code being called isn't determined
  until run time. The compiler does ensure that the method exists and performs
  type checking on the arguments and return value, but it doesn't know the exact
  code to execute.

  To perform late binding, Java uses a special bit of code in lieu of the
  absolute call. This code calculates the address of the method body, using
  information stored in the object.

Parameterized types
: With a parameterized container, the compiler could customize that container so
  that it would accept only Shapes and fetch only Shapes. (Called Generics)

Direct Memory Allocation
: With languages that allow objects to be created on the stack, the
  compiler determines how long the object exists and can automatically destroy
  it. However, if you create it on the heap the compiler has no knowledge of its
  lifetime. In a language like C++, you must determine programmatically when to
  destroy the object.

## Where storage lives
Registers
: fastest storage

Stack
: lives in general random-access memory area, but has direct support from the
  processor via its stack pointer. The stack pointer is moved down to create new
  memory and moved up to release that memory.

  Java objects themselves are not placed on the stack.

Heap
: General-purpose pool of memory where all Java objects live. Unlike the stack,
  the compiler does not need to know how long that storage must stay on the
  heap.  Of course, there's a price you pay for this flexibility: It may take
  more time to allocate and clean up heap storage than stack storage.

## Java SE5 autoboxing
```java
Character ch = new Character('x');
Character ch = 'x'; // autoboxing
```
## Static keyword
If you want to have only a single piece of storage for a particular field,
regardless of how many objects of that class are created, of even if no objects
are created. Use it if you need a method that you can call even if no objects
are created.

Of course, since static methods don't need any objects to be created before they
are used, they cannot directly access non-static members or methods by simply
calling those other members without referring to a named object

## First compilation
At the beginning of each program file, you must place any necessary import
statements to bring in extra classes you'll need for the code in that file.

There's a certain library of classes that are automatically brought into every
Java file: java.lang

System.out is a static PrintStream object. Since it's static, you don't need to
create anything with new. The out object is always there, and you can just use
it.

```java
// Displays all of the properties from the system where you are running the
// program, so it gives you environment information. The list() method sends
// the results to its arguments, System.out.

System.getProperties().list(System.out);

// You can also ask for a specific property
System.out.println(System.getProperty("user.name"));
```

## Comments and embedded documentation
If the documentation and the code are seperate, it becomes tedious to change the
documentation every time you change the code. The tool to extract the comments
is called Javadoc.

The output of Javadoc is an HTML file that you can view with your Web Browser.
In addition, you can write your own Javadoc handlers, called doclets, if you
want to perform special operations on the information procesed by Javadoc (to
produce output in a different format, for example).

### Syntax
All of the Javadoc commands occur only within `/** */` comments.

There are two primary ways to use Javadoc: Embed HTML or use "doc tags"

There are three "types" of comment documentation, which correspond to the
element the comment precedes: class, field or method.

```java
/** A class comment */
public class Documentation {}
```

Note that  Javadoc will process comment documentation for only public and
protected members. Comments for private and package-access members are ignored,
and you'll see no output.


### Embedded HTML
```java
/**
 * <pre>
 * System.out.println(new Date());
 * </pre>
 * You can <em>even</em> insert a list:
 * <ol>
 * <li> Item one
 * <li> Item two
 * <li> Item thre
 * </ol>
 */
```
### Tags
Standalone doc tags are commands that start with an '@' and are placed at the
beginning of a comment line.  Inline doc tags can appear anywhere within a
Javadoc comment and also start with an '@' but are surrounded by curly braces.

### Some example tags
**@see**
: This tag allows you to refer to the documentation of other classes.

```java
@see classname
@see fully-qualified-classname
@see fully-qualified-classname#method-name
```

Each one adds a hyperlinked "See Also" entry to the generated documentation.

**{@link package.class#member label}**
: Very similar to **@see**, except that it can be used inline and uses the label
  as the hyperlink test rather that "See Also."


**@docRoot**
: Produces the relative path to the documentation root directory

**@inheritDoc**
: Inherits the documentation from the nearest base class of this class into the
  current doc comment.

**@version**
: This is of the form: `@version version-information`

**@author**
: author-information  in which author-information could also include your email
  address or any other appropriate information.

You can have multiple author tags for a list of authors, but they must be placed
consecutively.

**@since**
: This tag allows you to indicate the version of this code that began using a
  particular feature.

**@param**
: This is used for method documentation

```java
@param parameter-name description
```

**@return**
: This is used for method documentation, and looks like this:

```java
@return description
```

**@throws**
: Objects that can be "thrown" out of a method if that method fails.

```java
@throws fully-qualified-class-name description
```

**@deprecated**
: This is used to indicate features that were superseded by an improved feature.
  A method that is marked @deprecated causes the compiler to issue a warning if
  it is used. In Java SE5, the @deprecated Javadoc tag has been superseded by
  the `@Deprecated` annotation.


The Access Control chapter introduces the concept of the static import that was
added to Java SE5, and creates a tiny library to simplify writing print
statements. However, you don't need to know those details in order to begin
using that library.

```java
import static net.mindview.util.Print.*;
```
Unary minus inverts the sign on the data. Unary plus provides symmetry with
unary minus, although it does not not have any effect.


# Operators

## Auto Incrememnt and Decrement
For pre-increment and pre-decrement (++a, --a) the operation is performed and
the value is produced.

For post-decrement, the value is produced, then the operation is performed.

## Beware of equals
The default behaviour of equals() is to compare references. So it literally does
a == comparison.  Most of the Java library classes implement equals() so that it
compares the contents of objects instead of their references.

## Short-circuiting
When dealing with logical operators, you run into a phenomenon called
"short-circuiting". This means that the expression will be evaluated until the
truth of falsehood of the entire expression can be unambiguously determined.  As
a result, the latter parts of a logical expression might not be evaluated.

## Literals
```
Hexadecimal 0x
Octal       0  (Leading 0)
```
## Exponential notation
_e_ means 10 to the power.

E was probably used because at that time, the keyboards were all uppercase.  The
'E' simply stood for exponential [ not logarithm base 'e' ] which was for the
base of the number system used - usually 10. [ Fortran] The problem arose as
lowercase crept into Fortran, not at its beginning.

## Shifts
- `|` bitwise or
- `&` bitwise and
- `^` bitwise xor
- `~` NOT
- `>>` signed right shift - uses sign extension
- `>>>` unsigned right shift, which uses zero extension.
- `<<` left shift

If you shift a char, byte, or short, it will be promoted to int before the shift
takes place, and the result will be an int.

## Ternary if-else operator
The ternary operator, also called the conditional operator, is unusual because
it has three operands.

```java
boolean-exp ? value0 : value1;
```
The conditional operator is different from if-else because it produces a value.

## Controlling Execution
- if-else, while, do-while, for, return, break, switch.
- do-while

The sole difference between while and do-while is that statement of the do-while
always executes at least once, even if the expression evaluated to *false* the
first time.

- **for**
```java
for (initialization; Boolean expression; step) {
    statement;
}
```

- **for-each**
For use with arrays and containers. This is often called the for each syntax,
and it means that you don't have to create an int to count through a sequence of
items - the for each produces each item for you, automatically.

```java
float[] f = new float[10];
for (float x : f) {
    System.out.println(x);
}
```
Any method that returns an array is a candidate for use with foreach.

**for-each** will also work with any object that is *Iterable*.

- **return**
The return keyword has two purposes: It specifies what value a method will
return (if it doesn't have a void return value) and it causes the current method
to exit, returning that value.

- **break and continue**
*break* quits the loop without executing the rest of the statements in the loop.

*continue* stops the execution of the current iteration and goes back to the
beginning of the loop to begin the next iteration.

A second for of the infinite loop is for(;;). The compiler treats both
while(true) and for(;;) in the same way.

- **goto**

A label is an identifier followed by a colon: `label1:`

The only place a label is useful in Java is right before an iteration statement.
And that means *right before* - it does no good to put any other statement
between the label and the iteration.

The sole reason to put a label before an iteration is if you're going to nest
another iteration or a switch inside it.

That's because the break and continue keywords will normally interrupt only the
current loop, but when used with a label, they'll interrupt the loops up to
where the label exists:

```java
label1:
outer-iteration {
  inner-iteration {
      break; // 1
      continue; // 2
      continue label1; // 3
      break label1; // 4
  }
}
```

In the cases where breaking out of a loop will also exit the method, you can
simply use a return.

In Dijkstra's "Goto considered harmful" paper, what he specifically objected to
was the labels, not the goto. He observed that the number of bugs seems to
increase with the number of labels in a program, and that labels and gotos make
programs difficult to analyze.

Java labels don't suffer from this problem, since they are constrained in their
placement and can't be used to transfer control in an ad hoc manner.

- **switch**
```java
switch (integral-selector) {
    case value1: statement; break;
    case value2: statement; break;
    default: statement;
}
```
If a break statement is missing, the code of the following case statements
executes until a break is encountered.


The switch statement is a clean way to implement multiway selection. (floating
point numbers don't work as selector, but strings do as of Java 7!)

For non-integral types, you must use a series of _if_ statements. The new _enum_
feature helps ease this restriction, as enums are designed to work nicely with
switch.

```java
case 'o':
case 'b':
case 'c': statement; break;
```
# Initialization and Cleanup
Note that the coding style of making the first letter of all methods lowercase
does not apply to constructors, since the name of the constructor must mach the
name of the classs exactly (for constructor)

A constructor that takes no arguments is called the **default** constructor.

## Method overloading
In Java and C++, another factor forces the overloading of method names: the
constructor. Because the constructor's name is predetermined by the name of the
class, there can be only one constructor name. But what if you want to create an
object in more that one way?

Method overloading is essential to allow the same method name to be used with
different argument types. And although method overloading is a must for
constructors, it's a general convenience and can be used with any method.

### Distinguishing overloaded methods
Each overloaded method must take a unique list of argument types.  Even
differences in the ordering of arguments are sufficient to distinguish two
methods, although you don't normally want to take this approach because it
produces difficult-to-maintain code.

#### Overloading with primitives
A primitive can be automatically promoted from a smaller type to a larger one,
and this can be slightly confusing in combination with overloading.

_char_ produces a slightly different effect, since if it doesn't find an exact
_char_ match, it is promoted to _int_.


#### Overloading on return values
```java
void f() {}
int f() { return 1; }
```
This might work if we say int x = f();

However, you can also call a method and ignore the return value. This is often
referred to as calling a method for its side effect, since you don't care about
the return value, but instead want the other effects of the method call.

```java
f()
```
How can Java determine which f() should be called? And how could someone reading
the code see it?  Because of this sort of problem, you cannot use return value
typs to distinguish overloaded methods.

### this
```java
class Banana { void peel(int i) {} }

public class BananaPeel {
    public static void main(String[] args) {
        Banana a = new Banana();
        Banana b = new Banana();

        a.peel(1);
        b.peel(2);
    }
}
```
If there's only one method called peel(), how can that method know whether it's
being used for object a or b?

To allow you to write the code in a covenient object-oriented syntax in which
you "send a message to an object" the compiler does some undercover work for
you.

There's a secret first argument passed to the method peel(), and that argument
is the reference to the object that's being manipulated. So the two method calls
become something like:

```java
Banana.peel(a, 1);
Banana.peel(b, 2);
```
This is internal and you can't write these expressions and get the compiler to
accept them, but it gives you an idea of what's happening.

Suppose you're inside a method and you'd like to get the reference to the
current object.  Since the reference is passed secretly by the compiler, there's
no identifier for it.

However for this purpose there's a keyword: **this**. The *this* keyword, which
can only be used inside a non-static method, produces the reference to the
object that the method has been called for.

Keep in mind that if you're calling a method of your class from within another
method of your class, you don't need to use this. You simply call the method.
The current this reference is automatically used for the other method.

```java
public class Apricot {
    void pick() {}
    void pit() { pick(); }
}
```
People expect *this* to be used only when it is necessary. Following a
consistent and straightforward coding style saves time and money.

### Fluent API
```java
public class Leaf {
    int i = 0;

    Leaf increment() {
        i++;
        return this;
    }

    public static void main(String[] args) {
        Leaf x = new Leaf();
        x.increment().increment().increment();
    }
}
```
Because increment() return the reference to the current object via the *this*
keyword, multiple operations can easily be performed on the same object.

The *this* keyword is also useful for passing the current object to another
method.

```java
class Apple {
    Apple getPeeled() {return Peeler.peel(this); }
}
class Peeler {
    static Apple peel(Apple apple) {
        return apple;
    }
}
```

### Calling constructors from constructors
When you write several constructors for a class, there are times when you'd like
to call one constructor from another to avoid duplicating code. You can make
such a call by using the *this* keyword.

In a constructor, the *this* keyword takes on a different meaning when you give
it an argument list.  It makes an explicit call to the constructor that matches
that argument list.

```java
public class Flower {
    Flower (int petals) { }

    Flower (String s, int petals) {
        this(petals);
    }
}
```

Note that you cannot call two constructors with this. In addition, the
constructor call must be the first thing you do, or you'll get a compiler error
message.

## Cleanup: finalization and garbage collection
Suppose your object allocates "special" memory without using *new*, so it won't
know how to release the object's "special" memory. To handle this case, Java
provides a method called finalize() that you can define for your class.

When the gc is ready to release the storage used for your object, it will first
call finalize(), and only on the next garbage collection pass will it reclaim
the object's memory.

finalize() offers the ability to perform some important cleanup at the time of
the garbage collection.

It is limited to special cases in which your object can allocate storage in some
way other than creating an object. It is because of the possibility that you'll
do something by allocating memory using a mechanism other than the normal one in
Java. This can happen through native methods, which is a way to call non-Java
code from Java.

Joshua Bloch argues that finalizers are unpredictable, dangerous, and generally
unnecesary.

### The termination condition
In general, you can't rely on finalize() being called, and you must create
separate "cleanup" methods and call them explicitly.  So it appears that
finalize() is only useful for obscure memory cleanup that most programmers will
never use.

However, there is an interesting use of finalize() that does not rely on it
being called everytime. This is the verification of the termination condition of
an object.

You can use to check that all open files are closed or not.

Note that System.gc() is used to force finalization.

You should generally assume that the base-class version of finalize() will also
be doing something important, and call it using super, as you can see in
Book.finalize() (super.finalize()).

## Member Initialization
Java goes out of its way to guarantee that variables are properly initialized
before they are used. In the case of a method’s local variables, this guarantee
comes in the form of a compile-time error.

```java
void f() {
    int i;
    i++; // error
}
```
Each primitive field of a class is guaranteed to get an initial value (default:
0).

When you define an object reference inside a class without initializing it to a
new object, that reference is given a special value of null.


### Specifying initialization
What happens if you want to give a variable an initial value? One direct way to
do this is simply to assign the value at the point you define the variable in
the class. (Notice you cannot do this in C++, although C++ novices always try.)

```java
class Depth{}

public class Measurement {
    Depth d = new Depth();
}
```
You can even call a method to provide an initialization value. This method can
have arguments of course, but those arguments cannot be other other class
members that haven't been initialized yet.

```java
public class MethodInit {
    int i = f();
    int f() { return 11; }
}

public class MethodInit3 {
    // int j = g(i); // Illegal forward reference
    int i = f();

    int f() { return 11; }
    int g(int n) { return n*10; }
}
```

### Constructor initialization
The constructor can be used to perform initialization, and this gives you
greater flexibility in your programming because you can call methods and perform
actions at run time to determine the initial values.

```java
public class Counter {
    int i; // value is 0 because of automatic initialization
    Counter() { i = 7;}
}
```
### Order of initialization
Within a class, the order of initialization is determined by the order that the
variables are defined within the class.

The instance variables are initialized before any methods can be called — even
the constructor.

## static data initialization
There’s only a single piece of storage for a static, regardless of how many
objects are created. You can’t apply the static keyword to local variables, so
it only applies to fields.

Static initialization occurs only if it's necessary. If you don't create an
object and never refer to static fields, the static fields will never be
created.

After that, the static objects are not reinitialized.

The order of initialization is statics first, if they haven’t already been
initialized by a previous object creation, and then the non-static objects.

Even though it doesn’t explicitly use the static keyword, the constructor is
actually a static method.

### Explicit static initialization
Java allows you to group other static initializations inside a special _static
clause_ (sometimes called a static block) in a class.

```java
public class Spon {
    static int i;
    static {
        i = 47;
    }
}
```

### Non-static instance initialization
Java provides a similar syntax, called instance initialization, for initializing
non-static variables for each object.

```java
public class Mugs {
    Mug mug1;
    Mug mug2;

    {
        mug1 = new Mug(1);
        mug2 = new Mug(2);
        print("mug1 & mug2 initialized");
    }
}
```
This syntax is necessary to support the initialization of anonymous inner
classes, but it also allows you to guarantee that certain operations occur
regardless of which explicit constructor is called.

Instance initialization clause is executed before the constructor is executed.

## Array initialization
An array is simply a sequence of either objects or primitives that are all the
same type and are packaged together under one identifier name. Arrays are
defined and used with the square-brackets indexing operator [ ].

```java
int[] a1;
int[] a1 = { 1, 2, 3, 4, 5};
```
To know the length of an array, call the `length` member of an array.

What if you don’t know how many elements you’re going to need in your array
while you’re writing the program? You simply use new to create the elements in
the array.

```java
int[] a;
a = new int[rand.nextInt(20)];
```
Note: If you create a non-primitive array, you create an array of references.

It's also possible to initialize arrays of objects by using the curly
brace-enclosed list. There are two forms:

```java
Integer[] a = {new Integer(1), new Integer(2), 3};
Integer[] b = new Integer[] { new Integer(1), new Integer(2), 3 };

System.out.println(Arrays.toString(a));
```
Although the first form is useful, it's more limited because it can only be used
at the point where the array is defined.

You can use the second and third forms anywhere, even inside a method call.

## Variable argument lists
This can include unknown quantities of arguments as well as unknown types.

```java
static void printArray ( Object... args) {
    for (Object obj : args)
        System.out.print(obj + " ");
}
public static void main(String[] args) {
    printArray(43, 3.14F. 11.11);
    printArray("one","two");
}
```
With varargs, you no longer have to explicitly write out the array syntax—the
compiler will actually fill it in for you when you specify varargs. You’re still
getting an array, which is why print( ) is able to use foreach to iterate
through the array.


So if you have a group of items you can pass them in as a list, and if you
already have an array it will accept that as the variable argument list.

It’s possible to use any type of argument in varargs, including a primitive
type. If there is no arguments for varargs, you will receive an array object of
length 0.

```java
static void g(int... args) {
    ...
}
```

## Enumerated types
```java
// Spiceness.java
public enum Spiceness {
    NOT, MILD, MEDIUM, HOT, FLAMING
}
```
This creates an enumerated type called Spiciness with five named values.
Because the instances of enumerated types are constants, they are in all capital
letters by convention (if there are multiple words in a name, they are separated
by underscores)

```java
class SimpleEnumUse {
    public static void main(String[] args) {
        Spiciness howHot = Spiciness.MEDIUM;
        System.out.println(howHot);
    }
} /* Output MEDIUM */
```
The compiler automatically adds useful features when you create an enum. For
example, it creates a toString( ) so that you can easily display the name of an
enum instance, which is how the print statement above produced its output.

The compiler also creates an ordinal() method to indicate the declaration order
of a particular enum constant, and a static values() method that produces an
array of values of the enum constants in the order that they were declared:

```java
public class EnumOrder {
    public static void main(String[] args) {
        for(Spiciness s : Spiciness.values()) {
            System.out.println(s + ", ordinal " + s.ordinal());
        }
    }
}
```
```
Output:
NOT, ordinal 0
MILD, ordinal 1
MEDIUM, ordinal 2
HOT, ordinal 3
FLAMING, ordinal 4
```
SIDENOTE: So it seems like enum will just create a class with methods and other
stuff already defined/created for you. Treat an enum as a class.

An especially nice feature is the way that enums can be used inside switch
statements:

```java
public void describe (Spiceness degree) {
    switch (degree) {
        case NOT: print("Not hot at all");  break;
        case MILD:
        case MEDIUM: print("A little hot"); break;
        default: print("maybe too hot");    break;
    }
}
```

# Access Control
**package**
: A package contains a group of classes, organized together under a single
  namespace.

To import everything from that namespace,
```java
import java.util.*;
```

When you create a source-code file for Java, it’s commonly called a compilation
unit (sometimes a translation unit). Each compilation unit must have a name
ending in .java, and inside the compilation unit there can be a public class
that must have the same name as the file (including capitalization, but
excluding the .java file name extension).

There can be only one public class in each compilation unit; otherwise, the
compiler will complain. If there are additional classes in that compilation
unit, they are hidden from the world outside that package because they’re not
public, and they comprise "support" classes for the main public class.

When you compile a .java file, you get an output file for each class in the
.java file. Each output file has the name of a class in the .java file, but with
an extension of .class. Thus you can end up with quite a few .class files from a
small number of .java files.

If you use a package statement, it must appear as the first non-comment in the
file. When you say:

```java
package access;
```

By convention, the first part of the package name is the reversed Internet
domain name of the creator of the class. Since Internet domain names are
guaranteed to be unique, if you follow this convention, your package name will
be unique and you’ll never have a name clash.

The second part of this trick is resolving the package name into a directory on
your machine, so that when the Java program runs and it needs to load the .class
file, it can locate the directory where the .class file resides.

The Java interpreter proceeds as follows. First, it finds the environment
variable CLASSPATH  (set via the operating system, and sometimes by the
installation program that installs Java or a Java-based tool on your machine).

CLASSPATH contains one or more directories that are used as roots in a search
for .class files. Starting at that root, the interpreter will take the package
name and replace each dot with a slash to generate a path name off of the
CLASSPATH root (so package foo.bar.baz becomes foo\bar\baz or foo/bar/baz or
possibly something else, depending on your operating system).

This is then concatenated to the various entries in the CLASSPATH. That’s where
it looks for the .class file with the name corresponding to the class you’re
trying to create. (It also searches some standard directories relative to where
the Java interpreter resides.)

There’s a variation when using JAR files, however. You must put the actual name
of the JAR file in the classpath, not just the path where it’s located.

```bash
e.g CLASSPATH=D:\JAVA\LIB;C:\flavors\grape.jar
```
When the compiler encounters the import statement for the simple library, it
begins searching at the directories specified by CLASSPATH, looking for
subdirectory net/mindview/simple, then seeking the compiled files of the
appropriate names

### Collision
What happens if two libraries are imported via `*` and they include the same
names?

```java
import net.mindview.simple.*; // contains Vector
import java.util.*; // contains Vector
```
Which Vector class does this refer to? The compiler can’t know, and the reader
can’t know either. So the compiler complains and forces you to be explicit.

## Static import
```java
package simple;
public class Print {
    public static void print() {
        ...
    }
}

// In another class

import static simple.Print.*;
public class Hello {
    public static void main (String[] args) {
        print(); // the one from simple.Print.print()
    }
}
```

## Package access
public
: it means that the member declaration that immediately
  follows public is available to everyone

default
: Java treats files like this as implicitly part of the “default package” for
  that directory, and thus they provide package access to all the other files in
  that directory.

private
: The private keyword means that no one can access that member except the class
  that contains that member, inside methods of that class.

protected
: The protected keyword deals with a concept called inheritance, which takes an
  existing class

Sometimes the creator of the base class would like to take a particular member
and grant access to derived classes but not the world in general.  That’s what
protected does. protected also gives package access—that is, other classes in
the same package may access protected elements.

There can be only one public class per compilation unit (file). The idea is that
each compilation unit has a single public interface represented by that public
class.

It can have as many supporting package-access classes as you want.

The name of the public class must exactly match the name of the file containing
the compilation unit, including capitalization. So for Widget, the name of the
file must be Widget.java, not widget.java or WIDGET.java.  Again, you’ll get a
compile-time error if they don’t agree.

It is possible, though not typical, to have a compilation unit with no public
class at all. In this case, you can name the file whatever you like (although
naming it arbitrarily will be confusing to people reading and maintaining the
code).

IMPORTANT: Note that a class cannot be private (that would make it inaccessible
to anyone but the class) or protected. So you have only two choices for class
access: package access or public.

Actually, an inner class can be private or protected, but that’s a special case.

If you don’t want anyone else to have access to that class, you can make all the
constructors private, thereby preventing anyone but you, inside a static member
of the class, from creating an object of that class.

## Inheritance

### Initializing the base class
If you want to explicitly call the base-class constructor, use the *super*
keyword.

```java
class Haha extends Hihi {
    Haha (int i) {
        super(i);
    }
}
```
Note
: There is a caveat with base constructors with arguments only.  Usually, the
  derived constructor will automatically call the base constructor who does not
  have any arguments. However, if you want to call the base constructor with
  arguments, or if there is no base constructor with no arguments, you have to
  call super();

The call to the base-class constructor must be the first thing you do in the
derived-class constructor.

## Overriding
Java SE5 has added the `@Override` annotation, which is not a keyword but can be
used as if it were. When you mean to override a method, you can choose to add
this annotation and the compiler will produce an error message if you
accidentally overload instead of overriding.

The `@Override` annotation will thus prevent you from accidentally overloading
when you don’t mean to.

## Upcasting
The most important aspect of inheritance is not that it provides methods for the
new class.  It’s the relationship expressed between the new class and the base
class. This relationship can be summarized by saying, “The new class is a type
of the existing class.”


## Final keyword
Applies to data, methods and classes.


Final data
: To tell the compiler that a piece of data is "constant".

A constant is useful for two reasons:
- It can be a compile-time constant that won't ever change
- It can be a value initialized at run time that you don't want changed.

A field that is both static and final has only one piece of storage that cannot
be changed.

Just because something is final doesn’t mean that its value is known at compile
time.  e.g `final int x = getRandomNumber();`

### Blank finals
Java allows the creation of blank finals, which are fields that are declared as
final but are not given an initialization value.

```java
public class Haha {
    private final j; // Blank final

    public Haha() {
        j = 1;
    }
}
```
### Final arguments
Java allows you to make arguments final by declaring them as such in the
argument list.  This means that inside the method you cannot change what the
argument reference points to. This feature is primarily used to pass data to
anonymous inner classes.

### Final methods
There are two reasons for final methods. The first is to put a “lock” on the
method to prevent any inheriting class from changing its meaning. This is done
for design reasons when you want to make sure that a method’s behavior is
retained during inheritance and cannot be overridden.

### Final and private
Any private methods in a class are implicitly final. Because you can’t access a
private method, you can’t override it. You can add the final specifier to a
private method, but it doesn’t give that method any extra meaning.

# Polymorphism
Polymorphism is the third essential feature of an object-oriented programming
language, after data abstraction and inheritance.

It provides another dimension of separation of interface from implementation, to
decouple what from how. Polymorphism allows improved code organization and
readability as well as the creation of extensible programs that can be “grown”
not only during the original creation of the project, but also when new features
are desired.

Wouldn’t it be much nicer if you could just write a single method that takes the
base class as its argument, and not any of the specific derived classes?  That
is, wouldn’t it be nice if you could forget that there are derived classes, and
write your code to talk only to the base class?

That’s exactly what polymorphism allows you to do. However, most programmers who
come from a procedural programming background have a bit of trouble with the way
polymorphism works.

```java
class Instrument {
    play(Note note) {}
}
public class Wind extends Instrument {
    @Override
    play(Note note){}
}
```
Inside Music.java ...

```java
public static void tune (Instrument i) {
    i.play(Note.MIDDLE_C);
}
```
It receives an Instrument reference. So how can the compiler possibly know that
this Instrument reference points to a Wind in this case and not a Brass or
Stringed? The compiler can’t. To get a deeper understanding of the issue, it’s
helpful to examine the subject of binding.

### Method-call binding
Connecting a method call to a method body is called binding.

When binding is performed before the program is run (by the compiler and linker,
if there is one), it’s called early binding. You might not have heard the term
before because it has never been an option with procedural languages. C
compilers have only one kind of method call, and that’s early binding.

The confusing part of the preceding program revolves around early binding,
because the compiler cannot know the correct method to call when it has only an
Instrument reference.

The solution is called late binding, which means that the binding occurs at run
time, based on the type of object. Late binding is also called dynamic binding
or runtime binding. When a language implements late binding, there must be some
mechanism to determine the type of the object at run time and to call the
appropriate method. That is, the compiler still doesn’t know the object type,
but the method-call mechanism finds out and calls the correct method body. The
late-binding mechanism varies from language to language, but you can imagine
that some sort of type information must be installed in the objects.

All method binding in Java uses late binding unless the method is static or
final (private methods are implicitly final). This means that ordinarily you
don’t need to make any decisions about whether late binding will occur—it
happens automatically.

### Pitfall: fields and static methods
If you access a field directly, that access will be resolved at compile time, as
the following example demonstrates.

```java
class Super {
    public int field = 0;
    public int getField() { return field;}
}
class Sub extends Super {
    public int field = 1;
    public int getField() {return field;}
    public int getSuperField() {return super.field;}

}
public class FieldAccess {
    public static void main(String[] args) {
        Super sup = new Sub();
        printf(sup.field); // Answer is 0
        printf(sup.getField()); // Answer is 1

        Sub sub = new Sub();
        printf(sub.field); // Answer is 1
        printf(sub.getField()); // Answer is 1
        printf(sub.getSuperField()); // Answer is 0
    }
}
```

For one thing, you’ll generally make all fields private and so you won’t access
them directly


If a method is static, it doesn’t behave polymorphically

```java
class StaticSuper {
    public static String staticGet() { return "BaseStaticGet"; }
    public String dynamicGet() { return "BaseDynamicGet"; }
}

class StaticSub extends StaticSuper {
    public static String staticGet() { return "DerivedStaticGet"; }
    public String dynamicGet() { return "DerivedDynamicGet"; }
}

public class Haha {
    public static void main (String[] args) {
        StaticSuper sup = new StaticSub();
        printf(sup.staticGet()); // BaseStaticGet
        printf(sup.dynamicGet()); // DerivedDynamicGet

        StaticSub sub = new StaticSub();
        printf(sub.staticGet()); // DerivedStaticGet
        printf(sub.dynamicGet()); // DerivedDynamicGet
    }
}
```
Static methods are associated with the class, and not the individual objects.


## Constructors and polymorphism
Even though constructors are not polymorphic (they’re actually static methods,
but the static declaration is implicit), it’s important to understand the way
constructors work in complex hierarchies and with polymorphism.

A constructor for the base class is always called during the construction
process for a derived class, chaining up the inheritance hierarchy so that a
constructor for every base class is called. This makes sense because the
constructor has a special job: to see that the object is built properly. A
derived class has access to its own members only, and not to those of the base
class (whose members are typically private).

The order of the constructor calls is important. When you inherit, you know all
about the base class and can access any public and protected members of the base
class. This means that you must be able to assume that all the members of the
base class are valid when you’re in the derived class.

## Inheritance and cleanup
When using composition and inheritance to create a new class, most of the time
you won’t have to worry about cleaning up; subobjects can usually be left to the
garbage collector. If you do have cleanup issues, you must be diligent and
create a dispose( ) method (the name I have chosen to use here; you may come up
with something better) for your new class. And with inheritance, you must
override dispose( ) in the derived class if you have any special cleanup that
must happen as part of garbage collection. When you override dispose( ) in an
inherited class, it’s important to remember to call the base-class version of
dispose( ), since otherwise the base-class cleanup will not happen.

## Behaviour of polymorphic methods inside constructors
The hierarchy of constructor calls brings up an interesting dilemma. What
happens if you’re inside a constructor and you call a dynamically-bound method
of the object being constructed?

Inside an ordinary method, the dynamically-bound call is resolved at run time,
because the object cannot know whether it belongs to the class that the method
is in or some class derived from it.

If you call a dynamically-bound method inside a constructor, the overridden
definition for that method is used. However, the effect of this call can be
rather unexpected because the overridden method will be called before the object
is fully constructed. This can conceal some difficult-to-find bugs.

Actual process of initialization:
- The storage allocated for the object is initialized to binary zero before
  anything else happens.  [ so that means that the derived class has fields
  initialized to 0/null at least ]
- The base-class constructors are called as described previously. At this
  point, the overridden method is called.
- Member initializers are called in the order of declaration.
- The body of the derived-class constructor is called.

As a result, a good guideline for constructors is, “Do as little as possible to
set the object into a good state, and if you can possibly avoid it, don’t call
any other methods in this class.” The only safe methods to call inside a
constructor are those that are final in the base class. (This also applies to
private methods, which are automatically final.)

## Covariant return types
Java SE5 adds covariant return types, which means that an overridden method in a
derived class can return a type derived from the type returned by the base-class
method

```java
class Grain {
    public String toString() {return "Grain"; }
}
class Wheat extends Grain {
    public String toString() { return "Wheat"; }
}
class Mill {
    Grain process() {return new Grain(); }
}
class WheatMill extends Mill {
    Wheat process() {return new Wheat(); }
}

Mill m = new Mill();
Grain g = m.process(); // Grain

m = new WheatMill();
g = m.process(); // Wheat
```

At runtime, Java checks for the cast to ensure that it is in fact the type you
think it is at runtime.  If it isn't, you get a ClassCaseException.

This act of checking types at run time is called runtime type identification
(RTTI)

## Abstract
A class containing abstract methods is called an abstract class. If a class
contains one or more abstract methods, the class itself must be qualified as
abstract. (Otherwise, the compiler gives you an error message.)

# Interfaces
The interface keyword produces a completely abstract class, one that provides no
implementation at all. It allows the creator to determine method names, argument
lists, and return types, but no method bodies. An interface provides only a
form, but no implementation.

So the interface is used to establish a "protocol" between classes.

However, an interface is more than just an abstract class taken to the extreme,
since it allows you to perform a variation of "multiple inheritance" by creating
a class that can be upcast to more than one base type.

You can choose to explicitly declare the methods in an interface as public, but
they are public even if you don’t say it. So when you implement an interface,
the methods from the interface must be defined as public. Otherwise, they would
default to package access, and you’d be reducing the accessibility of a method
during inheritance, which is not allowed by the Java compiler.

[so during inheritance, you can increase the visibility of a method, from
protected to public!]

## Extending an interface with inheritance
You can easily add new method declarations to an interface by using inheritance,
and you can also combine several interfaces into a new interface with
inheritance. In both cases you get a new interface,

```java
interface Monster {
    void menace();
}
interface DangerousMonster extends Monster {
    void destroy();
}
class DragonZilla implements DangerousMonster {
    public void menace() {}
    public void destroy() {}
}
interface Lethal {
    void kill();
}
interface Vampire extends DangerousMonster, Lethal {
    void drinkBlood();
}
class VeryBadVampire implements Vampire {
    public void menace() {}
    public void destroy() {}
    public void kill() {}
    public void drinkBlood() {}
}
```
Fields in interfaces are by default public and final, the interface is a
convenient tool for creating groups of constant values.

Fields defined in interfaces cannot be "blank finals," but they can be
initialized with non-constant expressions.

```java
public interface Haha {
    Random RAND = new Random(47);
    int RANDOM_INT = RAND.nextInt(10);
}
```
Since the fields are static, they are initialized when the class is first
loaded, which happens when any of the fields are accessed for the first time.

The fields, of course, are not part of the interface. The values are stored in
the static storage area for that interface.

You can also declare variables. Of course they are also final and public. So
they are basically constants that will be shared among the classes that
implement that interface.

## Inner Class
The inner class is a valuable feature because it allows you to group classes
that logically belong together and to control the visibility of one within the
other. However, it’s important to understand that inner classes are distinctly
different from composition.

You create an inner class just as you’d expect—by placing the class definition
inside a surrounding class

### The link to the outer class
So far, it appears that inner classes are just a name-hiding and code
organization scheme, which is helpful but not totally compelling. However,
there’s another twist. When you create an inner class, an object of that inner
class has a link to the enclosing object that made it, and so it can access the
members of that enclosing object—without any special qualifications. In
addition, inner classes have access rights to all the elements in the enclosing
class.

The inner class can access methods and fields from the enclosing class as if it
owned them.  [It can even access private fields in the enclosing class]

So an inner class has automatic access to the members of the enclosing class.
How can this happen? The inner class secretly captures a reference to the
particular object of the enclosing class that was responsible for creating it.

Then, when you refer to a member of the enclosing class, that reference is used
to select that member.

### Using the .this and .new
If you need to produce the reference to the outer-class object, you name the
outer class followed by a dot and this. The resulting reference is automatically
the correct type, which is known and checked at compile time, so there is no
runtime overhead.

public class DotThis {
    void f() {print("dotThis.f()");}

    public class Inner {
        public DotThis outer() {
            return DotThis.this; // A plain "this" would be Inner's "this"
        }
    }
    public Inner inner() { return new Inner(); }
    public static void main(String[] args) {
        DotThis dt = new DotThis();
        DotThis.Inner dti = dt.Inner();
        dti.outer().f();
    }
}
class EnclosingOuter {
    class Inner{ System.out.println(“Inner class reference is “ + this);
        // inner class instance
        System.out.println(“Outer class reference is “
                + EnclosingOuter.this); //outer class instance
    }
}
```
Sometimes you want to tell some other object to create an object of one of its
inner classes. To do this you must provide a reference to the other outer-class
object in the new expression, using the .new syntax.o

```java
public class DotNew {
    public class Inner {}
    public static void main(String[] args) {
        DotNew dn = new DotNew();
        DotNew.Inner dni = dn.new Inner();
    }
}
```
If you make a nested class (a *static* inner class), then it doesn't need a
reference to the outer-class object.

### Inner classes and upcasting
Inner classes really come into their own when you start upcasting to a base
class, and in particular to an interface. (The effect of producing an interface
reference from an object that implements it is essentially the same as upcasting
to a base class.) That’s because the inner class—the implementation of the
interface—can then be unseen and unavailable, which is convenient for hiding the
implementation. All you get back is a reference to the base class or the
interface.


Local Inner Class
: Creation of an entire class within the scope of a method
  instead of the scope of another class]

```java
public class Parcel4 {
    // This is a method!
    public Destination dest(String s) {
        class PDestination implements Destination {
            private String label;
            private PDestination(String whereTo) {
                label = whereTo;
            }
            public String readLabel() {return label; }
        }
        // Still in the method!
        return new PDestination(s);
    }
}
```
Nest an inner class within any arbitrary scope:

*SideNote*: Note the syntax to create a new inner class object
```java
Parcel3 p = new Parcel3());
Parcel3.PContents pc = p.new PContents();
```
## Anonymous Inner classes
```java
public class Parcel6 {
    public Contents cont() {
        return new Contents() {
            private int i = 11;

            public int value() { return i; }
        }; // >>> Semicolon required!!!
    }
    public static void main(String[] args) {
        Parcel6 p = new Parcel6();
        Contents c = p.cont();
    }
}
// Contents.java
public interface Contents {
    int value();
}
```
What this strange syntax means is "Create an object of an anonymous class that’s
inherited from Contents." The reference returned by the new expression is
automatically upcast to a Contents reference.

Contents is created by using a default constructor. If argument needed:

```java
public class Parcel7 {
    public Wrapping wrap(int x) {
        return new Wrapping(x) {
            public int value() {
                return super.value() * 47;
            }
        };
    }
}
public class Wrapping {
    private int i;
    public Wrapping(int x) {
        i = x;
    }
    public int value() {
        return i;
    }
}
```
 That is, you simply pass the appropriate argument to the base-class
 constructor, seen here as the x passed in new Wrapping(x). Although it’s an
 ordinary class with an implementation, Wrapping is also being used as a common
 "interface" to its derived classes

If you are defining an anonymous inner class and want to use an object that is
defined outside the anonymous inner class, the compiler requires that the
**argument** reference be _final_ like the argument to dest().

SO THE **ARGUMENTS** THAT ARE PASSED TO THE METHOD THAT CONTAINS THE ANONYMOUS
INNER CLASS NEED TO BE FINAL IF THEY ARE TO BE USED INSIDE THE INNER CLASS

THE ANONYMOUS INNER CLASS CAN STILL ACCESS ALL THE OBJECTS DEFINED IN THE
ENCLOSING CLASS WITHOUT THE NEED FOR FINAL!!!

```java
WithInner getWithInner (final String x) {
    return new WithInner() {
        /// here i'm referring to x; so
        // x must be final if i want to refer
        // to it even after the method has
        // returned and does not exist anymore.
        getString() {
            return x;
        }
    }
}
```
This also applies to local inner class that need to access something from the
enclosing method arguments.

```java
// this is a method
public WithInner getWithInner(final String x) {

    class Hoho extends WithInner {
        String a = x;
        // won't compile if x is not final !!!
    }
    return new Hoho();
}
```
You can’t have a named constructor in an anonymous class (since there’s no
name!), but with instance initialization, you can, in effect, create a
constructor for an anonymous inner class [ see example above, where instance
iniliazer is printed, this is instance initialization ]

Anonymous inner classes are somewhat limited compared to regular inheritance,
because they can either extend a class or implement an interface, but not both.
And if you do implement an interface, you can only implement one.

## Nested class
If you don't need a connection between the inner class object and the outer
class object, then you can make the inner class _static_. This is commonly
called a _nested class_.

A nested class means:
- You don't need an outer-class object in order to create an object of a
  nested class.
- You can't access a non-static outer-class object from an object of a
  nested class. ( SINCE NESTED CLASS MEANS INNER CLASS THAT IS STATIC !!!)

In an ordinary (non-static) inner class, the link to the outer-class object is
achieved with a special this reference. A nested class does not have a special
this reference, which makes it analogous to a static method.

### Reaching outward from a multiply-nested class

 It does not matter how deeply an inner class may be nested - it can
 transparently access all of the members of all the classes it is nested within.

```java
 class MNA {
     private void f() {}
     class A {
         private void g() {}
         public class B{
             void h() {
                 g();
                 f();
             }
         }
     }
 }

public class MultiNestingAccess {
    public static boid main(String[] args) {
        MNA mna = new MNA();
        MNA.A mnaa = mna.new A();
        MNA.A.B mnaab = mnaa.new B();
        mnaab.h();
    }
}
```
## Why inner classes?
Typically, the inner class inherits from a class or implements an interface, and
the code in the inner class manipulates the outer class object that it was
created within. So you could say that an inner class provides a kind of window
into the outer class.

Each inner class can independently inherit from an implementation.  Thus, the
inner class is not limited by whether the outer class is already inheriting from
an implementation.

```java
class D {}
abstract class E {}

class Z extends D {
    // kind of inherits E here, since we are calling the base
    // constructor of
    // E, even though the outer class inherits D
    E makeE {
        return new E() {};
    }
}
```
## Closures and Callbacks
A _closure_ is a callable object that retains the information from the scope in
which it was created. From this definition, you can see that an inner class is
an object-oriented closure, because it doesn't just contain each piece of
information from the outer class object, it automatically holds a reference back
to the whole outer class object, where it has permission to manipulate all the
members, even private ones.

With a callback, some other object is given a piece of information that allows
it to call back into the originating object at some later point.

```java
class MyIncrement {
    void increment() {
        println("Other operation");
    }
    static void f(MyIncrement mi) { mi.increment(); }
}

// if your class must implement increment() in some other way, you must
// use an inner class

class Callee2 extends MyIncrement {
    private int i = 0;
    private void increment() {
        i++;
        println(i);
    }
    private class Closure implements Incrementable {
        public void increment() { incr(); }
    }
    Incrementable getCallbackReference() {
        return new Closure();
    }
}
```
The inner class Closure implements Incrementable to provide a hook back into
Callee2— but a safe hook. Whoever gets the Incrementable reference can, of
course, only call increment( ) and has no other abilities (unlike a pointer,
which would allow you to run wild).

Caller takes an Incrementable reference in its constructor (although the
capturing of the callback reference could happen at any time) and then, sometime
later, uses the reference to "call back" into the Callee class.  The value of
the callback is in its flexibility; you can dynamically decide what methods will
be called at run time. The benefit of this will become more evident in the
Graphical User Interfaces chapter, where callbacks are used everywhere to
implement GUI functionality.

## Can inner classes be overridden?
Create an inner class, inherit from the enclosing class and redefine the inner
class.... is it possible to override the entire inner class?

"Overriding" an inner class as if it were another method of the outer class
doesn’t really do anything [overiding is more associated with methods]

```java
class Egg {
    private Yolk y;
    protected class Yolk {
        public Yolk() {println("Egg.Yolk()");}
    }
    public Egg() {
        System.out.println("New Egg()");
        y = new Yolk();
    }
}
public class BigEgg extends Egg {
    public class Yolk {
        public Yolk() { println("BigEgg.Yolk()"); }
    }
    public static void main(String[] args) {
        new BigEgg();
    }
}

// New Egg() and Egg.Yolk() are printed
// we would expect that BigEgg.Yolk() to be printed because
// y = new Yolk() in the Egg() should in theory call the overridden one
// (BigEgg.Yolk())
```

You might think that since a BigEgg is being created, the "overridden" version
of Yolk would be used, but this is not the case.

You can't really implicitly since the two inner classes are completely seperate
entities, each in their own namespace. However it is still possible to
explicitly inherit from the inner class.

Note that this is different from trying to inherit the inner class itself, right
now we are inheriting the outer class and trying to also "inherit the inner
class"

```java
class Egg2 {
    protected class Yolk {
        public Yolk() {
            println("Egg2.Yolk()");
        }
    }
    public void f() {
        println("Egg2.Yolk.f()");
    }
    private Yolk y = new Yolk();
    public Egg2() {
        println("New Egg2()");
    }
    public void insertYolk(Yolk yy) { y = yy; }
    public void g() { y.f();}
}

class BigEgg2 extends Egg2 {
    private static Test monitor = new Test();
    public class Yolk extends Egg2.Yolk {
        public Yolk() {
            println("BigEgg2.Yolk()");
        }
        public void f() {
            println("BigEgg2.Yolk.f()");
        }
    }
    public BigEgg2() {
        insertYolk(new Yolk());
    }
    public static void main (String[] args) {
        Egg2 e2 = new BigEgg2();
        e2.g();
    }
}

// what we would see:
// Egg2.Yolk()
// New Egg2()
// Egg2.Yolk()
// BigEgg2.Yolk()
// BigEgg2.Yolk.f()
```
### Local Inner classes
As noted earlier, inner classes can also be created inside code blocks,
typically inside the body of a method. A local inner class cannot have an
"access" specifier because it isn't part of the outer class, but it does have
access to the _final_ variables in the current code block and all the members of
the enclosing class.

```java
// LocalInnerClass.java
interface Counter {
    int next();
}

public class LocalInnerClass {
    private int count = 0;

    Counter getCounter (final String name) {
        // local inner class

        class LocalCounter implements Counter {
            public LocalCounter() {
                System.out.println("localcounter()");
            }
            public int next() {
                print(name); // access local final
                return count++;
            }
        }
        return new LocalCounter();
    }

    // same thing with anonymous inner class

    Counter getCounter2(final String name) {
        return new Counter() {
            // anonymous inner class cannot have a named constructor.
            // only an
            // instance initializer
            {
                System.out.println("Counter()");
            }
            public int next() {
                System.out.print(name); // access local final
                return count++;
            }
        };
    }
}
```
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Since the name of the local inner class is not accessible outside the method,
the only justification for using a local inner class instead of an anonymous
inner class is if you need a named constructor and/or an overloaded constructor,
since an anonymous inner class can only use instance initialization.

The only reason to make a local inner class rather than an anonymous inner class
is if you need to make more than one object of that class.

### Inner class identifiers

Since every class produces a .class file that holds all the information about
how to create objects of that type, you might guess that inner classes must also
produce .class files.

The names of these files/classes have a strict formula: the name of the
enclosing class, followed by a '$', followed by the name of the inner class.

If inner classes are anonymous, the compiler simply starts generating numbers as
inner class identifiers. If inner classes are nested within inner classes, their
names are simply appended after a '$' and the outer class identifier(s).

```
// eg Counter.class
     LocalInnerClass$2.class
             LocalInnerClass$1LocalCounter.class
             LocalInnerClass.class
```
# Holding your objects

The java.util library has a reasonably complete set of container classes to
solve this problem, the basic types of which are List, Set, Queue, and Map.
These types of objects are also known as collection classes, but because the
Java library uses the name Collection to refer to a particular subset of the
library, I shall use the more inclusive term "container." Containers provide
sophisticated ways to hold your objects, and you can solve a surprising number
of problems by using these tools.

Among their other characteristics—Set, for example, holds only one object of
each value, and Map is an associative array that lets you associate objects with
other objects—the Java container classes will automatically resize themselves.
So, unlike with arrays, you can put in any number of objects and you don’t need
to worry about how big to make the container while you’re writing the program.

## Generics and type-safe containers

One of the problems of using pre-Java SE5 containers was that the compiler
allowed you to insert an incorrect type into a container. For example, consider
a container of Apple objects, using the basic workhorse container, ArrayList.
For now, you can think of ArrayList as "an array that automatically expands
itself." Using an ArrayList is straightforward: Create one, insert objects using
add( ), and access them with get( ), using an index—just as you do with an
array, but without the square brackets.  ArrayList also has a method size( ) to
let you know how many elements have been added, so that you don’t inadvertently
index off the end and cause an error

In this example, Apples and Oranges are placed into the container, then pulled
out.  Normally, the Java compiler will give you a warning because the example
does not use generics. Here, a special Java SE5 annotation is used to suppress
the warning. Annotations start with an ‘@’ sign, and can take an argument; this
one is @SuppressWarnings and the argument indicates that "unchecked" warnings
only should be suppressed

```java
import java.util.*;

class Apple {
    privae static long counter;
    private final long id = counter++;
    public long id() {return id;}
}
class Orange {}

public calss ApplesAndOrangesWithoutGenerics {
    @SuppressWarnings("unchecked")
    public static void main(String[] args) {
        ArrayList apples = new ArrayList();

       for(int i = 0: i < 3; i++) { apples.add(new Apple());}
       apples.add(new Orange()); // not prevented from adding an Orange to
       // apples.
       for(int i = 0; i < apples.size(); i++)
       {
           ((Apple)apples.get(i).id();
            // Orange is detected only at run time
        }
    }
}
```
When you go to fetch out what you think are Apple objects using the ArrayList
method get( ), you get back a reference to an Object that you must cast to an
Apple. Then you need to surround the entire expression with parentheses to force
the evaluation of the cast before calling the id( ) method for Apple; otherwise,
you’ll get a syntax error. At run time, when you try to cast the Orange object
to an Apple, you’ll get an error in the form of the aforementioned exception.

For example, to define an ArrayList intended to hold Apple objects, you say
ArrayList<Apple> instead of just ArrayList. The angle brackets surround the type
parameters (there may be more than one), which specify the type(s) that can be
held by that instance of the container. With generics, you’re prevented, at
compile time, from putting the wrong type of object into a container.

```java
public class ApplesAndOrangesWithGenerics {
    public static void main(String[] args) {
        ArrayList<Apple> apples = new ArrayList<Apple>();
        for (int i = 0; i< 3; i++)
            apples.add(new Apple());

        // Compile-time error
        // apples.add(new Orange());
        ...
            for (Apple c : apples)
                System.out.println(c.id());
    }
}
```
Now the compiler will prevent you from putting an Orange into apples, so it
becomes a compile-time error rather than a runtime error.

It aLso work with upcasting

```java
class GrannySmith extend Apple{}
ArrayList<Apple> apples = new ArrayList<Apple>();
apples.add(new GrannySmith());
```
## Basic Concepts
The Java container library takes the idea of "holding your objects" and divides
it into two distinct concepts, expressed as the basic interfaces of the library:

Collection
: a sequence of individual elements with one or more rules
  applied to them. A List must hold the elements in the way that they were
  inserted, a Set cannot have duplicate elements, and a Queue produces the
  elements in the order determined by a queuing discipline (usually the same
  order in which they are inserted).

Map
: a group of key-value object pairs, allowing you to look up a value
  using a key.  An ArrayList allows you to look up an object using a number, so
  in a sense it associates numbers to objects. A map allows you to look up an
  object using another object. It’s also called an associative array, because it
  associates objects with other objects, or a dictionary, because you look up a
  value object using a key object just like you look up a definition using a
  word. Maps are powerful programming tools.

```java
List<Apple> apples = new ArrayList<Apple>();
```
Notice that the ArrayList has been upcast to a List, in contrast to the way it
was handled in the previous examples. The intent of using the interface is that
if you decide you want to change your implementation, all you need to do is
change it at the point of creation,

This approach won’t always work, because some classes have additional
functionality. For example, LinkedList has additional methods that are not in
the List interface, and a TreeMap has methods that are not in the Map interface.
If you need to use those methods, you won’t be able to upcast to the more
general interface.

The Collection interface generalizes the idea of a sequence—a way of holding a
group of objects.

```java
Collection<Integer> c = new ArrayList<Integer>();
```
Since this example only uses Collection methods, any object of a class inherited
from Collection would work, but ArrayList is the most basic type of sequence.

Collection -> List and Sets

## Adding groups of elements

here are utility methods in both the Arrays and Collections classes in java.util
that add groups of elements to a Collection. Arrays.asList( ) takes either an
array or a comma- separated list of elements (using varargs) and turns it into a
List object.

Collections.addAll( ) takes a Collection object and either an array or a
comma-separated list and adds the elements to the Collection.

```java
Collection<Integer> collection =
new ArrayList<Integer>(Arrays.asList(1, 2, 3, 4, 5));

Integer[] moreInts = { 6, 7, 8, 9, 10 };
collection.addAll(Arrays.asList(moreInts));

// runs significantly faster, but you can't
// construct a Collection this way

Collections.addAll(collection, 11, 12, 13, 14, 15);
Collections.addAll(collection, moreInts);

// *********** Very Important ***************
// *** Produces a list "backed by" an array: ***

List<Integer> list = Arrays.asList(16, 17, 18, 19, 20);
list.set(1, 99); // OK -- modify an element

// list.add(21); // Runtime error because the
// underlying array cannot be resized.
```
The constructor for a Collection can accept another Collection which it uses for
initializing itself, so you can use Arrays.asList( ) to produce input for the
constructor.  However, Collections.addAll( ) runs **much faster**, and it’s
just as easy to construct the Collection with no elements and then call
Collections.addAll( ), so this is the preferred approach.

The Collection.addAll( ) member method can only take an argument of another
Collection object, so it is not as flexible as Arrays.asList( ) or
Collections.addAll( ), which use variable argument lists.

Note
: It’s also possible to use the output of Arrays.asList( ) directly, as a List,
  but the underlying representation in this case is the array, which cannot be
  resized. If you try to add( ) or delete( ) elements in such a list, that would
  attempt to change the size of an array, so you’ll get an "Unsupported
  Operation" error at run time.

A limitation of Arrays.asList( ) is that it takes a best guess about the
resulting type of the List, and doesn’t pay attention to what you’re assigning
it to.

```java
class Snow{}
class Powder extends Snow {}
class Light extends Powder {}
class Heavy extends Powder {}
class Crusty extends Snow {}
class Slush extends Snow {}

public class AsListInference {
    ...
        List<Snow> snow1 =
        Arrays.asList(new Crusty(), new Slush(), new Powder());

    // Won't Compile:
    // List<Snow> snow2 = Arrays.asList(new Light(), new Heavy());
    // Compiler says:
    // found      : java.util.List<Powder>
    // required: java.util.List<Snow>

    // Collections.addAll() doesn't get confused:

    List<Snow> snow3 = new ArrayList<Snow>();
    Collections.addAll(snow3, new Light(), new Heavy());

    // Give a hing using an explicit type argument specification:

    List<Snow> snow4 = Arrays.<Snow>asList(new Light(), new Heavy());
    ...
}
```

When trying to create snow2, Arrays.asList( ) only has types of Powder, so it
creates a List<Powder> rather than a List<Snow>, whereas Collections.addAll( )
works fine because it knows from the first argument what the target type is.

As you can see from the creation of snow4, it’s possible to insert a "hint" in
the middle of Arrays.asList( ), to tell the compiler what the actual target type
should be for the resulting List type produced by Arrays.asList(). This is
called an explicit type argument specification.

### Printing containers

You must use Arrays.toString( ) to produce a printable representation of an
array, but the containers print nicely without any help.

```java
public class PrintingContainers {
    static Collection fill(Collection<String> collection) {
        collection.add("rat");
        collection.add("cat");
        collection.add("dog");
        collection.add("dog");
        return collection;
    }
    static Map fill(Map<String,String> map) {
        map.put("rat", "Fuzzy");
        map.put("cat", "Rags");
        map.put("dog", "Bosco");
        map.put("dog", "Spot");
        return map;
    }
    public static void main(String[] args) {
        print(fill(new ArrayList<String>()));
        print(fill(new LinkedList<String>()));
        print(fill(new HashSet<String>()));
        print(fill(new TreeSet<String>()));
        print(fill(new LinkedHashSet<String>()));
        print(fill(new HashMap<String,String>()));
        print(fill(new TreeMap<String,String>()));
        print(fill(new LinkedHashMap<String,String>()));
    }
}
```
```
Output:
[rat, cat, dog, dog]
[rat, cat, dog, dog]
[dog, cat, rat]
[cat, dog, rat]
[rat, cat, dog]
{dog=Spot, cat=Rags, rat=Fuzzy}
{cat=Rags, dog=Spot, rat=Fuzzy}
{rat=Fuzzy, cat=Rags, dog=Spot}
```
In the output, you can see that the default printing behavior (provided via each
container’s toString( ) method) produces reasonably readable results. A
Collection is printed surrounded by square brackets, with each element separated
by a comma. A Map is surrounded by curly braces, with each key and value
associated with an equal sign (keys on the left, values on the right).

If storage order is important, you can use a TreeSet, which keeps the objects in
ascending comparison order, or a LinkedHashSet, which keeps the objects in the
order in which they were added.

Map.put(key, value) adds a value (the thing you want) and associates it with a
key (the thing you look it up with). Map.get(key) produces the value associated
with that key.

The example uses the three basic flavors of Map: HashMap, TreeMap and
LinkedHashMap. Like HashSet, HashMap provides the fastest lookup technique, and
also doesn’t hold its elements in any apparent order. A TreeMap keeps the keys
sorted by ascending comparison order, and a LinkedHashMap keeps the keys in
insertion order while retaining the lookup speed of the HashMap.

## List

Lists promise to maintain elements in a particular sequence. The List interface
adds a number of methods to Collection that allow insertion and removal of
elements in the middle of a List.

The basic ArrayList, which excels at randomly accessing elements, but is slower
when inserting and removing elements in the middle of a List.

The LinkedList, which provides optimal sequential access, with inexpensive
insertions and deletions from the middle of the List. A LinkedList is relatively
slow for random access, but it has a larger feature set than the ArrayList.

You can find out whether an object is in the list using the contains( ) method.
If you want to remove an object, you can pass that object’s reference to the
remove( ) method. Also, if you have a reference to an object, you can discover
the index number where that object is located in the List using indexOf( )

When deciding whether an element is part of a List, discovering the index of an
element, and removing an element from a List by reference, the equals( ) method
(part of the root class Object) is used.

The subList( ) method allows you to easily create a slice out of a larger list,
and this naturally produces a true result when passed to containsAll( ) for that
larger list. It’s also interesting to note that order is unimportant—you can see
in output lines 11 and 12 that calling the intuitively named Collections.sort( )
and Collections.shuffle( ) on sub doesn’t affect the outcome of containsAll( ).
subList( ) produces a list backed by the original list. Therefore, changes in
the returned list are reflected in the original list, and vice versa.

The retainAll( ) method is effectively a "set intersection" operation, in this
case keeping all the elements in copy

The removeAll( ) method also operates based on the equals( ) method. As the name
implies, it removes all the objects from the List that are in the argument List.
The set( ) method is rather unfortunately named because of the potential
confusion with the Set class— "replace" might have been a better name here, be

You can convert any Collection to an array using toArray( ).

This is an overloaded method; the no-argument version returns an array of
Object, but if you pass an array of the target type to the overloaded version,
it will produce an array of the type specified (assuming it passes type
checking). If the argument array is too small to hold all the objects in the
List (as is the case here), to Array( ) will create a new array of the
appropriate size.

```java
String[] test = collection.toArray(new String[0]);
```

## Iterator
In any container, you must have a way to insert elements and fetch them out
again. After all, that’s the primary job of a container—to hold things. In a
List, add( ) is one way to insert elements, and get( ) is one way to fetch
elements.

If you want to start thinking at a higher level, there’s a drawback: You need to
program to the exact type of the container in order to use it. This might not
seem bad at first, but what if you write code for a List, and later on you
discover that it would be convenient to apply that same code to a Set? Or
suppose you’d like to write, from the beginning, a piece of general- purpose
code that doesn’t know or care what type of container it’s working with, so that
it can be used on different types of containers without rewriting that code?

An iterator is an object whose job is to move through a sequence and select each
object in that sequence without the client programmer knowing or caring about
the underlying structure of that sequence. In addition, an iterator is usually
what’s called a lightweight object: one that’s cheap to create. For that reason,
you’ll often find seemingly strange constraints for iterators; for example, the
Java Iterator can move in only one direction.  There’s not much you can do with
an Iterator except:

1. Ask a Collection to hand you an Iterator using a method called iterator( ).
That Iterator will be ready to return the first element in the sequence.

2. Get the next object in the sequence with next( ).
3. See if there are any more objects in the sequence with hasNext( ).

4. Remove the last element returned by the iterator with remove( ).

```java
List<Pet> pets = Pets.arrayList(12);
Iterator<Pet> it = pets.iterator();

while(it.hasNext()) {
    Pet p = it.next();
    System.out.print(p.id() + ":" + p + " ");
}

//simpler approach
for (Pet p : pets)
    System.out.print(p.id() + ":" + p + " ");

// an iterator can also remove elements
it = pets.iterator();

for(int i = 0; i < 6; i++) {
    it.next();
    it.remove();
}
```

With an Iterator, you don’t need to worry about the number of elements in the
container.  That’s taken care of for you by hasNext( ) and next( ).  If you’re
simply moving forward through the List and not trying to modify the List object
itself, you can see that the foreach syntax is more succinct.

### Linked list
The LinkedList also implements the basic List interface like ArrayList does, but
it performs certain operations (insertion and removal in the middle of the List)
more efficiently than does ArrayList. Conversely, it is less efficient for
random-access operations.

LinkedList also adds methods that allow it to be used as a stack, a Queue or a
double-ended queue (deque).

### Stack
A stack is sometimes referred to as a "last-in, first-out" (LIFO) container.
It’s sometimes called a pushdown stack, because whatever you "push" on the stack
last is the first item you can "pop" off of the stack. An often-used analogy is
of cafeteria trays in a spring-loaded holder—the last ones that go in are the
first ones that come out.

LinkedList has methods that directly implement stack functionality, so you can
also just use a LinkedList rather than making a stack class.  However, a stack
class can sometimes tell the story better

```java
public class Stack<T> {
    private LinkedList<T> storage = new LinkedList<T>();
    public void push(T v) { storage.addFirst(v); }
    public T peek() { return storage.getFirst(); }
    public T pop() { return storage.removeFirst(); }
    public boolean empty() { return storage.isEmpty(); }
    public String toString() { return storage.toString(); }
}
```
If you want only stack behavior, inheritance is inappropriate here because it
would produce a class with all the rest of the LinkedList methods (you’ll see in
the Containers in Depth chapter that this very mistake was made by the Java l.o
designers when they created java.util.Stack).

### Set
A Set refuses to hold more than one instance of each object value. If you try to
add more than one instance of an equivalent object, the Set prevents
duplication. The most common use for a Set is to test for membership, so that
you can easily ask whether an object is in a Set.  Because of this, lookup is
typically the most important operation for a Set, so you’ll usually choose a
HashSet implementation, which is optimized for rapid lookup.

Set has the same interface as Collection, so there isn’t any extra functionality
like there is in the two different types of List. Instead, the Set is exactly a
Collection—it just has different behavior. (This is the ideal use of inheritance
and polymorphism: to express different behavior.) A Set determines membership
based on the "value" of an object, a more complex topic that you will learn
about in the Containers in Depth chapter.

If you want the results to be sorted, one approach is to use a TreeSet instead
of a HashSet

If you’d like to sort a set alphabetically, you can pass the
String.CASE_INSENSITIVE_ORDER Comparator (a comparator is an object that
establishes order) to the TreeSet constructor

```java
Set<String> words = new TreeSet<String>(String.CASE_INSENSITIVE_ORDER);
```
### Map
The ability to map objects to other objects can be an immensely powerful way to
solve programming problems. For example, consider a program to examine the
randomness of Java’s Random class. Ideally, Random would produce a perfect
distribution of numbers, but to test this you need to generate many random
numbers and count the ones that fall in the various ranges. A Map easily solves
the problem; in this case, the key is the number produced by Random, and the
value is the number of times that number appears

Maps, like arrays and Collections, can easily be expanded to multiple
dimensions; you simply make a Map whose values are Maps (and the values of those
Maps can be other containers, even other Maps). Thus, it’s quite easy to combine
containers to quickly produce powerful data structures. For example, suppose you
are keeping track of people who have multiple pets—all you need is a Map<Person,
List<Pet>>:

### Queue
A queue is typically a “first-in, first-out" (FIFO) container. That is, you put
things in at one end and pull them out at the other, and the order in which you
put them in will be the same order in which they come out. Queues are commonly
used as a way to reliably transfer objects from one area of a program to
another. Queues are especially important in concurrent programming, as you will
see in the Concurrency chapter, because they safely transfer objects from one
task to another.

LinkedList has methods to support queue behavior and it implements the Queue
interface, so a LinkedList can be used as a Queue implementation. By upcasting a
LinkedList to a Queue, this example uses the Queuespecific methods in the Queue
interface:

```java
Queue<Character> qc = new LinkedList<Character>();
```
The Queue interface narrows access to the methods of LinkedList so that only the
appropriate methods are available, and you are thus less tempted to use
LinkedList methods (here, you could actually cast queue back to a LinkedList,
but you are at least discouraged from doing so).

```java
public class QueueDemo {
    public static void printQ(Queue queue) {
        while(queue.peek() != null)
            System.out.print(queue.remove() + " ");
        System.out.println();
    }
    public static void main(String[] args) {
        Queue<Integer> queue = new LinkedList<Integer>();
        Random rand = new Random(47);
        for(int i = 0; i < 10; i++)
            queue.offer(rand.nextInt(i + 10));
        printQ(queue);
        Queue<Character> qc = new LinkedList<Character>();
        for(char c : "Brontosaurus".toCharArray())
            qc.offer(c);
        printQ(qc);
    }
}
```
### Priority Queue
First-in, first-out (FIFO) describes the most typical queuing discipline. A
queuing discipline is what decides, given a group of elements in the queue,
which one goes next. First-in, first- out says that the next element should be
the one that was waiting the longest.

Apriority queue says that the element that goes next is the one with the
greatest need (the highest priority). For example, in an airport, a customer
might be pulled out of a queue if their plane is about to leave. If you build a
messaging system, some messages will be more important than others, and should
be dealt with sooner, regardless of when they arrive. The PriorityQueue was
added in Java SE5 to provide an automatic implementation for this behavior.

When you offer( ) an object onto a PriorityQueue, that object is sorted into the
queue. The default sorting uses the natural order of the objects in the queue,
but you can modify the order by providing your own Comparator.  The
PriorityQueue ensures that when you call peek( ), poll( ) or remove( ), the
element you get will be the one with the highest priority.

Integer, String and Character work with PriorityQueue because these classes
already have natural ordering built in. If you want you use your own class in a
PriorityQueue, you must include additional functionality to produce natural
ordering, or provide your own Comparator. There’s a more sophisticated example
that demonstrates this in the Containers in Depth chapter.

The use of Iterator becomes compelling when you implement a foreign class, one
that is not a Collection, in which it would be difficult or annoying to make it
implement the Collection interface.

Producing an Iterator is the least-coupled way of connecting a sequence to a
method that consumes that sequence, and puts far fewer constraints on the
sequence class than does implementing Collection.

## foreach and iterators
So far, the foreach syntax has been primarily used with arrays, but it also
works with any Collection object.

The reason that this works is that Java SE5 introduced a new interface called
Iterable which contains an iterator( ) method to produce an Iterator, and the
Iterable interface is what foreach uses to move through a sequence. So if you
create any class that implements Iterable, you can use it in a foreach statement

```java
public class IterableClass implements Iterable<String> {
    public Iterator<String> iterator() {
        return new Iterator<String>() {
        }
    }
}
```
Note that you cannot use an iterator inside a for each loop, only an object that
implements the iteratble object

The iterator( ) method returns an instance of an anonymous inner implementation
of Iterator<String> which delivers each word in the array.

In Java SE5, a number of classes have been made Iterable, primarily all
Collection classes (but not Maps).

A foreach statement works with an array or anything Iterable, but that doesn’t
mean that an array is automatically an Iterable, nor is there any autoboxing
that takes place.

## Summary
Java provides a number of ways to hold objects:

1. An array associates numerical indexes to objects. It holds objects of a known
   type so that you don’t have to cast the result when you’re looking up an
   object. It can be multidimensional, and it can hold primitives. However, its
   size cannot be changed once you create it.

2. A Collection holds single elements, and a Map holds associated pairs. With
   Java generics, you specify the type of object to be held in the containers,
   so you can’t put the wrong type into a container and you don’t have to cast
   elements when you fetch them out of a container. Both Collections and Maps
   automatically resize themselves as you add more elements. A container won’t
   hold primitives, but autoboxing takes care of translating primitives back and
   forth to the wrapper types held in the container.

3. Like an array, a List also associates numerical indexes to objects— thus,
   arrays and Lists are ordered containers.

4. Use an ArrayList if you’re doing a lot of random accesses, but a LinkedList
   if you will be doing a lot of insertions and removals in the middle of the
       list.

5. The behavior of Queues and stacks is provided via the LinkedList.

6. A Map is a way to associate not integral values, but objects with other
   objects.  HashMaps are designed for rapid access, whereas a TreeMap keeps its
   keys in sorted order, and thus is not as fast as a HashMap. A LinkedHashMap
   keeps its elements in insertion order, but provides rapid access with
   hashing.

7. A Set only accepts one of each type of object. HashSets provide maximally
   fast lookups, whereas TreeSets keep the elements in sorted order.
   LinkedHashSets keep elements in insertion order.

8. There’s no need to use the legacy classes Vector, Hashtable, and Stack in new
   code.

You’ll see that there are really only four basic container components—Map,
List, Set, and Queue—and only two or three implementations of each one

You can see that all Sets except TreeSet have exactly the same interface as
Collection. List and Collection differ significantly, although List requires
methods that are in Collection.  On the other hand, the methods in the Queue
interface stand alone; the Collection methods are not required to create a
functioning Queue implementation. Finally, the only intersection between Map and
Collection is the fact that a Map can produce Collections using the entrySet( )
and values( ) methods.

Notice the tagging interface java.util.RandomAccess, which is attached to
ArrayList but not to LinkedList. This provides information for algorithms that
might want to dynamically change their behavior depending on the use of a
particular List.


# Error Handling with Exceptions
When you throw an exception, several things happen. First, the exception object
is created in the same way that any Java object is created: on the heap, with
new. Then the current path of execution (the one you couldn’t continue) is
stopped and the reference for the exception object is ejected from the current
context. At this point the exception-handling mechanism takes over and begins to
look for an appropriate place to continue executing the program.  This
appropriate place is the exception handler, whose job is to recover from the
problem so the program can either try another tack or just continue.

Like any object in Java, you always create exceptions on the heap using new,
which allocates storage and calls a constructor. There are two constructors in
all standard exceptions; The first one is the default constructor, and the
second takes a string argument so you can place pertinent information in the
exception:

```java
throw new NullPointerException("t = null" );
```

The string can later be extracted using various methods.

You can throw any type of _Throwable_ ( the exception root class) object that
you want.

The information about the error is represented both inside the exception object
and implicitly in the name of the exception class, so someone in the bigger
context can figure out what to do with your exception. (Often, the only
information is the type of exception, and nothing meaningful is stored within
the exception object.)

## Catching an exception
To see how an exception is caught, you must first understand the concept of a
guarded region. This is a section of code that might produce exceptions and is
followed by the code to handle those exceptions.

If you’re inside a method and you throw an exception (or another method that you
call within this method throws an exception), that method will exit in the
process of throwing. If you don’t want a throw to exit the method, you can set
up a special block within that method to capture the exception. This is called
the try block because you "try" your various method calls there. The try block
is an ordinary scope preceded by the keyword try

Of course, the thrown exception must end up someplace. This "place" is the
exception handler, and there’s one for every exception type you want to catch.
Exception handlers immediately follow the try block and are denoted by the
keyword catch

```java
try {

} catcch (Typ1 id1) {

} catch (Typ2 id2) {

}
```
Each catch clause (exception handler) is like a little method that takes one and
only one argument of a particular type. The identifier (id1, id2, and so on) can
be used inside the handler, just like a method argument. Sometimes you never use
the identifier because the type of the exception gives you enough information to
deal with the exception, but the identifier must still be there.

## Creating your own exceptions

To create your own exception class, you must inherit from an existing exception
class, preferably one that is close in meaning to your new exception (although
this is often not possible). The most trivial way to create a new type of
exception is just to let the compiler create the default constructor for you, so
it requires almost no code at all

As you’ll see, the most important thing about an exception is the class name

However, you may want to send error output to the standard error stream by
writing to System.err. This is usually a better place to send error information
than System.out, which may be redirected. If you send output to System.err, it
will not be redirected along with System.out so the user is more likely to
notice it.

```java
class MyException extends Exception {
    public MyException() {}
    public MyException(String msg) { super(msg); }
}
```

printStackTrace()
: produces information about the sequence of methods that were called to get to
  the point where the exception happened. By default, the information goes to
  the standard error stream, but overloaded versions allow you to send the
  results to any other stream as well.

getMessage()
: will return the string that you gave to the constructor

getMessage( ) is something like toString( ) for exception classes.

## The exception specification
In Java, you’re encouraged to inform the client programmer, who calls your
method, of the exceptions that might be thrown from your method. This is
civilized, because the caller can then know exactly what code to write to catch
all potential exceptions.

Java provides syntax (and forces you to use that syntax) to allow you to
politely tell the client programmer what exceptions this method throws, so the
client programmer can handle them. This is the exception specification and it’s
part of the method declaration, appearing after the argument list.

```java
void f() throws TooBig, TooSmall, DivZero {
```
There is one place you can lie: You can claim to throw an exception that you
really don’t. The compiler takes your word for it, and forces the users of your
method to treat it as if it really does throw that exception. This has the
beneficial effect of being a placeholder for that exception, so you can actually
start throwing the exception later without requiring changes to existing code.
It’s also important for creating abstract base classes and interfaces whose
derived classes or implementations may need to throw exceptions.

## Catching any exception

It is possible to create a handler that catches any type of exception. You do
this by catching the base-class exception type Exception (there are other types
of base exceptions, but Exception is the base that’s pertinent to virtually all
programming activities).

Since the Exception class is the base of all the exception classes that are
important to the programmer, you don’t get much specific information about the
exception, but you can call the methods that come from its base type Throwable

```java
String getLocalizedMessage( )
Gets the detail message, or a message adjusted for this particular
locale.

void printStackTrace( )
voidprintStackTrace(PrintStream)
voidprintStackTrace(java.io.PrintWriter)

Throwable fillInStackTrace( )
: Records information within this Throwable object about the current state of
  the stack frames. Useful when an application is rethrowing an error or exception
```
## The Stack Trace
The information provided by printStackTrace( ) can also be accessed directly
using getStackTrace( ). This method returns an array of stack trace elements,
each representing one stack frame. Element zero is the top of the stack, and is
the last method invocation in the sequence (the point this Throwable was created
and thrown). The last element of the array and the bottom of the stack is the
first method invocation in the sequence.

If you inherit exceptions from RuntimeException, you don't need to tell your
method to throw the exception ( methodName() throws FunkyException ) if you
don't catch that exception in the method when you throw it

Since the Exception class is the base of all the exception classes that are
important to the programmer, you don't get much specific information about the
exception, but you can call the methods that come from its base type Throwable

```java
} catch (Exception e) {
    for (StackTraceElement ste : e.getStackTrace()) {
        System.out.println (ste.getMethodName());
    }
}
```
Here, we just print the method name, but you can also print the entire
StackTraceElement, which contains additional information.


## Rethrowing an Exception
Sometimes you'll want to rethrow the exception that you just caught,
particularly when you use Exception to catch any exception.

```java
catch(Exception e) {
    println("An exception was thrown");
    throw e;
}
```
If you simply rethrow the current exception, the information that you print
about the exception in printStackTrace() will pertain to the exception's origin,
not the place where you rethrow it.

Any further catch clauses for the same try block are still ignored.

If you simply rethrow the current exception, the information that you print
about that exception in printStackTrace( ) will pertain to the exception’s
origin, not the place where you rethrow it.

If you want to install new stack trace information, you can do so by calling
fillInStackTrace(), which returns a Throwable object that it creates by stuffing
the current stack information into the old exception object.

```java
public static void g() throws Exception {
    try {
        f();
    } catch (Exception e) {
        e.printStackTrace();

        // throw e;// keep the original stack trace
        // the stack trace always remembers its true point of origin no
        // matter how many time it gets rethrown

        throw e.fillInStackTrace(); // replacing the stack trace to make as
        //  if it was thrown here

    }
    public static void main(String[] args) {
        try {
            g();
        } catch (Exception e) {

        }

    }
}
```
          Throwable
             / \
            /   \
           /     \
         Error    Exception
                      |
                      |
               RuntimeException

## Exception chaining - Keep the information about the originating exception --

Often you want to catch one exception and throw another, but still keep the
information about the originating exception - this is called _exception
chaining_

All Throwable subclasses may take a _cause_ object in their constructor. The
cause is intended to be the originating exception, and by passing it in you
maintain the stack trace back to its origin, even though you're creating and
throwing a new exception at this point.

The cause is intended to be the originating exception, and by passing it in you
maintain the stack trace back to its origin, even though you’re creating and
throwing a new exception.

It's interesting to note that the only Throwable subclasses that provide the
cause argument in the constructor are the three fundamental exception classes
Error (used by JVM to report system errors), Exception, and RuntimeException.

If you want to chain any other exception types, you do it through the
initCause() method rather than the constructor.

```java
// initCause
DynamicFieldsException dfe = new DynamicFieldsException();
dfe.initCause(new NullPointerException());

// cause
throw new RuntimeException(e);
```

## Standard Java exceptions
The Java class Throwable describes anything that can be thrown as an Exception.
There are two general types of Throwable objects.

- Error represents compile-time and system errors that you don't worry about
  catching.

- Exception is the basic type that can be thrown from any of the standard Java
  library class methods and from your methods and run-time accidents. So the
  Java programmer's base type of interest is usually Exception.

The basic idea is that the name of the exception represents the problem that
occurred, and the exception name is intended to be relatively self-explanatory.

## Runtime Exception
You never need to write an exception specification saying that a method might
throw a RuntimeException, because they are _unchecked_ exceptions.

Because they indicate bugs, you don't usually catch a RuntimeException - it's
dealt with automatically. If you were forced to check for RuntimeExceptions,
your code could get too messy. Even though you don't typically catch
RuntimeExceptions, in your own packages you might choose to throw some of the
RuntimeExceptions.

The reasoning is that a RuntimeException represents a programming error:
- An error that you cannot anticipate
- An error that you, as a programmer, should have checked for in your code
  (such as ArrayIndexOutOfBoundsException)

You can already see that a RuntimeException (or anything inherited from it) is a
special case, since the compiler doesn’t require an exception specification for
these types. The output is reported to System.err:

```java
throw new RuntimeException("From f()");
```
If a RuntimeException gets all the way out to main( ) without being caught,
printStackTrace( ) is called for that exception as the program exits.

## Performing Cleanup with finally
finally is necessary when you need to set something other than memory back to
its original state. This is some kind of cleanup like an open file or network
connection, something you've drawn on the screen, or even a switch in the
outside world.

finally clause is executed whether or not an exception is thrown.

Because a finally clause is always executed, it’s possible to return from
multiple points within a method and still guarantee that important cleanup will
be performed

```java
try {
    print("Point 1");
    if(i == 1) return;
    print("Point 2");
    if(i == 2) return;
    print("Point 3");
    if(i == 3) return;
    print("End");
    return;
} finally {
    print("Performing cleanup");
}
```

## Pitfall -the lost exception

There's a flaw in Java's exception implementation. Although exceptions are an
indication of a crisis in your program and should never be ignored, it's
possible for an exception to simply be lost.

This happens with a particular configuration using a finally clause

```java
lm.f() throws VeryImportantException();
lm.dispose() throws HoHumException();

class HoHumException extends Exception {
    public String toString() {
        return "A trivial exception";
    }
}

// code in question
try {
    lm.f();
} finally {
    lm.dispose();
}

// what is printed
Exception in thread main "A trivial Exception"
```
his occurs because there is no catch() - it is simply replaced by the
HoHumException in the finally clause.

You can see from the output that there’s no evidence of the
VerylmportantException, which is simply replaced by the HoHumException in the
finally clause. This is a rather serious pitfall, since it means that an
exception can be completely lost, and in a far more subtle and
difficult-to-detect fashion than the preceding example.

An even simpler way to lose an exception is just to return from inside a finally
clause

```java
try {
    throw new RuntimeException();
} finally {
    // Using ‘return’ inside the finally block
    // will silence any thrown exception.
    return;
}
```
## Exception Restrictions
When you override a method, you can throw only the exceptions that have been
specified in the base-class version of the method. This is a useful restriction,
since it means that the code that works with the base class will automatically
work with any object derived from the base class.

IMPORTANT: you can use "throws" in a method even though you never throw that
method in case of error:

```java
int haha() throws PlotException {
}
```
This is legal because it allows you to force the user to catch any exceptions
that might be added in overriden versions.

A derived-class constructor cannot catch exceptions thrown by its base-class
constructor. [Why? Probably because if the base constructor throws an
exception, the base object has not been properly initialized!]

# Strings

## Overloading '+' vs StringBuilder
Since String objects are immutable, you can alias to a particular String as many
times as you want. Because a String is read-only, there’s no possibility that
one reference will change something that will affect the other references.

Immutability can have efficiency issues. A case in point is the operator ‘+’
that has been overloaded for String objects. Overloading means that an operation
has been given an extra meaning when used with a particular class.  (The ‘+’ and
`+=` for String are the only operators that are overloaded in Java, and Java
does not allow the programmer to overload any others.) The’+’ operator allows
you to concatenate Strings

```java
String s = "abc" + mango + "def" + 47;

/* Output:
   abcmangodef47
 */
```
You could imagine how this might work. The String "abc" could have a method
append( ) that creates a new String object containing "abc" concatenated with
the contents of mango.  The new String object would then create another new
String that added "def," and so on.

This would certainly work, but it requires the creation of a lot of String
objects just to put together this new String, and then you have a bunch of
intermediate String objects that need to be garbage collected.

To see what really happens, you can decompile the above code using the javap
tool that comes as part of the JDK. Here’s the command line:

Although StringBuilder has a full complement of methods, including insert( ),
replace(), substring( ) and even reverse( ), the ones you will generally use are
append( ) and toString( ). Note the use of delete( ) to remove the last comma
and space before adding the closing square bracket.

StringBuilder was introduced in Java SE5. Prior to this, Java used StringBuffer,
which ensured thread safety (see the Concurrency chapter) and so was
significantly more expensive. Thus, string operations in Java SE5/6 should be
faster.

## Formatting output
One of the long-awaited features that has finally appeared in Java SE5 is output
formatting in the style of C’s printf( ) statement. Not only does this allow for
simplified output code, but it also gives Java developers powerful control over
output formatting and alignment.

 Java SE5 introduced the format( ) method, available to PrintStream or
 PrintWriter objects (which you’ll learn more about in the I/O chapter), which
 includes System.out. The format( ) method is modeled after C’s printf().
 There’s even a convenience printf( ) method that you can use if you’re feeling
 nostalgic, which just calls format( ). Here’s a simple example

```java
public class SimpleFormat {
    public static void main(String[] args) {
        int x = 5;
        double y = 5.332542;
        System.out.println("Row 1: [" + x + " " + y + "]");
        System.out.format("Row 1: [%d %f]\n", x, y);
        System.out.printf("Row 1: [%d %f]\n", x, y);
    }
}
```
## The Formatter class
All of Java’s new formatting functionality is handled by the Formatter class in
the java.util package. You can think of Formatter as a translator that converts
your format string and data into the desired result. When you create a Formatter
object, you tell it where you want this result to go by passing that information
to the constructor:

```java
import java.io.*;
import java.util.*;
public class Turtle {
    private String name;
    private Formatter f;
    public Turtle(String name, Formatter f) {
        this.name = name;
        this.f = f;
    }
    public void move(int x, int y) {
        f.format("%s The Turtle is at (%d,%d)\n", name, x, y);
    }
    public static void main(String[] args) {
        PrintStream outAlias = System.out;
        Turtle tommy = new Turtle("Tommy",
                new Formatter(System.out));
        Turtle terry = new Turtle("Terry",
                new Formatter(outAlias));
        tommy.move(0,0);
        terry.move(4,8);
        tommy.move(3,4);
        terry.move(2,5);
        tommy.move(3,3);
        terry.move(3,3);
    }
}
/* Output:
   Tommy The Turtle is at (0,0)
   Terry The Turtle is at (4,8)
   Tommy The Turtle is at (3,4)
   Terry The Turtle is at (2,5)
   Tommy The Turtle is at (3,3)
   Terry The Turtle is at (3,3)
 */
```

All the tommy output goes to System.out and all the terry output goes to an
alias of System.out. The constructor is overloaded to take a range of output
locations, but the most useful are PrintStreams (as above), OutputStreams, and
Files. You’ll learn more about these in the I/O chapter.

The previous example uses a new format specifier, ‘%s’. This indicates a String
argument and is an example of the simplest kind of format specifier-one that has
only a conversion type.

### Format Specifiers
To control spacing and alignment when data is inserted, you need more elaborate
format specifiers. Here’s the general syntax:

```
[argument_index$][flags][width][.precision]conversion
```
Often, you’ll need to control the minimum size of a field. This can be
accomplished by specifying a width. The Formatter guarantees that a field is at
least a certain number of characters wide by padding it with spaces if
necessary. By default, the data is right justified, but this can be overridden
by including a ‘-’ in the flags section.

The opposite of width is precision, which is used to specify a maximum. Unlike
the width, which is applicable to all of the data conversion types and behaves
the same with each, precision has a different meaning for different types. For
Strings, the precision specifies the maximum number of characters from the
String to print. For floating point numbers, precision specifies the number of
decimal places to display (the default is 6), rounding if there are too many or
adding trailing zeroes if there are too few. Since integers have no fractional
part, precision isn’t applicable to them and you’ll get an exception if you use
precision with an integer conversion type.

As you can see, the Formatter provides powerful control over spacing and
alignment with fairly concise notation. Here, the format strings are simply
copied in order to produce the appropriate spacing.

Java SE5 also took a cue from C’s sprintf( ), which is used to create Strings.
String.format( ) is a static method which takes all the same arguments as
Formatter’s format( ) but returns a String. It can come in handy when you only
need to call format( ) once:

```java
super(String.format("(t%d, q%d) %s", transactionID, queryID, message));
```
Under the hood, all String.format( ) does is instantiate a Formatter and pass
your arguments to it, but using this convenience method can often be clearer and
easier than doing it by hand.

## Regular Expressions
Regular expressions are powerful and flexible text-processing tools. They allow
you to specify, programmatically, complex patterns of text that can be
discovered in an input string. Once you discover these patterns, you can then
react to them any way you want. Although the syntax of regular expressions can
be intimidating at first, they provide a compact and dynamic language that can
be employed to solve all sorts of string processing, matching and selection,
editing, and verification problems in a completely general way.

### Basics
A regular expression is a way to describe strings in general terms, so that you
can say, "If a string has these things in it, then it matches what I’m looking
for." For example, to say that a number might or might not be preceded by a
minus sign, you put in the minus sign followed by a question mark, like this:

```
-?
```
To describe an integer, you say that it’s one or more digits. In regular
expressions, a digit is described by saying ‘\d’. If you have any experience
with regular expressions in other languages, you’ll immediately notice a
difference in the way backslashes are handled. In other languages, ‘\\’ means "I
want to insert a plain old (literal) backslash in the regular expression.  Don’t
give it any special meaning." In Java, ‘ \ \ ‘ means "I’m inserting a regular
expression backslash, so that the following character has special meaning." For
example, if you want to indicate a digit, your regular expression string will be
‘\\d’. If you want to insert a literal backslash, you say ‘\\\\’- However,
things like newlines and tabs just use a single backslash: ‘\n\t’.

The simplest way to use regular expressions is to use the functionality built
into the String class.

```java
public class IntegerMatch {
    public static void main(String[] args) {
        System.out.println("-1234".matches("-?\\d+"));
        System.out.println("5678".matches("-?\\d+"));
        System.out.println("+911".matches("-?\\d+"));
        System.out.println("+911".matches("(-|\\+)?\\d+"));
    }
} /* Output:
     true
     true
     false
     true
   */
```
### Quantifiers
A quantifier describes the way that a pattern absorbs input text:

Greedy
: Quantifiers are greedy unless otherwise altered. A greedy expression finds as
  many possible matches for the pattern as possible. A typical cause of problems
  is to assume that your pattern will only match the first possible group of
  characters, when it’s actually greedy and will keep going until it’s matched
  the largest possible string.

Reluctant
: Specified with a question mark, this quantifier matches the minimum number of
  characters necessary to satisfy the pattern.  Also called lazy, minimal
  matching, non-greedy, or ungreedy.

Possessive
: Currently this is only available in Java (not in other languages) and is more
  advanced, so you probably won’t use it right away. As a regular expression is
  applied to a string, it generates many states so that it can backtrack if the
  match fails.

Possessive quantifiers do not keep those intermediate states, and thus prevent
backtracking. They can be used to prevent a regular expression from running away
and also to make it execute more efficiently.

### Pattern and Matcher

In general, you’ll compile regular expression objects rather than using the
fairly limited String utilities. To do this, you import java.util.regex, then
compile a regular expression by using the static Pattern.compile( ) method.
This produces a Pattern object based on its String argument. You use the Pattern
by calling the matcher( ) method, passing the string that you want to search.
The matcher( ) method produces a Matcher object, which has a set of operations
to choose from (you can see all of these in the JDK documentation for
java.util.regex.Matcher). For example, the replaceAll( ) method replaces all the
matches with its argument.


```java
for(String arg : args) {
    print("Regular expression: \"" + arg + "\"");
    Pattern p = Pattern.compile(arg);
    Matcher m = p.matcher(args[0]);
    while(m.find()) {
        print("Match \"" + m.group() + "\" at positions " +
                m.start() + "-" + (m.end() - 1));
    }
}
```
```
Input: "abcabcabcdefabc"
Regular expression: "abcabcabcdefabc"
Match "abcabcabcdefabc" at positions 0-14
Regular expression: "abc+"
Match "abc" at positions 0-2
Match "abc" at positions 3-5
Match "abc" at positions 6-8
Match "abc" at positions 12-14
Regular expression: "(abc)+"
Match "abcabcabc" at positions 0-8
Match "abc" at positions 12-14
Regular expression: "(abc){2,}"
Match "abcabcabc" at positions 0-8
```
A Pattern object represents the compiled version of a regular expression. As
seen in the preceding example, you can use the matcher( ) method and the input
string to produce a Matcher object from the compiled Pattern object. Pattern
also has a static method:

```java
static boolean matches(String regex, CharSequence input)
```

to check whether regex matches the entire input CharSequence, and a split( )
method that produces an array of String that has been broken around matches of
the regex.

A Matcher object is generated by calling Pattern.matcher( ) with the input
string as an argument. The Matcher object is then used to access the results,
using methods to evaluate the success or failure of different types of matches:

```java
boolean matches()
boolean lookingAt()
boolean find()
boolean find(int start)
```
The matches ( ) method is successful if the pattern matches the entire input
string, while lookingAt( ) is successful if the input string, starting at the
beginning, is a match to the pattern.

# Type Information

Runtime type information (RTTI) allows you to discover and use type information
while a program is running.

All classes are loaded into the JVM dynamically, upon the first use of a class.
This happens when the program makes the first reference to a static member of
that class. It turns out that the constructor is also a static method of a
class, even though the static keyword is not used for a constructor. Therefore,
creating a new object of that class using the new operator also counts as a
reference to a static member of the class.

Thus, a Java program isn’t completely loaded before it begins, but instead
pieces of it are loaded when necessary. This is different from many traditional
languages. Dynamic loading enables behavior that is difficult or impossible to
duplicate in a statically loaded language like C++.

The class loader first checks to see if the Class object for that type is
loaded. If not, the default class loader finds the .class file with that name
(an add-on class loader might, for example, look for the bytecodes in a database
instead). As the bytes for the class are loaded, they are verified to ensure
that they have not been corrupted and that they do not comprise bad Java code
(this is one of the lines of defense for security in Java).

Once the Class object for that type is in memory, it is used to create all
objects of that type.

```java```
Class.forName("Gum");
```
All Class objects belong to the class Class. A Class object is like any other
object, so you can get and manipulate a reference to it (that’s what the loader
does). One of the ways to get a reference to the Class object is the static
forName( ) method, which takes a String containing the textual name (watch the
spelling and capitalization!) of the particular class you want a reference for.
It returns a Class reference, which is being ignored here; the call to forName(
) is being made for its side effect, which is to load the class Gum if it isn’t
already loaded. In the process of loading, Gum’s static clause is executed.

Anytime you want to use type information at run time, you must first get a
reference to the appropriate Class object. Class.forName( ) is one convenient
way to do this, because you don’t need an object of that type in order to get
the Class reference. However, if you already have an object of the type you’re
interested in, you can fetch the Class reference by calling a method that’s part
of the Object root class: getClass( ). This returns the Class reference
representing the actual type of the object. Class has many interesting methods;
here are a few of them:


##HERE
          //: typeinfo/toys/ToyTest.java
          // Testing class Class.
          package typeinfo.toys;
          import static net.mindview.util.Print.*;
          interface HasBatteries {}
          interface Waterproof {}
          interface Shoots {}
          class Toy {
          // Comment out the following default constructor
          // to see NoSuchMethodError from (*1*)
          Toy() {}
          Toy(int i) {}
          }
          class FancyToy extends Toy
          implements HasBatteries, Waterproof, Shoots {
          FancyToy() { super(1); }
          }
          public class ToyTest {
          static void printInfo(Class cc) {
          print("Class name: " + cc.getName() +
          " is interface? [" + cc.isInterface() + "]");
          print("Simple name: " + cc.getSimpleName());
          print("Canonical name : " + cc.getCanonicalName());
          }
          public static void main(String[] args) {
          Class c = null;
          try {
          c = Class.forName("typeinfo.toys.FancyToy");
              } catch(ClassNotFoundException e) {
                  print("Can’t find FancyToy");
                  System.exit(1);
              }
              printInfo(c);
              for(Class face : c.getInterfaces())
                  printInfo(face);

              Class up = c.getSuperclass();
              Object obj = null;
              try {
                  // Requires default constructor:
                  obj = up.newInstance();
              } catch(InstantiationException e) {
                  print("Cannot instantiate");
                  System.exit(1);
              } catch(IllegalAccessException e) {
                  print("Cannot access");
                  System.exit(1);
              }
              printInfo(obj.getClass());
          }
              } /* Output:
                   Class name: typeinfo.toys.FancyToy is interface? [false]
                   Simple name: FancyToy
                   Canonical name : typeinfo.toys.FancyToy
                   Class name: typeinfo.toys.HasBatteries is interface? [true]
                   Simple name: HasBatteries
                   Canonical name : typeinfo.toys.HasBatteries
                   Class name: typeinfo.toys.Waterproof is interface? [true]
                   Simple name: Waterproof
                   Canonical name : typeinfo.toys.Waterproof
                   Class name: typeinfo.toys.Shoots is interface? [true]
                   Simple name: Shoots
                   Canonical name : typeinfo.toys.Shoots
                   Class name: typeinfo.toys.Toy is interface? [false]
                   Simple name: Toy
                   Canonical name : typeinfo.toys.Toy
                 */

  FancyToy inherits from Toy and implements the interfaces HasBatteries,
  Waterproof, and Shoots. In main( ), a Class reference is created and
  initialized to the FancyToy Class using forName( ) inside an appropriate try
  block. Notice that you must use the fully qualified name (including the
  package name) in the string that you pass to forName( ).

  printInfo( ) uses getName( ) to produce the fully qualified class name, and
  getSimpleName( ) and getCanonicalName( ) (introduced in Java SE5) to produce
  the name without the package, and the fully qualified name, respectively. As
  its name implies, islnterface( ) tells you whether this Class object
  represents an interface. Thus, with the Class object you can find out just
  about everything you want to know about a type.

  The Class.getlnterfaces( ) method called in main( ) returns an array of Class
  objects representing the interfaces that are contained in the Class object of
  interest.

  If you have a Class object, you can also ask it for its direct base class
  using getSuperclass(). This returns a Class reference that you can further
  query. Thus you can discover an object’s entire class hierarchy at run time.


  The newlnstance( ) method of Class is a way to implement a "virtual
  constructor," which allows you to say, "I don’t know exactly what type you
  are, but create yourself properly anyway." In the preceding example, up is
  just a Class reference with no further type information known at compile time.
  And when you create a new instance, you get back an Object reference. But that
  reference is pointing to a Toy object. Of course, before you can send any
  messages other than those accepted by Object, you must investigate it a bit
  and do some casting. In addition, the class that’s being created with
  newlnstance( ) must have a default constructor. Later in this chapter, you’ll
  see how to dynamically create objects of classes using any constructor, with
  the Java reflection API.

- Class literals

  Java provides a second way to produce the reference to the Class object: the
  class literal. In the preceding program this would look like:

        FancyToy.class;

  which is not only simpler, but also safer since it’s checked at compile time
  (and thus does not need to be placed in a try block). Because it eliminates
  the forName( ) method call, it’s also more efficient.

  Class literals work with regular classes as well as interfaces, arrays, and
  primitive types. In addition, there’s a standard field called TYPE that exists
  for each of the primitive wrapper classes. The TYPE field produces a reference
  to the Class object for the associated primitive type, such that:

          is equivalent to

        boolean.class        Boolean.TYPE
        char.class           Character.TYPE
        void.class           Void.TYPE

        etc


  My preference is to use the ".class" versions if you can, since they’re more
  consistent with regular classes.

  It’s interesting to note that creating a reference to a Class object using
  ".class" doesn’t automatically initialize the Class object. There are actually
  three steps in preparing a class for use:

  1.  Loading, which is performed by the class loader. This finds the bytecodes
  (usually, but not necessarily, on your disk in your classpath) and creates a
  Class object from those bytecodes.

  2.  Linking. The link phase verifies the bytecodes in the class, allocates
  storage for static fields, and if necessary, resolves all references to other
  classes made by this class.

  3.  Initialization. If there’s a superclass, initialize that. Execute static
  initializers and static initialization blocks.

  Initialization is delayed until the first reference to a static method (the
  constructor is implicitly static) or to a non-constant static field:

      //: typeinfo/ClassInitialization.java
      import java.util.*;
      class Initable {
          static final int staticFinal = 47;
          static final int staticFinal2 =
              ClassInitialization.rand.nextInt(1000);
          static {
              System.out.println("Initializing Initable");
          }
      }
      class Initable2 {
          static int staticNonFinal = 147;
          static {
              System.out.println("Initializing Initable2");
          }
      }
      class Initable3 {
          static int staticNonFinal = 74;
          static {
              System.out.println("Initializing Initable3");
          }
      }
      public class ClassInitialization {
          public static Random rand = new Random(47);
          public static void main(String[] args) throws Exception {
              Class initable = Initable.class;
              System.out.println("After creating Initable ref");
              // Does not trigger initialization:
              System.out.println(Initable.staticFinal);
              // Does trigger initialization:
              System.out.println(Initable.staticFinal2);
              // Does trigger initialization:
              System.out.println(Initable2.staticNonFinal);
              Class initable3 = Class.forName("Initable3");
              System.out.println("After creating Initable3 ref");
              System.out.println(Initable3.staticNonFinal);
          }
      } /* Output:
           After creating Initable ref
           47
           Initializing Initable
           258
           Initializing Initable2
           147
           Initializing Initable3
           After creating Initable3 ref
           74
         */

  Effectively, initialization is "as lazy as possible." From the creation of the
  initable reference, you can see that just using the .class syntax to get a
  reference to the class doesn’t cause initialization. However, Class.forName( )
  initializes the class immediately in order to produce the Class reference, as
  you can see in the creation of initable3.

################################################################################
  If a static final value is a "compile-time constant," such as
  Initable.staticFinal, that value can be read without causing the Initable
  class to be initialized. Making a field static and final, however, does not
  guarantee this behavior: accessing Initable.staticFinal2 forces class
  initialization because it cannot be a compile-time constant.
################################################################################

  If a static field is not final, accessing it always requires linking (to
  allocate storage for the field) and initialization (to initialize that
  storage) before it can be read, as you can see in the access to
  Initable2.staticNonFinal.

- Generic class references

  A Class reference points to a Class object, which manufactures instances of
  classes and contains all the method code for those instances. It also contains
  the statics for that class. So a Class reference really does indicate the
  exact type of what it’s pointing to: an object of the class Class.

  However, the designers of Java SE5 saw an opportunity to make this a bit more
  specific by allowing you to constrain the type of Class object that the Class
  reference is pointing to, using the generic syntax. In the following example,
  both syntaxes are correct:

      public class GenericClassReferences {
          public static void main(String[] args) {
              Class intClass = int.class;
              Class<Integer> genericIntClass = int.class;
              genericIntClass = Integer.class; // Same thing
              intClass = double.class;
              // genericIntClass = double.class; // Illegal
          }
      }

  The ordinary class reference does not produce a warning. However, you can see
  that the ordinary class reference can be reassigned to any other Class object,
  whereas the generic class reference can only be assigned to its declared type.
  By using the generic syntax, you allow the compiler to enforce extra type
  checking.

  What if you’d like to loosen the constraint a little? Initially, it seems like
  you ought to be able to do something like:

        Class<Number> genericNumberClass = int.class;

  This would seem to make sense because Integer is inherited from Number. But
  this doesn’t work, because the Integer Class object is not a subclass of the
  Number Class object (this may seem like a subtle distinction; we’ll look into
  it more deeply in the Generics chapter).

  To loosen the constraints when using generic Class references, I employ the
  wildcard, which is part of Java generics. The wildcard symbol is ‘?’, and it
  indicates "anything." So we can add wildcards to the ordinary Class reference
  in the above example and produce the same results:

          public class WildcardClassReferences {
              public static void main(String[] args) {
                  Class<?> intClass = int.class;
                  intClass = double.class;
              }
          }

  In Java SE5, Class<?> is preferred over plain Class, even though they are
  equivalent and the plain Class, as you saw, doesn’t produce a compiler
  warning. The benefit of Class<?> is that it indicates that you aren’t just
  using a non-specific class reference by accident, or out of ignorance. You
  chose the non-specific version.

  In order to create a Class reference that is constrained to a type or any
  subtype, you combine the wildcard with the extends keyword to create a bound.
  So instead of just saying Class<Number>, you say:

          public class BoundedClassReferences {
              public static void main(String[] args) {
                  Class<? extends Number> bounded = int.class;
                  bounded = double.class;
                  bounded = Number.class;
                  // Or anything else derived from Number.
              }
          }

  The reason for adding the generic syntax to Class references is only to
  provide compile-time type checking, so that if you do something wrong you find
  out about it a little sooner. You can’t actually go astray with ordinary Class
  references, but if you make a mistake you won’t find out until run time, which
  can be inconvenient.

  Here’s an example that uses the generic class syntax. It stores a class
  reference, and later produces a List filled with objects that it generates
  using newlnstance( ):

      import java.util.*;

      class CountedInteger {
          private static long counter;
          private final long id = counter++;

          public String toString() {
              return Long.toString(id);
          }


          public class FilledList<T> {
              private Class<T> type;
              public FilledList(Class<T> type) {
                  this.type = type;
              }

              public List<T> create (int nElements) {
                  List<T> result = new ArrayList<T>();

                  try {
                      for (int i = 0; i < nElements; i++) {
                          result.add(type.newInstance());
                      }

                  } catch(Exception e) {
                      throw new RuntimeException(e);
                  }
                  return result;
              }

              public static void main (String[] args) {
                  FilledList<CountedInteger> fl =
                      new FilledList<CountedInteger>(CountedInteger.class);
                  System.out.println(fl.create(15));
              }
          }

          /* Output:
           * [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
           */

  Notice that this class must assume that any type that it works with has a
  default constructor (one without arguments), and you’ll get an exception if
  that isn’t the case. The compiler does not issue any warnings for this
  program.

################################################################################
  An interesting thing happens when you use the generic syntax for Class
  objects: newlnstance( ) will return the exact type of the object, rather than
  just a basic Object as you saw in ToyTest.java. This is somewhat limited:
################################################################################


          //: typeinfo/toys/GenericToyTest.java
          // Testing class Class.
          package typeinfo.toys;
          public class GenericToyTest {
              public static void main(String[] args) throws Exception {
                  Class<FancyToy> ftClass = FancyToy.class;
                  // Produces exact type:
                  FancyToy fancyToy = ftClass.newInstance();
                  Class<? super FancyToy> up = ftClass.getSuperclass();
                  // This won’t compile:
                  // Class<Toy> up2 = ftClass.getSuperclass();
                  // Only produces Object:
                  Object obj = up.newInstance();
              }
          }

  ***
  If you get the superclass, the compiler will only allow you to say that the
  superclass reference is "some class that is a superclass of FancyToy" as seen
  in the expression Class <? super FancyToy >. It will not accept a declaration
  of Class<Toy>. This seems a bit strange because getSuperclass( ) returns the
  base class (not interface) and the compiler knows what that class is at
  compile time—in this case, Toy.class, not just "some superclass of FancyToy."
  In any event, because of the vagueness, the return value of up.newlnstance( )
  is not a precise type, but just an Object.
  ***


- New cast syntax

  Java SE5 also adds a casting syntax for use with Class references, which is
  the cast( ) method:


          class Building {}
          class House extends Building {}
          public class ClassCasts {
              public static void main(String[] args) {
                  Building b = new House();
                  Class<House> houseType = House.class;
                  House h = houseType.cast(b);
                  h = (House)b; // ... or just do this.
              }
          }


  The cast( ) method takes the argument object and casts it to the type of the
  Class reference.  Of course, if you look at the above code it seems like a lot
  of extra work compared to the last line in main( ), which does the same thing.


  ***
  The new casting syntax is useful for situations where you can’t just use an
  ordinary cast. This usually happens when you’re writing generic code (which
  you’ll learn about in the Generics chapter), and you’ve stored a Class
  reference that you want to use to cast with at a later time.  It turns out to
  be a rare thing—I found only one instance where cast( ) was used in the entire
  Java SE5 library (it was in com.sun.mirror.util.DeclarationFilter).
  ***

  Another new feature had no usage in the Java SE5 library: Class.asSubclass( ).
  This allows you to cast the class object to a more specific type.


- Checking before a cast

  So far, you’ve seen forms of RTTI, including:

  1. The classic cast; e.g., "(Shape)," which uses RTTI to make sure the cast is
  correct.  This will throw a ClassCastException if you’ve performed a bad cast.

  2. The Class object representing the type of your object. The Class object can
  be queried for useful runtime information.

  In C++, the classic cast "(Shape)" does not perform RTTI. It simply tells the
  compiler to treat the object as the new type. In Java, which does perform the
  type check, this cast is often called a "type-safe downcast." The reason for
  the term "downcast" is the historical arrangement of the class hierarchy
  diagram. If casting a Circle to a Shape is an upcast, then casting a Shape to
  a Circle is a downcast.


  However, because it knows that a Circle is also a Shape, the compiler freely
  allows an upcast assignment, without requiring any explicit cast syntax. The
  compiler cannot know, given a Shape, what that Shape actually is—it could be
  exactly a Shape, or it could be a subtype of Shape, such as a Circle, Square,
  Triangle or some other type. At compile time, the compiler only sees a Shape.
  Thus, it won’t allow you to perform a downcast assignment without using an
  explicit cast, to tell it that you have extra information that allows you to
  know that it is a particular type (the compiler will check to see if that
  downcast is reasonable, so it won’t let you downcast to a type that’s not
  actually a subclass).

  There’s a third form of RTTI in Java. This is the keyword instanceof, which
  tells you if an object is an instance of a particular type. It returns a
  boolean so you use it in the form of a question, like this:

          if (x instanceof Dog) {
              ((Dog)x).bark();
          }

  The if statement checks to see if the object x belongs to the class Dog before
  casting x to a Dog. It’s important to use instanceof before a downcast when
  you don’t have other information that tells you the type of the object;
  otherwise, you’ll end up with a ClassCastException.

  Ordinarily, you might be hunting for one type (triangles to turn purple, for
  example), but you can easily tally all of the objects by using instanceof. For
  example, suppose you have a family of classes to describe Pets (and their
  people, a feature which will come in handy in a later example). Each
  Individual in the hierarchy has an id and an optional name. Although the
  classes that follow inherit from Individual, there are some complexities in
  the Individual class, so that code will be shown and explained in the
  Containers in Depth chapter. As you can see, it’s not really necessary to see
  the code for Individual at this point—you only need to know that you can
  create it with or without a name, and that each Individual has a method id( )
  that returns a unique identifier (created by counting each object). There’s
  also a toString( ) method; if you don’t provide a name for an Individual,
  toString( ) only produces the simple type name.


      //: typeinfo/pets/Person.java
      package typeinfo.pets;
      public class Person extends Individual {
          public Person(String name) { super(name); }
      } ///:~
      //: typeinfo/pets/Pet.java
      package typeinfo.pets;
      public class Pet extends Individual {
          public Pet(String name) { super(name); }
          public Pet() { super(); }
      } ///:~
      //: typeinfo/pets/Dog.java
      package typeinfo.pets;
      public class Dog extends Pet {
          public Dog(String name) { super(name); }
          public Dog() { super(); }
      } ///:~
      //: typeinfo/pets/Mutt.java
      package typeinfo.pets;
      public class Mutt extends Dog {
          public Mutt(String name) { super(name); }
          public Mutt() { super(); }
      } ///:~
      //: typeinfo/pets/Pug.java
      package typeinfo.pets;
      public class Pug extends Dog {
          public Pug(String name) { super(name); }
          public Pug() { super(); }
      } ///:~
      //: typeinfo/pets/Cat.java
      package typeinfo.pets;
      public class Cat extends Pet {
          public Cat(String name) { super(name); }
          public Cat() { super(); }
      } ///:~
      //: typeinfo/pets/EgyptianMau.java
      package typeinfo.pets;
      public class EgyptianMau extends Cat {
          public EgyptianMau(String name) { super(name); }
          public EgyptianMau() { super(); }
      } ///:~
      //: typeinfo/pets/Manx.java
      package typeinfo.pets;
      public class Manx extends Cat {
          public Manx(String name) { super(name); }
          public Manx() { super(); }
      } ///:~
      //: typeinfo/pets/Cymric.java
      package typeinfo.pets;
      public class Cymric extends Manx {
          public Cymric(String name) { super(name); }
          public Cymric() { super(); }
      } ///:~
      //: typeinfo/pets/Rodent.java
      package typeinfo.pets;
      public class Rodent extends Pet {
          public Rodent(String name) { super(name); }
          public Rodent() { super(); }
      } ///:~
      //: typeinfo/pets/Rat.java
      package typeinfo.pets;
      public class Rat extends Rodent {
          public Rat(String name) { super(name); }
          public Rat() { super(); }
      } ///:~
      //: typeinfo/pets/Mouse.java
      package typeinfo.pets;
      public class Mouse extends Rodent {
          public Mouse(String name) { super(name); }
          public Mouse() { super(); }
      } ///:~
      //: typeinfo/pets/Hamster.java
      package typeinfo.pets;
      public class Hamster extends Rodent {
          public Hamster(String name) { super(name); }
          public Hamster() { super(); }
      } ///:~


  Next, we need a way to randomly create different types of pets, and for
  convenience, to create arrays and Lists of pets. To allow this tool to evolve
  through several different implementations, we’ll define it as an abstract
  class:


      //: typeinfo/pets/PetCreator.java
      // Creates random sequences of Pets.
      package typeinfo.pets;
      import java.util.*;
      public abstract class PetCreator {
          private Random rand = new Random(47);
          // The List of the different types of Pet to create:
          public abstract List<Class<? extends Pet>> types();

          public Pet randomPet() { // Create one random Pet
              int n = rand.nextInt(types().size());
              try {
                  return types().get(n).newInstance();
              } catch(InstantiationException e) {
                  throw new RuntimeException(e);
              } catch(IllegalAccessException e) {
                  throw new RuntimeException(e);
              }
          }

          public Pet[] createArray(int size) {
              Pet[] result = new Pet[size];
              for(int i = 0; i < size; i++)
                  result[i] = randomPet();
              return result;
          }

          public ArrayList<Pet> arrayList(int size) {
              ArrayList<Pet> result = new ArrayList<Pet>();
              Collections.addAll(result, createArray(size));
              return result;
          }
      } ///:~

   The abstract getTypes( ) method defers to a derived class to get the List of
   Class objects (this is a variation of the Template Method design pattern).
   Notice that the type of class is specified to be "anything derived from Pet,"
   so that newlnstance( ) produces a Pet without requiring a cast. randomPet( )
   randomly indexes into the List and uses the selected Class object to generate
   a new instance of that class with Class.newlnstance( ). The createArray( )
   method uses randomPet( ) to fill an array, and arrayList( ) uses createArray(
   ) in turn.

   [getTypes or types() -> maybe a typo]

   You can get two kinds of exceptions when calling newlnstance( ). You can see
   these handled in the catch clauses following the try block. Again, the names
   of the exceptions are relatively useful explanations of what went wrong
   (IllegalAccessException relates to a violation of the Java security
   mechanism, in this case if the default constructor is private).

   When you derive a subclass of PetCreator, the only thing you need to supply
   is the List of the types of pet that you want to create using randomPet( )
   and the other methods. The getTypes( ) method will normally just return a
   reference to a static List. Here’s an implementation using forName( ):


           //: typeinfo/pets/ForNameCreator.java
           package typeinfo.pets;
           import java.util.*;
           public class ForNameCreator extends PetCreator {
               private static List<Class<? extends Pet>> types =
                   new ArrayList<Class<? extends Pet>>();
               // Types that you want to be randomly created:
               private static String[] typeNames = {
                   "typeinfo.pets.Mutt",
                   "typeinfo.pets.Pug",
                   "typeinfo.pets.EgyptianMau",
                   "typeinfo.pets.Manx",
                   "typeinfo.pets.Cymric",
                   "typeinfo.pets.Rat",
                   "typeinfo.pets.Mouse",
                   "typeinfo.pets.Hamster"
               };
               @SuppressWarnings("unchecked")
                   private static void loader() {
                       try {
                           for(String name : typeNames)
                               types.add(
                                     (Class<? extends Pet>)Class.forName(name));
                       } catch(ClassNotFoundException e) {
                           throw new RuntimeException(e);
                       }
                   }
               static { loader(); }
               public List<Class<? extends Pet>> types() {return types;}
           } ///:~


  The loader( ) method creates the List of Class objects using Class.forName( ).
  This may generate a ClassNotFoundException, which makes sense since you’re
  passing it a String which cannot be validated at compile time. Since the Pet
  objects are in package typeinfo, the package name must be used when referring
  to the classes.

  ***
  In order to produce a typed List of Class objects, a cast is required, which
  produces a compile-time warning. The loader( ) method is defined separately
  and then placed inside a static initialization clause because the
  @SuppressWarnings annotation cannot be placed directly onto the static
  initialization clause. To count Pets, we need a tool that keeps track of the
  quantities of various different types of Pets. A Map is perfect for this; the
  keys are the Pet type names and the values are Integers to hold the Pet
  quantities. This way, you can say, "How many Hamster objects are there?" We
  can use instanceof to count Pets:
  ***


          //: typeinfo/PetCount.java
          // Using instanceof.
          import typeinfo.pets.*;
          import java.util.*;
          import static net.mindview.util.Print.*;
          public class PetCount {
              static class PetCounter extends HashMap<String,Integer> {
                  public void count(String type) {
                      Integer quantity = get(type);
                      if(quantity == null)
                          put(type, 1);
                      else
                          put(type, quantity + 1);
                  }
              }
              public static void
                  countPets(PetCreator creator) {
                      PetCounter counter= new PetCounter();
                      for(Pet pet : creator.createArray(20)) {
                          // List each individual pet:
                          printnb(pet.getClass().getSimpleName() + " ");
                          if(pet instanceof Pet)
                              counter.count("Pet");
                          if(pet instanceof Dog)
                              counter.count("Dog");
                          if(pet instanceof Mutt)
                              counter.count("Mutt");
                          if(pet instanceof Pug)
                              counter.count("Pug");
                          if(pet instanceof Cat)
                              counter.count("Cat");
                          if(pet instanceof Manx)
                              counter.count("EgyptianMau");
                          if(pet instanceof Manx)
                              counter.count("Manx");
                          if(pet instanceof Manx)
                              counter.count("Cymric");
                          if(pet instanceof Rodent)
                              counter.count("Rodent");
                          if(pet instanceof Rat)
                              counter.count("Rat");
                          if(pet instanceof Mouse)
                              counter.count("Mouse");
                          if(pet instanceof Hamster)
                              counter.count("Hamster");
                      }
                      // Show the counts:
                      print();
                      print(counter);
                  }
              public static void main(String[] args) {
                  countPets(new ForNameCreator());
              }
          } /* Output:
               Rat Manx Cymric Mutt Pug Cymric Pug Manx Cymric Rat EgyptianMau Hamster
               EgyptianMau Mutt Mutt Cymric Mouse Pug Mouse Cymric
               {Pug=3, Cat=9, Hamster=1, Cymric=7, Mouse=2, Mutt=3, Rodent=5, Pet=20,
               Manx=7, EgyptianMau=7, Dog=6, Rat=2}
             *///:~

                [ Note that you might be confused as to why the sum of pets is not
                  equal to the number of Pet (20). That's because some species [like
                  Mouse] is a Pet, Rodent and Mouse.]

  In countPets( ), an array is randomly filled with Pets using a PetCreator.
  Then each Pet in the array is tested and counted using instanceof. There’s a
  rather narrow restriction on instanceof: You can compare it to a named type
  only, and not to a Class object. In the preceding example you might feel that
  it’s tedious to write out all of those instanceof expressions, and you’re
  right. But there is no way to cleverly automate instanceof by creating an
  array of Class objects and comparing it to those instead (stay tuned—you’ll
  see an alternative). This isn’t as great a restriction as you might think,
  because you’ll eventually understand that your design is probably flawed if
  you end up writing a lot of instanceof expressions.


- Using class literals

  If we reimplement the PetCreator using class literals, the result is cleaner
  in many ways:

    //: typeinfo/pets/LiteralPetCreator.java
    // Using class literals.
    package typeinfo.pets;
    import java.util.*;
    public class LiteralPetCreator extends PetCreator {
        // No try block needed.
        @SuppressWarnings("unchecked")
            public static final List<Class<? extends Pet>> allTypes =
            Collections.unmodifiableList(Arrays.asList(
                        Pet.class, Dog.class, Cat.class, Rodent.class,
                        Mutt.class, Pug.class, EgyptianMau.class, Manx.class,
                        Cymric.class, Rat.class, Mouse.class,Hamster.class));
        // Types for random creation:
        private static final List<Class<? extends Pet>> types =
            allTypes.subList(allTypes.indexOf(Mutt.class),
                    allTypes.size());
        public List<Class<? extends Pet>> types() {
            return types;
        }
        public static void main(String[] args) {
            System.out.println(types);
        }
    } /* Output:
         [class typeinfo.pets.Mutt, class typeinfo.pets.Pug, class
         typeinfo.pets.EgyptianMau, class typeinfo.pets.Manx, class
         typeinfo.pets.Cymric, class typeinfo.pets.Rat, class
         typeinfo.pets.Mouse, class typeinfo.pets.Hamster]
       *///:~


  In the upcoming PetCount3.java example, we need to pre-load a Map with all the
  Pet types (not just the ones that are to be randomly generated), so the
  allTypes List is necessary. The types list is the portion of allTypes (created
  using List.subList( )) that includes the exact pet types, so it is used for
  random Pet generation.

  ***
  This time, the creation of types does not need to be surrounded by a try block
  since it’s evaluated at compile time and thus won’t throw any exceptions,
  unlike Class.forName( ).
  ***

  We now have two implementations of PetCreator in the typeinfo.pets library. In
  order to provide the second one as a default implementation, we can create a
  Faqade that utilizes LiteralPetCreator:

      //: typeinfo/pets/Pets.java
      // Facade to produce a default PetCreator.
      package typeinfo.pets;
      import java.util.*;
      public class Pets {
          public static final PetCreator creator =
              new LiteralPetCreator();
          public static Pet randomPet() {
              return creator.randomPet();
          }
          public static Pet[] createArray(int size) {
              return creator.createArray(size);
          }
          public static ArrayList<Pet> arrayList(int size) {
              return creator.arrayList(size);
          }
      } ///:~

  This also provides indirection to randomPet( ), createArray( ) and arrayList(
  ).


  Because PetCount.countPets( ) takes a PetCreator argument, we can easily test
  the LiteralPetCreator (via the above Facade):

      //: typeinfo/PetCount2.java
      import typeinfo.pets.*;
      public class PetCount2 {
          public static void main(String[] args) {
              PetCount.countPets(Pets.creator);
          }
      } /* (Execute to see output) *///:~

  The output is the same as that of PetCount.java.



- A dynamic instanceof

  The Class.islnstance( ) method provides a way to dynamically test the type of
  an object.  Thus, all those tedious instanceof statements can be removed from
  PetCount.java:


      //: typeinfo/PetCount3.java
      // Using isInstance()
      import typeinfo.pets.*;
      import java.util.*;
      import net.mindview.util.*;
      import static net.mindview.util.Print.*;
      public class PetCount3 {
          static class PetCounter
              extends LinkedHashMap<Class<? extends Pet>,Integer> {
                  public PetCounter() {
                      super(MapData.map(LiteralPetCreator.allTypes, 0));
                  }
                  public void count(Pet pet) {
                      // Class.isInstance() eliminates instanceofs:
                      for(Map.Entry<Class<? extends Pet>,Integer> pair
                              : entrySet())
                          if(pair.getKey().isInstance(pet))
                              put(pair.getKey(), pair.getValue() + 1);
                  }
                  public String toString() {
                      StringBuilder result = new StringBuilder("{");
                      for(Map.Entry<Class<? extends Pet>,Integer> pair
                              : entrySet()) {
                          result.append(pair.getKey().getSimpleName());
                          result.append("=");
                          result.append(pair.getValue());
                          result.append(", ");
                      }
                      result.delete(result.length()-2, result.length());
                      result.append("}");
                      return result.toString();
                  }
              }
          public static void main(String[] args) {
              PetCounter petCount = new PetCounter();
              for(Pet pet : Pets.createArray(20)) {
                  printnb(pet.getClass().getSimpleName() + " ");
                  petCount.count(pet);
              }
              print();
              print(petCount);
          }
      } /* Output:
           Rat Manx Cymric Mutt Pug Cymric Pug Manx Cymric Rat EgyptianMau Hamster
           EgyptianMau Mutt Mutt Cymric Mouse Pug Mouse Cymric
           {Pet=20, Dog=6, Cat=9, Rodent=5, Mutt=3, Pug=3, EgyptianMau=2, Manx=7,
           Cymric=5, Rat=2, Mouse=2, Hamster=1}
         *///:~

  In order to count all the different types of Pet, the PetCounter Map is
  preloaded with the types from LiteralPetCreator.allTypes. This uses the
  net.mindview.util.MapData class, which takes an Iterable (the allTypes List)
  and a constant value (zero, in this case), and fills the Map with keys taken
  from allTypes and values of zero). Without pre-loading the Map, you would only
  end up counting the types that are randomly generated, and not the base types
  like Pet and Cat.

  You can see that the isInstance( ) method has eliminated the need for the
  instanceof expressions. In addition, this means that you can add new types of
  Pet simply by changing the LiteralPetCreator.types array; the rest of the
  program does not need modification (as it did when using the instanceof
  expressions).


  The toString( ) method has been overloaded for easier-to-read output that
  still matches the typical output that you see when printing a Map.


- Counting recursively

  The Map in PetCount3.PetCounter was pre-loaded with all the different Pet
  classes. Instead of pre-loading the map, we can use Class.isAssignableFrom( )
  and create a general-purpose tool that is not limited to counting Pets:


          //: net/mindview/util/TypeCounter.java
          // Counts instances of a type family.
          package net.mindview.util;
          import java.util.*;
          public class TypeCounter extends HashMap<Class<?>,Integer>{
              private Class<?> baseType;
              public TypeCounter(Class<?> baseType) {
                  this.baseType = baseType;
              }
              public void count(Object obj) {
                  Class<?> type = obj.getClass();
                  if(!baseType.isAssignableFrom(type))
                      throw new RuntimeException(obj + " incorrect type: "
                              + type + ", should be type or subtype of "
                              + baseType);
                  countClass(type);
              }
              private void countClass(Class<?> type) {
                  Integer quantity = get(type);
                  put(type, quantity == null ? 1 : quantity + 1);
                  Class<?> superClass = type.getSuperclass();
                  if(superClass != null &&
                          baseType.isAssignableFrom(superClass))
                      countClass(superClass);
              }
              public String toString() {
                  StringBuilder result = new StringBuilder("{");
                  for(Map.Entry<Class<?>,Integer> pair : entrySet()) {
                      result.append(pair.getKey().getSimpleName());
                      result.append("=");
                      result.append(pair.getValue());
                      result.append(", ");
                  }
                  result.delete(result.length()-2, result.length());
                  result.append("}");
                  return result.toString();
              }
          } ///:~

  The count( ) method gets the Class of its argument, and uses isAssignableFrom(
  ) to perform a runtime check to verify that the object that you’ve passed
  actually belongs to the hierarchy of interest. countClass( ) first counts the
  exact type of the class. Then, if baseType is assignable from the superclass,
  countClass( ) is called recursively on the superclass.

      //: typeinfo/PetCount4.java
      import typeinfo.pets.*;
      import net.mindview.util.*;
      import static net.mindview.util.Print.*;
      public class PetCount4 {
          public static void main(String[] args) {
              TypeCounter counter = new TypeCounter(Pet.class);
              for(Pet pet : Pets.createArray(20)) {
                  printnb(pet.getClass().getSimpleName() + " ");
                  counter.count(pet);
              }
              print();
              print(counter);
          }
      } /* Output: (Sample)
           Rat Manx Cymric Mutt Pug Cymric Pug Manx Cymric Rat EgyptianMau Hamster
           EgyptianMau Mutt Mutt Cymric Mouse Pug Mouse Cymric
           {Mouse=2, Dog=6, Manx=7, EgyptianMau=2, Rodent=5, Pug=3, Mutt=3,
           Cymric=5, Cat=9, Hamster=1, Pet=20, Rat=2}
         *///:~


  As you can see from the output, both base types as well as exact types are counted.


pg435

- Registered Factories

  A problem with generating objects of the Pets hierarchy is the fact that every
  time you add a new type of Pet to the hierarchy you must remember to add it to
  the entries in LiteralPetCreator.java. In a system where you add more classes
  on a regular basis this can become problematic.

  You might think of adding a static initializer to each subclass, so that the
  initializer would add its class to a list somewhere. Unfortunately, static
  initializers are only called when the class is first loaded, so you have a
  chicken-and-egg problem: The generator doesn’t have the class in its list, so
  it can never create an object of that class, so the class won’t get loaded and
  placed in the list.

  Basically, you’re forced to create the list yourself, by hand (unless you want
  to write a tool that searches through and analyzes your source code, then
  creates and compiles the list). So the best you can probably do is to put the
  list in one central, obvious place. The base class for the hierarchy of
  interest is probably the best place.

  The other change we’ll make here is to defer the creation of the object to the
  class itself, using the Factory Method design pattern. A factory method can be
  called polymorphically, and creates an object of the appropriate type for you.
  In this very simple version, the factory method is the create( ) method in the
  Factory interface:


      //: typeinfo/factory/Factory.java
      package typeinfo.factory;
      public interface Factory<T> { T create(); } ///:~


  The generic parameter T allows create( ) to return a different type for each
  implementation of Factory. This also makes use of covariant return types. In
  this example, the base class Part contains a List of factory objects.
  Factories for types that should be produced by the createRandom( ) method are
  "registered" with the base class by adding them to the partFactories List:

      //: typeinfo/RegisteredFactories.java
      // Registering Class Factories in the base class.
      import typeinfo.factory.*;
      import java.util.*;
      class Part {
          public String toString() {
              return getClass().getSimpleName();
          }
          static List<Factory<? extends Part>> partFactories =
              new ArrayList<Factory<? extends Part>>();
          static {
              // Collections.addAll() gives an "unchecked generic
              // array creation ... for varargs parameter" warning.
              partFactories.add(new FuelFilter.Factory());
              partFactories.add(new AirFilter.Factory());
              partFactories.add(new CabinAirFilter.Factory());
              partFactories.add(new OilFilter.Factory());
              partFactories.add(new FanBelt.Factory());
              partFactories.add(new PowerSteeringBelt.Factory());
              partFactories.add(new GeneratorBelt.Factory());
          }
          private static Random rand = new Random(47);
          public static Part createRandom() {
              int n = rand.nextInt(partFactories.size());
              return partFactories.get(n).create();
          }
      }
      class Filter extends Part {}
      class FuelFilter extends Filter {
          // Create a Class Factory for each specific type:
          public static class Factory
              implements typeinfo.factory.Factory<FuelFilter> {
                  public FuelFilter create() { return new FuelFilter(); }
              }
      }
      class AirFilter extends Filter {
          public static class Factory
              implements typeinfo.factory.Factory<AirFilter> {
                  public AirFilter create() { return new AirFilter(); }
              }
      }
      class CabinAirFilter extends Filter {
          public static class Factory
              implements typeinfo.factory.Factory<CabinAirFilter> {
                  public CabinAirFilter create() {
                      return new CabinAirFilter();
                  }
              }
      }
      class OilFilter extends Filter {
          public static class Factory
              implements typeinfo.factory.Factory<OilFilter> {
                  public OilFilter create() { return new OilFilter(); }
              }
      }
      class Belt extends Part {}
      class FanBelt extends Belt {
          public static class Factory
              implements typeinfo.factory.Factory<FanBelt> {
                  public FanBelt create() { return new FanBelt(); }
              }
      }
      class GeneratorBelt extends Belt {
          public static class Factory
              implements typeinfo.factory.Factory<GeneratorBelt> {
                  public GeneratorBelt create() {
                      return new GeneratorBelt();
                  }
              }
      }
      class PowerSteeringBelt extends Belt {
          public static class Factory
              implements typeinfo.factory.Factory<PowerSteeringBelt> {
                  public PowerSteeringBelt create() {
                      return new PowerSteeringBelt();
                  }
              }
      }
      public class RegisteredFactories {
          public static void main(String[] args) {
              for(int i = 0; i < 10; i++)
                  System.out.println(Part.createRandom());
          }
      } /* Output:
           GeneratorBelt
           CabinAirFilter
           GeneratorBelt
           AirFilter
           PowerSteeringBelt
           CabinAirFilter
           FuelFilter
           PowerSteeringBelt
           PowerSteeringBelt
           FuelFilter
         *///:~



  Not all classes in the hierarchy should be instantiated; in this case Filter
  and Belt are just classifiers so you do not create an instance of either one,
  but only of their subclasses. If a class should be created by createRandom( ),
  it contains an inner Factory class. The only way to reuse the name Factory as
  seen above is by qualifying typeinfo.factory.Factory.

  Although you can use Collections.addAll( ) to add the factories to the list,
  the compiler expresses its unhappiness with a warning about a "generic array
  creation" (which is supposed to be impossible, as you’ll see in the Generics
  chapter), so I reverted to calling add( ). The createRandom( ) method randomly
  selects a factory object from partFactories and calls its create( ) to produce
  a new Part.

- instanceof v/s Class equivalence

  When you are querying for type information, there’s an important difference
  between either form of instanceof (that is, instanceof or islnstance( ), which
  produce equivalent results) and the direct comparison of the Class objects.
  Here’s an example that demonstrates the difference:

          //: typeinfo/FamilyVsExactType.java
          // The difference between instanceof and class
          package typeinfo;
          import static net.mindview.util.Print.*;
          class Base {}
          class Derived extends Base {}
          public class FamilyVsExactType {
              static void test(Object x) {
                  print("Testing x of type " + x.getClass());
                  print("x instanceof Base " + (x instanceof Base));
                  print("x instanceof Derived "+ (x instanceof Derived));
                  print("Base.isInstance(x) "+ Base.class.isInstance(x));
                  print("Derived.isInstance(x) " +
                          Derived.class.isInstance(x));
                  print("x.getClass() == Base.class " +
                          (x.getClass() == Base.class));
                  print("x.getClass() == Derived.class " +
                          (x.getClass() == Derived.class));
                  print("x.getClass().equals(Base.class)) "+
                          (x.getClass().equals(Base.class)));
                  print("x.getClass().equals(Derived.class)) " +
                          (x.getClass().equals(Derived.class)));
              }
              public static void main(String[] args) {
                  test(new Base());
                  test(new Derived());
              }
          } /* Output:
               Testing x of type class typeinfo.Base
               x instanceof Base true
               x instanceof Derived false
               Base.isInstance(x) true
               Derived.isInstance(x) false
               x.getClass() == Base.class true
               x.getClass() == Derived.class false
               x.getClass().equals(Base.class)) true
               x.getClass().equals(Derived.class)) false
               Testing x of type class typeinfo.Derived
               x instanceof Base true
               x instanceof Derived true
               Base.isInstance(x) true
               Derived.isInstance(x) true
               x.getClass() == Base.class false
               x.getClass() == Derived.class true
               x.getClass().equals(Base.class)) false
               x.getClass().equals(Derived.class)) true
             *///:~


  The test( ) method performs type checking with its argument using both forms
  of instanceof. It then gets the Class reference and uses == and equals( ) to
  test for equality of the Class objects. Reassuringly, instanceof and
  islnstance( ) produce exactly the same results, as do equals( ) and ==. But
  the tests themselves draw different conclusions. In keeping with the concept
  of type, instanceof says, "Are you this class, or a class derived from this
  class?" On the other hand, if you compare the actual Class objects using ==,
  there is no concern with inheritance—it’s either the exact type or it isn’t.


***** not in book ***

Difference between instanceof and isInstance()
=============================================

First difference: instanceof is a reserved word of Java, but isInstance() is a
method of java.lang.Class.

Other differences: you could use instanceof on types (which are known on compile
time), and isInstance() could only be called on an instance fo java.lang.Class.

 So instanceof work on Types [which are... types] whereas isInstance works on
 objects...]

***********************

- Reflection: runtime class information

  If you don’t know the precise type of an object, RTTI will tell you. However,
  there’s a limitation: The type must be known at compile time in order for you
  to detect it using RTTI and to do something useful with the information. Put
  another way, the compiler must know about all the classes you’re working with.


  This doesn’t seem like that much of a limitation at first, but suppose you’re
  given a reference to an object that’s not in your program space. In fact, the
  class of the object isn’t even available to your program at compile time. For
  example, suppose you get a bunch of bytes from a disk file or from a network
  connection, and you’re told that those bytes represent a class. Since this
  class shows up long after the compiler generates the code for your program,
  how can you possibly use such a class?

  Another compelling motivation for discovering class information at run time is
  to provide the ability to create and execute objects on remote platforms,
  across a network. This is called Remote Method Invocation (RMI), and it allows
  a Java program to have objects distributed across many machines.

  This distribution can happen for a number of reasons. For example, perhaps
  you’re doing a computation-intensive task, and in order to speed things up,
  you want to break it up and put pieces on machines that are idle.  In other
  situations you might want to place code that handles particular types of tasks
  (e.g., "Business Rules" in a multitier client/server architecture) on a
  particular machine, so the machine becomes a common repository describing
  those actions, and it can be easily changed to affect everyone in the system.
  (This is an interesting development, since the machine exists solely to make
  software changes easy!) Along these lines, distributed computing also supports
  specialized hardware that might be good at a particular task—matrix
  inversions, for example—but inappropriate or too expensive for generalpurpose
  programming.

  The class Class supports the concept of reflection, along with the
  java.lang.reflect library which contains the classes Field, Method, and
  Constructor (each of which implements the Member interface). Objects of these
  types are created by the JVM at run time to represent the corresponding member
  in the unknown class.

  You can then use the Constructors to create new objects, the get( ) and set( )
  methods to read and modify the fields associated with Field objects, and the
  invoke( ) method to call a method associated with a Method object. In
  addition, you can call the convenience methods getFields( ), getMethods( ),
  getConstructors( ), etc., to return arrays of the objects representing the
  fields, methods, and constructors. (You can find out more by looking up the
  class Class in the JDK documentation.) Thus, the class information for
  anonymous objects can be completely determined at run time, and nothing need
  be known at compile time.

  It’s important to realize that there’s nothing magic about reflection. When
  you’re using reflection to interact with an object of an unknown type, the JVM
  will simply look at the object and see that it belongs to a particular class
  (just like ordinary RTTI). Before anything can be done with it, the Class
  object must be loaded. Thus, the .class file for that particular type must
  still be available to the JVM, either on the local machine or across the
  network.

  ******************
  So the true difference between RTTI and reflection is that with RTTI, the
  compiler opens and examines the .class file at compile time. Put another way,
  you can call all the methods of an object in the "normal" way. With
  reflection, the .class file is unavailable at compile time; it is opened and
  examined by the runtime environment.
  ******************
  pg 440


- A class method extractor

  Reflection is in the language to support other Java features, such as object
  serialization and JavaBeans (both covered later in the book).  However, there
  are times when it’s quite useful to dynamically extract information about a
  class.

  Consider a class method extractor. Looking at a class definition source code
  or JDK documentation shows only the methods that are defined or overridden
  within that class definition. But there might be dozens more available to you
  that have come from base classes. To locate these is both tedious and time
  consuming. 1 Fortunately, reflection provides a way to write a simple tool
  that will automatically show you the entire interface. Here’s the way it
  works:

      import java.util.regex.*;
      import static net.mindview.util.Print.*;
      public class ShowMethods {
          private static String usage =
              "usage:\n" +
              "ShowMethods qualified.class.name\n" +
              "To show all methods in class or:\n" +
              "ShowMethods qualified.class.name word\n" +
              "To search for methods involving ‘word’";
          private static Pattern p = Pattern.compile("\\w+\\.");

          public static void main(String[] args) {
              if(args.length < 1) {
                  print(usage);
                  System.exit(0);
              }
              int lines = 0;
              try {
                  Class<?> c = Class.forName(args[0]);
                  Method[] methods = c.getMethods();
                  Constructor[] ctors = c.getConstructors();
                  if(args.length == 1) {
                      for(Method method : methods)
                          print(
                                  p.matcher(method.toString()).replaceAll(""));
                      for(Constructor ctor : ctors)
                          print(p.matcher(ctor.toString()).replaceAll(""));
                      lines = methods.length + ctors.length;
                  } else {
                      for(Method method : methods)
                          if(method.toString().indexOf(args[1]) != -1) {
                              print(
                                      p.matcher(method.toString()).replaceAll(""));
                              lines++;
                          }
                      for(Constructor ctor : ctors)
                          if(ctor.toString().indexOf(args[1]) != -1) {
                              print(p.matcher(
                                          ctor.toString()).replaceAll(""));
                              lines++;
                          }
                  }
              } catch(ClassNotFoundException e) {
                  print("No such class: " + e);
              }
          }
      } /* Output:
           public static void main(String[])
           public native int hashCode()
           public final native Class getClass()
           public final void wait(long,int) throws InterruptedException
           public final void wait() throws InterruptedException
           public final native void wait(long) throws InterruptedException
           public boolean equals(Object)
           public String toString()
           public final native void notify()
           public final native void notifyAll()
           public ShowMethods()
         *///:~

  The Class methods getMethods( ) and getConstructors( ) return an array of
  Method and array of Constructor, respectively. Each of these classes has
  further methods to dissect the names, arguments, and return values of the
  methods they represent. But you can also just use toString( ), as is done
  here, to produce a String with the entire method signature. The rest of the
  code extracts the command-line information, determines if a particular
  signature matches your target string (using indexOf( )), and strips off the
  name qualifiers using regular expressions (introduced in the Strings chapter).

  The result produced by Class.forName( ) cannot be known at compile time, and
  therefore all the method signature information is being extracted at run time.
  If you investigate the JDK reflection documentation, you’ll see that there is
  enough support to actually set up and make a method call on an object that’s
  totally unknown at compile time (there will be examples of this later in this
  book).



- Dynamic Proxies

  Proxy is one of the basic design patterns. It is an object that you insert in
  place of the "real" object in order to provide additional or different
  operations—these usually involve communication with a "real" object, so a
  proxy typically acts as a go-between. Here’s a trivial example to show the
  structure of a proxy:


      //: typeinfo/SimpleProxyDemo.java
      import static net.mindview.util.Print.*;
      interface Interface {
          void doSomething();
          void somethingElse(String arg);
      }
      class RealObject implements Interface {
          public void doSomething() { print("doSomething"); }
          public void somethingElse(String arg) {
              print("somethingElse " + arg);
          }
      }

      class SimpleProxy implements Interface {
          private Interface proxied;
          public SimpleProxy(Interface proxied) {
              this.proxied = proxied;
          }
          public void doSomething() {
              print("SimpleProxy doSomething");
              proxied.doSomething();
          }
          public void somethingElse(String arg) {
              print("SimpleProxy somethingElse " + arg);
              proxied.somethingElse(arg);
          }
      }
      class SimpleProxyDemo {
          public static void consumer(Interface iface) {
              iface.doSomething();
              iface.somethingElse("bonobo");
          }
          public static void main(String[] args) {
              consumer(new RealObject());
              consumer(new SimpleProxy(new RealObject()));
          }
      } /* Output:
           doSomething
           somethingElse bonobo
           SimpleProxy doSomething
           doSomething
           SimpleProxy somethingElse bonobo
           somethingElse bonobo

################################################################################
  Because consumer( ) accepts an Interface, it can’t know if it’s getting a
  RealObject or a SimpleProxy, because both implement Interface.
################################################################################

  But the SimpleProxy inserted between the client and the RealObject performs
  operations and then calls the identical method on a RealObject.

  ***
  A proxy can be helpful anytime you’d like to separate extra operations into a
  different place than the "real object," and especially when you want to easily
  change from not using the extra operations to using them, and vice versa (the
  point of design patterns is to encapsulate change—so you need to be changing
  things in order to justify the pattern). For example, what if you wanted to
  track calls to the methods in the RealObject, or to measure the overhead of
  such calls? This is not code you want to have incorporated in your
  application, so a proxy allows you to add and remove it easily.
  ***

  Java’s dynamic proxy takes the idea of a proxy one step further, by both
  creating the proxy object dynamically and handling calls to the proxied
  methods dynamically. All calls made on a dynamic proxy are redirected to a
  single invocation handler, which has the job of discovering what the call is
  and deciding what to do about it. Here’s SimpleProxyDemo.java rewritten to use
  a dynamic proxy:

          //: typeinfo/SimpleDynamicProxy.java
          import java.lang.reflect.*;
          class DynamicProxyHandler implements InvocationHandler {
          private Object proxied;
          public DynamicProxyHandler(Object proxied) {
          this.proxied = proxied;
          }
          public Object
          invoke(Object proxy, Method method, Object[] args)
          throws Throwable {
          System.out.println("**** proxy: " + proxy.getClass() +
          ", method: " + method + ", args: " + args);
          if(args != null)
          for(Object arg : args)
          System.out.println(" " + arg);

          return method.invoke(proxied, args);
          }
          }
          class SimpleDynamicProxy {
          public static void consumer(Interface iface) {
          iface.doSomething();
          iface.somethingElse("bonobo");
          }
          public static void main(String[] args) {
          RealObject real = new RealObject();
          consumer(real);
          // Insert a proxy and call again:
          Interface proxy = (Interface)Proxy.newProxyInstance(
          Interface.class.getClassLoader(),
          new Class[]{ Interface.class },
          new DynamicProxyHandler(real));
          consumer(proxy);
          }
          } /* Output: (95% match)
          doSomething
          somethingElse bonobo
             **** proxy: class $Proxy0, method: public abstract void
             Interface.doSomething(), args: null
             doSomething
             **** proxy: class $Proxy0, method: public abstract void
             Interface.somethingElse(java.lang.String), args:
             [Ljava.lang.Object;@42e816
             bonobo
             somethingElse bonobo
             *///:~

          [ NOTE: Proxy is found in java.lang.reflect ]

    ######################################################################
    Interesting to see that interfaces can call methods without any fancy
    need for Methods objects
    ######################################################################

  You create a dynamic proxy by calling the static method
  Proxy.newProxyInstance( ), which requires a class loader (you can generally
  just hand it a class loader from an object that has already been loaded), a
  list of interfaces (not classes or abstract classes) that you wish the proxy
  to implement, and an implementation of the interface InvocationHandler.

  The dynamic proxy will redirect all calls to the invocation handler, so the
  constructor for the invocation handler is usually given the reference to the
  "real" object so that it can forward requests once it performs its
  intermediary task.

  The invoke( ) method is handed the proxy object, in case you need to
  distinguish where the request came from—but in many cases you won’t care.
  However, be careful when calling methods on the proxy inside invoke( ),
  because calls through the interface are redirected through the proxy.

  In general you will perform the proxied operation and then use Method.invoke(
  ) to forward the request to the proxied object, passing the necessary
  arguments. This may initially seem limiting, as if you can only perform
  generic operations. However, you can filter for certain method calls, while
  passing others through

      // Looking for particular methods in a dynamic proxy.
      import java.lang.reflect.*;
              import static net.mindview.util.Print.*;
              class MethodSelector implements InvocationHandler {
                  private Object proxied;
                  public MethodSelector(Object proxied) {
                      this.proxied = proxied;
                  }
                  public Object
                      invoke(Object proxy, Method method, Object[] args)
                      throws Throwable {
                          if(method.getName().equals("interesting"))
                              print("Proxy detected the interesting method");
                          return method.invoke(proxied, args);
                      }
              }
              interface SomeMethods {
                  void boring1();
                  void boring2();
                  void interesting(String arg);
                  void boring3();
              }
              class Implementation implements SomeMethods     {
                  public void boring1() { print("boring1"); }
                  public void boring2() { print("boring2"); }
                  public void interesting(String arg) {
                      print("interesting " + arg);
                  }
                  public void boring3() { print("boring3"); }
              }

              class SelectingMethods {
                  public static void main(String[] args) {
                      SomeMethods proxy= (SomeMethods)Proxy.newProxyInstance(
                              SomeMethods.class.getClassLoader(),
                              new Class[]{ SomeMethods.class },
                              new MethodSelector(new Implementation()));
                      proxy.boring1();
                      proxy.boring2();
                      proxy.interesting("bonobo");
                      proxy.boring3();
                  }
              } /* Output:
                   boring1
                   boring2
                   Proxy detected the interesting method
                   interesting bonobo
                   boring3
                 *///:~

  Here, we are just looking for method names, but you could also be looking for
  other aspects of the method signature, and you could even search for
  particular argument value

  The dynamic proxy is not a tool that you’ll use every day, but it can solve
  certain types of problems very nicely.


- Null Objects

  When you use the built-in null to indicate the absence of an object, you must
  test a reference for null-ness every time you use it. This can get very
  tedious and produce ponderous code.  The problem is that null has no behavior
  of its own except for producing a NullPointerException if you try to do
  anything with it.

  Sometimes it is useful to introduce the idea of a Null Object that will accept
  messages for the object that it’s "standing in" for, but will return values
  indicating that no "real" object is actually there. This way, you can assume
  that all objects are valid and you don’t have to waste programming time
  checking for null (and reading the resulting code).

  Although it’s fun to imagine a programming language that would automatically
  create Null Objects for you, in practice it doesn’t make sense to use them
  everywhere—sometimes checking for null is fine, and sometimes you can
  reasonably assume that you won’t encounter null, and sometimes even detecting
  aberrations via NullPointerException is acceptable.

  The place where Null Objects seem to be most useful is "closer to the data,"
  with objects that represent entities in the problem space. As a simple
  example, many systems will have a Person class, and there are situations in
  the code where you don’t have an actual person (or you do, but you don’t have
  all the information about that person yet), so traditionally you’d use a null
  reference and test for it. Instead, we can make a Null Object.  But even
  though the Null Object will respond to all messages that the "real" object
  will respond to, you still need a way to test for nullness. The simplest way
  to do this is to create a tagging interface:

      //: net/mindview/util/Null.java
      package net.mindview.util;
      public interface Null {} ///:~

  This allows instanceof to detect the Null Object, and more importantly, does
  not require you to add an isNull( ) method to all your classes (which would
  be, after all, just a different way of performing RTTI—why not use the
  built-in facility instead?).

          //: typeinfo/Person.java
          // A class with a Null Object.
          import net.mindview.util.*;
          class Person {
              public final String first;
              public final String last;
              public final String address;
              // etc.
              public Person(String first, String last, String address){
                  this.first = first;
                  this.last = last;
                  this.address = address;
              }
              public String toString() {
                  return "Person: " + first + " " + last + " " + address;
              }
              public static class NullPerson
                  extends Person implements Null {

                      // note that the constructor is private to make it a
                      // singleton
                      private NullPerson() { super("None", "None", "None"); }
                      public String toString() { return "NullPerson"; }
                  }
              public static final Person NULL = new NullPerson();
          } ///:~

  In general, the Null Object will be a Singleton, so here it is created as a
  static final instance.  This works because Person is immutable—you can only
  set the values in the constructor, and then read those values, but you can’t
  modify them (because Strings themselves are inherently immutable). If you want
  to change a NullPerson, you can only replace it with a new Person object.
  Notice that you have the option of detecting the generic Null or the more
  specific NullPerson using instanceof, but with the Singleton approach you can
  also just use equals( ) or even == to compare to Person.NULL.


  Now suppose you’re back in the high-flying days of Internet startups and
  you’ve been given a big pile of venture funding for your Amazing Idea. You’re
  ready to staff up, but while you’re waiting for positions to be filled, you
  can use Person Null Objects as placeholders for each Position:

          //: typeinfo/Position.java
          class Position {
              private String title;
              private Person person;

              public Position(String jobTitle, Person employee) {
                  title = jobTitle;
                  person = employee;
                  if(person == null)
                      person = Person.NULL;
              }
              public Position(String jobTitle) {
                  title = jobTitle;
                  person = Person.NULL;
              }
              public String getTitle() { return title; }
              public void setTitle(String newTitle) {
                  title = newTitle;
              }
              public Person getPerson() { return person; }
              public void setPerson(Person newPerson) {
                  person = newPerson;
                  if(person == null)
                      person = Person.NULL;
              }
              public String toString() {
                  return "Position: " + title + " " + person;
              }
          } ///:~


  With Position, we don’t need to make a Null Object because the existence of
  Person.NULL implies a null Position (it’s possible that, later, you’ll
  discover the need to add an explicit Null Object for Position, but YAGNI (You
  Aren’t Going to Need It) says to try "the simplest thing that could possibly
  work" for your first draft, and to wait until some aspect of the program
  requires you to add in the extra feature, rather than assuming it’s
  necessary).

  The Staff class can now look for Null Objects when you are filling positions:

          //: typeinfo/Staff.java
          import java.util.*;
          public class Staff extends ArrayList<Position> {
              public void add(String title, Person person) {
                  add(new Position(title, person));
              }
              public void add(String... titles) {
                  for(String title : titles)
                      add(new Position(title));
              }
              public Staff(String... titles) { add(titles); }
              public boolean positionAvailable(String title) {
                  for(Position position : this)
                      if(position.getTitle().equals(title) &&
                              position.getPerson() == Person.NULL)
                          return true;
                  return false;
              }
              public void fillPosition(String title, Person hire) {
                  for(Position position : this)
                      if(position.getTitle().equals(title) &&
                              position.getPerson() == Person.NULL) {
                          position.setPerson(hire);
                          return;
                      }
                  throw new RuntimeException(
                          "Position " + title + " not available");
              }
              public static void main(String[] args) {
                  Staff staff = new Staff("President", "CTO",
                          "Marketing Manager", "Product Manager",
                          "Project Lead", "Software Engineer",
                          "Software Engineer", "Software Engineer",
                          "Software Engineer", "Test Engineer",
                          "Technical Writer");
                  staff.fillPosition("President",
                          new Person("Me", "Last", "The Top, Lonely At"));
                  staff.fillPosition("Project Lead",
                          new Person("Janet", "Planner", "The Burbs"));
                  if(staff.positionAvailable("Software Engineer"))
                      staff.fillPosition("Software Engineer",
                              new Person("Bob", "Coder", "Bright Light City"));
                  System.out.println(staff);
              }
          }

  Notice that you must still test for Null Objects in some places, which is not
  that different from checking for null, but in other places (such as toString(
  ) conversions, in this case), you don’t have to perform extra tests; you can
  just assume that all object references are valid.


  If you are working with interfaces instead of concrete classes, it’s possible
  to use a DynamicProxy to automatically create the Null Objects. Suppose we
  have a Robot interface that defines a name, model, and a List < Operation >
  that describes what the Robot is capable of doing. Operation contains a
  description and a command (it’s a type of Command pattern):


          //: typeinfo/Operation.java
          public interface Operation {
              String description();
              void command();
          } ///:~

  You can access a Robot’s services by calling operations( ):

          //: typeinfo/Robot.java
          import java.util.*;
          import net.mindview.util.*;
          public interface Robot {
              String name();
              String model();
              List<Operation> operations();
              class Test {

                  public static void test(Robot r) {

                      if(r instanceof Null)
                          System.out.println("[Null Robot]");

                      System.out.println("Robot name: " + r.name());
                      System.out.println("Robot model: " + r.model());

                      for(Operation operation : r.operations()) {
                          System.out.println(operation.description());
                          operation.command();
                      }
                  }
              }
          } ///:~

  This also incorporates a nested class to perform tests.  We can now create a
  Robot that removes snow:


          //: typeinfo/SnowRemovalRobot.java
          import java.util.*;
          public class SnowRemovalRobot implements Robot {

              private String name;

              public SnowRemovalRobot(String name) {this.name = name;}
              public String name() { return name; }
              public String model() { return "SnowBot Series 11"; }

              public List<Operation> operations() {
                  return Arrays.asList(
                          new Operation() {
                          public String description() {
                          return name + " can shovel snow";
                          }
                          public void command() {
                          System.out.println(name + " shoveling snow");
                          }
                          },
                          new Operation() {
                          public String description() {
                          return name + " can chip ice";
                          }
                          public void command() {
                          System.out.println(name + " chipping ice");
                          }
                          },
                          new Operation() {
                          public String description() {
                          return name + " can clear the roof";
                          }
                          public void command() {
                              System.out.println(name + " clearing roof");
                          }
                          }
                  );
              }

              public static void main(String[] args) {
                  Robot.Test.test(new SnowRemovalRobot("Slusher"));
              }

          } /* Output:
               Robot name: Slusher
               Robot model: SnowBot Series 11
               Slusher can shovel snow
               Slusher shoveling snow
               Slusher can chip ice
               Slusher chipping ice
               Slusher can clear the roof
               Slusher clearing roof
             *///:~

  There will presumably be many different types of Robot, and we’d like to have
  each Null Object do something special for each Robot type—in this case,
  incorporate information about the exact type of Robot the Null Object is
  standing for. This information will be captured by the dynamic proxy:

          //: typeinfo/NullRobot.java
          // Using a dynamic proxy to create a Null Object.
          import java.lang.reflect.*;
          import java.util.*;
          import net.mindview.util.*;

          class NullRobotProxyHandler implements InvocationHandler {

              private String nullName;
              private Robot proxied = new NRobot();

              NullRobotProxyHandler(Class<? extends Robot> type) {
                  nullName = type.getSimpleName() + " NullRobot";
              }

              private class NRobot implements Null, Robot {

                  public String name() { return nullName; }
                  public String model() { return nullName; }

                  public List<Operation> operations() {
                      return Collections.emptyList();
                  }
              }

              public Object
                  invoke(Object proxy, Method method, Object[] args)
                  throws Throwable {
                      return method.invoke(proxied, args);
                  }
          }

          public class NullRobot {

              public static Robot newNullRobot(Class<? extends Robot> type) {
                  return (Robot)Proxy.newProxyInstance(
                          NullRobot.class.getClassLoader(),
                          new Class[]{ Null.class, Robot.class },
                          new NullRobotProxyHandler(type));
              }

              public static void main(String[] args) {
                  Robot[] bots = {
                      new SnowRemovalRobot("SnowBee"),
                      newNullRobot(SnowRemovalRobot.class)
                  };

                  for(Robot bot : bots)
                      Robot.Test.test(bot);
              }
          } /* Output:
               Robot name: SnowBee
               Robot model: SnowBot Series 11
               SnowBee can shovel snow
               SnowBee shoveling snow
               SnowBee can chip ice
               SnowBee chipping ice
               SnowBee can clear the roof
               SnowBee clearing roof
               [Null Robot]
               Robot name: SnowRemovalRobot NullRobot
               Robot model: SnowRemovalRobot NullRobot
             *///:~

  Whenever you need a null Robot object, you just call newNullRobot( ), passing
  the type of Robot you want a proxy for. The proxy fulfills the requirements of
  the Robot and Null interfaces, and provides the specific name of the type that
  it proxies.

- Mock Objects & Stubs

  Logical variations of the Null Object are the MocA: Object and the Stub. Like
  Null Object, both of these are stand-ins for the "real" object that will be
  used in the finished program.  However, both Mock Object and Stub pretend to
  be live objects that deliver real information, rather than being a more
  intelligent placeholder for null, as Null Object is.

  The distinction between Mock Object and Stub is one of degree. Mock Objects
  tend to be lightweight and self-testing, and usually many of them are created
  to handle various testing situations. Stubs just return stubbed data, are
  typically heavyweight and are often reused between tests. Stubs can be
  configured to change depending on how they are called. So a Stub is a
  sophisticated object that does lots of things, whereas you usually create lots
  of small, simple Mock Objects if you need to do many things.

- Interfaces and type information

  An important goal of the interface keyword is to allow the programmer to
  isolate components, and thus reduce coupling. If you write to interfaces, you
  accomplish this, but with type information it’s possible to get around that—
  interfaces are not airtight guarantees of decoupling. Here’s an example,
  starting with an interface:

          //: typeinfo/interfacea/A.java
          package typeinfo.interfacea;
          public interface A {
              void f();
          } ///:~

  This interface is then implemented, and you can see how to sneak around to the
  actual implementation type:

      //: typeinfo/InterfaceViolation.java
      // Sneaking around an interface.
      import typeinfo.interfacea.*;

      class B implements A {
          public void f() {}
          public void g() {}
      }

      public class InterfaceViolation {
          public static void main(String[] args) {
              A a = new B();
              a.f();
              // a.g(); // Compile error
              System.out.println(a.getClass().getName());
              if(a instanceof B) {
                  B b = (B)a;
                  b.g();
              }
          }
      } /* Output:
           B
         *///:~


  Using RTTI, we discover that a has been implemented as a B. By casting to B,
  we can call a method that’s not in A.


  ***
  This is perfectly legal and acceptable, but you may not want client
  programmers to do this, because it gives them an opportunity to couple more
  closely to your code than you’d like.  That is, you may think that the
  interface keyword is protecting you, but it isn’t, and the fact that you’re
  using B to implement A in this case is effectively a matter of public record.
  ***

  One solution is to simply say that programmers are on their own if they decide
  to use the actual class rather than the interface. This is probably reasonable
  in many cases, but if "probably" isn’t enough, you might want to apply more
  stringent controls.

  The easiest approach is to use package access for the implementation, so that
  clients outside the package may not see it:


          //: typeinfo/packageaccess/HiddenC.java
          package typeinfo.packageaccess;
          import typeinfo.interfacea.*;
          import static net.mindview.util.Print.*;

          class C implements A {
              public void f() { print("public C.f()"); }
              public void g() { print("public C.g()"); }
              void u() { print("package C.u()"); }
              protected void v() { print("protected C.v()"); }
              private void w() { print("private C.w()"); }
          }

          public class HiddenC {
              public static A makeA() { return new C(); }
          } ///:~

  The only public part of this package, HiddenC, produces an A interface when
  you call it.  What’s interesting about this is that even if you were to return
  a C from makeA( ), you still couldn’t use anything but an A from outside the
  package, since you cannot name C outside the package.

  ***
  Now if you try to downcast to C, you can’t do it because there is no ‘C type
  available outside the package:
  ***

      //: typeinfo/HiddenImplementation.java
      // Sneaking around package access.
      import typeinfo.interfacea.*;
      import typeinfo.packageaccess.*;
      import java.lang.reflect.*;

      public class HiddenImplementation {

          public static void main(String[] args) throws Exception {
              A a = HiddenC.makeA();

              a.f();

              System.out.println(a.getClass().getName());

              // Compile error: cannot find symbol ‘C’:
              /* if(a instanceof C) {
                 C c = (C)a;
                 c.g();
                 } */
              // Oops! Reflection still allows us to call g():
              callHiddenMethod(a, "g");

              // And even methods
              // that are less accessible!
              callHiddenMethod(a, "u");
              callHiddenMethod(a, "v");
              callHiddenMethod(a, "w");
          }

          static void callHiddenMethod(Object a, String methodName)
              throws Exception {
                  Method g = a.getClass().getDeclaredMethod(methodName);
                  g.setAccessible(true);
                  g.invoke(a);
              }

      } /* Output:
           public C.f()
           typeinfo.packageaccess.C
           public C.g()
           package C.u()
           protected C.v()
           private C.w()
         *///:~

  ***
  As you can see, it’s still possible to reach in and call all of the methods
  using reflection, even private methods! If you know the name of the method,
  you can call setAccessible(true) on the Method object to make it callable, as
  seen in callHiddenMethod( ).

  You may think that you can prevent this by only distributing compiled code,
  but that’s no solution. All you must do is run javap, which is the decompiler
  that comes with the JDK.  Here’s the command line:

                javap -private C


  The -private flag indicates that all members should be displayed, even private
  ones. Here’s the output:

          class typeinfo.packageaccess.C extends
          java.lang.Object implements typeinfo.interfacea.A {
              typeinfo.packageaccess.C();
              public void f( );
              public void g( );
              void u( );
              protected void v( );
              private void w();
          }

  So anyone can get the names and signatures of your most private methods, and
  call them.  What if you implement the interface as a private inner class?
  Here’s what it looks like:

      //: typeinfo/InnerImplementation.java
      // Private inner classes can’t hide from reflection.
      import typeinfo.interfacea.*;
      import static net.mindview.util.Print.*;
      class InnerA {

          private static class C implements A {
              public void f() { print("public C.f()"); }
              public void g() { print("public C.g()"); }
              void u() { print("package C.u()"); }
              protected void v() { print("protected C.v()"); }
              private void w() { print("private C.w()"); }
          }

          public static A makeA() { return new C(); }
      }

      public class InnerImplementation {

          public static void main(String[] args) throws Exception {

              A a = InnerA.makeA();
              a.f();
              System.out.println(a.getClass().getName());
              // Reflection still gets into the private class:
              HiddenImplementation.callHiddenMethod(a, "g");
              HiddenImplementation.callHiddenMethod(a, "u");
              HiddenImplementation.callHiddenMethod(a, "v");
              HiddenImplementation.callHiddenMethod(a, "w");
          }
      } /* Output:
           public C.f()
           InnerA$C
           public C.g()
           package C.u()
           protected C.v()
           private C.w()
         *///:~

  That didn’t hide anything from reflection. What about an anonymous class?


          //: typeinfo/AnonymousImplementation.java
          // Anonymous inner classes can’t hide from reflection.
          import typeinfo.interfacea.*;
          import static net.mindview.util.Print.*;
          class AnonymousA {
              public static A makeA() {
                  return new A() {
                      public void f() { print("public C.f()"); }
                      public void g() { print("public C.g()"); }
                      void u() { print("package C.u()"); }
                      protected void v() { print("protected C.v()"); }
                      private void w() { print("private C.w()"); }
                  };
              }
          }
          public class AnonymousImplementation {
              public static void main(String[] args) throws Exception {
                  A a = AnonymousA.makeA();
                  a.f();
                  System.out.println(a.getClass().getName());
                  // Reflection still gets into the anonymous class:
                  HiddenImplementation.callHiddenMethod(a, "g");
                  HiddenImplementation.callHiddenMethod(a, "u");
                  HiddenImplementation.callHiddenMethod(a, "v");
                  HiddenImplementation.callHiddenMethod(a, "w");
              }
          } /* Output:
               public C.f()
               AnonymousA$1
               public C.g()
               package C.u()
               protected C.v()
               private C.w()
             *///:~

  There doesn’t seem to be any way to prevent reflection from reaching in and
  calling methods that have non-public access. This is also true for fields,
  even private fields:


          //: typeinfo/ModifyingPrivateFields.java
          import java.lang.reflect.*;
          class WithPrivateFinalField {
              private int i = 1;
              private final String s = "I’m totally safe";
              private String s2 = "Am I safe?";
              public String toString() {
                  return "i = " + i + ", " + s + ", " + s2;
              }
          }
          public class ModifyingPrivateFields {
              public static void main(String[] args) throws Exception {
                  WithPrivateFinalField pf = new WithPrivateFinalField();
                  System.out.println(pf);
                  Field f = pf.getClass().getDeclaredField("i");
                  f.setAccessible(true);
                  System.out.println("f.getInt(pf): " + f.getInt(pf));
                  f.setInt(pf, 47);
                  System.out.println(pf);
                  f = pf.getClass().getDeclaredField("s");
                  f.setAccessible(true);
                  System.out.println("f.get(pf): " + f.get(pf));
                  f.set(pf, "No, you’re not!");
                  System.out.println(pf);
                  f = pf.getClass().getDeclaredField("s2");
                  f.setAccessible(true);
                  System.out.println("f.get(pf): " + f.get(pf));
                  f.set(pf, "No, you’re not!");
                  System.out.println(pf);
              }
          } /* Output:
               i = 1, I’m totally safe, Am I safe?
               f.getInt(pf): 1
               i = 47, I’m totally safe, Am I safe?
               f.get(pf): I’m totally safe
               i = 47, I’m totally safe, Am I safe?
               f.get(pf): Am I safe?
               i = 47, I’m totally safe, No, you’re not!
             *///:~


  However, final fields are actually safe from change. The runtime system
  accepts any attempts at change without complaint, but nothing actually
  happens.


  In general, all these access violations are not the worst thing in the world.
  If someone uses such a technique to call methods that you marked with private
  or package access (thus clearly indicating they should not call them), then
  it’s difficult for them to complain if you change some aspect of those
  methods. On the other hand, the fact that you always have a back door into a
  class may allow you to solve certain types of problems that could otherwise be
  difficult or impossible, and the benefits of reflection in general are
  undeniable.


  [ The most famous case of this is the Windows operating system, which had a
  published API that you were supposed to write to, and an unpublished but
  visible set of functions that you could discover and call. To solve problems,
  programmers used the hidden API functions, which forced Microsoft to maintain
  them as if they were part of the public API. This became a source of great
  cost and effort for the company. ]

* Generics

  Ordinary classes and methods work with specific types: either
  primitives or class types. If you are writing code that might be used
  across more types, this rigidity can be overconstraining.

  One way that object-oriented languages allow generalization is through
  polymorphism. You can write (for example) a method that takes a base class
  object as an argument, and then use that method with any class derived from
  that base class. Now your method is a little more general and can be used in
  more places. The same is true within classes—anyplace you use a specific type,
  a base type provides more flexibility. Of course, anything but a final class
  can be extended, so this flexibility is automatic much of the time.

  Sometimes even an interface is too restrictive. An interface still requires
  that your code work with that particular interface. You could write even more
  general code if you could say that your code works with "some unspecified
  type," rather than a specific interface or class.

  This is the concept of generics, one of the more significant changes in Java
  SE5. Generics implement the concept of parameterized types, which allow
  multiple types. The term "generic" means "pertaining or appropriate to large
  groups of classes." The original intent of generics in programming languages
  was to allow the programmer the greatest amount of expressiveness possible
  when writing classes or methods, by loosening the constraints on the types
  that those classes or methods work with. As you will see in this chapter, the
  Java implementation of generics is not that broad reaching—indeed, you may
  question whether the term "generic" is even appropriate for this feature.


- Comparison with C++

  Generics require more comparison with C++ for two reasons. First,
  understanding certain aspects of C++ templates (the main inspiration for
  generics, including the basic syntax) will help you understand the foundations
  of the concept, as well as—and this is very important— the limitations of what
  you can do with Java generics and why. The ultimate goal is to give you a
  clear understanding of where the boundaries lie, because my experience is that
  by understanding the boundaries, you become a more powerful programmer. By
  knowing what you can’t do, you can make better use of what you can do (partly
  because you don’t waste time bumping up against walls).

  The second reason is that there is significant misunderstanding in the Java
  community about C++ templates, and this misunderstanding may further confuse
  you about the intent of generics.


- Simple Generics

  One of the most compelling initial motivations for generics is to create
  container classes, which you saw in the Holding Your Objects chapter (you’ll
  learn more about these in the Containers in Depth chapter). A container is a
  place to hold objects while you’re working with them. Although this is also
  true of arrays, containers tend to be more flexible and have different
  characteristics than simple arrays. Virtually all programs require that you
  hold a group of objects while you use them, so containers are one of the most
  reusable of class libraries.

  Let’s look at a class that holds a single object. Of course, the class could
  specify the exact type of the object, like this:


          //: generics/Holder1.java
          class Automobile {}
          public class Holder1 {
              private Automobile a;
              public Holder1(Automobile a) { this.a = a; }
              Automobile get() { return a; }
          } ///:~

  But this is not a very reusable tool, since it can’t be used to hold anything
  else. We would prefer not to write a new one of these for every type we
  encounter.

  Before Java SE5, we would simply make it hold an Object:

          //: generics/Holder2.java
          public class Holder2 {
              private Object a;
              public Holder2(Object a) { this.a = a; }
              public void set(Object a) { this.a = a; }
              public Object get() { return a; }
              public static void main(String[] args) {
                  Holder2 h2 = new Holder2(new Automobile());
                  Automobile a = (Automobile)h2.get();
                  h2.set("Not an Automobile");
                  String s = (String)h2.get();
                  h2.set(1); // Autoboxes to Integer
                  Integer x = (Integer)h2.get();
              }
          } ///:~

  Now a Holder2 can hold anything—and in this example, a single Holder2 holds
  three different types of objects.

  ***
  There are some cases where you want a container to hold multiple types of
  objects, but typically you only put one type of object into a container. One
  of the primary motivations for generics is to specify what type of object a
  container holds, and to have that specification backed up by the compiler.
  ***

  So instead of Object, we’d like to use an unspecified type, which can be
  decided at a later time. To do this, you put a type parameter inside angle
  brackets after the class name, and then substitute an actual type when you use
  the class. For the "holder" class, it looks like this, where T is the type
  parameter:

          public class Holder3<T> {
              private T a;
              public Holder3(T a) { this.a = a; }
              public void set(T a) { this.a = a; }
              public T get() { return a; }
              public static void main(String[] args) {
                  Holder3<Automobile> h3 =
                      new Holder3<Automobile>(new Automobile());
                  Automobile a = h3.get(); // No cast needed
                  // h3.set("Not an Automobile"); // Error
                  // h3.set(1); // Error
              }
          } ///:~

  Now when you create a Holders, you must specify what type you want to put into
  it using the same angle-bracket syntax, as you can see in main( ). You are
  only allowed to put objects of that type (or a subtype, since the substitution
  principle still works with generics) into the holder. And when you get a value
  out, it is automatically the right type.

  That’s the core idea of Java generics: You tell it what type you want to use,
  and it takes care of the details.

  In general, you can treat generics as if they are any other type—they just
  happen to have type parameters. But as you’ll see, you can use generics just
  by naming them along with their type argument list.

pg 464 A tuple library

- A tuple library

  One of the things you often want to do is return multiple objects from a
  method call. The return statement only allows you to specify a single object,
  so the answer is to create an object that holds the multiple objects that you
  want to return.

  Of course, you can write a special class every time you encounter the
  situation, but with generics it’s possible to solve the problem once and save
  yourself the effort in the future. At the same time, you are ensuring
  compile-time type safety.

  This concept is called a tuple, and it is simply a group of objects wrapped
  together into a single object. The recipient of the object is allowed to read
  the elements but not put new ones in. (This concept is also called a Data
  Transfer Object (or Messenger.)

  Tuples can typically be any length, but each object in the tuple can be of a
  different type.  However, we want to specify the type of each object and
  ensure that when the recipient reads the value, they get the right type. To
  deal with the problem of multiple lengths, we create multiple different
  tuples. Here’s one that holds two objects:

      //: net/mindview/util/TwoTuple.java
      package net.mindview.util;
      public class TwoTuple<A,B> {
        public final A first;
        public final B second;
        public TwoTuple(A a, B b) { first = a; second = b; }
        public String toString() {
            return "(" + first + ", " + second + ")";
        }
      } ///:~

  The constructor captures the object to be stored, and toString( ) is a
  convenience function to display the values in a list. Note that a tuple
  implicitly keeps its elements in order.

  Upon first reading, you may think that this could violate common safety
  principles of Java programming. Shouldn’t first and second be private, and
  only accessed with methods named getFirst( ) and getSecond( )? Consider the
  safety that you would get in that case: Clients could still read the objects
  and do whatever they want with them, but they could not assign first or second
  to anything else. The final declaration buys you the same safety, but the
  above form is shorter and simpler.

  Another design observation is that you might want to allow a client programmer
  to point first or second to another object. However, it’s safer to leave it in
  the above form, and just force the user to create a new TwoTuple if they want
  one that has different elements.

  The longer-length tuples can be created with inheritance. You can see that
  adding more type parameters is a simple matter:

          //: net/mindview/util/ThreeTuple.java
          package net.mindview.util;
          public class ThreeTuple<A,B,C> extends TwoTuple<A,B> {
              public final C third;
              public ThreeTuple(A a, B b, C c) {
                  super(a, b);
                  third = c;
              }
              public String toString() {
                  return "(" + first + ", " + second + ", " + third +")";
              } ///:~
              //: net/mindview/util/FourTuple.java
              package net.mindview.util;
              public class FourTuple<A,B,C,D> extends ThreeTuple<A,B,C> {
                  public final D fourth;
                  public FourTuple(A a, B b, C c, D d) {
                      super(a, b, c);
                      fourth = d;
                  }
                  public String toString() {
                      return "(" + first + ", " + second + ", " +
                          third + ", " + fourth + ")";
                  }
              } ///:~
          }

  To use a tuple, you simply define the appropriate-length tuple as the return
  value for your function, and then create and return it in your return
  statement:

          static ThreeTuple<Amphibian,String,Integer> g() {
              return new ThreeTuple<Amphibian, String, Integer>(
                      new Amphibian(), "hi", 47);
          }

  Because of generics, you can easily create any tuple to return any group of
  types, just by writing the expression.

  You can see how the final specification on the public fields prevents them
  from being reassigned after construction, in the failure of the statement
  ttsi.first = "there".

  The new expressions are a little verbose. Later in this chapter you’ll see how
  to simplify them using generic methods.

- A stack class

  Let’s look at something slightly more complicated: the traditional pushdown
  stack. In the Holding Your Objects chapter, you saw this implemented using a
  LinkedList as the net.mindview.util.Stack class (page 412). In that example,
  you can see that a LinkedList already has the necessary methods to create a
  stack. The Stack was constructed by composing one generic class (Stack<T>)
  with another generic class (LinkedList<T>). In that example, notice that (with
  a few exceptions that we shall look at later) a generic type is just another
  type.

  Instead of using LinkedList, we can implement our own internal linked storage
  mechanism.

          //: generics/LinkedStack.java
          // A stack implemented with an internal linked structure.
          public class LinkedStack<T> {
              private static class Node<U> {
                  U item;
                  Node<U> next;
                  Node() { item = null; next = null; }
                  Node(U item, Node<U> next) {
                      this.item = item;
                      this.next = next;
                  }
                  boolean end() { return item == null && next == null; }
              }
              private Node<T> top = new Node<T>(); // End sentinel
              public void push(T item) {
                  top = new Node<T>(item, top);
              }
              public T pop() {
                  T result = top.item;
                  if(!top.end())
                      top = top.next;
                  return result;
              }
              public static void main(String[] args) {
                  LinkedStack<String> lss = new LinkedStack<String>();
                  for(String s : "Phasers on stun!".split(" "))
                      lss.push(s);
                  String s;
                  while((s = lss.pop()) != null)
                      System.out.println(s);
              }
          } /* Output:
               stun!
               on
               Phasers
             *///:~


  The inner class Node is also a generic, and has its own type parameter.

  This example makes use of an end sentinel to determine when the stack is
  empty. The end sentinel is created when the LinkedStack is constructed, and
  each time you call push( ) a new Node<T> is created and linked to the previous
  Node<T>. When you call pop( ), you always return the top.item, and then you
  discard the current Node<T> and move to the next one— except when you hit the
  end sentinel, in which case you don’t move. That way, if the client keeps
  calling pop( ), they keep getting null back to indicate that the stack is
  empty.

- RandomList

  For another example of a holder, suppose you’d like a special type of list
  that randomly selects one of its elements each time you call select( ). When
  doing this you want to build a tool that works with all objects, so you use
  generics:


          //: generics/RandomList.java
          import java.util.*;
          public class RandomList<T> {
              private ArrayList<T> storage = new ArrayList<T>();
              private Random rand = new Random(47);
              public void add(T item) { storage.add(item); }
              public T select() {
                  return storage.get(rand.nextInt(storage.size()));
              }
              public static void main(String[] args) {
                  RandomList<String> rs = new RandomList<String>();
                  for(String s: ("The quick brown fox jumped over " +
                              "the lazy brown dog").split(" "))
                      rs.add(s);
                  for(int i = 0; i < 11; i++)
                      System.out.print(rs.select() + " ");
              }
          } /* Output:
               brown over fox quick quick dog brown The brown lazy brown
             *///:~


- Generic Interfaces

  Generics also work with interfaces. For example, a generator is a class that
  creates objects.

  It’s actually a specialization of the Factory Method design pattern, but when
  you ask a generator for new object, you don’t pass it any arguments, whereas
  you typically do pass arguments to a Factory Method. The generator knows how
  to create new objects without any extra information.

  Typically, a generator just defines one method, the method that produces new
  objects. Here, we’ll call it next( ), and include it in the standard
  utilities:


      //: net/mindview/util/Generator.java
      // A generic interface.
      package net.mindview.util;
      public interface Generator<T> { T next(); } ///:~

  The return type of next( ) is parameterized to T. As you can see, using
  generics with interfaces is no different than using generics with classes.

  To demonstrate the implementation of a Generator, we’ll need some classes.
  Here’s a coffee hierarchy:

          //: generics/coffee/Coffee.java
          package generics.coffee;
          public class Coffee {
              private static long counter = 0;
              private final long id = counter++;
              public String toString() {
                  return getClass().getSimpleName() + " " + id;
              }
          } ///:~
          //: generics/coffee/Latte.java
          package generics.coffee;
          public class Latte extends Coffee {} ///:~
          //: generics/coffee/Mocha.java
          package generics.coffee;
          public class Mocha extends Coffee {} ///:~
          //: generics/coffee/Cappuccino.java
          package generics.coffee;
          public class Cappuccino extends Coffee {} ///:~
          //: generics/coffee/Americano.java
          package generics.coffee;
          public class Americano extends Coffee {} ///:~
          //: generics/coffee/Breve.java
          package generics.coffee;
          public class Breve extends Coffee {} ///:~

  Now we can implement a Generator < Coffee > that produces random different
  types of Coffee objects:

      //: generics/coffee/CoffeeGenerator.java
      // Generate different types of Coffee:
      package generics.coffee;
      import java.util.*;
      import net.mindview.util.*;
      public class CoffeeGenerator
          implements Generator<Coffee>, Iterable<Coffee> {
              private Class[] types = { Latte.class, Mocha.class,
                  Cappuccino.class, Americano.class, Breve.class, };
              private static Random rand = new Random(47);
              public CoffeeGenerator() {}
              // For iteration:
              private int size = 0;
              public CoffeeGenerator(int sz) { size = sz; }
              public Coffee next() {
                  try {
                      return (Coffee)
                          types[rand.nextInt(types.length)].newInstance();
                      // Report programmer errors at run time:
                  } catch(Exception e) {
                      throw new RuntimeException(e);
                  }
              }
              class CoffeeIterator implements Iterator<Coffee> {
                  int count = size;
                  public boolean hasNext() { return count > 0; }
                  public Coffee next() {
                      count--;
                      return CoffeeGenerator.this.next();
                  }
                  public void remove() { // Not implemented
                      throw new UnsupportedOperationException();
                  }
              };
              public Iterator<Coffee> iterator() {
                  return new CoffeeIterator();
              }
              public static void main(String[] args) {
                  CoffeeGenerator gen = new CoffeeGenerator();
                  for(int i = 0; i < 5; i++)
                      System.out.println(gen.next());
                  for(Coffee c : new CoffeeGenerator(5))
                      System.out.println(c);
              }
          } /* Output:
               Americano 0
               Latte 1
               Americano 2
               Mocha 3
               Mocha 4
               Breve 5
               Americano 6
               Latte 7
               Cappuccino 8
               Cappuccino 9
             *///:~

  The parameterized Generator interface ensures that next( ) returns the
  parameter type.  CoffeeGenerator also implements the Iterable interface, so it
  can be used in a foreach statement. However, it requires an "end sentinel" to
  know when to stop, and this is produced using the second constructor.

  Here’s a second implementation of Generator<T>, this time to produce Fibonacci
  numbers:

          //: generics/Fibonacci.java
          // Generate a Fibonacci sequence.
          import net.mindview.util.*;
          public class Fibonacci implements Generator<Integer> {
              private int count = 0;
              public Integer next() { return fib(count++); }
              private int fib(int n) {
                  if(n < 2) return 1;
                  return fib(n-2) + fib(n-1);
              }
              public static void main(String[] args) {
                  Fibonacci gen = new Fibonacci();
                  for(int i = 0; i < 18; i++)
                      System.out.print(gen.next() + " ");
              }
          } /* Output:
               1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584
             *///:~

  *****************************************************************************
  Although we are working with ints both inside and outside the class, the type
  parameter is Integer. This brings up one of the limitations of Java generics:
  You cannot use primitives as type parameters. However, Java SE5 conveniently
  added autoboxing and autounboxing to convert from primitive types to wrapper
  types and back. You can see the effect here because ints are seamlessly used
  and produced by the class.
  ****************************************************************************

  We can go one step further and make an Iterable Fibonacci generator. One
  option is to reimplement the class and add the Iterable interface, but you
  don’t always have control of the original code, and you don’t want to rewrite
  when you don’t have to. Instead, we can create an adapter to produce the
  desired interface—this design pattern was introduced earlier in the book.

  Adapters can be implemented in multiple ways. For example, you could use
  inheritance to generate the adapted class:

          //: generics/IterableFibonacci.java
          // Adapt the Fibonacci class to make it Iterable.
          import java.util.*;
          public class IterableFibonacci
              extends Fibonacci implements Iterable<Integer> {
                  private int n;
                  public IterableFibonacci(int count) { n = count; }
                  public Iterator<Integer> iterator() {
                      return new Iterator<Integer>() {
                          public boolean hasNext() { return n > 0; }
                          public Integer next() {
                              n--;
                              return IterableFibonacci.this.next();
                          }
                          public void remove() { // Not implemented
                              throw new UnsupportedOperationException();
                          }
                      };
                  }
                  public static void main(String[] args) {
                      for(int i : new IterableFibonacci(18))
                          System.out.print(i + " ");
                  }
              } /* Output:
                   1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584
                 *///:~

  To use IterableFibonacci in a foreach statement, you give the constructor a
  boundary so that hasNext( ) can know when to return false.


- Generic Methods

  So far we’ve looked at parameterizing entire classes. You can also
  parameterize methods within a class. The class itself may or may not be
  generic—this is independent of whether you have a generic method.

  A generic method allows the method to vary independently of the class. As a
  guideline, you should use generic methods "whenever you can." That is, if it’s
  possible to make a method generic rather than the entire class, it’s probably
  going to be clearer to do so. In addition, if a method is static, it has no
  access to the generic type parameters of the class, so if it needs to use
  genericity it must be a generic method.

  To define a generic method, you simply place a generic parameter list before
  the return value, like this:

          //: generics/GenericMethods.java
          public class GenericMethods {
              public <T> void f(T x) {
                  System.out.println(x.getClass().getName());
              }
              public static void main(String[] args) {
                  GenericMethods gm = new GenericMethods();
                  gm.f("");
                  gm.f(1);
                  gm.f(1.0);
                  gm.f(1.0F);
                  gm.f(‘c’);
                  gm.f(gm);
              }
          } /* Output:
               java.lang.String
               java.lang.Integer
               java.lang.Double
               java.lang.Float
               java.lang.Character
               GenericMethods
             *///:~

  The class GenericMethods is not parameterized, although both a class and its
  methods may be parameterized at the same time. But in this case, only the
  method f( ) has a type parameter, indicated by the parameter list before the
  method’s return type.

  Notice that with a generic class, you must specify the type parameters when
  you instantiate the class.

  ##############################################################################
  *** But with a generic method, you don’t usually have to specify the parameter
  types, because the compiler can figure that out for you. ***
  ##############################################################################

  This is called type argument inference. So calls to f( ) look like normal
  method calls, and it appears that f( ) has been infinitely overloaded. It will
  even take an argument of the type GenericMethods.

  For the calls to f( ) that use primitive types, autoboxing comes into play,
  automatically wrapping the primitive types in their associated objects. In
  fact, generic methods and autoboxing can eliminate some code that previously
  required hand conversion.

  [ Useful as for Arrays.asList(...) or Arrays.<type>asList(...), the latter to
  tell the method what the type should be ]

- Leveraging type argument inference

  One of the complaints about generics is that it adds even more text to your
  code. Consider holding/MapOfList.java from the Holding Your Objects chapter.
  The creation of the Map of List looks like this:


      Map<Person, List<? extends Pet>> petPeople =
      new HashMap<Person, List<? extends Pet>>();

  (This use of extends and the question marks will be explained later in this
  chapter.) It appears that you are repeating yourself, and that the compiler
  should figure out one of the generic argument lists from the other. Alas, it
  cannot, but type argument inference in a generic method can produce some
  simplification. For example, we can create a utility containing various static
  methods, which produces the most commonly used implementations of the various
  containers:

      //: net/mindview/util/New.java
      // Utilities to simplify generic container creation
      // by using type argument inference.
      package net.mindview.util;
      import java.util.*;
      public class New {
          public static <K,V> Map<K,V> map() {
              return new HashMap<K,V>();
          }
          public static <T> List<T> list() {
              return new ArrayList<T>();
          }
          public static <T> LinkedList<T> lList() {
              return new LinkedList<T>();
          }
          public static <T> Set<T> set() {
              return new HashSet<T>();
          }
          public static <T> Queue<T> queue() {
              return new LinkedList<T>();
          }
          // Examples:
          public static void main(String[] args) {
              Map<String, List<String>> sls = New.map();
              List<String> ls = New.list();
              LinkedList<String> lls = New.lList();
              Set<String> ss = New.set();
              Queue<String> qs = New.queue();
          }
      } ///:~

 [SMART!]

 In main( ) you can see examples of how this is used—type argument inference
 eliminates the need to repeat the generic parameter list. This can be applied
 to holding/MapOfList.java:

         //: generics/SimplerPets.java
         import typeinfo.pets.*;
         import java.util.*;
         import net.mindview.util.*;
         public class SimplerPets {
             public static void main(String[] args) {
                 Map<Person, List<? extends Pet>> petPeople = New.map();
                 // Rest of the code is the same...
             }
         } ///:~

  Although this is an interesting example of type argument inference, it’s
  difficult to say how much it actually buys you. The person reading the code is
  required to parse and understand this additional library and its implications,
  so it might be just as productive to leave the original (admittedly
  repetitious) definition in place—ironically, for simplicity. However, if the
  standard Java library were to add something like the New.java utility above,
  it would make sense to use it.


  *** Type inference doesn’t work for anything other than assignment. ***
      [ so = ]

################################################################################
  If you pass the result of a method call such as New.map( ) as an argument to
  another method, the compiler will not try to perform type inference. Instead
  it will treat the method call as though the return value is assigned to a
  variable of type Object. Here’s an example that fails:
################################################################################


          //: generics/LimitsOfInference.java
          import typeinfo.pets.*;
          import java.util.*;
          public class LimitsOfInference {
              static void
                  f(Map<Person, List<? extends Pet>> petPeople) {}
              public static void main(String[] args) {
                  // f(New.map()); // Does not compile
              }
          } ///:~

- Explicit type specification

  It is possible to explicitly specify the type in a generic method, although
  the syntax is rarely needed.

  To do so, you place the type in angle brackets after the dot and immediately
  preceding the method name. When calling a method from within the same class,
  you must use this before the dot, and when working with static methods, you
  must use the class name before the dot.

          public class ExplicitTypeSpecification {
              static void f(Map<Person, List<Pet>> petPeople) {}
              public static void main(String[] args) {
                  f(New.<Person, List<Pet>>map());
              }
          }

- Varargs and generic methods

  Generic methods and variable argument lists coexist nicely:


          public class GenericVarargs {
              public static <T> List<T> makeList(T... args) {
                  List<T> result = new ArrayList<T>();
                  for(T item : args)
                      result.add(item);
                  return result;
              }
              public static void main(String[] args) {
                  List<String> ls = makeList("A");
                  System.out.println(ls);
                  ls = makeList("A", "B", "C");
                  System.out.println(ls);
                  ls = makeList("ABCDEFFHIJKLMNOPQRSTUVWXYZ".split(""));
                  System.out.println(ls);
              }
          } /* Output:
               [A]
               [A, B, C]
               [, A, B, C, D, E, F, F, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W,
               X, Y, Z]
             *///:~

- A generic method to use with Generators

  It is convenient to use a generator to fill a Collection, and it makes sense
  to "generify" this operation:

          public class Generators {
              public static <T> Collection<T>
                  fill(Collection<T> coll, Generator<T> gen, int n) {
                      for(int i = 0; i < n; i++)
                          coll.add(gen.next());
                      return coll;
                  }
              public static void main(String[] args) {
                  Collection<Coffee> coffee = fill(
                          new ArrayList<Coffee>(), new CoffeeGenerator(), 4);
                  for(Coffee c : coffee)
                      System.out.println(c);
                  Collection<Integer> fnumbers = fill(
                          new ArrayList<Integer>(), new Fibonacci(), 12);
                  for(int i : fnumbers)
                      System.out.print(i + ", ");
              }
          }

- A general-purpose Generator

  Here’s a class that produces a Generator for any class that has a default
  constructor. To reduce typing, it also includes a generic method to produce a
  BasicGenerator:

          public class BasicGenerator<T> implements Generator<T> {
              private Class<T> type;
              public BasicGenerator(Class<T> type){ this.type = type; }
              public T next() {
                  try {
                      // Assumes type is a public class:
                      return type.newInstance();
                  } catch(Exception e) {
                      throw new RuntimeException(e);
                  }
              }
              // Produce a Default generator given a type token:
              public static <T> Generator<T> create(Class<T> type) {
                  return new BasicGenerator<T>(type);
              }
          }

   The generic create( ) method allows you to say
   BasicGenerator.create(MyType.class) instead of the more awkward new
   BasicGenerator<MyType>(MyType.class).

- Simplifying tuple use

  Type argument inference, together with static imports, allows the tuples we
  saw earlier to be rewritten into a more general-purpose library. Here, tuples
  can be created using an overloaded static method:


          public class Tuple {
              public static <A,B> TwoTuple<A,B> tuple(A a, B b) {
                  return new TwoTuple<A,B>(a, b);
              }
              public static <A,B,C> ThreeTuple<A,B,C>
                  tuple(A a, B b, C c) {
                      return new ThreeTuple<A,B,C>(a, b, c);
                  }
              public static <A,B,C,D> FourTuple<A,B,C,D>
                  tuple(A a, B b, C c, D d) {
                      return new FourTuple<A,B,C,D>(a, b, c, d);
                  }
              public static <A,B,C,D,E>
                  FiveTuple<A,B,C,D,E> tuple(A a, B b, C c, D d, E e) {
                      return new FiveTuple<A,B,C,D,E>(a, b, c, d, e);
                  }
          }

- A set utility

  For another example of the use of generic methods, consider the mathematical
  relationships that can be expressed using Sets. These can be conveniently
  defined as generic methods, to be used with all different types:


          public class Sets {
              public static <T> Set<T> union(Set<T> a, Set<T> b) {
                  Set<T> result = new HashSet<T>(a);
                  result.addAll(b);
                  return result;
              }
              public static <T>
                  Set<T> intersection(Set<T> a, Set<T> b) {
                      Set<T> result = new HashSet<T>(a);
                      result.retainAll(b);
                      return result;
                  }
              // Subtract subset from superset:
              public static <T> Set<T>
                  difference(Set<T> superset, Set<T> subset) {
                      Set<T> result = new HashSet<T>(superset);
                      result.removeAll(subset);
                      return result;
                  }
              // Reflexive--everything not in the intersection:
              public static <T> Set<T> complement(Set<T> a, Set<T> b) {
                  return difference(union(a, b), intersection(a, b));
              }
          }

  The first three methods duplicate the first argument by copying its references
  into a new HashSet object, so the argument Sets are not directly modified. The
  return value is thus a new Set object.

- Anonymous inner classes

  Generics can also be used with inner classes and anonymous inner classes.
  Here’s an example that implements the Generator interface using anonymous
  inner classes:

          ...
          class Teller {
              private static long counter = 1;
              private final long id = counter++;
              private Teller() {}
              public String toString() { return "Teller " + id; }
              // A single Generator object:
              public static Generator<Teller> generator =
                  new Generator<Teller>() {
                      public Teller next() { return new Teller(); }
                  };
          }
          ...

- Building complex models

  An important benefit of generics is the ability to simply and safely create
  complex models.  For example, we can easily create a List of tuples:

          public class TupleList<A,B,C,D>
          extends ArrayList<FourTuple<A,B,C,D>> {
              public static void main(String[] args) {
                  TupleList<Vehicle, Amphibian, String, Integer> tl =
                      new TupleList<Vehicle, Amphibian, String, Integer>();
                  tl.add(TupleTest.h());
                  tl.add(TupleTest.h());
                  for(FourTuple<Vehicle,Amphibian,String,Integer> i: tl)
                      System.out.println(i);
              }
          }

  Although it gets somewhat verbose (especially the creation of the iterator),
  you end up with a fairly powerful data structure without too much code.

  Here’s another example showing how straightforward it is to build complex
  models using generic types. Even though each class is created as a building
  block, the total has many parts.  In this case, the model is a retail store
  with aisles, shelves and products:

          class Product {
              private final int id;
              private String description;
              private double price;
              public Product(int IDnumber, String descr, double price){
                  id = IDnumber;
                  description = descr;
                  this.price = price;
                  System.out.println(toString());
              }
              public String toString() {
                  return id + ": " + description + ", price: $" + price;
              }
              public void priceChange(double change) {
                  price += change;
              }
              public static Generator<Product> generator =
                  new Generator<Product>() {
                      private Random rand = new Random(47);
                      public Product next() {
                          return new Product(rand.nextInt(1000), "Test",
                                  Math.round(rand.nextDouble() * 1000.0) + 0.99);
                      }
                  };
          }
          class Shelf extends ArrayList<Product> {
              public Shelf(int nProducts) {
                  Generators.fill(this, Product.generator, nProducts);
              }
          }
          class Aisle extends ArrayList<Shelf> {
              public Aisle(int nShelves, int nProducts) {
                  for(int i = 0; i < nShelves; i++)
                      add(new Shelf(nProducts));
              }
          }
          class CheckoutStand {}
          class Office {}
          public class Store extends ArrayList<Aisle> {
              private ArrayList<CheckoutStand> checkouts =
                  new ArrayList<CheckoutStand>();
              private Office office = new Office();
              public Store(int nAisles, int nShelves, int nProducts) {
                  for(int i = 0; i < nAisles; i++)
                      add(new Aisle(nShelves, nProducts));
              }
              public String toString() {
                  StringBuilder result = new StringBuilder();
                  for(Aisle a : this)
                      for(Shelf s : a)
                          for(Product p : s) {
                              result.append(p);
                              result.append("\n");
                          }
                  return result.toString();
              }
              public static void main(String[] args) {
                  System.out.println(new Store(14, 5, 10));
              }
          }

  As you can see in Store.toString( ), the result is many layers of containers
  that are nonetheless type-safe and manageable. What’s impressive is that it is
  not intellectually prohibitive to assemble such a model.

- The mystery of erasure

  As you begin to delve more deeply into generics, there are a number of things
  that won’t initially make sense. For example, although you can say
  ArrayList.class, you cannot say ArrayList<Integer>.class. And consider the
  following:

      public class ErasedTypeEquivalence {
          public static void main(String[] args) {
              Class c1 = new ArrayList<String>().getClass();
              Class c2 = new ArrayList<Integer>().getClass();
              System.out.println(c1 == c2);
          }
      } /* Output:
           true
         *///:~

  Array List < String > and Array List < Integer > could easily be argued to be
  distinct types. Different types behave differently, and if you try, for
  example, to put an Integer into an Array List < String >, you get different
  behavior (it fails) than if you put an Integer into an ArrayList< Integer >
  (it succeeds). And yet the above program suggests that they are the same type.

  Here’s an example that adds to this puzzle:

          class Quark<Q> {}
          class Fnorkle {}
          class Frob {}
          class Particle<POSITION,MOMENTUM> {}
          public class LostInformation {
              public static void main(String[] args) {
                  List<Frob> list = new ArrayList<Frob>();
                  Map<Frob,Fnorkle> map = new HashMap<Frob,Fnorkle>();
                  Quark<Fnorkle> quark = new Quark<Fnorkle>();
                  Particle<Long,Double> p = new Particle<Long,Double>();
                  System.out.println(Arrays.toString(
                              list.getClass().getTypeParameters()));
                  System.out.println(Arrays.toString(
                              map.getClass().getTypeParameters()));
                  System.out.println(Arrays.toString(
                              quark.getClass().getTypeParameters()));
                  System.out.println(Arrays.toString(
                              p.getClass().getTypeParameters()));
              }
          } /* Output:
               [E]
               [K, V]
               [Q]
               [POSITION, MOMENTUM]
             *///:~

  According to the JDK documentation, Class.getTypeParameters( ) "returns an
  array of TypeVariable objects that represent the type variables declared by
  the generic declaration..." This seems to suggest that you might be able to
  find out what the parameter types are. However, as you can see from the
  output, all you find out is the identifiers that are used as the parameter
  placeholders, which is not such an interesting piece of information.

  The cold truth is: There’s no information about generic parameter types
  available inside generic code.

  Thus, you can know things like the identifier of the type parameter and the
  bounds of the generic type—you just can’t know the actual type parameter(s)
  used to create a particular instance. This fact, which is especially
  frustrating if you’re coming from C++, is the most fundamental issue that you
  must deal with when working with Java generics.

  Java generics are implemented using erasure. This means that any specific type
  information is erased when you use a generic. Inside the generic, the only
  thing that you know is that you’re using an object. So List<String> and List<
  Integer> are, in fact, the same type at run time. Both forms are "erased" to
  their raw type, List. Understanding erasure and how you must deal with it will
  be one of the biggest hurdles you will face when learning Java generics, and
  that’s what we’ll explore in this section.
  [pg 486 on explanation about erasure]

- Bounds [pg 501]

  Bounds allow you to place constraints on the parameter types that can be used
  with generics. Although this allows you to enforce rules about the types that
  your generics can be applied to, a potentially more important effect is that
  you can call methods that are in your bound types.

  Because erasure removes type information, the only methods you can call for an
  unbounded generic parameter are those available for Object. If, however, you
  are able to constrain that parameter to be a subset of types, then you can
  call the methods in that subset. To perform this constraint, Java generics
  reuse the extends keyword. It’s important for you to understand that extends
  has a significantly different meaning in the context of generic bounds than it
  does ordinarily. This example shows the basics of bounds:

          interface HasColor { java.awt.Color getColor(); }
          class Colored<T extends HasColor> {
              T item;
              Colored(T item) { this.item = item; }
              T getItem() { return item; }
              // The bound allows you to call a method:
              java.awt.Color color() { return item.getColor(); }
          }
          class Dimension { public int x, y, z; }
          // This won’t work -- class must be first, then interfaces:
          // class ColoredDimension<T extends HasColor & Dimension> {
          // Multiple bounds:
          class ColoredDimension<T extends Dimension & HasColor> {
              T item;
              ColoredDimension(T item) { this.item = item; }
              T getItem() { return item; }
              java.awt.Color color() { return item.getColor(); }
              int getX() { return item.x; }
              int getY() { return item.y; }
              int getZ() { return item.z; }
          }
          interface Weight { int weight(); }
          // As with inheritance, you can have only one
          // concrete class but multiple interfaces:
          class Solid<T extends Dimension & HasColor & Weight> {
              T item;
              Solid(T item) { this.item = item; }
              T getItem() { return item; }
              java.awt.Color color() { return item.getColor(); }
              int getX() { return item.x; }
              int getY() { return item.y; }
              int getZ() { return item.z; }
              int weight() { return item.weight(); }
          }
          class Bounded
              extends Dimension implements HasColor, Weight {
                  public java.awt.Color getColor() { return null; }
              }
          public int weight() { return 0; }
          public class BasicBounds {
              public static void main(String[] args) {
                  Solid<Bounded> solid =
                      new Solid<Bounded>(new Bounded());
                  solid.color();
                  solid.getY();
                  solid.weight();
              }
          }

  You might observe that BasicBounds.java seems to contain redundancies that
  could be eliminated through inheritance. Here, you can see how each level of
  inheritance also adds bounds constraints:

          class HoldItem<T> {
              T item;
              HoldItem(T item) { this.item = item; }
              T getItem() { return item; }
          }
          class Colored2<T extends HasColor> extends HoldItem<T> {
              Colored2(T item) { super(item); }
              java.awt.Color color() { return item.getColor(); }
          }
          class ColoredDimension2<T extends Dimension & HasColor>
              extends Colored2<T> {
                  ColoredDimension2(T item) { super(item); }
                  int getX() { return item.x; }
                  int getY() { return item.y; }
                  int getZ() { return item.z; }
              }
          class Solid2<T extends Dimension & HasColor & Weight>
              extends ColoredDimension2<T> {
                  Solid2(T item) { super(item); }
                  int weight() { return item.weight(); }
              }
          public class InheritBounds {
              public static void main(String[] args) {
                  Solid2<Bounded> solid2 =
                      new Solid2<Bounded>(new Bounded());
                  solid2.color();
                  solid2.getY();
                  solid2.weight();
              }
          }

  Holdltem simply holds an object, so this behavior is inherited into Colored2,
  which also requires that its parameter conforms to HasColor. ColoredDimension2
  and Solid2 further extend the hierarchy and add bounds at each level. Now the
  methods are inherited and they don’t have to be repeated in each class.

- Wildcards

  You’ve already seen some simple uses of wildcards—question marks in generic
  argument expressions—in the Holding Your Objects chapter and more in the Type
  Information chapter. This section will explore the issue more deeply.

  We’ll start with an example that shows a particular behavior of arrays: You
  can assign an array of a derived type to an array reference of the base type:

          class Fruit {}
          class Apple extends Fruit {}
          class Jonathan extends Apple {}
          class Orange extends Fruit {}
          public class CovariantArrays {
              public static void main(String[] args) {
                  Fruit[] fruit = new Apple[10];
                  fruit[0] = new Apple(); // OK
                  fruit[1] = new Jonathan(); // OK
                  // Runtime type is Apple[], not Fruit[] or Orange[]:
                  try {
                      // Compiler allows you to add Fruit:
                      fruit[0] = new Fruit(); // ArrayStoreException
                  } catch(Exception e) { System.out.println(e); }
                  try {
                      // Compiler allows you to add Oranges:
                      fruit[0] = new Orange(); // ArrayStoreException
                  } catch(Exception e) { System.out.println(e); }
              }
          } /* Output:
               java.lang.ArrayStoreException: Fruit
               java.lang.ArrayStoreException: Orange
             *///:~

  The first line in main( ) creates an array of Apple and assigns it to a
  reference to an array of Fruit. This makes sense—an Apple is a kind of Fruit,
  so an array of Apple should also be an array of Fruit.

  However, if the actual array type is Apple [], you should only be able to
  place an Apple or a subtype of Apple into the array, which in fact works at
  both compile time and run time. But notice that the compiler allows you to
  place a Fruit object into the array. This makes sense to the compiler, because
  it has a Fruit[] reference—why shouldn’t it allow a Fruit object, or anything
  descended from Fruit, such as Orange, to be placed into the array? So at
  compile time, this is allowed. The runtime array mechanism, however, knows
  that it’s dealing with an Apple [] and throws an exception when a foreign type
  is placed into the array.

  "Upcast" is actually rather a misnomer here. What you’re really doing is
  assigning one array to another. The array behavior is that it holds other
  objects, but because we are able to upcast, it’s clear that the array objects
  can preserve the rules about the type of objects they contain. It’s as if the
  arrays are conscious of what they are holding, so between the compile- time
  checks and the runtime checks, you can’t abuse them.

  This arrangement for arrays is not so terrible, because you do find out at run
  time that you’ve inserted an improper type. But one of the primary goals of
  generics is to move such error detection to compile time. So what happens when
  we try to use generic containers instead of arrays?

      //: generics/NonCovariantGenerics.java
      // {CompileTimeError} (Won’t compile)
      import java.util.*;
      public class NonCovariantGenerics {
          // Compile Error: incompatible types:
          List<Fruit> flist = new ArrayList<Apple>();
      }

  Although you may at first read this as saying, "You can’t assign a container
  of Apple to a container of Fruit," remember that generics are not just about
  containers. What it’s really saying is, "You can’t assign a generic involving
  Apples to a generic involving Fruit." If, as in the case of arrays, the
  compiler knew enough about the code to determine that containers were
  involved, perhaps it could give some leeway. But it doesn’t know anything like
  that, so it refuses to allow the "upcast." But it really isn’t an "upcast"
  anyway—a List of Apple is not a List of Fruit. A List of Apple will hold
  Apples and subtypes of Apple, and a List of Fruit will hold any kind of Fruit.
  Yes, including Apples, but that doesn’t make it a List of Apple; it’s still a
  List of Fruit. A List of Apple is not type-equivalent to a List of Fruit, even
  if an Apple is a type of Fruit.

  The real issue is that we are talking about the type of the container, rather
  than the type that the container is holding. Unlike arrays, generics do not
  have built-in covariance. This is because arrays are completely defined in the
  language and can thus have both compile-time and runtime checks built in, but
  with generics, the compiler and runtime system cannot know what you want to do
  with your types and what the rules should be.

  Sometimes, however, you’d like to establish some kind of upcasting
  relationship between the two. This is what wildcards allow.

          import java.util.*;
          public class GenericsAndCovariance {
              public static void main(String[] args) {
                  // Wildcards allow covariance:
                  List<? extends Fruit> flist = new ArrayList<Apple>();
                  // Compile Error: can’t add any type of object:
                  // flist.add(new Apple());
                  // flist.add(new Fruit());
                  // flist.add(new Object());
                  flist.add(null); // Legal but uninteresting
                  // We know that it returns at least Fruit:
                  Fruit f = flist.get(0);
              }
          }

  The type of flist is now List<? extends Fruit>, which you can read as "a list
  of any type that’s inherited from Fruit." This doesn’t actually mean that the
  List will hold any type of Fruit, however. The wildcard refers to a definite
  type, so it means "some specific type which the flist reference doesn’t
  specify." So the List that’s assigned has to be holding some specified type
  such as Fruit or Apple, but in order to upcast to flist, that type is a "don’t
  actually care."

  If the only constraint is that the List hold a specific Fruit or subtype of
  Fruit, but you don’t actually care what it is, then what can you do with such
  a List? If you don’t know what type the List is holding, how can you safely
  add an object? Just as with the "upcast" array in CovariantArrays.java, you
  can’t, except that the compiler prevents it from happening rather than the
  runtime system. You discover the problem sooner.

  You might argue that things have gone a bit overboard, because now you can’t
  even add an Apple to a List that you just said would hold Apples. Yes, but the
  compiler doesn’t know that. A List<? extends Fruit> could legally point to a
  List<Orange>. Once you do this kind of "upcast," you lose the ability to pass
  anything in, even an Object.

  On the other hand, if you call a method that returns Fruit, that’s safe
  because you know that anything in the List must at least be of type Fruit, so
  the compiler allows it.
        [pg 505]
TODO: FINISH THAT SECTION

pg 557 Arrays


* Arrays

  The simple view of arrays is that you create and populate them, you select
  elements from them using int indexes, and they don’t change their size. Most
  of the time that’s all you need to know, but sometimes you need to perform
  more sophisticated operations on arrays, and you may also need to evaluate the
  use of an array vs. a more flexible container. This chapter will show you how
  to think about arrays in more depth.

- Why arrays are special

  There are a number of other ways to hold objects, so what makes an array
  special?

  There are three issues that distinguish arrays from other types of containers:
  efficiency, type, and the ability to hold primitives. The array is Java’s most
  efficient way to store and randomly access a sequence of object references.

  The array is a simple linear sequence, which makes element access fast. The
  cost of this speed is that the size of an array object is fixed and cannot be
  changed for the lifetime of that array.

  You might suggest an ArrayList (from Holding Your Objects), which will
  automatically allocate more space, creating a new one and moving all the
  references from the old one to the new one. Although you should generally
  prefer an ArrayList to an array, this flexibility has overhead, so an
  ArrayList is measurably less efficient than an array.

  Both arrays and containers guarantee that you can’t abuse them. Whether you’re
  using an array or a container, you’ll get a RuntimeException if you exceed the
  bounds, indicating a programmer error.

  Before generics, the other container classes dealt with objects as if they had
  no specific type.  That is, they treated them as type Object, the root class
  of all classes in Java. Arrays are superior to pre-generic containers because
  you create an array to hold a specific type. This means that you get
  compile-time type checking to prevent you from inserting the wrong type or
  mistaking the type that you’re extracting. Of course, Java will prevent you
  from sending an inappropriate message to an object at either compile time or
  run time. So it’s not riskier one way or the other; it’s just nicer if the
  compiler points it out to you, and there’s less likelihood that the end user
  will get surprised by an exception.

  An array can hold primitives, whereas a pre-generic container could not. With
  generics, however, containers can specify and check the type of objects they
  hold, and with autoboxing containers can act as if they are able to hold
  primitives, since the conversion is automatic.  Here’s an example that
  compares arrays with generic containers:

          //: arrays/ContainerComparison.java
          import java.util.*;
          import static net.mindview.util.Print.*;

          class BerylliumSphere {
              private static long counter;
              private final long id = counter++;
              public String toString() { return "Sphere " + id; }
          }

          public class ContainerComparison {
              public static void main(String[] args) {

                  BerylliumSphere[] spheres = new BerylliumSphere[10];

                  for(int i = 0; i < 5; i++)
                      spheres[i] = new BerylliumSphere();

                  print(Arrays.toString(spheres));
                  print(spheres[4]);

                  List<BerylliumSphere> sphereList = new ArrayList<BerylliumSphere>();

                  for(int i = 0; i < 5; i++)
                      sphereList.add(new BerylliumSphere());

                  print(sphereList);
                  print(sphereList.get(4));

                  int[] integers = { 0, 1, 2, 3, 4, 5 };
                  print(Arrays.toString(integers));
                  print(integers[4]);

                  List<Integer> intList = new ArrayList<Integer>(
                          Arrays.asList(0, 1, 2, 3, 4, 5));

                  intList.add(97);
                  print(intList);
                  print(intList.get(4));
              }
          } /* Output:
               [Sphere 0, Sphere 1, Sphere 2, Sphere 3, Sphere 4, null, null, null,
               null, null]
               Sphere 4
               [Sphere 5, Sphere 6, Sphere 7, Sphere 8, Sphere 9]
               Sphere 9
               [0, 1, 2, 3, 4, 5]
               4
               [0, 1, 2, 3, 4, 5, 97]
               4
             *///:~

  Both ways of holding objects are type-checked, and the only apparent
  difference is that arrays use [ ] for accessing elements, and a List uses
  methods such as add( ) and get( ). The similarity between arrays and the
  ArrayList is intentional, so that it’s conceptually easy to switch between the
  two. But as you saw in the Holding Your Objects chapter, containers have
  significantly more functionality than arrays.

  With the advent of autoboxing, containers are nearly as easy to use for
  primitives as arrays.  The only remaining advantage to arrays is efficiency.
  However, when you’re solving a more general problem, arrays can be too
  restrictive, and in those cases you use a container class.

- Arrays are first-class objects

  *****************************************************************************
  Regardless of what type of array you’re working with, the array identifier is
  actually a reference to a true object that’s created on the heap.
  *****************************************************************************

  This is the object that holds the references to the other objects, and it can
  be created either implicitly, as part of the array initialization syntax, or
  explicitly with a new expression. Part of the array object (in fact, the only
  field or method you can access) is the read-only length member that tells you
  how many elements can be stored in that array object. The ‘[ ]’ syntax is the
  only other access that you have to the array object.

  The following example summarizes the various ways that an array can be
  initialized, and how the array references can be assigned to different array
  objects. It also shows that arrays of objects and arrays of primitives are
  almost identical in their use. The only difference is that arrays of objects
  hold references, but arrays of primitives hold the primitive values directly.

          //: arrays/ArrayOptions.java
          // Initialization & re-assignment of arrays.
          import java.util.*;
          import static net.mindview.util.Print.*;

          public class ArrayOptions {
              public static void main(String[] args) {
                  // Arrays of objects:
                  BerylliumSphere[] a; // Local uninitialized variable
                  BerylliumSphere[] b = new BerylliumSphere[5];

                  // The references inside the array are
                  // automatically initialized to null:
                  print("b: " + Arrays.toString(b));
                  BerylliumSphere[] c = new BerylliumSphere[4];

                  for(int i = 0; i < c.length; i++)
                      if(c[i] == null) // Can test for null reference
                          c[i] = new BerylliumSphere();

                  // Aggregate initialization:
                  BerylliumSphere[] d = { new BerylliumSphere(),
                      new BerylliumSphere(), new BerylliumSphere()
                  };

                  // Dynamic aggregate initialization:
                  a = new BerylliumSphere[]{
                      new BerylliumSphere(), new BerylliumSphere(),
                  };
                  // (Trailing comma is optional in both cases)
                  print("a.length = " + a.length);
                  print("b.length = " + b.length);
                  print("c.length = " + c.length);
                  print("d.length = " + d.length);

                  a = d;

                  print("a.length = " + a.length);

                  // Arrays of primitives:
                  int[] e; // Null reference
                  int[] f = new int[5];

                  // The primitives inside the array are
                  // automatically initialized to zero:
                  print("f: " + Arrays.toString(f));
                  int[] g = new int[4];

                  for(int i = 0; i < g.length; i++)
                      g[i] = i*i;
                  int[] h = { 11, 47, 93 };
                  // Compile error: variable e not initialized:
                  //!print("e.length = " + e.length);
                  print("f.length = " + f.length);
                  print("g.length = " + g.length);
                  print("h.length = " + h.length);
                  e = h;
                  print("e.length = " + e.length);
                  e = new int[]{ 1, 2 };
                  print("e.length = " + e.length);
              }
          } /* Output:
        b: [null, null, null, null, null]
        a.length = 2
        b.length = 5
        c.length = 4
        d.length = 3
        a.length = 3
        f: [0, 0, 0, 0, 0]
        f.length = 5
        g.length = 4
        h.length = 3
        e.length = 3
        e.length = 2
             *///:~

  The array a is an uninitialized local variable, and the compiler prevents you
  from doing anything with this reference until you’ve properly initialized it.

  The array b is initialized to point to an array of BerylliumSphere references,
  but no actual BerylliumSphere objects are ever placed in that array. However,
  you can still ask what the size of the array is, since b is pointing to a
  legitimate object.

  This brings up a slight drawback: You can’t find out how many elements are
  actually in the array, since length tells you only how many elements can be
  placed in the array; that is, the size of the array object, not the number of
  elements it actually holds. However, when an array object is created, its
  references are automatically initialized to null, so you can see whether a
  particular array slot has an object in it by checking to see whether it’s
  null. Similarly, an array of primitives is automatically initialized to zero
  for numeric types, (char)o for char, and false for boolean.

  ##############################################################################
  Array c shows the creation of the array object followed by the assignment of
  BerylliumSphere objects to all the slots in the array. Array d shows the
  "aggregate initialization" syntax that causes the array object to be created
  (implicitly with new on the heap, just like for array c) and initialized with
  BerylliumSphere objects, all in one statement.
  ##############################################################################

  The next array initialization can be thought of as a "dynamic aggregate
  initialization." The aggregate initialization used by d must be used at the
  point of d’s definition, but with the second syntax you can create and
  initialize an array object anywhere. For example, suppose hide( ) is a method
  that takes an array of BerylliumSphere objects. You could call it by saying:

                hide(d);

  but you can also dynamically create the array you want to pass as the
  argument:

                hide(new BerylliumSphere[]{ new BerylliumSphere(),
                new BerylliumSphere() });

  The expression: a = d, hows how you can take a reference that’s attached to
  one array object and assign it to another array object, just as you can do
  with any other type

  The second part of ArrayOptions.java shows that primitive arrays work just
  like object arrays except that primitive arrays hold the primitive values
  directly.

- Returning an array

  Suppose you’re writing a method and you don’t want to return just one thing,
  but a whole bunch of things.

  ##############################################################################
  Languages like C and C++ make this difficult because you can’t just return an
  array, only a pointer to an array. This introduces problems because it becomes
  messy to control the lifetime of the array, which leads to memory leaks.
  ##############################################################################


  In Java, you just return the array. You never worry about responsibility for
  that array—it will be around as long as you need it, and the garbage collector
  will clean it up when you’re done.

  As an example, consider returning an array of String:

          //: arrays/IceCream.java
          // Returning arrays from methods.
          import java.util.*;
          public class IceCream {
              private static Random rand = new Random(47);
              static final String[] FLAVORS = {
                  "Chocolate", "Strawberry", "Vanilla Fudge Swirl",
                  "Mint Chip", "Mocha Almond Fudge", "Rum Raisin",
                  "Praline Cream", "Mud Pie"
              };
              public static String[] flavorSet(int n) {
                  if(n > FLAVORS.length)
                      throw new IllegalArgumentException("Set too big");
                  String[] results = new String[n];
                  boolean[] picked = new boolean[FLAVORS.length];
                  for(int i = 0; i < n; i++) {
                      int t;

                      do {
                          t = rand.nextInt(FLAVORS.length);
                      } while(picked[t]);

                      results[i] = FLAVORS[t];
                      picked[t] = true;
                  }
                  return results;
              }
              public static void main(String[] args) {
                  for(int i = 0; i < 7; i++)
                      System.out.println(Arrays.toString(flavorSet(3)));
              }
          } /* Output:
               [Rum Raisin, Mint Chip, Mocha Almond Fudge]
               [Chocolate, Strawberry, Mocha Almond Fudge]
               [Strawberry, Mint Chip, Mocha Almond Fudge]
               [Rum Raisin, Vanilla Fudge Swirl, Mud Pie]
               [Vanilla Fudge Swirl, Chocolate, Mocha Almond Fudge]
               [Praline Cream, Strawberry, Mocha Almond Fudge]
               [Mocha Almond Fudge, Strawberry, Mint Chip]
             *///:~

  The method flavorSet( ) creates an array of String called results. The size of
  this array is n, determined by the argument that you pass into the method.
  Then it proceeds to choose flavors randomly from the array FLAVORS and place
  them into results, which it returns.  Returning an array is just like
  returning any other object—it’s a reference. It’s not important that the array
  was created within flavorSet( ), or that the array was created anyplace else,
  for that matter. The garbage collector takes care of cleaning up the array
  when you’re done with it, and the array will persist for as long as you
  need it.

  As an aside, notice that when flavorSet( ) chooses flavors randomly, it
  ensures that a particular choice hasn’t already been selected. This is
  performed in a do loop that keeps making random choices until it finds one not
  already in the picked array. (Of course, a String comparison also could have
  been performed to see if the random choice was already in the results array.)
  If it’s successful, it adds the entry and finds the next one (i gets
  incremented).

  You can see from the output that flavorSet( ) chooses the flavors in a random
  order each time.

- Multidimensional arrays

  You can easily create multidimensional arrays. For a multidimensional array of
  primitives, you delimit each vector in the array by using curly braces:

          public static void main(String[] args) {
              int[][] a = {
                  { 1, 2, 3, },
                  { 4, 5, 6, },
              };
          }

  Each nested set of curly braces moves you into the next level of the array.

  This example uses the Java SE5 Arrays.deepToString( ) method, which turns
  multidimensional arrays into Strings, as you can see from the output.

  You can also allocate an array using new. Here’s a three-dimensional array
  allocated in a new expression:

                int[][][] a = new int[2][2][4];

  Each vector in the arrays that make up the matrix can be of any length (this
  is called a ragged array):

          int[][][] a = new int[rand.nextInt(7)][][];
          for(int i = 0; i < a.length; i++) {
              a[i] = new int[rand.nextInt(5)][];
              for(int j = 0; j < a[i].length; j++)
                  a[i][j] = new int[rand.nextInt(5)];
          }

  The first new creates an array with a random-length first element and the rest
  undetermined. The second new inside the for loop fills out the elements but
  leaves the third index undetermined until you hit the third new.

  You can deal with arrays of non-primitive objects in a similar fashion. Here,
  you can see how to collect many new expressions with curly braces:

          BerylliumSphere[][] spheres = {
              { new BerylliumSphere(), new BerylliumSphere() },
              { new BerylliumSphere(), new BerylliumSphere(),
                  new BerylliumSphere(), new BerylliumSphere() },
              { new BerylliumSphere(), new BerylliumSphere(),
                  new BerylliumSphere(), new BerylliumSphere(),
                  new BerylliumSphere(), new BerylliumSphere(),
                  new BerylliumSphere(), new BerylliumSphere() },
          };

  Autoboxing also works with array initializers:

                Integer[][] a = { // Autoboxing:
                { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 },
                { 21, 22, 23, 24, 25, 26, 27, 28, 29, 30 },
                { 51, 52, 53, 54, 55, 56, 57, 58, 59, 60 },
                { 71, 72, 73, 74, 75, 76, 77, 78, 79, 80 },
                };

  The Arrays.deepToString( ) method works with both primitive arrays and object
  arrays:

   Again, in the Integer and Double arrays, Java SE5 autoboxing creates the
   wrapper objects for you.

- Arrays and generics

  In general, arrays and generics do not mix well. You cannot instantiate arrays
  of parameterized types:

                Peel<Banana>[] peels = new Peel<Banana> [10]; // Illegal

  Erasure removes the parameter type information, and arrays must know the exact
  type that they hold, in order to enforce type safety.

  However, you can parameterize the type of the array itself:

                class ClassParameter<T> {
                        public T[] f(T[] arg) { return arg; }
                }
                class MethodParameter {
                        public static <T> T[] f(T[] arg) { return arg; }
                }

  Note the convenience of using a parameterized method instead of a
  parameterized class: You don’t have to instantiate a class with a parameter
  for each different type you need to apply it to, and you can make it static.
  Of course, you can’t always choose to use a parameterized method instead
  of a parameterized class, but it can be preferable.  [ClassParameter vs
  MethodParameter]


  As it turns out, it’s not precisely correct to say that you cannot create
  arrays of generic types.  True, the compiler won’t let you instantiate an
  array of a generic type. However, it will let you create a reference to such
  an array. For example:

                List<String>[] ls;

  This passes through the compiler without complaint. And although you cannot
  create an actual array object that holds generics, you can create an array of
  the non-generified type and cast it:

                List<String>[] ls;
                List[] la = new List[10];
                ls = (List<String>[])la; // "Unchecked" warning
                ls[0] = new ArrayList<String>();
                // Compile-time checking produces an error:
                //! ls[1] = new ArrayList<Integer>();
                // The problem: List<String> is a subtype of Object
                Object[] objects = ls; // So assignment is OK
                // Compiles and runs without complaint:
                objects[1] = new ArrayList<Integer>();

                // However, if your needs are straightforward it is
                // possible to create an array of generics, albeit
                // with an "unchecked" warning:
                List<BerylliumSphere>[] spheres =
                (List<BerylliumSphere>[])new List[10];
                for(int i = 0; i < spheres.length; i++)
                    spheres[i] = new ArrayList<BerylliumSphere>();
        }


  Once you have a reference to a List<String>[], you can see that you get some
  compile-time checking. The problem is that arrays are covariant, so a
  List<String>[] is also an Object[], and you can use this to assign an
  ArrayList<Integer> into your array, with no error at either compile time or
  run time.

  If you know you’re not going to upcast and your needs are relatively simple,
  however, it is possible to create an array of generics, which will provide
  basic compile-time type checking.  However, a generic container will virtually
  always be a better choice than an array of generics.

  In general you’ll find that generics are effective at the boundaries of a
  class or method. In the interiors, erasure usually makes generics unusable. So
  you cannot, for example, create an array of a generic type:

          public class ArrayOfGenericType<T> {
              T[] array; // OK
              @SuppressWarnings("unchecked")
                  public ArrayOfGenericType(int size) {
                      //! array = new T[size]; // Illegal
                      array = (T[])new Object[size]; // "unchecked" Warning
                  }
              // Illegal:
              //! public <U> U[] makeArray() { return new U[10]; }
          }

  Erasure gets in the way again—this example attempts to create arrays of types
  that have been erased, and are thus unknown types. Notice that you can create
  an array of Object, and cast it, but without the @SuppressWarnings annotation
  you get an "unchecked" warning at compile time because the array doesn’t
  really hold or dynamically check for type T. That is, if I create a String[],
  Java will enforce at both compile time and run time that I can only place
  String objects in that array. However, if I create an Object[], I can put
  anything into that array except primitive types.

- Creating test data

  When experimenting with arrays, and with programs in general, it’s helpful to
  be able to easily generate arrays filled with test data. The tools in this
  section will fill an array with values or objects.

- Arrays.fill()

  The Java standard library Arrays class has a rather trivial fill( ) method: It
  only duplicates a single value into each location, or in the case of objects,
  copies the same reference into each location. Here’s an example:

                char[] a3 = new char[size];
                Arrays.fill(a3, ‘x’);

  You can either fill the entire array or, as the last two statements show, fill
  a range of elements. But since you can only call Arrays.fill( ) with a single
  data value, the results are not especially useful.

- Data Generators

  To create more interesting arrays of data, but in a flexible fashion, we’ll
  use the Generator concept that was introduced in the Generics chapter. If a
  tool uses a Generator, you can produce any kind of data via your choice of
  Generator (this is an example of the Strategy design pattern—each different
  Generator represents a different strategy 1 ).

  [pg 569, simply a generator with a next function. then feed an array to it,
  and it will call next() to fill the array]

- Creating arrays from Generators

  In order to take a Generator and produce an array, we need two conversion
  tools. The first one uses any Generator to produce an array of Object
  subtypes. To cope with the problem of primitives, the second tool takes any
  array of primitive wrapper types and produces the associated array of
  primitives.


          public static <T> T[] array(Class<T> type,
                  Generator<T> gen, int size) {
              T[] a =
                  (T[])java.lang.reflect.Array.newInstance(type, size);
              return new CollectionData<T>(gen, size).toArray(a);
          }

           [Array.newInstance is the way to create new arrays in java with
           generics]

  The second method uses reflection to dynamically create a new array of the
  appropriate type and size. This is then filled using the same technique as the
  first method.

                [pg 574]

  Generics don’t work with primitives, and we want to use the generators to fill
  primitive arrays. To solve the problem, we create a converter that takes any
  array of wrapper objects and converts it to an array of the associated
  primitive types. Without this tool, we would have to create special case
  generators for all the primitives.

          public static char[] primitive(Character[] in) {
              char[] result = new char[in.length];
              for(int i = 0; i < in.length; i++)
                  result[i] = in[i];
              return result;
          }

  Each version of primitive( ) creates an appropriate primitive array of the
  correct length, then copies the elements from the in array of wrapper types.
  Notice that autounboxing takes place in the expression:

                result[i] = in [1];

- Arrays Utilities

- Copying an array

  The Java standard library provides a static method, System.arraycopy( ), which
  can copy arrays far more quickly than if you use a for loop to perform the
  copy by hand.

  The arguments to arraycopy( ) are the source array, the offset into the source
  array from whence to start copying, the destination array, the offset into the
  destination array where the copying begins, and the number of elements to
  copy. Naturally, any violation of the array boundaries will cause an
  exception.

- Comparing arrays

  Arrays provides the equals( ) method to compare entire arrays for equality,
  which is overloaded for all the primitives and for Object. To be equal, the
  arrays must have the same number of elements, and each element must be
  equivalent to each corresponding element in the other array, using the equals(
  ) for each element. (For primitives, that primitive’s wrapper class equals( )
  is used; for example, Integer.equals( ) for int.)

- Array element comparisons

  Sorting must perform comparisons based on the actual type of the object. Of
  course, one approach is to write a different sorting method for every
  different type, but such code is not reusable for new types.

  A primary goal of programming design is to "separate things that change from
  things that stay the same," and here, the code that stays the same is the
  general sort algorithm, but the thing that changes from one use to the next is
  the way objects are compared. So instead of placing the comparison code into
  many different sort routines, the Strategy design pattern is used.

  With a Strategy, the part of the code that varies is encapsulated inside a
  separate class (the Strategy object). You hand a Strategy object to the code
  that’s always the same, which uses the Strategy to fulfill its algorithm. That
  way, you can make different objects to express different ways of comparison
  and feed them to the same sorting code.

  Java has two ways to provide comparison functionality. The first is with the
  "natural" comparison method that is imparted to a class by implementing the
  java.lang.Comparable interface. This is a very simple interface with a single
  method, compareTo( ). This method takes another object of the same type as an
  argument and produces a negative value if the current object is less than the
  argument, zero if the argument is equal, and a positive value if the current
  object is greater than the argument.

  Now suppose someone hands you a class that doesn’t implement Comparable, or
  hands you this class that does implement Comparable, but you decide you don’t
  like the way it works and would rather have a different comparison method for
  the type. To solve the problem, you create a separate class that implements an
  interface called Comparator (briefly introduced in the Holding Your Objects
  chapter). This is an example of the Strategy design pattern. It has two
  methods, compare( ) and equals( ). However, you don’t have to implement
  equals( ) except for special performance needs, because anytime you create a
  class, it is implicitly inherited from Object, which has an equals( ). So you
  can just use the default Object equals( ) and satisfy the contract imposed by
  the interface.

           Arrays.sort(a, Collections.reverseOrder());

- Sorting an array

  With the built-in sorting methods, you can sort any array of primitives, or
  any array of objects that either implements Comparable or has an associated
  Comparator.

  One thing you’ll notice about the output in the String sorting algorithm is
  that it’s lexicographic, so it puts all the words starting with uppercase
  letters first, followed by all the words starting with lowercase letters.
  (Telephone books are typically sorted this way.) If you want to group the
  words together regardless of case, use String.CASE_INSENSITIVE_ORDER as shown
  in the last call to sort( ) in the above example.

          Arrays.sort(sa, String.CASE_INSENSITIVE_ORDER);

- Searching a sorted array

  Once an array is sorted, you can perform a fast search for a particular item
  by using Arrays.binarySearch( ). However, if you try to use binarySearchC ) on
  an unsorted array the results will be unpredictable.

  Arrays.binarySearch( ) produces a value greater than or equal to zero if the
  search item is found. Otherwise, it produces a negative value representing the
  place that the element should be inserted if you are maintaining the sorted
  array by hand.

  The value produced is
        (insertion point) - 1

  The insertion point is the index of the first element greater than the key, or
  a.size( ), if all elements in the array are less than the specified key.

  If an array contains duplicate elements, there is no guarantee which of those
  duplicates will be found. The search algorithm is not designed to support
  duplicate elements, but rather to tolerate them. If you need a sorted list of
  non-duplicated elements, use a TreeSet (to maintain sorted order) or
  LinkedHashSet (to maintain insertion order). These classes take care of all
  the details for you automatically. Only in cases of performance bottlenecks
  should you replace one of these classes with a hand-maintained array.

  If you sort an object array using a Comparator (primitive arrays do not allow
  sorting with a Comparator), you must include that same Comparator when you
  perform a binarySearch( ) (using the overloaded version of binarySearch( )).

* Containers in Depth

  After a more complete overview of containers, you’ll learn how hashing works,
  and how to write hashCode( ) and equals( ) to work with hashed containers.
  You’ll learn why there are different versions of some containers and how to
  choose between them. The chapter finishes with an exploration of
  general-purpose utilities and special classes.

- Filling containers

    Collections.fill(...)

- A Generator solution
[pg 591]

- Using abstract classes

  An alternative approach to the problem of producing test data for containers
  is to create custom Collection and Map implementations. Each java.util
  container has its own Abstract class that provides a partial implementation of
  that container, so all you must do is implement the necessary methods in order
  to produce the desired container. If the resulting container is read-only, as
  it typically is for test data, the number of methods you need to provide is
  minimized.

  Although it isn’t particularly necessary in this case, the following solution
  also provides the opportunity to demonstrate another design pattern: the
  Flyweight. You use a flyweight when the ordinary solution requires too many
  objects, or when producing normal objects takes up too much space. The
  Flyweight pattern externalizes part of the object so that, instead of
  everything in the object being contained within the object, some or all of the
  object is looked up in a more efficient external table (or produced through
  some other calculation that saves space).

  An important point of this example is to demonstrate how relatively simple it
  is to create a custom Map and Collection by inheriting from the
  java.util.Abstract classes. In order to create a read-only Map, you inherit
  from AbstractMap and implement entrySet( ). In order to create a readonly Set,
  you inherit from AbstractSet and implement iterator( ) and size( ).

  The data set in this example is a Map of the countries of the world and their
  capitals. 2 The capitals( ) method produces a Map of countries and capitals.
  The names( ) method produces a List of the country names. In both cases you
  can get a partial listing by providing an int argument indicating the desired
  size:

  public class Countries {
      public static final String[][] DATA = {
          // Africa
          {"ALGERIA","Algiers"}, {"ANGOLA","Luanda"},
          ...
      };

      private static class FlyweightMap
          extends AbstractMap<String,String> {
              private static class Entry
                  implements Map.Entry<String,String> {
                      int index;
                      Entry(int index) { this.index = index; }
                      public boolean equals(Object o) {
                          return DATA[index][0].equals(o);
                      }
                      public String getKey() { return DATA[index][0]; }
                      public String getValue() { return DATA[index][1]; }
                      public String setValue(String value) {
                          throw new UnsupportedOperationException();
                      }
                      public int hashCode() {
                          return DATA[index][0].hashCode();
                      }
                  }


              // Use AbstractSet by implementing size() & iterator()
              static class EntrySet
                  extends AbstractSet<Map.Entry<String,String>> {
                      private int size;
                      EntrySet(int size) {
                          if(size < 0)
                              this.size = 0;
                          // Can’t be any bigger than the array:
                          else if(size > DATA.length)
                              this.size = DATA.length;
                          else
                              this.size = size;
                      }
                      public int size() { return size; }
                      private class Iter
                          implements Iterator<Map.Entry<String,String>> {
                              // Only one Entry object per Iterator:
                              private Entry entry = new Entry(-1);
                              public boolean hasNext() {
                                  return entry.index < size - 1;
                              }
                              public Map.Entry<String,String> next() {
                                  entry.index++;
                                  return entry;
                              }
                              public void remove() {
                                  throw new UnsupportedOperationException();
                              }
                          }


                      public
                          Iterator<Map.Entry<String,String>> iterator() {
                              return new Iter();
                          }
                  }

  [pg 577]

  The UnsupportedOperationException must be a rare event. That is, for most
  classes, all operations should work, and only in special cases should an
  operation be unsupported. This is true in the Java containers library, since
  the classes you’ll use 99 percent of the time—ArrayList, LinkedList, HashSet,
  and HashMap, as well as the other concrete implementations—support all of the
  operations.

  When an operation is unsupported, there should be reasonable likelihood that
  an UnsupportedOperationException will appear at implementation time, rather
  than after you’ve shipped the product to the customer. After all, it indicates
  a programming error: You’ve used an implementation incorrectly.

  It’s worth noting that unsupported operations are only detectable at run time,
  and therefore represent dynamic type checking. If you’re coming from a
  statically typed language like C++, Java might appear to be just another
  statically typed language. Java certainly has static type checking, but it
  also has a significant amount of dynamic typing, so it’s hard to say that it’s
  exactly one type of language or another. Once you begin to notice this, you’ll
  start to see other examples of dynamic type checking in Java.

  A common source of unsupported operations involves a container backed by a
  fixed-sized data structure.

  - LinkedHashSet

    Has the lookup speed of a HashSet, but internally maintains the order in
    which you add the elements (the insertion order) using a linked list. Thus,
    when you iterate through the Set, the results appear in insertion order.
    Elements must also define hashCode( ).

  The asterisk on HashSet indicates that, in the absence of other constraints,
  this should be your default choice because it is optimized for speed.

  Defining hashCode( ) will be described later in this chapter. You must create
  an equals( ) for both hashed and tree storage, but the hashCode( ) is
  necessary only if the class will be placed in a HashSet (which is likely,
  since that should generally be your first choice as a Set implementation) or
  LinkedHashSet. However, for good programming style, you should always override
  hashCode( ) when you override equals( ).

- Priority Queues

  Priority queues were given a simple introduction in the Holding Your Objects
  chapter. A more interesting problem is a to-do list, where each object
  contains a string and a primary and secondary priority value. The ordering of
  this list is again controlled by implementing Comparable:

  You can see how the ordering of the items happens automatically because of the
  priority queue.  [put into priority queue, most priority object goes out
  first, least one goes out last, uses Comparable interface]

- Deques

  A deque (double-ended queue) is like a queue, but you can add and remove
  elements from either end. There are methods in LinkedList that support deque
  operations, but there is no explicit interface for a deque in the Java
  standard libraries. Thus, LinkedList cannot implement this interface and you
  cannot upcast to a Deque interface as you can to a Queue in the previous
  example. However, you can create a Deque class using composition, and simply
  expose the relevant methods from LinkedList:

- Understanding Maps

   The standard Java library contains different basic implementations of Maps:
   HashMap, TreeMap, LinkedHashMap, WeakHashMap, ConcurrentHashMap, and
   IdentityHashMap. They all have the same basic Map interface, but they differ
   in behaviors including efficiency, the order in which the pairs are held and
   presented, how long the objects are held by the map, how the map works in
   multithreaded programs, and how key equality is determined. The number of
   implementations of the Map interface should tell you something about the
   importance of this tool.

- Performance

  Performance is a fundamental issue for maps, and it’s very slow to use a
  linear search in get( ) when hunting for a key. This is where HashMap speeds
  things up. Instead of a slow search for the key, it uses a special value
  called a hash code. The hash code is a way to take some information in the
  object in question and turn it into a "relatively unique" int for that object.
  hashCode( ) is a method in the root class Object, so all Java objects can
  produce a hash code. A HashMap takes the hashCode( ) of the object and uses it
  to quickly hunt for the key. This results in a dramatic performance
  improvement.

  The other implementations emphasize other characteristics, and are thus not as
  fast as HashMap.

- LinkedHashMap

  Like a HashMap, but when you iterate through it, you get the pairs in
  insertion order, or in least-recently-used (LRU) order. Only slightly slower
  than a HashMap, except when iterating, where it is faster due to the linked
  list used to maintain the internal ordering.

- WeakHashMap

  A map of weak keys that allow objects referred to by the map to be released;
  designed to solve certain types of problems. If no references to a particular
  key are held outside the map, that key may be garbage collected.

- ConcurrentHashMap

  A thread-safe Map which does not involve synchronization locking. This is
  discussed in the Concurrency chapter.

- IdentityHashMap

  A hash map that uses == instead of equals( ) to compare keys. Only for solving
  special types of problems; not for general use.

  ---

- SortedMap

  If you have a SortedMap (of which TreeMap is the only one available), the keys
  are guaranteed to be in sorted order, which allows additional functionality to
  be provided with these methods in the SortedMap interface:

- LinkedHashMap

  The LinkedHashMap hashes everything for speed, but also produces the pairs in
  insertion order during a traversal (System.out.println( ) iterates through the
  map, so you see the results of traversal). In addition, a LinkedHashMap can be
  configured in the constructor to use a leastrecently- used (LRU) algorithm
  based on accesses, so elements that haven’t been accessed (and thus are
  candidates for removal) appear at the front of the list. This allows easy
  creation of programs that do periodic cleanup in order to save space.

- Hashing and HashCode
  [pg628]

- Hashing for speed

  The whole point of hashing is speed: Hashing allows the lookup to happen
  quickly. Since the bottleneck is in the speed of the key lookup, one of the
  solutions to the problem is to keep the keys sorted and then use
  Collections.binarySearch( ) to perform the lookup (an exercise will walk you
  through this process).

  Hashing goes further by saying that all you want to do is to store the key
  somewhere in a way that it can be found quickly. The fastest structure in
  which to store a group of elements is an array, so that will be used for
  representing the key information (note that I said "key information," and not
  the key itself). But because an array cannot be resized, we have a problem: We
  want to store an indeterminate number of values in the Map, but if the number
  of keys is fixed by the array size, how can this be?

  The answer is that the array will not hold the keys. From the key object, a
  number will be derived that will index into the array. This number is the hash
  code, produced by the hashCode( ) method (in computer science parlance, this
  is the hash function) defined in Object and presumably overridden by your
  class.

  To solve the problem of the fixed-size array, more than one key may produce
  the same index.  That is, there may be collisions. Because of this, it doesn’t
  matter how big the array is; any key object’s hash code will land somewhere in
  that array.

  So the process of looking up a value starts by computing the hash code and
  using it to index into the array. If you could guarantee that there were no
  collisions (which is possible if you have a fixed number of values), then
  you’d have a perfect hashing junction, but that’s a special case 7 In all
  other cases, collisions are handled by external chaining: The array doesn’t
  point directly to a value, but instead to a list of values. These values are
  searched in a linear fashion using the equals( ) method. Of course, this
  aspect of the search is much slower, but if the hash function is good, there
  will only be a few values in each slot. So instead of searching through the
  entire list, you quickly jump to a slot where you only have to compare a few
  entries to find the value. This is much faster, which is why the HashMap is so
  quick.

- Overriding hashCode()

  First of all, you don’t control the creation of the actual value that’s used
  to index into the array of buckets. That is dependent on the capacity of the
  particular HashMap object, and that capacity changes depending on how full the
  container is, and what the load factor is (this term will be described later).
  Thus, the value produced by your hashCode( ) will be further processed in
  order to create the bucket index (in SimpleHashMap, the calculation is just a
  modulo by the size of the bucket array).

  The most important factor in creating a hashCode( ) is that, regardless of
  when hashCode( ) is called, it produces the same value for a particular object
  every time it is called. If you end up with an object that produces one
  hashCode( ) value when it is put( ) into a HashMap and another during a get(
  ), you won’t be able to retrieve the objects. So if your hashCode( ) depends
  on mutable data in the object, the user must be made aware that changing the
  data will produce a different key because it generates a different hashCode(
  ).

  In addition, you will probably nor want to generate a hashCode( ) that is
  based on unique object information—in particular, the value of this makes a
  bad hashCode( ) because then you can’t generate a new key identical to the one
  used to put( ) the original key-value pair.

  One example can be seen in the String class. Strings have the special
  characteristic that if a program has several String objects that contain
  identical character sequences, then those String objects all map to the same
  memory. So it makes sense that the hashCode( ) produced by two separate
  instances of the String "hello" should be identical.

  So, for a hashCode( ) to be effective, it must be fast and it must be
  meaningful; that is, it must generate a value based on the contents of the
  object. Remember that this value doesn’t have to be unique—you should lean
  toward speed rather than uniqueness—but between hashCode( ) and equals( ), the
  identity of the object must be completely resolved.

  Because the hashCode( ) is further processed before the bucket index is
  produced, the range of values is not important; it just needs to generate an
  int.

  There’s one other factor: A good hashCode( ) should result in an even
  distribution of values. If the values tend to cluster, then the HashMap or
  HashSet will be more heavily loaded in some areas and will not be as fast as
  it can be with an evenly distributed hashing function.


  In Effective JavaTM Programming Language Guide (Addison-Wesley, 2001), Joshua
  Bloch gives a basic recipe for generating a decent hashCode( ):

    Store some constant nonzero value, say 17, in an int variable called result.

    For each significant field in your object (that is, each field taken into
    account by the equals( ) method), calculate an int hash code c for the
    field:

    Combine the hash code(s) computed above: result = 37 * result + c;

    Return result.

     Look at the resulting hashCode( ) and make sure that equal instances have
     equal hash codes.

[performance test framework pg 640]



 Utilities found in java.util.Collections.

- Making a Collection or Map unmodifiable

  Collection<String> c =
  Collections.unmodifiableCollection( new ArrayList<String>(data));


- Synchronizing a Collection or Map

  The synchronized keyword is an important part of the subject of
  multithreading, a more complicated topic that will not be introduced until the
  Concurrency chapter. Here, I shall note only that the Collections class
  contains a way to automatically synchronize an entire container. The syntax is
  similar to the "unmodifiable" methods:

                Collection<String> c =
                Collections.synchronizedCollection(
                new ArrayList<String>());


- Fail Fast

  The Java containers also have a mechanism to prevent more than one process
  from modifying the contents of a container. The problem occurs if you’re in
  the middle of iterating through a container, and then some other process steps
  in and inserts, removes, or changes an object in that container. Maybe you’ve
  already passed that element in the container, maybe it’s ahead of you, maybe
  the size of the container shrinks after you call size( )—there are many
  scenarios for disaster. The Java containers library uses a fail-fast mechanism
  that looks for any changes to the container other than the ones your process
  is personally responsible for. If it detects that someone else is modifying
  the container, it immediately produces a ConcurrentModification- Exception.
  This is the "fail-fast" aspect—it doesn’t try to detect a problem later on
  using a more complex algorithm.

  The exception happens because something is placed in the container after the
  iterator is acquired from the container. The possibility that two parts of the
  program might modify the same container produces an uncertain state, so the
  exception notifies you that you should change your code—in this case, acquire
  the iterator after you have added all the elements to the container.

  The ConcurrentHashMap, CopyOnWriteArrayList, and CopyOnWriteArraySet use
  techniques that avoid ConcurrentModificationExceptions.


- Holding references

  The java.lang.ref library contains a set of classes that allow greater
  flexibility in garbage collection. These classes are especially useful when
  you have large objects that may cause memory exhaustion. There are three
  classes inherited from the abstract class Reference: SoftReference,
  WeakReference, and PhantomReference. Each of these provides a different level
  of indirection for the garbage collector if the object in question is only
  reachable through one of these Reference objects.

  If an object is reachable, it means that somewhere in your program the object
  can be found.  This could mean that you have an ordinary reference on the
  stack that goes right to the object, but you might also have a reference to an
  object that has a reference to the object in question; there can be many
  intermediate links. If an object is reachable, the garbage collector cannot
  release it because it’s still in use by your program. If an object isn’t
  reachable, there’s no way for your program to use it, so it’s safe to garbage
  collect that object.

  You use Reference objects when you want to continue to hold on to a reference
  to that object—you want to reach that object—but you also want to allow the
  garbage collector to release that object. Thus, you have a way to use the
  object, but if memory exhaustion is imminent, you allow that object to be
  released.

  You accomplish this by using a Reference object as an intermediary (a proxy)
  between you and the ordinary reference. In addition, there must be no ordinary
  references to the object (ones that are not wrapped inside Reference objects).
  If the garbage collector discovers that an object is reachable through an
  ordinary reference, it will not release that object.

  In the order of SoftReference, WeakReference, and PhantomReference, each one
  is "weaker" than the last and corresponds to a different level of
  reachability. Soft references are for implementing memory-sensitive caches.
  Weak references are for implementing "canonicalizing mappings"—where instances
  of objects can be simultaneously used in multiple places in a program, to save
  storage—that do not prevent their keys (or values) from being reclaimed.
  Phantom references are for scheduling pre-mortem cleanup actions in a more
  flexible way than is possible with the Java finalization mechanism.

  With SoftReferences and WeakReferences, you have a choice about whether to
  place them on a ReferenceQueue (the device used for premortem cleanup
  actions), but a PhantomReference can only be built on a ReferenceQueue. Here’s
  a simple demonstration:


          class VeryBig {
              private static final int SIZE = 10000;
              private long[] la = new long[SIZE];
              private String ident;
              public VeryBig(String id) { ident = id; }
              public String toString() { return ident; }
              protected void finalize() {
                  System.out.println("Finalizing " + ident);
              }
          }



        public class References {
            private static ReferenceQueue<VeryBig> rq =
                new ReferenceQueue<VeryBig>();
            public static void checkQueue() {
                Reference<? extends VeryBig> inq = rq.poll();
                if(inq != null)
                    System.out.println("In queue: " + inq.get());
            }
            public static void main(String[] args) {
                int size = 10;
                // Or, choose size via the command line:
                if(args.length > 0)
                    size = new Integer(args[0]);
                LinkedList<SoftReference<VeryBig>> sa =
                    new LinkedList<SoftReference<VeryBig>>();
                for(int i = 0; i < size; i++) {
                    sa.add(new SoftReference<VeryBig>(
                                new VeryBig("Soft " + i), rq));
                    System.out.println("Just created: " + sa.getLast());
                    checkQueue();
                }
                LinkedList<WeakReference<VeryBig>> wa =
                    new LinkedList<WeakReference<VeryBig>>();
                for(int i = 0; i < size; i++) {
                    wa.add(new WeakReference<VeryBig>(
                                new VeryBig("Weak " + i), rq));
                    System.out.println("Just created: " + wa.getLast());
                    checkQueue();
                }
                SoftReference<VeryBig> s =
                    new SoftReference<VeryBig>(new VeryBig("Soft"));
                WeakReference<VeryBig> w =
                    new WeakReference<VeryBig>(new VeryBig("Weak"));
                System.gc();
                LinkedList<PhantomReference<VeryBig>> pa =
                    new LinkedList<PhantomReference<VeryBig>>();
                for(int i = 0; i < size; i++) {
                    pa.add(new PhantomReference<VeryBig>(
                                new VeryBig("Phantom " + i), rq));
                    System.out.println("Just created: " + pa.getLast());
                    checkQueue();
                }
            }
        }

  When you run this program (you’ll want to redirect the output into a text file
  so that you can view the output in pages), you’ll see that the objects are
  garbage collected, even though you still have access to them through the
  Reference object (to get the actual object reference, you use get( )). You’ll
  also see that the ReferenceQueue always produces a Reference containing a null
  object. To use this, inherit from a particular Reference class and add more
  useful methods to the new class.

  [Reference queues, to which registered reference objects are appended by the
  garbage collector after the appropriate reachability changes are detected. ]

- WeakHashMap

  The containers library has a special Map to hold weak references: the
  WeakHashMap.  This class is designed to make the creation of canonicalized
  mappings easier. In such a mapping, you are saving storage by creating only
  one instance of a particular value. When the program needs that value, it
  looks up the existing object in the mapping and uses that (rather than
  creating one from scratch). The mapping may make the values as part of its
  initialization, but it’s more likely that the values are made on demand.

  Since this is a storage-saving technique, it’s very convenient that the
  WeakHashMap allows the garbage collector to automatically clean up the keys
  and values. You don’t have to do anything special to the keys and values you
  want to place in the WeakHashMap; these are automatically wrapped in
  WeakReferences by the map. The trigger to allow cleanup is that the key is no
  longer in use, as demonstrated here:


          class Element {
              private String ident;
              public Element(String id) { ident = id; }
              public String toString() { return ident; }
              public int hashCode() { return ident.hashCode(); }
              public boolean equals(Object r) {
                  return r instanceof Element &&
                      ident.equals(((Element)r).ident);
              }
              protected void finalize() {
                  System.out.println("Finalizing " +
                          getClass().getSimpleName() + " " + ident);
              }
          }
          class Key extends Element {
              public Key(String id) { super(id); }
          }
          class Value extends Element {
              public Value(String id) { super(id); }
          }
          public class CanonicalMapping {
              public static void main(String[] args) {
                  int size = 1000;
                  // Or, choose size via the command line:
                  if(args.length > 0)
                      size = new Integer(args[0]);
                  Key[] keys = new Key[size];
                  WeakHashMap<Key,Value> map =
                      new WeakHashMap<Key,Value>();
                  for(int i = 0; i < size; i++) {
                      Key k = new Key(Integer.toString(i));
                      Value v = new Value(Integer.toString(i));
                      if(i % 3 == 0)
                          keys[i] = k; // Save as "real" references
                      map.put(k, v);
                  }
                  System.gc();
              }
          }

  The Key class must have a hashCode( ) and an equals( ) since it is being used
  as a key in a hashed data structure. The subject of hashCode( ) was described
  earlier in this chapter.

  When you run the program, you’ll see that the garbage collector will skip
  every third key, because an ordinary reference to that key has also been
  placed in the keys array, and thus those objects cannot be garbage collected.

  [Vector and Enumeration pg 664]

  A soft reference is exactly like a weak reference, except that it is less
  eager to throw away the object to which it refers. An object which is only
  weakly reachable (the strongest references to it are WeakReferences) will be
  discarded at the next garbage collection cycle, but an object which is softly
  reachable will generally stick around for a while.

  SoftReferences on the other hand are good for caching external, recreatable
  resources as the GC typically delays clearing them. It is guaranteed though
  that all SoftReferences will get cleared before OutOfMemoryError is thrown, so
  they theoretically can't cause an OOME[*].

  Unlike soft and weak references, phantom references are not automatically
  cleared by the garbage collector as they are enqueued. An object that is
  reachable via phantom references will remain so until all such references are
  cleared or themselves become unreachable.

  ---
  To perform some postmortem cleanup on objects that garbage collector consider
  as unreachable, one can use finalization. This feature can be utilized to
  reclaim native resources associated with an object. However, finalizers have
  many problems associated.

  Firstly, we can’t foresee the call of finalize(). Since the Garbage Collection
  is unpredictable, the calling of finalize() cannot be predicted. There is no
  guarantee that the object will be garbage collected. The object might never
  become eligible for GC because it could be reachable through the entire
  lifetime of the JVM. It is also possible that no garbage collection actually
  runs from the time the object became eligible and before JVM stops.

  Secondly, Finalization can slowdown an application. Managing objects with a
  finalize() method takes more resources from the JVM than normal objects.

  An object is phantom reachable if it is neither strongly nor softly nor weakly
  reachable and has been finalized and there is a path from the roots to it that
  contains at least one phantom reference.

  Phantom Reference can be used in situations, where sometime using finalize()
  is not sensible thing to do.This reference type differs from the other types
  defined in java.lang.ref Package because it isn't meant to be used to access
  the object, but as a signal that the object has already been finalized, and
  the garbage collector is ready to reclaim its memory.

  Phantom references are safe way to know an object has been removed from
  memory. For instance, consider an application that deals with large images.
  Suppose that we want to load a big image in to memory when large image is
  already in memory which is ready for garbage collected. In such case, we want
  to wait until the old image is collected before loading a new one. Here, the
  phantom reference is flexible and safely option to choose. The reference of
  the old image will be enqueued in the ReferenceQueue once the old image object
  is finalized. After receiving that reference, we can load the new image in to
  memory.

  Similarly we can use Phantom References to implement a Connection Pool. We can
  easily gain control over the number of open connections, and can block until
  one becomes available.

  Soft Reference can be garbage collected after there are no strong references
  to the referent. However, it typically retained until memory is low. All
  softly reachable objects will be reclaimed before an OutOfMemoryException is
  thrown. Therefore, it can be used to implement caches of objects that can be
  recreated if needed.

  Weak Reference can be garbage collected when there are no strong or soft
  references to the referent.  However, unlike Soft Reference, they are garbage
  collected on a gc even when memory is abundant.  They often can be used for
  “canonical mappings” where each object has a unique identifier (one-to-one),
  and in collections of “listeners”

  On the other hand, Phantom Reference, can be garbage collected once there are
  no strong, soft or weak references to the referent. When object is phantomly
  reachable, it means the object is already finalized but not yet reclaimed, so
  the GC enqueues it in a ReferenceQueue for post-finalization processing.

  A PhantomReference is not automatically cleared when it is enqueued, so when
  we remove a PhantomReference from a ReferenceQueue, we must call its clear()
  method or allow the PhantomReference object itself to be garbage-collected.

  [so use Phantom when the object is about to get garbage collected, and call
  the appropriate functions it that object to clean it up? - Is that true? it
  seems to return null when you call get...]

* I/O

  The challenge seems to be in covering all possibilities. Not only are there
  different sources and sinks of I/O that you want to communicate with (files,
  the console, network connections, etc.), but you need to talk to them in a
  wide variety of ways (sequential, random-access, buffered, binary, character,
  by lines, by words, etc.). The Java library designers attacked this problem by
  creating lots of classes. In fact, there are so many classes for Java’s I/O
  system that it can be intimidating at first (ironically, the Java I/O design
  actually prevents an explosion of classes).

- The File class

  The File class has a deceiving name; you might think it refers to a file, but
  it doesn’t. In fact, "FilePath" would have been a better name for the class.
  It can represent either the name of a particular file or the names of a set of
  files in a directory. If it’s a set of files, you can ask for that set using
  the list( ) method, which returns an array of String. It makes sense to return
  an array rather than one of the flexible container classes, because the number
  of elements is fixed, and if you want a different directory listing, you just
  create a different File object. This section shows an example of the use of
  this class, including the associated FilenameFilter interface.

- A directory lister

  Suppose you’d like to see a directory listing. The File object can be used in
  two ways. If you call list( ) with no arguments, you’ll get the full list that
  the File object contains. However, if you want a restricted list—for example,
  if you want all of the files with an extension of .Java— then you use a
  "directory filter," which is a class that tells how to select the File objects
  for display. Here’s the example. Note that the result has been effortlessly
  sorted (alphabetically) using the java.util.Arrays.sort( ) method and the
  String.CASE_INSENSITIVE_ORDER Comparator:

          public class DirList {
              public static void main(String[] args) {
                  File path = new File(".");
                  String[] list;
                  if(args.length == 0)
                      list = path.list();
                  else
                      list = path.list(new DirFilter(args[0]));
                  Arrays.sort(list, String.CASE_INSENSITIVE_ORDER);
                  for(String dirItem : list)
                      System.out.println(dirItem);
              }
          }
          class DirFilter implements FilenameFilter {
              private Pattern pattern;
              public DirFilter(String regex) {
                  pattern = Pattern.compile(regex);
              }
              public boolean accept(File dir, String name) {
                  return pattern.matcher(name).matches();
              }
          }

  The DirFilter class implements the interface FilenameFilter. Notice how simple
  the FilenameFilter interface is:

          public interface FilenameFilter {
              boolean accept(File dir, String name);
          }

  DirFilter’s sole reason for existence is to provide the accept( ) method to
  the list( ) method so that list( ) can "call back" accept( ) to determine
  which file names should be included in the list. Thus, this structure is often
  referred to as a callback. More specifically, this is an example of the
  Strategy design pattern, because list( ) implements basic functionality, and
  you provide the Strategy in the form of a FilenameFilter in order to complete
  the algorithm necessary for list( ) to provide its service.

  Because list( ) takes a FilenameFilter object as its argument, it means that
  you can pass an object of any class that implements FilenameFilter to choose
  (even at run time) how the list( ) method will behave. The purpose of a
  Strategy is to provide flexibility in the behavior of code.

  The accept( ) method must accept a File object representing the directory that
  a particular file is found in, and a String containing the name of that file.
  Remember that the list( ) method is calling accept( ) for each of the file
  names in the directory object to see which one should be included; this is
  indicated by the boolean result returned by accept( ).

  - Anonymous inner classes

    This example is ideal for rewriting using an anonymous inner class. [pg 671,
    example is trivial]

    [skipped whole sections]

- Input and Output

  Programming language I/O libraries often use the abstraction of a stream,
  which represents any data source or sink as an object capable of producing or
  receiving pieces of data. The stream hides the details of what happens to the
  data inside the actual I/O device.

  The Java library classes for I/O are divided by input and output.

  Through inheritance, everything derived from the InputStream or Reader classes
  has basic methods called read(  ) for reading a single byte or an array of
  bytes. Likewise, everything derived from OutputStream or Writer classes has
  basic methods called write(  ) for writing a single byte or an array of bytes.

  However, you won’t generally use these methods; they exist so that other
  classes can use them—these other classes provide a more useful interface.
  Thus, you’ll rarely create your stream object by using a single class, but
  instead will layer multiple objects together to provide your desired
  functionality (this is the Decorator design pattern, as you shall see in this
  section). The fact that you create more than one object to produce a single
  stream is the primary reason that Java’s I/O library is confusing.

  ##############################################################################
  It’s helpful to categorize the classes by their functionality. In Java l.o,
  the library designers started by deciding that all classes that had anything
  to do with input would be inherited from InputStream, and all classes that
  were associated with output would be inherited from OutputStream.
  ##############################################################################

- Types of InputStream

  InputStream’s job is to represent classes that produce input from different
  sources.

  - array of bytes
  - string object
  - file
  - pipe
  - sequence of other streams, collect them together into a single stream
  - other sources, such as internet connection

  Each of these has an associated subclass of InputStream. In addition, the
  FilterInputStream is also a type of InputStream, to provide a base class for
  "decorator" classes that attach attributes or useful interfaces to input
  streams.

  [pg 679 - must view table]

  e.g -> FileInputStream , for reading information from a file


- Types of OutputStream

  This category includes the classes that decide where your output will go: an
  array of bytes (but not a String—presumably, you can create one using the
  array of bytes ), a file, or a "pipe."

  e.g -> FileOutputStream, for sending information to a file

  The reason for the existence of the "filter" classes in the Java I/O library
  is that the abstract "filter" class is the base class for all the decorators.
  A decorator must have the same interface as the object it decorates, but the
  decorator can also extend the interface, which occurs in several of the
  "filter" classes.

  The classes that provide the decorator interface to control a particular
  InputStream or OutputStream are the FilterlnputStream and FilterOutputStream,
  which don’t have very intuitive names. FilterlnputStream and
  FilterOutputStream are derived from the base classes of the I/O library,
  InputStream and OutputStream, which is a key requirement of the decorator (so
  that it provides the common interface to all the objects that are being
  decorated).

- Reading from an InputStream with FilterInputStream

  The FilterlnputStream classes accomplish two significantly different things.
  DatalnputStream allows you to read different types of primitive data as well
  as String objects. (All the methods start with "read," such as readByte(  ),
  readFloat(), etc. ) This, along with its companion DataOutputStream, allows
  you to move primitive data from one place to another via a stream.

  The remaining FilterlnputStream classes modify the way an InputStream behaves
  internally: whether it’s buffered or unbuffered, whether it keeps track of the
  lines it’s reading (allowing you to ask for line numbers or set the line
  number ), and whether you can push back a single character. The last two
  classes look a lot like support for building a compiler (they were probably
  added to support the experiment of "building a Java compiler in Java"), so you
  probably won’t use them in general programming.

  You’ll need to buffer your input almost every time, regardless of the I/O
  device you’re connecting to, so it would have made more sense for the I/O
  library to have a special case (or simply a method call) for unbuffered input
  rather than buffered input.

- Writing to an OutputStream with FilterOutputStream

  The complement to DatalnputStream is DataOutputStream, which formats each of
  the primitive types and String objects onto a stream in such a way that any
  DatalnputStream, on any machine, can read them. All the methods start with
  "write," such as writeByte(  ), writeFloat(  ), etc.


  The original intent of PrintStream was to print all of the primitive data
  types and String objects in a viewable format. This is different from
  DataOutputStream, whose goal is to put data elements on a stream in a way that
  DatalnputStream can portably reconstruct them.

  The two important methods in PrintStream are print(  ) and println(  ), which
  are overloaded to print all the various types. The difference between print(
  ) and println(  ) is that the latter adds a newline when it’s done.

  PrintStream can be problematic because it traps all IOExceptions (you must
  explicitly test the error status with checkError(  ), which returns true if an
  error has occurred). Also, PrintStream doesn’t internationalize properly and
  doesn’t handle line breaks in a platform- independent way. These problems are
  solved with PrintWriter, described later.

  BufferedOutputStream is a modifier and tells the stream to use buffering so
  you don’t get a physical write every time you write to the stream. You’ll
  probably always want to use this when doing output.


  [pg 683 for table]

  PrintStream:
  For producing formatted output. While DataOutputStream handles the storage of
  data, PrintStream handles display.


- Readers and Writers

  Java 1.1 made significant modifications to the fundamental I/O stream library.
  When you see the Reader and Writer classes, your first thought (like mine )
  might be that these were meant to replace the InputStream and OutputStream
  classes.

  But that’s not the case.  Although some aspects of the original streams
  library are deprecated (if you use them you will receive a warning from the
  compiler), the InputStream and OutputStream classes still provide valuable
  functionality in the form of byte-oriented I/O, whereas the Reader and Writer
  classes provide Unicode-compliant, character-based I/O.

  There are times when you must use classes from the "byte" hierarchy in
  combination with classes in the "character" hierarchy. To accomplish this,
  there are "adapter" classes: InputStreamReader converts an InputStream to a
  Reader, and OutputStreamWriter converts an OutputStream to a Writer.

  The most important reason for the Reader and Writer hierarchies is for
  internationalization. The old I/O stream hierarchy supports only 8-bit byte
  streams and doesn’t handle the 16-bit Unicode characters well. Since Unicode
  is used for internationalization (and Java’s native char is 16-bit Unicode ),
  the Reader and Writer hierarchies were added to support Unicode in all I/O
  operations. In addition, the new libraries are designed for faster operations
  than the old.

- Sources and sinks of data

  Almost all of the original Java I/O stream classes have corresponding Reader
  and Writer classes to provide native Unicode manipulation. However, there are
  some places where the byte-oriented InputStreams and OutputStreams are the
  correct solution; in particular, thejava.util.zip libraries are byte-oriented
  rather than char-oriented. So the most sensible approach to take is to try to
  use the Reader and Writer classes whenever you can. You’ll discover the
  situations when you have to use the byte-oriented libraries because your code
  won’t compile.

  e.g InputStream -> Reader, FileInputStream -> FileReader,
      PipedInputStream -> PipedReader


- Modifying stream behaviour

  For InputStreams and OutputStreams, streams were adapted for particular needs
  using "decorator" subclasses of FilterInputStream and FilterOutputStream. The
  Reader and Writer class hierarchies continue the use of this idea—but not
  exactly.

  [pg 685 for table, must read]

  e.g BufferedInputStream -> BufferedReader

  There’s one direction that’s quite clear: Whenever you want to use readLine(),
  you shouldn’t do it with a DataInputStream (this is met with a deprecation
  message at compile time), but instead use a BufferedReader. Other than this,
  DataInputStream is still a "preferred" member of the I/O library.

- Off by itself: RandomAccessFile

  RandomAccessFile is used for files containing records of known size so that
  you can move from one record to another using seek(  ), then read or change
  the records.  The records don’t have to be the same size; you just have to
  determine how big they are and where they are placed in the file.

  At first it’s a little bit hard to believe that RandomAccessFile is not part
  of the InputStream or OutputStream hierarchy. However, it has no association
  with those hierarchies other than that it happens to implement the DataInput
  and DataOutput interfaces (which are also implemented by DataInputStream and
  DataOutputStream).  It doesn’t even use any of the functionality of the
  existing InputStream or OutputStream classes; it’s a completely separate
  class, written from scratch, with all of its own (mostly native) methods. The
  reason for this may be that RandomAccessFile has essentially different
  behavior than the other I/O types, since you can move forward and backward
  within a file. In any event, it stands alone, as a direct descendant of
  Object.

  Essentially, a RandomAccessFile works like a DataInputStream pasted together
  with a DataOutputStream, along with the methods getFilePointer(  ) to find out
  where you are in the file, seek(  ) to move to a new point in the file, and
  length(  ) to determine the maximum size of the file. In addition, the
  constructors require a second argument (identical to fopen(  ) in C)
  indicating whether you are just randomly reading ("r") or reading and writing
  ("rw"). There’s no support for write-only files, which could suggest that
  RandomAccessFile might have worked well if it were inherited from
  DataInputStream.

  The seeking methods are available only in RandomAccessFile, which works for
  files only.  BufferedInputStream does allow you to mark(  ) a position (whose
  value is held in a single internal variable) and reset(  ) to that position,
  but this is limited and not very useful.

  Most, if not all, of the RandomAccessFile functionality is superseded as of
  JDK 1.4 with the nio memory-mapped files, which will be described later in
  this chapter.

- Typical uses of I/O streams

  Although you can combine the I/O stream classes in many different ways, you’ll
  probably just use a few combinations.

  [reference of eg start pg 687]
    [read: general usages of input and output]
  pg689


  [pg 701: New I/O]

- New I/O

  The Java "new" I/O library, introduced in JDK 1.4 in the java.nio.* packages,
  has one goal: speed. In fact, the "old" I/O packages have been reimplemented
  using nio in order to take advantage of this speed increase, so you will
  benefit even if you don’t explicitly write code with nio.

  The speed comes from using structures that are closer to the operating
  system’s way of performing I/O: channels and buffers. You could think of it as
  a coal mine; the channel is the mine containing the seam of coal (the data ),
  and the buffer is the cart that you send into the mine. The cart comes back
  full of coal, and you get the coal from the cart.  That is, you don’t interact
  directly with the channel; you interact with the buffer and send the buffer
  into the channel. The channel either pulls data from the buffer, or puts data
  into the buffer.

  The only kind of buffer that communicates directly with a channel is a
  ByteBuffer—that is, a buffer that holds raw bytes. If you look at the JDK
  documentation for java.nio.ByteBuffer, you’ll see that it’s fairly basic: You
  create one by telling it how much storage to allocate, and there are methods
  to put and get data, in either raw byte form or as primitive data types. But
  there’s no way to put or get an object, or even a String. It’s fairly
  low-level, precisely because this makes a more efficient mapping with most
  operating systems.

  Three of the classes in the "old" I/O have been modified so that they produce
  a FileChannel: FileInputStream, FileOutputStream, and, for both reading and
  writing, RandomAccessFile. Notice that these are the byte manipulation
  streams, in keeping with the low-level nature of nio. The Reader and Writer
  character-mode classes do not produce channels, but the
  java.nio.channels.Channels class has utility methods to produce Readers and
  Writers from channels.

  Here’s a simple example that exercises all three types of stream to produce
  channels that are
  writeable, read/writeable, and readable:


      //: io/GetChannel.java
      // Getting channels from streams
      import java.nio.*;
      import java.nio.channels.*;
      import java.io.*;

      public class GetChannel {
          private static final int BSIZE = 1024;
          public static void main(String[] args) throws Exception {
              // Write a file:
              FileChannel fc =
              new FileOutputStream("data.txt").getChannel();
              fc.write(ByteBuffer.wrap("Some text ".getBytes()));

              fc.close();
              // Add to the end of the file:
              fc =
              new RandomAccessFile("data.txt", "rw").getChannel();
              fc.position(fc.size()); // Move to the end
              fc.write(ByteBuffer.wrap("Some more".getBytes()));
              fc.close();
              // Read the file:
              fc = new FileInputStream("data.txt").getChannel();
              ByteBuffer buff = ByteBuffer.allocate(BSIZE);
              fc.read(buff);
              buff.flip();
              while(buff.hasRemaining())
                  System.out.print((char)buff.get());
         }
      } /* Output:
              Some text Some more
       *///

  For any of the stream classes shown here, getChannel(  ) will produce a
  FileChannel. A channel is fairly basic: You can hand it a ByteBuffer for
  reading or writing, and you can lock regions of the file for exclusive access
  (this will be described later ).

  One way to put bytes into a ByteBuffer is to stuff them in directly using one
  of the "put" methods, to put one or more bytes, or values of primitive types.
  However, as seen here, you can also "wrap" an existing byte array in a
  ByteBuffer using the wrap(  ) method. When you do this, the underlying array
  is not copied, but instead is used as the storage for the generated
  ByteBuffer. We say that the ByteBuffer is "backed by" the array.

  The data.txt file is reopened using a RandomAccessFile. Notice that you can
  move the FileChannel around in the file; here, it is moved to the end so that
  additional writes will be appended.

  For read-only access, you must explicitly allocate a ByteBuffer using the
  static allocate(  ) method. The goal of nio is to rapidly move large amounts
  of data, so the size of the ByteBuffer should be significant—in fact, the lK
  used here is probably quite a bit smaller than you’d normally want to use
  (you’ll have to experiment with your working application to find the best
  size).

  It’s also possible to go for even more speed by using allocateDirect(  )
  instead of allocate(  ) to produce a "direct" buffer that may have an even
  higher coupling with the operating system. However, the overhead in such an
  allocation is greater, and the actual implementation varies from one operating
  system to another, so again, you must experiment with your working application
  to discover whether direct buffers will buy you any advantage in speed.

  Once you call read(  ) to tell the FileChannel to store bytes into the
  ByteBuffer, you must call flip(  ) on the buffer to tell it to get ready to
  have its bytes extracted (yes, this seems a bit crude, but remember that it’s
  very low-level and is done for maximum speed).  And if we were to use the
  buffer for further read(  ) operations, we’d also have to call clear(  ) to
  prepare it for each read(  ). You can see this in a simple file-copying
  program:

    //: io/ChannelCopy.java
    // Copying a file using channels and buffers
    // {Args: ChannelCopy.java test.txt }
    import java.nio.*;
    import java.nio.channels.*;
    import java.io.*;
    public class ChannelCopy {
        private static final int BSIZE = 1024;
        public static void main(String[] args) throws Exception {
            if(args.length != 2 ) {
                System.out.println("arguments: sourcefile destfile");
                System.exit(1);

            }
            FileChannel
            in = new FileInputStream(args[0]).getChannel(),
            out = new FileOutputStream(args[1]).getChannel();
            ByteBuffer buffer = ByteBuffer.allocate(BSIZE);
            while(in.read(buffer) != -1) {
                buffer.flip(); // Prepare for writing
                out.write(buffer);
                buffer.clear(); // Prepare for reading
            }
        }
    } ///:~

  You can see that one FileChannel is opened for reading, and one for writing. A
  ByteBuffer is allocated, and when FileChannel.read(  ) returns -1 (a holdover,
  no doubt, from Unix and C), it means that you’ve reached the end of the input.
  After each read(), which puts data into the buffer, flip(  ) prepares the
  buffer so that its information can be extracted by the write(  ). After the
  write(  ), the information is still in the buffer, and clear(  ) resets all
  the internal pointers so that it’s ready to accept data during another read().

  The preceding program is not the ideal way to handle this kind of operation,
  however. Special methods transferTo(  ) and transferFrom(  ) allow you to
  connect one channel directly to another:

    //: io/TransferTo.java
    // Using transferTo() between channels
    // {Args: TransferTo.java TransferTo.txt }
    import java.nio.channels.*;
    import java.io.*;
    public class TransferTo {
        public static void main(String[] args) throws Exception {
            if(args.length != 2 ) {
                System.out.println("arguments: sourcefile destfile");
                System.exit(1);

            }
            FileChannel
            in = new FileInputStream(args[0]).getChannel(),
            out = new FileOutputStream(args[1]).getChannel();
            in.transferTo(0, in.size(), out);
            // Or:
            // out.transferFrom(in, 0, in.size() );

        }

    } ///:~

- Converting data

  If you look back at GetChannel.java, you’ll notice that, to print the
  information in the file, we are pulling the data out one byte at a time and
  casting each byte to a char. This seems a bit primitive—if you look at the
  java.nio.CharBuffer class, you’ll see that it has a toString(  ) method that
  says, "Returns a string containing the characters in this buffer." Since a
  ByteBuffer can be viewed as a CharBuffer with the asCharBuffer(  ) method, why
  not use that? As you can see from the first line in the output statement
  below, this doesn’t work out:

    //: io/BufferToText.java
    // Converting text to and from ByteBuffers
    import java.nio.*;
    import java.nio.channels.*;
    import java.nio.charset.*;
    import java.io.*;
    public class BufferToText {
        private static final int BSIZE = 1024;
        public static void main(String[] args) throws Exception {
            FileChannel fc =
            new FileOutputStream("data2.txt").getChannel();
            fc.write(ByteBuffer.wrap("Some text".getBytes()));
            fc.close();
            fc = new FileInputStream("data2.txt").getChannel();
            ByteBuffer buff = ByteBuffer.allocate(BSIZE);
            fc.read(buff);
            buff.flip();
            // Doesn’t work:
            System.out.println(buff.asCharBuffer());
            // Decode using this system’s default Charset:
            buff.rewind();
            String encoding = System.getProperty("file.encoding");
            System.out.println("Decoded using " + encoding + ": "
            + Charset.forName(encoding).decode(buff));
            // Or, we could encode with something that will print:
            fc = new FileOutputStream("data2.txt").getChannel();
            fc.write(ByteBuffer.wrap(
            "Some text".getBytes("UTF-16BE")
                        ));
            fc.close();
            // Now try reading again:
            fc = new FileInputStream("data2.txt").getChannel();
            buff.clear();
            fc.read(buff);
            buff.flip();
            System.out.println(buff.asCharBuffer());
            // Use a CharBuffer to write through:
            fc = new FileOutputStream("data2.txt").getChannel();
            buff = ByteBuffer.allocate(24); // More than needed
            buff.asCharBuffer().put("Some text");
            fc.write(buff);
            fc.close();
            // Read and display:
            fc = new FileInputStream("data2.txt").getChannel();
            buff.clear();
            fc.read(buff);
            buff.flip();
            System.out.println(buff.asCharBuffer());

        }

    } /* Output:
    ????
    Decoded using Cp1252: Some text
    Some text
    Some text
    *///:~

  [continued java.nio pg 705]

- memory-mapped files

  Memory-mapped files allow you to create and modify files that are too big to
  bring into memory. With a memory-mapped file, you can pretend that the entire
  file is in memory and that you can access it by simply treating it as a very
  large array. This approach greatly simplifies the code you write in order to
  modify the file. Here’s a small example:

    //: io/LargeMappedFiles.java
    // Creating a very large file using mapping.
    // {RunByHand}
    import java.nio.*;
    import java.nio.channels.*;
    import java.io.*;
    import static net.mindview.util.Print.*;
    public class LargeMappedFiles {
        static int length = 0x8FFFFFF; // 128 MB
        public static void main(String[] args) throws Exception {
            MappedByteBuffer out =
            new RandomAccessFile("test.dat", "rw").getChannel()
            .map(FileChannel.MapMode.READ_WRITE, 0, length );
            for(int i = 0; i < length; i++ )
                out.put((byte)’x’);
                print("Finished writing");
                for(int i = length/2; i < length/2 + 6; i++ )
                    printnb((char)out.get(i));

        }

    } ///:~

  To do both writing and reading, we start with a RandomAccessFile, get a
  channel for that file, and then call map(  ) to produce a MappedByteBuffer,
  which is a particular kind of direct buffer. Note that you must specify the
  starting point and the length of the region that you want to map in the file;
  this means that you have the option to map smaller regions of a large file.

  MappedByteBuffer is inherited from ByteBuffer, so it has all of ByteBuffer’s
  methods.  Only the very simple uses of put(  ) and get(  ) are shown here, but
  you can also use methods like asCharBuffer(  ), etc.

  The file created with the preceding program is 128 MB long, which is probably
  larger than your OS will allow in memory at one time. The file appears to be
  accessible all at once because only portions of it are brought into memory,
  and other parts are swapped out. This way a very large file (up to 2 GB ) can
  easily be modified. Note that the file-mapping facilities of the underlying
  operating system are used to maximize performance.

- Performance

  Although the performance of "old" stream I/O has been improved by implementing
  it with nio, mapped file access tends to be dramatically faster.

- File locking

  File locking allows you to synchronize access to a file as a shared resource.
  However, two threads that contend for the same file may be in different JVMs,
  or one may be a Java thread and the other some native thread in the operating
  system. The file locks are visible to other operating system processes because
  Java file locking maps directly to the native operating system locking
  facility.
  [pg 717]

- Compression [pg720]



- Object Serialiazation [pg 725]

  When you create an object, it exists for as long as you need it, but under no
  circumstances does it exist when the program terminates. While this makes
  sense at first, there are situations in which it would be incredibly useful if
  an object could exist and hold its information even while the program wasn’t
  running. Then, the next time you started the program, the object would be
  there and it would have the same information it had the previous time the
  program was running. Of course, you can get a similar effect by writing the
  information to a file or to a database, but in the spirit of making everything
  an object, it would be quite convenient to declare an object to be
  "persistent," and have all the details taken care of for you.

  Java’s object serialization allows you to take any object that implements the
  Serializable interface and turn it into a sequence of bytes that can later be
  fully restored to regenerate the original object. This is even true across a
  network, which means that the serialization mechanism automatically
  compensates for differences in operating systems. That is, you can create an
  object on a Windows machine, serialize it, and send it across the network to a
  Unix machine, where it will be correctly reconstructed. You don’t have to
  worry about the data representations on the different machines, the byte
  ordering, or any other details.

  By itself, object serialization is interesting because it allows you to
  implement lightweight persistence. Persistence means that an object’s lifetime
  is not determined by whether a program is executing; the object lives in
  between invocations of the program.  By taking a serializable object and
  writing it to disk, then restoring that object when the program is reinvoked,
  you’re able to produce the effect of persistence. The reason it’s called
  "lightweight" is that you can’t simply define an object using some kind of
  "persistent" keyword and let the system take care of the details (perhaps this
  will happen in the future ).  Instead, you must explicitly serialize and
  deserialize the objects in your program. If you need a more serious
  persistence mechanism, consider a tool like Hibernate

  Object serialization was added to the language to support two major features.
  Java’s Remote Method Invocation (RMI) allows objects that live on other
  machines to behave as if they live on your machine. When messages are sent to
  remote objects, object serialization is necessary to transport the arguments
  and return values. RMI is discussed in Thinking in Enterprise Java. Object
  serialization is also necessary for JavaBeans, described in the Graphical User
  Interfaces chapter. When a Bean is used, its state information is generally
  configured at design time. This state information must be stored and later
  recovered when the program is started; object serialization performs this
  task.

  Serializing an object is quite simple as long as the object implements the
  Serializable interface (this is a tagging interface and has no methods ). When
  serialization was added to the language, many standard library classes were
  changed to make them serializable, including all of the wrappers for the
  primitive types, all of the container classes, and many others. Even Class
  objects can be serialized.


  To serialize an object, you create some sort of OutputStream object and then
  wrap it inside an ObjectOutputStream object. At this point you need only call
  writeObject(), and your object is serialized and sent to the OutputStream
  (object serialization is byte-oriented, and thus uses the InputStream and
  OutputStream hierarchies). To reverse the process, you wrap an InputStream
  inside an ObjectlnputStream and call readObject(  ). What comes back is, as
  usual, a reference to an upcast Object, so you must downcast to set things
  straight.

  A particularly clever aspect of object serialization is that it not only saves
  an image of your object, but it also follows all the references contained in
  your object and saves those objects, and follows all the references in each of
  those objects, etc. This is sometimes referred to as the "web of objects" that
  a single object can be connected to, and it includes arrays of references to
  objects as well as member objects. If you had to maintain your own object
  serialization scheme, maintaining the code to follow all these links could be
  mindboggling.  However, Java object serialization seems to pull it off
  flawlessly, no doubt using an optimized algorithm that traverses the web of
  objects. The following example tests the serialization mechanism by making a
  "worm" of linked objects, each of which has a link to the next segment in the
  worm as well as an array of references to objects of a different class, Data:

    //: io/Worm.java
    // Demonstrates object serialization.
    import java.io.*;
    import java.util.*;
    import static net.mindview.util.Print.*;
    class Data implements Serializable {
        private int n;
        public Data(int n ) { this.n = n;  }
        public String toString() { return Integer.toString(n);  }

    }
    public class Worm implements Serializable {
        private static Random rand = new Random(47);
        private Data[] d = {
            new Data(rand.nextInt(10)),
            new Data(rand.nextInt(10)),
            new Data(rand.nextInt(10))

        };
        private Worm next;
        private char c;
        // Value of i == number of segments
        public Worm(int i, char x ) {
            print("Worm constructor: " + i);
            c = x;
            if(--i > 0 )
                next = new Worm(i, (char)(x + 1 ) );

        }
        public Worm() {
            print("Default constructor");

        }
        public String toString() {
            StringBuilder result = new StringBuilder(":");
            result.append(c);
            result.append("(");
            for(Data dat : d )
                result.append(dat);
            result.append(")");
            if(next != null )
                result.append(next);
             return result.toString();
        }
        public static void main(String[] args)
            throws ClassNotFoundException, IOException {
                Worm w = new Worm(6, ‘a’ );
                print("w = " + w);
                ObjectOutputStream out = new ObjectOutputStream(
                new FileOutputStream("worm.out")
                        );
                out.writeObject("Worm storage\n");
                out.writeObject(w);
                out.close(); // Also flushes output
                ObjectInputStream in = new ObjectInputStream(
                new FileInputStream("worm.out")
                        );
                String s = (String)in.readObject();
                Worm w2 = (Worm)in.readObject();
                print(s + "w2 = " + w2 );
                ByteArrayOutputStream bout =
                new ByteArrayOutputStream();
                ObjectOutputStream out2 = new ObjectOutputStream(bout);
                out2.writeObject("Worm storage\n");
                out2.writeObject(w);
                out2.flush();
                ObjectInputStream in2 = new ObjectInputStream(
                new ByteArrayInputStream(bout.toByteArray())
                        );
                s = (String)in2.readObject();
                Worm w3 = (Worm)in2.readObject();
                print(s + "w3 = " + w3 );
            }
    } /* Output:
    Worm constructor: 6
    Worm constructor: 5
    Worm constructor: 4
    Worm constructor: 3
    Worm constructor: 2
    Worm constructor: 1
    w = :a(853):b(119):c(802):d(788):e(199):f(881)
    Worm storage
    w2 = :a(853):b(119):c(802):d(788):e(199):f(881)
    Worm storage
    w3 = :a(853):b(119):c(802):d(788):e(199):f(881)
    *///:~

  To make things interesting, the array of Data objects inside Worm are
  initialized with random numbers. (This way, you don’t suspect the compiler of
  keeping some kind of meta- information.) Each Worm segment is labeled with a
  char that’s automatically generated in the process of recursively generating
  the linked list of Worms. When you create a Worm, you tell the constructor how
  long you want it to be. To make the next reference, it calls the Worm
  constructor with a length of one less, etc. The final next reference is left
  as null, indicating the end of the Worm.

  The point of all this was to make something reasonably complex that couldn’t
  easily be serialized. The act of serializing, however, is quite simple. Once
  the ObjectOutputStream is created from some other stream, writeObject(  )
  serializes the object.  Notice the call to writeObject(  ) for a String, as
  well. You can also write all the primitive data types using the same methods
  as DataOutputStream (they share the same interface ).

  There are two separate code sections that look similar. The first writes and
  reads a file, and the second, for variety, writes and reads a ByteArray. You
  can read and write an object using serialization to any DataInputStream or
  DataOutputStream, including, as you can see in Thinking in Enterprise Java, a
  network.

  You can see from the output that the deserialized object really does contain
  all of the links that were in the original object.

  Note that no constructor, not even the default constructor, is called in the
  process of deserializing a Serializable object. The entire object is restored
  by recovering data from the InputStream.

  [continued serialization pg 728]



- XML [pg 740]

  An important limitation of object serialization is that it is a Java-only
  solution: Only Java programs can deserialize such objects. A more
  interoperable solution is to convert data to XML format, which allows it to be
  consumed by a large variety of platforms and languages.

  Because of its popularity, there are a confusing number of options for
  programming with XML, including the javax.xml.* libraries distributed with the
  JDK. I’ve chosen to use Elliotte Rusty Harold’s open-source XOM library
  (downloads and documentation at www.xom.nu) because it seems to be the
  simplest and most straightforward way to produce and modify XML using Java. In
  addition, XOM emphasizes XML correctness.

  [continued explanation on XOM]


- Preferences [pg 743]

  The Preferences API is much closer to persistence than it is to object
  serialization, because it automatically stores and retrieves your information.
  However, its use is restricted to small and limited data sets—you can only
  hold primitives and Strings, and the length of each stored String can’t be
  longer than 8K (not tiny, but you don’t want to build anything serious with
  it, either). As the name suggests, the Preferences API is designed to store
  and retrieve user preferences and program-configuration settings.

  Preferences are key-value sets (like Maps ) stored in a hierarchy of nodes.
  Although the node hierarchy can be used to create complicated structures, it’s
  typical to create a single node named after your class and store the
  information there.
  [eg on pg 743]



* Enumerated Types

  [pg 747]
