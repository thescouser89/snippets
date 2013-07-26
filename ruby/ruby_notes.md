* The structure and execution of Ruby programs

# Lexical Structure

The Ruby interpreter parses a program as a sequence of tokens. Tokens include
comments, literals, punctuation, identifiers, and keywords.


## Comments

Comments in Ruby begin with a # character and continue to the end of the line.
The Ruby interpreter ignores the # character and any text that follows it (but
does not ignore the newline character, which is meaningful whitespace and may
serve as a statement terminator).

If a # character appears within a string or regular expression literal, then it
is simply part of the string or regular expression and does not introduce a
comment.

```ruby
# This entire line is a comment
x = "# this is a string"                # and this is a comment
y = /# this is a regular expression/
```

Multiline comments are usually written simply by beginning each line with a
seperate # character.

Ruby has no C-style /*...*/ comment. THere is no way to embed a comment in the
middle of a line of code

### Embedded documents

Ruby supports another style of multiline comment known as an embedded document.

These start on a line that begin =begin and continue until (and include) a line
that begins =end.

Any text that appears after =begin or =end is part of the comment and is also
ignored, but that extra text must be seperated from the =begin and =end by at
least one space.

As the name implied, embedded documents can be used to include long blocks of
documentation within a program, or to embed source code of another language
(such as HTML or SQL) with a Ruby program.

Embedded documents are usually intended to be used by some kind of
postprocessing tool that is run over the Ruby source code, and it is typical to
follow =begin with an identifier that indicates which tool the comment is
intended for.

Ruby programs can include embedded API documentation as specially formatted
comments that preceded method, class, and module definitions. You can browse
this documentation using the ri tool. The rdoc tool extracts documentation
comments from Ruby source and formats them as HTML or prepares them for display
by ri. [See the file lib/rdoc/README in the Ruby source code for details]

Documentation comments must come immediately before the module, class or method
whose API they document. They are usually written as multiline comments where
each line begins with #, but they can also be written as embedded documents that
start =begin rdoc. (The rdoc tool will not process these comments if you leave
out the "rdoc".)

#### Rdoc overview:
```java
# = Headings

# Headings being with an equals sign

# == Sub-Headings
# The line above produces a subheading
# === Sub-Sub-Heading
# And so on

# = Examples
#
#      Indented lines are displayes verbatim in code font.
#      Be careful not to indent your headings and lists, though.

# = Lists and Fonts
# Lists items begin with * or -. Indicate fonts with punctuation or HTML:
# * _italic_ or <i>multi-word italic</i>
# * *bold* or <b>multi-word bold</b>
# * +code+ or <tt>multi-word code</tt>

# 1. Numbered lists begin with numbers.
# 99. Any number will do; they don't have to be sequential.
# 1. There is no way to do nested lists

# The terms of a description list are bracketed:
# [item 1] This is a description of item 1
# [item 2] This is a description of item 2
```
## Identifiers

An identifier is simply a name. Ruby uses identifiers to name variables,
methods, classes, and so forth.

Ruby identifiers consist of letters, numbers, and underscores characters, but
they may not begin with a number.

Identifiers may not include whitespace or nonprinting characters, and they may
not include punctuation characters except as described here.

Identifiers that begin with a capital letter A-Z are constants, and the Ruby
interpreter will issue a warning (but not an error) if you alter the value of
such an identifier.

Class and module names must begin with initial capital letters.

By convention, multiword identifiers that are not constants are written with
underscores like_this, whereas multiword constants are written LikeThis or
LIKE\_THIS.

## Unicode characters in identifiers
Ruby's rules for forming identifiers are defined in terms of ASCII characters
that are not allowed. In general, all characters outside of the ASCII character
set are valid in identifiers, including characters that appear to be
punctuation.

Similarly, a Japanese programmer writing a program encoded in SJIS or EUC can
include Kanji characters in her identifiers.

The special rules about forming identifiers are based on ASCII characters and
are not enforced for characters outside of that set. An identifier may not begin
with an ASCII digit, for example, but it may begin with a digit from a non-Latin
alphabet. Similarly, an identifier must begin with an ASCII capital letter in
order to be considered a constant. The identifier Å, for example, is not a
constant.

So basically rules for identifier namings only pertain to ACSCII characters,
such that an identifier cannot have an ASCII digit as first character. However
if the "digit" is defined in an encoding other than ASCII, you can use it as
first character

Two identifiers are the same only if they are represented by the same sequence
of bytes. Some character sets, such as Unicode, have more than one codepoint
that represents the same character. No Unicode normalization is performed in
Ruby, and two distinct codepoints are treated as distinct characters, even if
they have the same meaning or are represented by the same font glyph.

## Punctuation in identifiers
Punctuation characters may appear at the start and end of Ruby identifiers.

$   Global variables are prefixed with a dollar sign. Follows the Perl
    example

@   Instance variables are prefixed with a single at sign, and class
    variables are prefixed with two at signs.

?   As a helpful convention, methods that return Boolean values often
    have names that end with a question mark

!   Method names may end with an exclamation point to indicate that they
    should be used cautiously.  This naming convention is often to
    distinguish mutator methods that alter the object on which they are
    invoked from variants that return a modified copy of the original
    object.

=   Methods whose names end with an equals sign can be invoked by
    placing the method name, without the equals sign, on the left side
    of an assignment operator.


    e.g $files
        @@counter           # class variable
        timeout=            # a method invoked by assignment


################################################################################
        A number of Ruby's operators are implemented as methods, so that classes
        can redefine them for their own purposes.
################################################################################

################################################################################
        It is therefore possible to use certain operators as method names as
        well. In this context, the punctuation character or characters of the
        operator are treated as identifiers rather than operators.
################################################################################


- Keywords [ pg 30]

  In addition to those keywords, there are three keyword-like tokens that are
  treated specially by the Ruby parser when they appear at the beginning of a
  line:

         =begin  =end    __END__


  The token __END__ marks the end of the program (and the beginning of a data
  section) if it appears on a line by itself with no eading or trailing
  whitespace.

  In most languages, these words would be called "reserved words" and they would
  be never allowed as identifiers. The Ruby parser is flexible and does not
  complain if you prefix these keywords with @, @@, or $ prefixes and use them
  as instance, class, or global variable names. Also, you can use these keywords
  as method names, with the caveat that the method must always be explicitly
  invoked through an object. Note, however, that using these keywords in
  identifiers will result in confusing code. The best practice is to treat these
  keywords as reserved.

  Many important features of the Ruby language are actually implemented as
  methods of the Kernel, Module, Class, and Object classes. It is good practice,
  therefore, to treat the following identifiers as reserved words as well


- Whitespace

  Spaces, tabs, and newlines are not tokens themselves but are used to separate
  tokens that would otherwise merge into a single token. Aside from this basic
  token-separating function, most whitespace is ignored by the Ruby interpreter
  and is simply used to format programs so that they are easy to read and
  understand. Not all whitespace is ignored, however. Some is required, and some
  whitespace is actually forbidden. Ruby's grammar is expressive but complex,
  and there are a few cases in which inserting or removing whitespace can change
  the meaning of a program. Although these cases do not often arise, it is
  important to know about them.

  The most common form of whitespace dependency has to do with newlines as
  statement terminators. In languages like C and Java, every statement must be
  terminated with a semicolon. You can use semicolons to terminate statements in
  Ruby, too, but this is only required if you put more than one statement on the
  same line. Convention dictates that semicolons be omitted elsewhere.

  Without explicit semicolons, the Ruby interpreter must figure out on its own
  where statements end. If the Ruby code on a line is a syntactically complete
  statement, Ruby uses the newline as the statement terminator.  If the
  statement is not complete, then Ruby continues parsing the statement on the
  next line. (In Ruby 1.9, there is one exception, which is described later in
  this section.)

  This is no problem if all your statements fit on a single line. When they
  don't, however, you must take care that you break the line in such a way that
  the Ruby interpreter cannot interpret the first line as a statement of its
  own. This is where the whitespace dependency lies: your program may behave
  differently depending on where you insert a newline. For example, the
  following code adds x and y and assigns the sum to total:


        total = x +     # Incomplete expression, parsing continues
               y

   But this code assigns x to total, and then evaluates y, doing nothing with
   it:

        total = x               # This is a complete expression
        +y                      # A useless but complete expression


    As another example, consider the return and break statements. These
    statements may optionally be followed by an expression that provides a
    return value. A newline between the keyword and the expression will
    terminate the statement before the expression.

    ** You can safely insert a newline without fear of prematurely terminating
    your statement after an operator or after a period or comma in a method
    invocation, array literal, or hash literal.

    You can also escape a line break with a backslash, which prevents Ruby from
    automatically terminating the statement

        var total = bla + blo \
                  + blu

    In Ruby 1.9, the statement terminator rules change slightly. If the first
    nonspace character on a line is a period, then the line is considered a
    continuation line, and the newline before it is not a statement terminator.
    Lines that start with periods are useful for the long method chains
    sometimes used with "fluent APIs," in which each method invocation returns
    an object on which additional invocations can be made.


                animals = Array.new
                .push("dog")            # Does not work in Ruby 1.8
                .push("cow")
                .push("cat")
                .sort


- Spaces and method invocations

********************************************************************************
  Ruby's grammar allows the parentheses around method invocations to be omitted
  in certain circumstances.  This allows Ruby methods to be used as if they were
  statements, which is an important part of Ruby's elegance. Unfortunately,
  however, it opens up a pernicious whitespace dependency. Consider the
  following two lines, which differ only by a single space:
********************************************************************************

  [ This explains why some method get called like this: Haha.method? blue  ,
  where blue is a parameter to "method?" ]

                f(3+2) + 1

                f (3+2) + 1

   The first line passes the value 5 to the function f and then adds 1 to the
   result. Since the second line has a space after the function name, Ruby
   assumes that the parentheses around the method call have been omitted.  The
   parentheses that appear after the space are used to group a subexpression,
   but the entire expression (3+2)+1 is used as the method argument. If warnings
   are enabled (with -w), Ruby issues a warning whenever it sees ambiguous code
   like this.

   The solution to this whitespace dependency is straightforward:

   Never put a space between a method name and the opening parenthesis.

   If the first argument to a method begins with an open parenthesis, always use
   parentheses in the method invocation. For example, write f((3+2)+1).

   Always run the Ruby interpreter with the -w option so it will warn you if you
   forget either of the rules above!


- Syntactic Structure

  This section describes the syntax of Ruby programs, from the simplest
  expressions to the largest modules.  This section is, in effect, a roadmap to
  the chapters that follow.

  The basic unit of syntax in Ruby is the expression. The Ruby interpreter
  evaluates expressions, producing values. The simplest expressions are primary
  expressions, which represent values directly. Number and string literals,
  described earlier in this chapter, are primary expressions. Other primary
  expressions include certain keywords such as true, false, nil, and self.
  Variable references are also primary expressions; they evaluate to the value
  of the variable.


        [1,2,3]                # An Array literal
        {1=>"one", 2=>"two"}   # A Hash literal
        1..3                   # A range literal

    ### Expressions can be combined with Ruby's keywords to create statements,
    ### such as the if statement for conditionally executing code and the while
    ### statement for repeatedly executing code:

        if x < 10 then
                x = x + 1
        end

        while x < 10 do
                print x
                x = x + 1
        end

  In Ruby, these statements are technically expressions, but there is still a
  useful distinction between expressions that affect the control flow of a
  program and those that do not.

  In all but the most trivial programs, we usually need to group expressions and
  statements into parameterized units so that they can be executed repeatedly
  and operate on varying inputs. You may know these parameterized units as
  functions, procedures, or subroutines. Since Ruby is an object-oriented
  language, they are called methods.

  Finally, groups of methods that are designed to interoperate can be combined
  into classes, and groups of related classes and methods that are independent
  of those classes can be organized into modules.


- Block Structure in Ruby

  Ruby programs have a block structure. Module, class, and method definitions,
  and most of Ruby's statements, include blocks of nested code. These blocks are
  delimited by keywords or punctuation and, by convention, are indented two
  spaces relative to the delimiters. There are two kinds of blocks in Ruby
  programs. One kind is formally called a "block." These blocks are the chunks
  of code associated with or passed to iterator methods:

         3.times { print "Ruby! " }

  In this code, the curly braces and the code inside them are the block
  associated with the iterator method invocation 3.times. Formal blocks of this
  kind may be delimited with curly braces, or they may be delimited with the
  keywords do and end:

        1.upto(10) do |x|
                print x
        end

  do and end delimiters are usually used when the block is written on more than
  one line. Note the two-space indentation of the code within the block.

  To avoid ambiguity with these true blocks, we can call the other kind of block
  a body (in practice, however, the term "block" is often used for both). A body
  is just the list of statements that comprise the body of a class definition, a
  method definition, a while loop, or whatever. Bodies are never delimited with
  curly braces in Ruby—keywords usually serve as the delimiters instead.

  Bodies and blocks can be nested within each other, and Ruby programs typically
  have several levels of nested code, made readable by their relative
  indentation.


  module Stats                              # A module
    class Dataset                           # A class in the module
        def initialize(filename)            # A method in the class
            IO.foreach(filename) do |line|  # A block in the method

            if line[0,1] == "#"             # if condition
                next
            end
        end
    end
  end


- File Structure

  There are only a few rules about how a file of Ruby code must be structured.
  These rules are related to the deployment of Ruby programs and are not
  directly relevant to the language itself.

  First, if a Ruby program contains a "shebang" comment, to tell the (Unix-like)
  operating system how to execute it, that comment must appear on the first
  line.

  Second, if a Ruby program contains a "coding" comment, that comment must
  appear on the first line or on the second line if the first line is a shebang.

  Third, if a file contains a line that consists of the single token __END__
  with no whitespace before or after, then the Ruby interpreter stops processing
  the file at that point. The remainder of the file may contain arbitrary data
  that the program can read using the IO stream object DATA.

  Ruby programs are not required to fit in a single file. Many programs load
  additional Ruby code from external libraries, for example. Programs use
  "require" to load code from another file. "require" searches for specified
  modules of code against a search path, and prevents any given module from
  being loaded more than once.


        #!/usr/bin/ruby -w             shebang comment
        # -*- coding: utf-8 -*-
        require 'socket'

          ...

        __END__                        mark end of code

          ...                          program data goes here



- Program Encoding

  At the lowest level, a Ruby program is simply a sequence of characters. Ruby's
  lexical rules are defined using characters of the ASCII character set.
  Comments begin with the # character (ASCII code 35), for example, and allowed
  whitespace characters are horizontal tab (ASCII 9), newline (10), vertical tab
  (11), form feed (12), carriage return (13), and space (32). All Ruby keywords
  are written using ASCII characters, and all operators and other punctuation
  are drawn from the ASCII character set.


  By default, the Ruby interpreter assumes that Ruby source code is encoded in
  ASCII. This is not required, however; ###the interpreter can also process
  files that use other encodings, as long as those encodings can represent the
  full set of ASCII characters. ### In order for the Ruby interpreter to be able
  to interpret the bytes of a source file as characters, it must know what
  encoding to use. Ruby files can identify their own encodings or you can tell
  the interpreter how they are encoded.


  The Ruby interpreter is actually quite flexible about the characters that
  appear in a Ruby program. Certain ASCII characters have specific meanings, and
  certain ASCII characters are not allowed in identifiers, but beyond that, a
  Ruby program may contain any characters allowed by the encoding. We explained
  earlier that identifiers may contain characters outside of the ASCII character
  set. The same is true for comments and string and regular expression literals:
  they may contain any characters other than the delimiter character that marks
  the end of the comment or literal.

  In ASCII-encoded files, strings may include arbitrary bytes, including those
  that represent nonprinting control characters. (Using raw bytes like this is
  not recommended, however; Ruby string literals support escape sequences so
  that arbitrary characters can be included by numeric code instead.) If the
  file is written using the UTF-8 encoding, then comments, strings, and regular
  expressions may include arbitrary Unicode characters. If the file is encoded
  using the Japanese SJIS or EUC encodings, then strings may include Kanji
  characters.


- Specifying Program Encoding

  By default, the Ruby interpreter assumes that programs are encoded in ASCII.
  In Ruby 1.8, you can specify a different encoding with the -K command-line
  option. To run a Ruby program that includes Unicode characters encoded in
  UTF-8, invoke the interpreter with the -Ku option. Programs that include
  Japanese characters in EUC-JP or SJIS encodings can be run with the -Ke and
  -Ks options.


  Ruby 1.9 also supports the -K option, but it is no longer the preferred way to
  specify the encoding of a program file. Rather than have the user of a script
  specify the encoding when they invoke Ruby, the author of the script can
  specify the encoding of the script by placing a special "coding comment" at
  the start of the file.

        e.g
        # coding: utf-8

  The comment must be written entirely in ASCII, and must include the string
  coding followed by a colon or equals sign and the name of the desired encoding
  (which cannot include spaces or punctuation other than hyphen and underscore).
  Whitespace is allowed on either side of the colon or equals sign, and the
  string coding may have any prefix, such as en to spell encoding. The entire
  comment, including coding and the encoding name, is case-insensitive and can
  be written with upper- or lowercase letters.


   Encoding comments are usually written so that they also inform a text editor
   of the file encoding. Emacs users might write:

       # -*- coding: utf-8 -*-

   And vi users can write:

       # vi: set fileencoding=utf-8 :

   An encoding comment like this one is usually only valid on the first line of
   the file. It may appear on the second line, however, if the first line is a
   shebang comment (which makes a script executable on Unix-like operating
   systems):

        #!/usr/bin/ruby -w
        # coding: utf-8

  Encoding names are not case-sensitive and may be written in uppercase,
  lowercase, or a mix. Ruby 1.9 supports at least the following source
  encodings: ASCII-8BIT (also known as BINARY), US-ASCII (7-bit ASCII), the
  European encodings ISO-8859-1 through ISO-8859-15, the Unicode encoding UTF-8,
  and the Japanese encodings SHIFT_JIS (also known as SJIS) and EUC-JP. Your
  build or distribution of Ruby may support additional encodings as well.

  As a special case, UTF-8-encoded files identify their encoding if the first
  three bytes of the file are 0xEF 0xBB 0xBF. These bytes are known as the BOM
  or "Byte Order Mark" and are optional in UTF-8-encoded files. (Certain Windows
  programs add these bytes when saving Unicode files.)

  In Ruby 1.9, the language keyword __ENCODING__ (there are two underscores at
  the beginning and at the end) evaluates to the source encoding of the
  currently executing code. The resulting value is an Encoding object.


- Source Encoding and Default External Encoding

  In Ruby 1.9, it is important to understand the difference between the source
  encoding of a Ruby file and the default external encoding of a Ruby process.
  The source encoding is what we described earlier: it tells the Ruby
  interpreter how to read characters in a script. Source encodings are typically
  set with coding comments.  A Ruby program may consist of more than one file,
  and different files may have different source encodings.  The source encoding
  of a file affects the encoding of the string literals in that file.

  The default external encoding is something different: this is the encoding
  that Ruby uses by default when reading from files and streams. The default
  external encoding is global to the Ruby process and does not change from file
  to file. Normally, the default external encoding is set based on the locale
  that your computer is configured to. But you can also explicitly specify the
  default external encoding with command-line options, as we'll describe
  shortly. The default external encoding does not affect the encoding of string
  literals, but it is quite important for I/O


  We described the -K interpreter option earlier as a way to set the source
  encoding. In fact, what this option really does is set the default external
  encoding of the process and then uses that encoding as the default source
  encoding.



  In Ruby 1.9, the -K option exists for compatibility with Ruby 1.8 but is not
  the preferred way to set the default external encoding. Two new options, -E
  and --encoding, allow you to specify an encoding by its full name rather than
  by a one-character abbreviation.

        ruby -E utf-8           # Encoding name follows -E
        ruby -Eutf-8            # The space is optional
        ruby --encoding utf-8   # Encoding following --encoding with a space
        ruby --encoding=utf-8   # Or use an equals sign with --encoding

  You can query the default external encoding with Encoding.default_external.
  This class method returns an Encoding object. Use Encoding.locale_charmap to
  obtain the name (as a string) of the character encoding derived from the
  locale. This method is always based on the locale setting and ignores
  command-line options that override the default external encoding.



- Program Execution

  Ruby is a scripting language. This means that Ruby programs are simply lists,
  or scripts, of statements to be executed. By default, these statements are
  executed sequentially, in the order they appear. Ruby's control structures
  (described in Chapter 5) alter this default execution order and allow
  statements to be executed conditionally or repeatedly, for example.

  Programmers who are used to traditional static compiled languages like C or
  Java may find this slightly confusing. There is no special main method in Ruby
  from which execution begins. The Ruby interpreter is given a script of
  statements to execute, and it begins executing at the first line and continues
  to the last line.


  (Actually, that last statement is not quite true. The Ruby interpreter first
  scans the file for BEGIN statements, and executes the code in their bodies.
  Then it goes back to line 1 and starts executing sequentially.


  Another difference between Ruby and compiled languages has to do with module,
  class, and method definitions. In compiled languages, these are syntactic
  structures that are processed by the compiler. In Ruby, they are statements
  like any other. When the Ruby interpreter encounters a class definition, it
  executes it, causing a new class to come into existence.

  Similarly, when the Ruby interpreter encounters a method definition, it
  executes it, causing a new method to be defined. Later in the program, the
  interpreter will probably encounter and execute a method invocation expression
  for the method, and this invocation will cause the statements in the method
  body to be executed.


  The Ruby interpreter is invoked from the command line and given a script to
  execute. Very simple one-line scripts are sometimes written directly on the
  command line. More commonly, however, the name of the file containing the
  script is specified. The Ruby interpreter reads the file and executes the
  script. It first executes any BEGIN blocks. Then it starts at the first line
  of the file and continues until one of the following happens:

    • It executes a statement that causes the Ruby program to terminate.
    • It reaches the end of the file.
    • It reads a line that marks the logical end of the file with the token __END__.

  Before it quits, the Ruby interpreter typically (unless the exit! method was
  called) executes the bodies of any END statements it has encountered and any
  other "shutdown hook" code registered with the at_exit function.


* Datatypes and Objects

  The classes described in this chapter are the fundamental datatypes of the
  Ruby language. This chapter explains the basic behavior of those types: how
  literal values are written in a program, how integer and floating-point
  arithmetic work, how textual data is encoded, how values can serve as hash
  keys, and so on.  Although we cover numbers, strings, arrays, and hashes here,
  this chapter makes no attempt to explain the APIs defined by those types.


- Numbers

  Ruby includes five built-in classes for representing numbers, and the standard
  library includes three more numeric classes that are sometimes useful.


                               Numeric
                                  |
                                  |
       Integer    Float Complex  (Standard library) BigDecimal (Standard library) Rational (Standard library)
          |
          |
 Fixnum      Bignum



  All number objects in Ruby are instances of Numeric. All integers are
  instances of Integer. If an integer value fits within 31 bits (on most
  implementations), it is an instance of Fixnum. Otherwise, it is a Bignum.
  Bignum objects represent integers of arbitrary size, and if the result of an
  operation on Fixnum operands is too big to fit in a Fixnum, that result is
  transparently converted to a Bignum. Similarly, if the result of an operation
  on Bignum objects falls within the range of Fixnum, then the result is a
  Fixnum.


  Real numbers are approximated in Ruby with the Float class, which uses the
  native floating-point representation of the platform.

  The Complex, BigDecimal, and Rational classes are not built-in to Ruby but are
  distributed with Ruby as part of the standard library. The Complex class
  represents complex numbers, of course. BigDecimal represents real numbers with
  arbitrary precision, using a decimal representation rather than a binary
  representation. And Rational represents rational numbers: one integer divided
  by another.


  All numeric objects are immutable; there are no methods that allow you to
  change the value held by the object. If you pass a reference to a numeric
  object to a method, you need not worry that the method will modify the object.
  Fixnum objects are commonly used, and Ruby implementations typically treat
  them as immediate values rather than as references. Because numbers are
  immutable, however, there is really no way to tell the difference.


- Integer Literals

  An integer literal is simply a sequence of digits:

        0
        123
        12345

  If the integer values fit within the range of the Fixnum class, the value is a
  Fixnum. Otherwise, it is a Bignum, which supports integers of any size.
  Underscores may be inserted into integer literals (though not at the beginning
  or end), and this feature is sometimes used as a thousands separator:


       1_000_000_000

  If an integer literal begins with zero and has more than one digit, then it is
  interpreted in some base other than base 10. Numbers beginning with 0x or 0X
  are hexadecimal (base 16) and use the letters a through f (or A through F) as
  digits for 10 through 15. Numbers beginning 0b or 0B are binary (base 2) and
  may only include digits 0 and 1. Numbers beginning with 0 and no subsequent
  letter are octal (base 8) and should consist of digits between 0 and 7.


  To represent a negative number, simply begin an integer literal with a minus
  sign. Literals may also begin with a plus sign, although this never changes
  the meaning of the literal.



- Floating-Point Literals

  A floating-point literal is an optional sign followed by one or more decimal
  digits, a decimal point (the .  character), one or more additional digits, and
  an optional exponent. An exponent begins with the letter e or E, and is
  followed by an optional sign and one or more decimal digits. As with integer
  literals, underscores may be used within floating-point literals. Unlike
  integer literals, it is not possible to express floating-point values in any
  radix other than base 10.


        0.0
        -3.14

        6.02e23
        1_000_000.01

  Ruby requires that digits appear before and after the decimal point. You
  cannot simply write .1, for example; you must explicitly write 0.1. This is
  necessary to avoid ambiguity in Ruby's complex grammar. Ruby differs from many
  other languages in this way.


   - Arithmetic in Ruby

     *** All numeric types in Ruby define standard +, –, *, and / operators for
     addition, subtraction, multiplication, and division. When an integer result
     is too large for a Fixnum, Ruby automatically converts to a Bignum, and as
     a result, integer arithmetic in Ruby never overflows as it does in many
     other languages. Floating-point numbers (at least on platforms that use the
     standard IEEE-754 floating-point representation) overflow to special
     positive or negative infinity values, and underflow to zero.


     The division operator depends on the class of the operands. If both
     operands are integers, then the operation performed is truncating-integer
     division. If either operand is a Float, then floating-point division is
     performed:

            x = 5/2     # 2
            y = 5.0/2   # 2.5
            z = 5/2.0   # 2.5


     Integer division by zero causes a ZeroDivisionError to be thrown.
     Floating-point division by zero does not cause an error; it simply returns
     the value Infinity. The case of 0.0/0.0 is special; on most modern
     hardware, and with most operating systems, it evaluates to another special
     floating-point value known as NaN, or Not-a-Number.

     The modulo (%) operator computes remainder-after-integer division:

            x = 5%2        # result is 1


     The % operator can also be used with Float operands, although this is less
     common:

           x = 1.5%0.4     # result is 0.3



      ** Division, Modulo, and Negative Numbers

         When one (but not both) of the operands is negative, Ruby performs the
         integer division and modulo operations differently than languages like
         C, C++, and Java do (but the same as the languages Python and Tcl).

         Consider the quotient -7/3. The floating-point result is –2.33. The
         result of integer division must be an integer, however, so this number
         must be rounded. Ruby rounds toward negative infinity and returns –3. C
         and related languages round toward zero instead and return –2. (This is
         just one way to characterize the results; no floating-point division is
         actually done, of course.)


         An important corollary of Ruby's definition of integer division is
         that, in Ruby, -a/b equals a/-b but may not equal -(a/b).

         Ruby's definition of the ** modulo ** (i.e % !!) operation also differs
         from that of C and Java. In Ruby, –7%3 is 2. In C and Java, the result
         is -1 instead. The magnitude of the result differs, of course, because
         the value of the quotient differs. But the sign of the result differs,
         too. In Ruby, the sign of the result is always the same as the sign of
         the second operand. In C and Java, the sign of the result is always the
         same as the sign of the first operand. (Ruby also provides a remainder
         method that behaves, in sign and magnitude, like the C modulo
         operator.)

         [Why? when you do 7%3, the modulo returns 1, because 6 is the highest
         value before 7 to be divisible by 3 [ 7 - 6].  for -7%3, instead of
         going to -6 and return an answer of -1 [-7 - -6], ruby goes instead to
         -9 and returns a value of 2.[-7 - -9]


         Ruby also borrows the ** operator from Fortran for exponentiation.
         Exponents need not be integers:


                x**4
                x**-1           # same thing as 1/x
                x**(1/3.0)

          When multiple exponentiations are combined into a single expression,
          they are evaluated from right to left.

          Thus, 4**3**2 is the same as 4**9, not 64**2

          Exponentiation can result in very large values. Remember that integers
          can become arbitrarily large, but Float objects cannot represent
          numbers larger than Float::MAX.

          The expression 9.9**1000 overflows to the Float value Infinity


          Fixnum and Bignum values support the standard bit-manipulation
          operators -- ~, &, |, ^, >> and <<


          In addition, integer values can also be indexed like arrays to query
          [but not set] individual bits.

          The index 0 returns the LEAST significant bit:

          even = ( x[0] == 0)     # a number is even if the least-significant
                                    bit is 0.



- Binary Floating-Point and Rounding errors

  Most computer hardware and most computer languages (including Ruby)
  approximate real numbers using a floating-point representation like Ruby's
  Float class.

  For hardware efficiency, most floating-point representations are binary
  representations, which can exactly represent franctions like 1/2, 1/4 and
  1/1024.

  Unfortunately, the fractions we use most commonly are 1/10, 1/100, 1/1000, and
  so on.

  Binary floating-point representations cannot exactly represent numbers as
  simple as 0.1.


  Float objects have plenty of precision and can approximate 0.1 very well, but
  the fact that this number cannot be represented exactly leads to problems.

      0.4 - 0.3 == 0.1   # evaluates to false in most implementations

  Because or rounding error, the difference between the approximations of 0.4 -
  0.3 is not quite the same as the approximation of 0.1.

  One solution to this problem is to use a decimal representation of real
  numbers rather than a binary representation.

  The BigDecimal class from Ruby's standard library is one such representation.
  Arithmetic on BigDecimal objects is many times slower than arithmetic on Float
  values. It is fast enough for typical financial calculations, but not for
  scientific number crunching.


- Text

  Text is represented in Ruby by objects of the String class. Strings are
  mutable objects, and the String class defines a powerful set of operators and
  methods for extracting substrings, inserting and deleting text, searching,
  replacing, and so on. Ruby provides a number of ways to express string
  literals in your programs, and some of them support a powerful string
  interpolation syntax by which the values of arbitrary Ruby expressions can be
  substituted into string literals.

  Textual patterns are represented in Ruby as Regexp objects, and Ruby defines a
  syntax for including regular expressions literally in your programs. The code
  /[a-z]\d+/, for example, represents a single lowercase letter followed by one
  or more digits. Regular expressions are a commonly used feature of Ruby, but
  regexps are not a fundamental datatype in the way that numbers, strings, and
  arrays are.


- String literals

  String literal enclosed in single quotes:

       'This is a simple Rubby String literal'

  If you need to place an apostrophe within a single-quoted string literal,
  precede it with a backslash so that the Ruby interpreter does not think that
  it terminates the string:

       'Wont\'t'

   The backslash also works to escape another backslash, so that the second
   backslash is not itself interpreted as an escape character.

       'This string literal ends with a single backslash: \\'

   In single-quoted strings, a backslash is not special if the character that
   follows it is anything other than a quote or a backslash. Most of the time,
   therefore, backslashes need not be doubled (although they can be) in string
   literals. For example, the following two string literals are equal:

       'a\b' == 'a\\b'         [note that they are equal for SINGLE quotes]

    Single-quoted strings may extend over multiple lines, and the resulting
    string literal includes the newline characters. It is not possible to escape
    the newlines with a backslash:

       'This is a long string literal \
        that includes a backslash and a newline'

        [This is a long string literal \
        that includes a backslash and a newline] [ what is printed]


        e.g 'this is haha
                        hoho'

                [this is haha
                hoho ] [what is printed]

     If you want to break a long single-quoted string literal across multiple
     lines without embedding newlines in it, simply break it into multiple
     adjacent string literals; the Ruby interpreter will concatenate them during
     the parsing process. Remember, though, that you must escape the newlines
     (see Chapter 2) between the literals so that Ruby does not interpret the
     newline as a statement terminator:

            message =
            'These three literals are '\
            'concatenated into one by the interpreter. '\
            'The resulting string contains no newlines.'


- Double-quoted String literals

  String literals delimited by double quotation marks are much more flexible
  than single-quoted literals.  Double-quoted literals support quite a few
  backslash escape sequences, such as \n for newline, \t for tab, and \" for a
  quotation mark that does not terminate the string:

        "\t\"This quote begins with a tab and ends with a newline\"\n"
        "\\" # A single backslash

   In Ruby 1.9, the \u escape embeds arbitrary Unicode characters, specified by
   their codepoint, into a double-quoted string.

   More powerfully, double-quoted string literals may also include arbitrary
   Ruby expressions. When the string is created, the expression is evaluated,
   converted to a string, and inserted into the string in place of the
   expression text itself. This substitution of an expression with its value is
   known in Ruby as "string interpolation." Expressions within double-quoted
   strings begin with the # character and are enclosed within curly braces:


    "360 degrees=#{2*Math::PI} radians" # "360 degrees=6.28318530717959 radians"

   When the expression to be interpolated into the string literal is simply a
   reference to a global, instance, or class variable, then the curly braces may
   be omitted:

        $salutation = 'hello'
        "#$salutation world"

   Use a backslash to escape the # character if you do not want it to be treated
   specially. Note that this only needs to be done if the character after # is
   {, $, or @:

        "My phone #: 555-1234"                  # No escape needed
        "Use \#{ to interpolate expressions"    # Escape #{ with backslash


    *** String Interpolation with sprintf ***


        C programmers may be happy to know that Ruby also supports printf and
        sprintf functions for interpolating formatted values into strings:

            sprintf("pi is about %.4f", Math::PI) # Returns "pi is about 3.1416"

        The advantage of this style of interpolation is that the format string
        can specify options, such as the number of decimal places to display in
        a Float. In true Ruby style, there is even an operator form of the *
        sprintf * method: simply use a % operator between a format string and
        the arguments to be interpolated into it:

            "pi is about %.4f" % Math::PI           # Same as example above
            "%s: %f" % ["pi", Math::PI]             # Array on righthand side
                                                      for multiple args

################################################################################
   Double-quoted string literals may span multiple lines, and line terminators
   become part of the string literal, unless escaped with a backslash:
################################################################################

            "This string literal
            has two lines \
            but is written on three"

            [equivalent to: This string literal\nhas 3 lines but is written on three]

            [ in double quotes, \ is special, but not so in single quote]

        You may prefer to explicitly encode the line terminators in your
        strings—in order to enforce network CRLF (Carriage Return Line Feed)
        line terminators, as used in the HTTP protocol, for example. To do this,
        write all your string literals on a single line and explicitly include
        the line endings with the \r and \n escape sequences. Remember that
        adjacent string literals are automatically concatenated, but if they are
        written on separate lines, the newline between them must be escaped

            "This string has three lines.\r\n" \
            "It is written as three adjacent literals\r\n" \
            "separated by escaped newlines\r\n"

         pg86 escapesequencemeaning


- Escape Sequence Meaning

  \ x A backslash before any character x is equivalent to the character x by
      itself, unless x is a line terminator or one of the special characters
      abcefnrstuvxCM01234567. This syntax is useful to escape the special
      meaning of the \, #, and " characters.

   \a The BEL character (ASCII code 7).
      Rings the console bell.

   \b The Backspace character (ASCII code 8).

   \e The ESC character (ASCII code 27).

   \f The Form Feed character (ASCII code 12).

   \n The Newline character (ASCII code 10).

   \r The Carriage Return character (ASCII code 13).

   \s The Space character (ASCII code 32).

   \t The TAB character (ASCII code 9).

   \unnnn The Unicode codepoint nnnn, where each n is one hexadecimal digit.
          Leading zeros may not be dropped; all four digits are required in this
          form of the \u escape. Supported in Ruby 1.9 and later.

   \u{ hexdigits } The Unicode codepoint(s) specified by hexdigits. See the
                   description of this escape in the main text. Ruby 1.9 and
                   later.

   \v The vertical tab character (ASCII code 11).

   \nnn The byte nnn, where nnn is three octal digits between 000 and 377.

   \nn Same as \0nn, where nn is two octal digits between 00 and 77.

   \n Same as \00n, where n is an octal digit between
       0 and 7

   \xnn The byte nn, where nn is two hexadecimal digits between 00 and FF. (Both
        lowercase and uppercase letters are allowed as hexadecimal digits.)

   \xn Same as \x0n, where n is a hexadecimal digit between 0 and F (or f).

   \cx Shorthand for \C-x.

   \C-x The character whose character code is formed by zeroing the sixth and
        seventh bits of x, retaining the high-order bit and the five low bits. x
        can be any character, but this sequence is usually used to represent
        control characters Control-A through Control-Z (ASCII codes 1 through
        26). Because of the layout of the ASCII table, you can use either
        lowercase or uppercase letters for x. Note that \cx is shorthand. x can
        be any single character or an escape other than \C \u, \x, or \nnn.


    \M-x The character whose character code is formed by setting the high bit of
         the code of x. This is used to represent "meta" characters, which are
         not technically part of the ASCII character set. x can be any single
         character or an escape other than \M \u, \x, or \nnn. \M can be
         combined with \C as in \M-\C-A.

        \eol A backslash before a line terminator escapes the terminator.
             Neither the backslash nor the terminator appear in the string.


- Unicode Escapes

  In Ruby 1.9, double-quoted strings can include arbitrary Unicode characters
  with \u escapes. In its simplest form, \u is followed by exactly four
  hexadecimal digits (letters can be upper- or lowercase), which represent a
  Unicode codepoint between 0000 and FFFF.

        "\u00D7" # => "×": leading zeros cannot be dropped
        "\u20ac" # => "€": lowercase letters are okay

  A second form of the \u escape is followed by an open curly brace, one to six
  hexadec- imal digits, and a close curly brace. The digits between the braces
  can represent any Unicode codepoint between 0 and 10FFFF, and leading zeros
  can be dropped in this form:

        "\u{A5}"                 # => "¥": same as "\u00A5"
        "\u{3C0}"                # Greek lowercase pi: same as "\u03C0"
        "\u{10ffff}"     # The largest Unicode codepoint

   Finally, the \u{} form of this escape allows multiple codepoints to be
   embedded within a single escape. Simply place multiple runs of one to six
   hexadecimal digits, separated by a single space or tab character, within the
   curly braces. Spaces are not allowed after the opening curly brace or before
   the closing brace:

         money = "\u{20AC A3 A5}" # => "€£¥"

   Note that spaces within the curly braces do not encode spaces in the string
   itself. You can, however, encode the ASCII space character with Unicode
   codepoint 20:

         money = "\u{20AC 20 A3 20 A5}" # => "€ £ ¥"

   Strings that use the \u escape are encoded using the Unicode UTF-8 encoding.


   \u escapes are usually, but not always, legal in strings. If the source file
   uses an encoding other than UTF-8, and a string contains multibyte characters
   in that encoding (literal characters, not characters created with escapes),
   then it is not legal to use \u in that string—it is just not possible for one
   string to encode characters in two different encodings. You can always use \u
   if the source encoding is UTF-8. And you can always use \u in a string that
   only contains ASCII characters.

   \u escapes may appear in double-quoted strings, and also in other forms of
   quoted text (described shortly) such as regular expressions, characters
   literals, %- and %Q-delimited strings, %W-delimited arrays, here documents,
   and backquote-delimited command strings. Java programmers should note that
   Ruby’s \u escape can only appear in quoted text, not in program identifiers.


- Arbitrary delimiters for string literals

  When working with text that contains apostrophes and quotation marks, it is
  awkward to use it as single- and double-quoted string literals. Ruby supports
  a generalized quot- ing syntax for string literals

  The sequence %q begins a string literal that follows single-quoted string
  rules, and the sequence %Q (or just %) introduces a literal that follows
  double-quoted string rules. The first character following q or Q is the
  delimiter character, and the string literal continues until a matching
  (unescaped) delimiter is found. If the opening delimiter is (, [, {, or <,
  then the matching delimiter is ), ], }, or >. (Note that the backtick ` and
  apostrophe ' are not a matched pair.) Otherwise, the closing delimiter is the
  same as the opening delimiter. Here are some examples:


        %q(Don't worry about escaping ' characters!)

        %Q|"How are you?", he said|

        %-This string literal ends with a newline\n- # Q omitted in this one

  If you find that you need to escape the delimiter character, you can use a
  backslash (even in the stricter %q form) or just choose a different delimiter:

        %q_This string literal contains \_underscores\__
        %Q!Just use a _different_ delimiter\!!


   If you use paired delimiters, you don’t need to escape those delimiters in
   your literals, as long as they appear in properly nested pairs:

        # XML uses paired angle brackets:
        %<<book><title>Ruby in a Nutshell</title></book>>  # This works
        # Expressions use paired, nested parens:
        %((1+(2*3)) = #{(1+(2*3))})                        # This works, too
        %(A mismatched paren \( must be escaped)           # Escape needed here


- Here Documents

  For long string literals, there may be no single character delimiter that can
  be used without worrying about remembering to escape characters within the
  literal. Ruby’s solution to this problem is to allow you to specify an
  arbitrary sequence of characters to serve as the delimiter for the string.


  This kind of literal is borrowed from Unix shell syntax and is historically
  known as a here document. (Because the document is right here in the source
  code rather than in an external file.)


  Here documents begin with << or <<-.


  These are followed immediately (no space is allowed, to prevent ambiguity with
  the left-shift operator) by an identifier or string that specifies the ending
  delimiter.

  The text of the string literal begins on the next line and continues until the
  text of the delimiter appears on a line by itself.


        document = <<HERE                # This is how we begin a here document
        This is a string literal.
        It has two lines and abruptly ends...
        HERE


  The Ruby interpreter gets the contents of a string literal by reading a line
  at a time from it.

  In fact, after reading the content of a here document, the Ruby interpreter
  goes back to the line it was on and continues parsing it. The following Ruby
  code, for example, creates a string by concatenating two here documents and a
  regular single- quoted string:


        greeting = <<HERE + <<THERE + "World"
        Hello
        HERE
        There
        THERE

  The <<HERE on line 1 causes the interpreter to read lines 2 and 3. And the
  <<THERE causes the interpreter to read lines 4 and 5. After these lines have
  been read, the three string literals are concatenated into one.

  The ending delimiter of a here document really must appear on a line by
  itself: no comment may follow the delimiter. If the here document begins with
  <<, then the de- limiter must start at the beginning of the line. *If the
  literal begins with <<- instead*, then the delimiter may have whitespace in
  front of it*. The newline at the beginning of a here document is not part of
  the literal, but the newline at the end of the document is.  Therefore, every
  here document ends with a line terminator, except for an empty here document,
  which is the same as "":

        empty = <<END
        END


  *** *** ***
  If you use an unquoted identifier as the terminator, as in the previous
  examples, then the here document behaves like a double-quoted string for the
  purposes of interpreting backslash escapes and the # character. *If you want
  to be very, very literal, allowing no escape characters whatsoever, place the
  delimiter in single quotes*. Doing this also allows you to use spaces in your
  delimiter:
  *** *** ***

        document = <<'THIS IS THE END, MY ONLY FRIEND, THE END'
        .
        . lots and lots of text goes here
        . with no escaping at all.
        .
        THIS IS THE END, MY ONLY FRIEND, THE END


  The single quotes around the delimiter hint that this string literal is like a
  single-quoted string. In fact, this kind of here document is even stricter.
  Because the single quote is not a delimiter, there is never a need to escape a
  single quote with a backslash. And because the backslash is never needed as an
  escape character, there is never a need to escape the backslash itself. In
  this kind of here document, therefore, backslashes are simply part of the
  string literal.

  You may also use a double-quoted string literal as the delimiter for a "here"
  document.  This is the same as using a single identifier, except that it
  allows spaces within the delimiter:

**
  [without quotes, you can't specify the end keyword with several words. e.g
  END.  but with quotes, your end message can be words with spaces in between.
  also note that <<- allows you to add whitespace to your end message, whereas
  << does not.

  NOTICE that you don't need to put quotes inside a here document, pretty much
  like %Q]
**

        document = <<-"# # #" # This is the only place we can put a comment
        <html><head><title>#{title}</title></head>
        <body>
        <h1>#{title}</h1>
        #{body}
        </body>
        </html>
                                # # #

   Note that there is no way to include a comment within a here document except
   on the first line after the << token and before the start of the literal. Of
   all the # characters in this code, one introduces a comment, three
   interpolate expressions into the literal, and the rest are the delimiter.


- Backtick Command Execution

  Ruby supports another syntax involving quotes and strings. When text is
  enclosed in backquotes (the ` character, also known as backticks), that text
  is treated as a double- quoted string literal. The value of that literal is
  passed to the specially named Kernel.` method. This method executes the text
  as an operating system shell command and returns the command’s output as a
  string.

        Consider the following Ruby code:
        `ls`

  On a Unix system, these four characters yield a string that lists the names of
  the files in the current directory. This is highly platform-dependent, of
  course. A rough equiv- alent in Windows might be `dir`.


  Ruby supports a generalized quote syntax you can use in place of backticks.
  This is like the %Q syntax introduced earlier, but uses %x (for execute)
  instead:

                %x[ls]

  Note that the text within the backticks (or following %x) is processed like a
  double- quoted literal, which means that arbitrary Ruby expressions can be
  interpolated into the string.


  if windows
      listcmd = 'dir'
  else
      listcmd = 'ls'
          end
          listing = `#{listcmd}`  # combining ruby expressions with backticks --

  # Ruby interprets the backtick as a double-quoted
  # literal
  # `ls` will return what you expect
  # so `listcmd`` will try to run the listcmd command,
  # whereas what you want is for it to evaluate the value
  # of listcmd, so you have to put #{  }

  In a case like this, however, it is simpler just to invoke the backtick method
  directly: listing = Kernel.`(listcmd)


- String literals and mutability

  Strings are mutable in Ruby. Therefore, the Ruby interpreter cannot use the
  same object to represent two identical string literals. (If you are a Java
  programmer, you may find this surprising.) Each time Ruby encounters a string
  literal, it creates a new object. If you include a literal within the body of
  a loop, Ruby will create a new object for each iteration. You can demonstrate
  this for yourself as follows:

       10.times { puts "test".object_id }

  For efficiency, you should avoid using literals within loops.


- The String.new method

  In addition to all the string literal options described earlier, you can also
  create new strings with the String.new method. With no arguments, this method
  returns a newly created string with no characters. With a single string
  argument, it creates and returns a new String object that represents the same
  text as the argument object.


- Character Literals

  Single characters can be included literally in a Ruby program by preceding the
  character with a question mark. No quotation marks of any kind are used:

        ?A   # Character literal for the ASCII character A
        ?"   # Character literal for the double-quote character
        ??   # Character literal for the question mark character

  Although Ruby has a character literal syntax, it does not have a special class
  to represent single characters. Also, the interpretation of character literals
  has changed between Ruby 1.8 and Ruby 1.9. In Ruby 1.8, character literals
  evaluate to the integer encoding of the specified character. ?A, for example,
  is the same as 65 because the ASCII encoding for the capital letter A is the
  integer 65. In Ruby 1.8, the character literal syntax only works with ASCII
  and single-byte characters.

  In Ruby 1.9 and later, characters are simply strings of length 1. That is, the
  literal ?A is the same as the literal 'A', and there is really no need for
  this character literal syntax in new code. In Ruby 1.9, the character literal
  syntax works with multibyte characters and can also be used with the \u
  Unicode escape (though not with the multicodepoint form \u{a b c}):


    ?\u20AC == ?€       # => true: Ruby 1.9 only
    ?€ == "\u20AC"      # => true

  The character literal syntax can actually be used with any of the character
  escapes listed earlier in Table 3-1:


    ?\t      # Character literal for the TAB character
    ?\C-x    # Character literal for Ctrl-X
    ?\111    # Literal for character whose encoding is 0111 (octal)

- String Operators

  The String class defines several useful operators for manipulating strings of
  text. The + operator concatenates two strings and returns the result as a new
  String object:

        planet = "Earth"

        "Hello" + " " + planet  # Produces "Hello Earth"

################################################################################
  Java programmers should note that the + operator does not convert its
  righthand operand to a string; you must do that yourself:
################################################################################


     "Hello planet #" + planet_number.to_s        # to_s converts to a string


  Of course, in Ruby, string interpolation is usually simpler than string
  concatenation with +. With string interpolation, the call to to_s is done
  automatically:

     "Hello planet ##{planet_number}"

  [Note that it will print "Hello planet #5"   , assuming that planet_number is
  5]

  The << operator appends its second operand to its first, and should be
  familiar to C++ programmers. This operator is very different from +; it alters
  the lefthand operand rather than creating and returning a new object:

        greeting = "Hello"
        greeting << " " << "World"
        puts greeting                  # Outputs "Hello World"


  Like +, the << operator does no type conversion on the righthand operand. If
  the right- hand operand is an integer, however, it is taken to be a character
  code, and the corresponding character is appended. In Ruby 1.8, only integers
  between 0 and 255 are allowed. In Ruby 1.9, any integer that represents a
  valid codepoint in the string’s encoding can be used:


        alphabet = "A"
        alphabet << ?B   # Alphabet is now "AB"
        alphabet << 67   # And now it is "ABC"
        alphabet << 256  # Error in Ruby 1.8: codes must be >=0 and < 256

  The * operator expects an integer as its righthand operand. It returns a
  String that repeats the text specified on the lefthand side the number of
  times specified by the righthand side:

        ellipsis = '.'*3         # Evaluates to '...'

  If the lefthand side is a string literal, any interpolation is performed just
  once before the repetition is done. This means that the following too-clever
  code does not do what you might want it to:

        a = 0;
        "#{a=a+1} " * 3          # Returns "1 1 1 ", not "1 2 3 "


  String defines all the standard comparison operators. == and != compare
  strings for equality and inequality. Two strings are equal if—and only if—they
  have the same length and all characters are equal. <, <=, >, and >= compare
  the relative order of strings by comparing the character codes of the
  characters that make up a string. If one string is a prefix of another, the
  shorter string is less than the longer string. Comparison is based strictly on
  character codes. No normalization is done, and natural language col- lation
  order (if it differs from the numeric sequence of character codes) is ignored.


  String comparison is case-sensitive.* Remember that in ASCII, the uppercase
  letters all have lower codes than the lowercase letters. This means, for
  example, that "Z" < "a".  For case-insensitive comparison of ASCII characters,
  use the casecmp method or convert your strings to the same case with downcase
  or upcase methods before comparing them. (Keep in mind that Ruby’s knowledge
  of upper- and lowercase letters is limited to the ASCII character set.)


- Accessing Characters and Substrings

  Perhaps the most important operator supported by String is the square-bracket
  array- index operator [], which is used for extracting or altering portions of
  a string. This operator is quite flexible and can be used with a number of
  different operand types. It can also be used on the lefthand side of an
  assignment, as a way of altering string content.


  In Ruby 1.8, a string is like an array of bytes or 8-bit character codes. The
  length of this array is given by the length or size method, and you get or set
  elements of the array simply by specifying the character number within square
  brackets:

        s = 'hello';    # Ruby 1.8
        s[0]            # 104: ASCII character code for h
        s[s.length-1]   # 111: character code for last character
        s[-1]           # 111: another way of accessing hte last character
        s[-2]           # 108: second to last character
        s[-s.length]    # 14: first character
        s[s.length]     # nul: there is no character at that index

  Notice that negative array indexes specify a 1-based position from the end of
  the string.  Also notice that Ruby does not throw an exception if you try to
  access a character beyond the end of the string; it simply returns nil
  instead.

  Ruby 1.9 returns single-character strings rather than character codes when you
  index a single character. Keep in mind that when working with multibyte
  strings, with char- acters encoded using variable numbers of bytes, random
  access to characters is less efficient than access to the underlying bytes:


        s = 'hello';            # Ruby 1.9
        s[0]                    # 'h'
        s[s.length-1]           # 'o' last character
        s[-1]                   # 'o' last character
        s[-2]                   # 'l' second-to-last character


  In Ruby 1.8, setting the deprecated global variable $= to true makes the ==,
  <, and related comparison operators perform case-insensitive comparisons. You
  should not do this, however; setting this variable produces a warning message,
  even if the Ruby interpreter is invoked without the -w flag. And in Ruby 1.9,
  $= is no longer supported.


  To alter individual characters of a string, simply use brackets on the
  lefthand side of an assignment expression. In Ruby 1.8, the righthand side may
  be an ASCII character code or a string. In Ruby 1.9, the righthand side must
  be a string. You can use character literals in either version of the language:

          s[0] = ?H         # Replace first character with a capital H
          s[-1] = ?O        # Replace last character with a capital O
          s[s.length] = ?!  # ERROR! Can't assign beyond the end of the string


  The righthand side of an assignment statement like this need not be a
  character code: it may be any string, including a multicharacter string or the
  empty string. Again, this works in both Ruby 1.8 and Ruby 1.9:

    s = "hello"        # Begin with a greeting
    s[-1] = ""         # Delete the last character; s is now "hell"
    s[-1] = "p!"       # Change new last character and add one; s is now "help!"

  More often than not, you want to retrieve substrings from a string rather than
  individual character codes. To do this, use two comma-separated operands
  between the square brackets. The first operand specifies an index (which may
  be negative), and the second specifies a length (which must be nonnegative).
  The result is the substring that begins at the specified index and continues
  for the specified number of characters:

  [ ### The length attribute below used to substitute the characters from
  starting point to starting point + length, and replace it with the character
  you specify ### ]

    s = "hello"
    s[0,2]          # "he"
    s[-1,1]         # "o" : returns a string, not the character code ?o
    s[0,0]          # "" : a zero-length substring is always empty
    s[0,10]         # "hello" : returns all the characters that are available
    s[s.length,1]   # "": there is an empty string immediately beyond hte end
    s[s.length+1,1] # nil: it is an error to read past that
    s[0,-1]         # nil: negative lengths don't make any sense

  If you assign a string to a string indexed like this, you replace the
  specified substring with the new string. If the righthand side is the empty
  string, this is a deletion, and if the lefthand side has zero-length, this is
  an insertion:

    s = "hello"
    s[0,1] = "H"             # Replace first letter with a capital letter
    s[s.length,0] = " world" # Append by assigning beyond the end of the string
    s[5,0] = ","             # Insert a comma, without deleting anything
    s[5,6] = ""              # Delete with no insertion; s == "Hellod"

    # So a length of 0 is for insertion

  Another way to extract, insert, delete, or replace a substring is by indexing
  a string with a Range object.

  a Range is two integers separated by dots. When a Range is used to index a
  string, the return value is the substring whose characters fall within the
  Range:

        s = "hello"
        s[2..3]                  # "ll": characters 2 and 3
        s[-3..-1]                # "llo": negative indexes work, too
        s[0..0]                  # "h": this Range includes one character index

        s[0...0]                # "": this Range is empty
        s[2..1]                 # "": this Range is also empty
        s[7..10]                # nil: this Range is outside the string bounds
        s[-2..-1] = "p!"        # Replacement: s becomes "help!"
        s[0...0] = "Please "    # Insertion: s becomes "Please help"
        s[6..10] = ""           # Deletion: s becomes "Please!"

  Don’t confuse string indexing with two comma-separated integers with this form
  that uses a single Range object. Although both involve two integers, there is
  an important difference: the form with the comma specifies an index and a
  length; the form that uses a Range object specifies two indexes.

  It is also possible to index a string with a string. When you do this, the
  return value is the first substring of the target string that matches the
  index string, or nil, if no match is found. This form of string indexing is
  really only useful on the lefthand side of an assignment statement when you
  want to replace the matched string with some other string:


    s = "hello"

    while(s["l"])           # While the string contains the substring "l"
            s["l"] = "L";   # Replace first occurrence of "l" with "L"
    end                     # Now we have "hello"


  Finally, you can index a string using a regular expression.  The result is the
  first substring of the string that matches the pattern, and again, this form
  of string indexing is most useful when used on the lefthand side of an
  assignment:

     s[/[aeiou]/] = '*'    # Replace first vowel with an asterisk


- Iterating Strings

  In Ruby 1.8, the String class defines an each method that iterates a string
  line-by-line.  The String class includes the methods of the Enumerable module,
  and they can be used to process the lines of a string. You can use the
  each_byte iterator in Ruby 1.8 to iterate through the bytes of a string, but
  there is little advantage to using each_byte over the [] operator because
  random access to bytes is as quick as sequential access in 1.8.


  The situation is quite different in Ruby 1.9, which removes the each method,
  and in which the String class is no longer Enumerable. In place of each, Ruby
  1.9 defines three clearly named string iterators: each_byte iterates
  sequentially through the individual bytes that comprise a string; each_char
  iterates the characters; and each_line iterates the lines. If you want to
  process a string character-by-character, it may be more efficient to use
  each_char than to use the [] operator and character indexes:



    s = "¥1000"
    s.each_char {|x| print "#{x} " }         # Prints "¥ 1 0 0 0". Ruby 1.9
    0.upto(s.size-1) {|i| print "#{s[i]} "}  # Inefficient with multibyte chars

- String Encodings and Multibyte Characters

  Strings are fundamentally different in Ruby 1.8 and Ruby 1.9:

  - In Ruby 1.8, strings are a sequence of bytes. When strings are used to
    represent text (instead of binary data), each byte of the string is assumed
    to represent a single ASCII character. In 1.8, the individual elements of a
    string are not characters, but numbers—the actual byte value or character
    encoding.

  - In Ruby 1.9, on the other hand, strings are true sequences of characters,
    and those characters need not be confined to the ASCII character set. In
    1.9, the individual elements of a string are characters—represented as
    strings of length 1—rather than integer character codes. Every string has an
    encoding that specifies the corre- spondence between the bytes in the string
    and the characters those bytes represent.  Encodings such as the UTF-8
    encoding of Unicode characters use variable numbers of bytes for each
    character, and there is no longer a 1-to-1 (nor even a 2-to-1)
    correspondence between bytes and characters.

- Multibyte characters in Ruby 1.9

  The String class has been rewritten in Ruby 1.9 to be aware of and properly
  handle multibyte characters. Although multibyte support is the biggest change
  in Ruby 1.9, it is not a highly visible change: code that uses multibyte
  strings just works. It is worth understanding why it works, however, and this
  section explains the details.

  If a string contains multibyte characters, then the number of bytes does not
  correspond to the number of characters. In Ruby 1.9, the length and size
  methods return the number of characters in a string, and the new bytesize
  method returns the number of bytes:



    # -*- coding: utf-8 -*- # Specify Unicode UTF-8 characters

   s = "2×2=4"
   s.length # => 5: Characters:    '2'      '×'    '2'   '='     '4'

   s.bytesize # => 6: Bytes (hex): 32     c3 97    32     3d      34

  Note that the first line in this code is a coding comment that sets the source
  encoding to UTF-8. Without this comment, the Ruby interpreter would not know
  how to decode the sequence of bytes in the string literal into a sequence of
  characters.

  When a string contains characters encoded with varying numbers of bytes, it is
  no longer possible to map directly from character index to byte offset in the
  string. In the string above, for example, the second character begins at the
  second byte. But the third character begins at the fourth byte. This means
  that you cannot assume that random access to arbitrary characters within a
  string is a fast operation.


  When you use the [] operator to access a character or substring within a
  multibyte string, the Ruby imple- mentation must internally iterate
  sequentially through the string to find the desired character index. In
  general, therefore, you should try to do your string processing using
  sequential algorithms when possible. That is: use the each_char iterator when
  possible instead of repeated calls to the [] operator.

  [ so for ^^ you can't really use random access [of arrays] to access chars
  because chars are no more necessarily 8 bits only. hence internally ruby still
  have to iterate sequentially throught the string [even though you might think
  it's random access]]

  On the other hand, it is usually not necessary to worry too much about this.
  Ruby implementations optimize the cases that can be optimized, and if a string
  consists entirely of 1-byte characters, random access to those characters will
  be efficient. If you want to attempt your own optimizations, you can use the
  instance method ascii_only? to determine whether a string consists entirely of
  7-bit ASCII characters.


  The Ruby 1.9 String class defines an encoding method that returns the encoding
  of a string (the return value is an Encoding object, which is described
  below):

        # -*- coding: utf-8 -*-
        s = "2×2=4"            # Note multibyte multiplication character
        s.encoding             # => <Encoding: UTF-8>
        t = "2+2=4"            # All characters are in the ASCII subset of UTF-8
        t.encoding             # => <Encoding: ASCII-8BIT>

  ***
  The encoding of a string literal is based on the source encoding of the file
  it appears within. But its encoding is not always the same as the source
  encoding. If a string literal contains only 7-bit ASCII characters, then its
  encoding method will return ASCII, even if the source encoding is UTF-8 (a
  superset of ASCII), for example. This optimization lets string methods know
  that all characters in the string are one byte long. Also, if a string literal
  contains \u escapes, then its encoding will be UTF-8, even if the source
  encoding is something different.
  ***

    -- ASCII and Binary encodings

       The “ASCII-8BIT” encoding shown earlier is Ruby 1.9’s name for the legacy
       encoding used by Ruby 1.8; it is the ASCII character set with no
       restrictions on the use of non- printing and control characters. In this
       encoding, one byte always equals one character, and strings can hold
       binary data or character data.

       Certain Ruby 1.9 methods require you to specify an encoding name (or
       Encoding object —see below). You can specify this ASCII encoding as
       “ASCII-8BIT” or by its alias “BINARY”. This may seem surprising, but it’s
       true: as far as Ruby is concerned, a sequence of bytes with no encoding
       (“BINARY”) is the same as a sequence of 8-bit ASCII characters. Because
       the “BINARY” encoding really means “unencoded bytes,” you can also
       specify this encoding by passing nil instead of an encoding name or
       Encoding object.


       Ruby 1.9 also supports an encoding named “US-ASCII”, which is true 7-bit
       ASCII; it differs from ASCII-8BIT in that it does not allow any bytes
       with their 8th bit set.



  Certain string operations, such as concatenation and pattern matching, require
  that two strings (or a string and a regular expression) have compatible
  encodings. If you concatenate an ASCII string with a UTF-8 string, for
  example, you obtain a UTF-8 string.


  It is not possible, however, to concatenate a UTF-8 string and an SJIS string:
  the encodings are not compatible, and an exception will be raised.

  ##############################################################################
  You can test whether two strings (or a string and a regular expression) have
  compatible encodings by using the class method Encoding.compatible?. If the
  encodings of the two arguments are compatible, it returns the one that is the
  superset of the other. If the encodings are incompatible, it returns nil.
  ##############################################################################


  You can explicitly set the encoding of a string with force_encoding. This is
  useful if you have a string of bytes (read from an I/O stream, perhaps) and
  want to tell Ruby how they should be interpreted as characters. Or, if you
  have a string of multibyte characters, but you want to index individual bytes
  with []:


    text = stream.readline.force_encoding("utf-8")
    bytes = text.dup.force_encoding(nil)             # nil encoding means binary


  force_encoding does not make a copy of its receiver; it modifies the encoding
  of the string and returns the string.

  ### This method does not do any character conversion—the underlying bytes of
  the string are not changed, only Ruby’s interpretation of them is changed. ###

  As shown above, the argument to force_encoding can be the name of an encoding
  or nil to specify binary encoding. You can also pass an Encoding object to
  specify the encoding.


  force_encoding does no validation; it does not check that the underlying bytes
  of the string represent a valid sequence of characters in the specified
  encoding. Use valid_encoding? to perform validation. This instance method
  takes no arguments and checks whether the bytes of a string can be interpreted
  as a valid sequence of characters using the string’s encoding:


    s = "\xa4".force_encoding("utf-8")       # This is not a valid UTF-8 string
    s.valid_encoding?                        # => false

  The encode method (and the mutating encode! variant) of a string is quite
  different from force_encoding. It returns a string that represents the same
  sequence of characters as its receiver, but using a different encoding. In
  order to change the encoding of—or transcode—a string like this, the encode
  method must alter the underlying bytes that make up the string.


    # -*- coding: utf-8 -*-
    euro1 = "\u20AC"                     # Start with the Unicode Euro character
    puts euro1                           # Prints "€"
    euro1.encoding                       # => <Encoding:UTF-8>
    euro1.bytesize                       # => 3

    euro2 = euro1.encode("iso-8859-15")  # Transcode to Latin-15
    puts euro2.inspect                   # Prints "\xA4"
    euro2.encoding                       # => <Encoding:iso-8859-15>
    euro2.bytesize                       # => 1

    euro2 = euro2.encode("utf-8")
    euro1 == euro3                       # => true

  Note that you should not often need to use the encode method. The most common
  time to transcode strings is before writing them to a file or sending them
  across a network connection.

  Ruby’s I/O stream classes support the automatic transcoding of text when it is
  written out.


  If the string that you are calling encode on consists of unencoded bytes, you
  need to specify the encoding by which to interpret those bytes before
  transcoding them to an- other encoding. Do this by passing two arguments to
  encode. The first argument is the desired encoding, and the second argument is
  the current encoding of the string. For example:


        # Interpret a byte as an iso-8859-15 codepoint, and transcode to UTF-8
        byte = "\xA4"
        char = byte.encode("utf-8", "iso-8859-15")

  [ interpret the bytes as an iso-8859-15 and then convert it to its utf8
  equivalent ]

 That is, the following two lines of code have the same effect:

        text = bytes.encode(to, from)
        text = bytes.dup.force_encoding(from).encode(to)

  Character encodings differ not only in their mapping from bytes to characters,
  but in the set of characters that they can represent. Unicode (also known as
  UCS—the Universal Character Set) tries to allow all characters, but
  character encodings not based on

  Unicode can only represent a subset of characters. It is not possible,
  therefore, to trans- code all UTF-8 strings to EUC-JP (for example); Unicode
  characters that are neither Latin nor Japanese cannot be translated.


  If the encode or encode! method encounters a character that it cannot
  transcode, it raises an exception;

        # The iso-8859-1 encoding doesn't have a Euro sign, so this raises an
        # exception
        "\u20AC".encode("iso-8859-1")

- The Encoding class

  The Encoding class of Ruby 1.9 represents a character encoding. Encoding
  objects act as opaque identifiers for an encoding and do not have many methods
  of their own. The name method returns the name of an encoding. to_s is a
  synonym for name, and inspect converts an Encoding object to a string in a
  more verbose way than name does.

  Ruby defines a constant for each of the built-in encodings it supports, and
  these are the easiest way to specify a hardcoded encoding in your program.


            Encoding::ASCII_8BIT            # Also ::BINARY
            Encoding::UTF_8
            Encoding::EUC_JP
            Encoding::SHIFT_JIS             # Japanese

  Note that because these are constants, they must be written in uppercase, and
  hyphens in the encoding names must be converted to underscores. Ruby 1.9 also
  supports the US-ASCII encoding, the European encodings ISO-8859-1 through
  ISO-8859-15, and the Unicode UTF-16 and UTF-32 encodings in big-endian and
  little-endian variants, but these are dynamically loaded as needed rather than
  built-in, and constants do not exist for these encodings until they are used.


  If you have an encoding name as a string and want to obtain the corresponding
  Encoding object, use the Encoding.find factory method:

           encoding = Encoding.find("utf-8")

  Using Encoding.find causes the named encoding to be dynamically loaded, if
  necessary.  Encoding.find accepts encoding names that are in either upper- or
  lowercase. Call the name method of an Encoding to obtain the name of the
  encoding as a string.

  If you want a list of available encodings, call Encoding.list, which returns
  an array of Encoding objects. The Encoding.list method only lists built-in
  encodings and any en- codings that have already been dynamically loaded.
  Calling Encoding.find can cause new encodings to be loaded. These new
  encodings will be listed by subsequent calls to Encoding.list.

  Use Encoding.default_external to obtain the Encoding object that represents
  the de- fault external encoding (see §2.4.2). To obtain the encoding for the
  current locale, call Encoding.locale_charmap and pass the resulting string to
  Encoding.find.

  Most methods that expect an Encoding object will also accept nil as a synonym
  for Encoding::BINARY (i.e., unencoded bytes). Most methods will also accept an
  encoding name (such as ascii, binary, utf-8, euc-jp, or sjis) in place of an
  Encoding object.


  The encodings supported by the encode method for transcoding may be a superset
  of the encodings supported by the Encoding class. That is (depending on which
  encodings are supported in your version and distribution of Ruby), it may be
  possible to use encode to transcode a string of characters into a string of
  bytes that Ruby cannot inter- pret as characters. This might be necessary, for
  example, when communicating with a legacy server that requires an unusual
  character encoding. You may pass Encoding ob- jects to the encode method, but
  when working with encodings that are not supported by the Encoding class, you
  will have to specify the encoding name as a string.


- Multibyte characters in Ruby 1.8

  Normally, Ruby 1.8 treats all strings as sequences of 8-bit bytes. There is
  rudimentary support for multibyte characters (using the UTF-8, EUC, or SJIS
  encodings) in the jcode module of the standard library.

  To use this library, require the jcode module, and set the global $KCODE
  variable to the encoding that your multibyte characters use. (Alternatively,
  use the -K command-line option when you start the Ruby interpreter.) The jcode
  library defines a new jlength method for String objects: it returns the length
  of the string in characters rather than in bytes. The existing 1.8 length and
  size methods are unchanged—they return the string length in bytes.

  The jcode library does not modify the array indexing operator on strings, and
  does not allow random access to the characters that comprise a multibyte
  string. But it does define a new iterator named each_char, which works like
  the standard each_byte but passes each character of the string (as a string
  instead of as a character code) to the block of code you supply:

        $KCODE = "u"           # Specify unicode UTF-8
        require "jcode"        # Load multibye character support

        mb = "2\303\2272=4"    # This is "2×2=4" with a Unicode multiplication
                               # sign
        mb.length              # 6
        mb.jlength             # 5
        mb.mbchar?             # 1: position of the first multibyte char, or nil

        mb.each_byte do |c|     # Iterate through the bytes of the string
                print c, " "    # c is Fixnum
        end                     # Outputs "50 195 151 50 61 52 "

        mb.each_char do |c|   # c is a String with jlength 1 and variable length
                print c, " "
        end                   # Outputs "2 × 2 = 4 "


  The jcode library also modifies several existing String methods, such as chop,
  delete, and tr, to work with multibyte strings.


* Arrays

  An array is a sequence of values that allows values to be accessed by their
  position, or index, in the sequence. In Ruby, the first value in an array has
  index 0. The size and length methods return the number of elements in an
  array.

  The last element of the array is at index size-1. Negative index values count
  from the end of the array, so the last element of an array can also be
  accessed with an index of –1. The second-to-last has an index of –2, and so
  on.

  If you attempt to read an element beyond the end of an array (with an index >=
  size) or before the beginning of an array (with an index < -size), Ruby simply
  returns nil and does not throw an exception.

  ***
  Ruby’s arrays are untyped and mutable. The elements of an array need not all
  be of the same class, and they can be changed at any time. Furthermore, arrays
  are dynamically resizeable; you can append elements to them and they grow as
  needed. If you assign a value to an element beyond the end of the array, the
  array is automatically extended with nil elements. (It is an error, however,
  to assign a value to an element before the beginning of an array.)
  ***

  An array literal is a comma-separated list of values, enclosed in square
  brackets:

    [1, 2, 3]             # An array that holds three Fixnum objects
    [-10...0, 0..10,]     # An array of two ranges; trailing commas are allowed
    [[1,2],[3,4],[5]]     # An array of nested arrays

    [x+y, x-y, x*y]       # Array elements can be arbitrary expressions
    []                    # The empty array has size 0

  Ruby includes a special-case syntax for expressing array literals whose
  elements are short strings without spaces:

    words = %w[this is a test]  # Same as: ['this', 'is', 'a', 'test']
    open = %w| ( [ { < |        # Same as: ['(', '[', '{', '<']
    white = %W(\s \t \r \n)     # Same as: ["\s", "\t", "\r", "\n"]

  %w and %W introduce an array literal, much like %q and %Q introduce a String
  %literal. In
  particular, the delimiter rules for %w and %W are the same as for %q and %Q.
  Within the delimiters, no quotation marks are required around the array
  element strings, and no commas are required between the elements. Array
  elements are delimited by whitespace.


  You can also create arrays with the Array.new constructor, and this provides
  options for programmatically initializing the array elements:

        empty = Array.new               # []: returns a new empty array
        nils = Array.new(3)             # [nil, nil, nil]: new array with 3 nil elements
        zeros = Array.new(4, 0)         # [0, 0, 0, 0]: new array with 4 0 elements
        copy = Array.new(nils)          # Make a new copy of an existing array
        count = Array.new(3) {|i| i+1}  # [1,2,3]: 3 elements computed from index

  To obtain the value of an array element, use a single integer within square
  brackets:

        a = [0, 1, 4, 9, 16]

        a[0]                    # first element
        a[-1]                   # last element
        a[-2]                   # second to last element
        a[-a.size]              # another way to query the first element
        a[8]                    # Querying beyond the end returns nil
        a[-8]                   # Querying before the start returns nil, too


  All of the expressions above, except for the last, can also be used on the
  lefthand side of an assignment:

        a[0] = "zero"        # ["zero", 1, 4, 9, 16]
        a[-1] = 1..16        # ["zero", 1, 4, 9, 1..16]
        a[8] = 64            # ["zero", 1, 4, 9, 1..16, nil, nil, nil, 64]


        a[-9] = 81           # Error: cannot assign before the start of an array


  Like strings, arrays can also be indexed with two integers that represent a
  starting index and a number of elements, or a Range object. In either case,
  the expression returns the specified subarray:


        a = ('a'..'e').to_a   # Range converted to ['a', 'b', 'c', 'd', 'e']
        a[0,0]                # [] : zero elements
        a[1,1]                # ['b'] : a one-element array
        a[-2,2]               # ['d','e'] : last two elements of the array
        a[0..2]               # ['a','b','c']
        a[-2..-1]             # ['d','e']
        a[0...-1]             # ['a','b','c','d'] : all but the last element


  When used on the lefthand side of an assignment, a subarray can be replaced by
  the elements of the array on the righthand side. This basic operation works
  for insertions and deletions as well:

        a[0,2] = ['A', 'B']

        a[0,0] = [1,2,3]      # insert elements at the beginning of a
        a[0..2] = []          # delete those elements
        a[-1,1] = ['Z']       # replace last element witha nother
        a[-1,1] = 'Z'         # For single elements, the array is optional
        a[-2,2] = nil         # Delete last 2 elements in 1.8, replace with nil in 1.9

        a[-1,1] = [45,35]     # This will replace the last element ['e'] with 45 and add
                                a new entry at the end [35]

        a[-1,2] = ['X','Y']   # Replace the last 2 elements with 'X' and 'Y'

   [Notice that when the length is specified, if length = 0, it will insert, if
   length > 0, it will replace the array positions]


  In addition to the square bracket operator for indexing an array, the Array
  class defines a number of other useful operators. Use + to concatenate two
  arrays:


        a = [1,2,3] + [4,5]   # [1,2,3,4,5]
        a = a + [[6,7,8]]     # [1,2,3,4,5,[6,7,8]]
        a = a + 9             # Error: righthand side must be an array


  The - operator subtracts one array from another. It begins by making a copy of
  its lefthand array, and then removes any elements from that copy if they
  appear anywhere in the righthand array:

      ['a', 'b', 'c', 'd', 'a'] - ['b', 'c', 'd']    # ['a', 'a']


  The + operator creates a new array that contains the elements of both its
  operands. Use << to append elements to the end of an existing array:


        a = []                  # Start with an empty array
        a << 1                  # a is [1]
        a << 2 << 3             # a is [1,2,3]
        a << [4,5,6]    # a is [1,2,3, [4,5,6]]

  Like the String class, Array also uses the multiplication operator for
  repetition:

        a = [0] * 8             # [0,0,0,0,0,0,0,0]


  The Array class borrows the Boolean operators | and & and uses them for union
  and intersection. | concatenates its arguments and then removes all duplicate
  elements from the result. & returns an array that holds elements that appear
  in both of the operand arrays. *** The returned array does not contain any
  duplicate elements: ***


        a = [1,1,2,2,3,3,4]
        b = [5,5,4,4,3,3,2]

        a | b    # [1,2,3,4,5]: duplicates are removed
        b | a    # [5,4,3,2,1]: elements are the same, but order is different

        a & b    # [2,3,4]
        b & a    # [4,3,2]


  ***
  Note that these operators are not transitive: a|b is not the same as b|a, for
  example. If you ignore the ordering of the elements, however, and consider the
  arrays to be unor- dered sets, then these operators make more sense. Note also
  that the algorithm by which union and intersection are performed is not
  specified, and there are no guarantees about the order of the elements in the
  returned arrays.
  ***


  The Array class defines quite a few useful methods. The only one we’ll discuss
  here is the each iterator, used for looping through the elements of an array:

        a = ('A'..'Z').to_a     # Begin with an array of letters
        a.each { |x| print x }  # Print te alphabet, one letter at a time

  Other Array methods you may want to look up include clear, compact!,
  delete_if, each_index, empty?, fill, flatten!, include?, index, join, pop,
  push, reverse, reverse_each, rindex, shift, sort, sort!, uniq!, and unshift.


* Hashes

  A hash is a data structure that maintains a set of objects known as keys, and
  associates a value with each key. Hashes are also known as maps because they
  map keys to values.  They are sometimes called associative arrays because they
  associate values with each of the keys, and can be thought of as arrays in
  which the array index can be any object instead of an integer. An example
  makes this clearer:


    numbers = Hash.new              # Create a new, empty, hash object
    numbers["one"] = 1              # Map the string "one" to the Fixnum 1
    numbers["two"] = 2              # Note taht we are using array notation here
    numbers["three"] = 3


     sum = numbers["one"] + numbers["two"]   # Retrieve values like this

  This introduction to hashes documents Ruby’s hash literal syntax and explains
  the requirements for an object to be used as a hash key.


- Hash literals

  A hash literal is written as a comma-separated list of key/value pairs,
  enclosed within curly braces. Keys and values are separated with a
  two-character “arrow”: =>. The Hash object created earlier could also be
  created with the following literal:

      numbers = { "one" => 1, "two" => 2, "three" => 3 }

  In general, Symbol objects work more efficiently as hash keys than strings do:

      numbers = { :one => 1, :two => 2, :three => 3 }

  Symbols are immutable interned strings, written as colon-prefixed identifiers;
  they are explained in more detail in §3.6 later in this chapter.


  Ruby 1.8 allows commas in place of arrows, but this deprecated syntax is no
  longer supported in Ruby 1.9:

      numbers = { :one, 1, :two, 2, :three, 3 } # Same, but harder to read


  Both Ruby 1.8 and Ruby 1.9 allow a single trailing comma at the end of the
  key/value list:

      numbers = { :one => 1, :two => 2, } # Extra comma ignored

  Ruby 1.9 supports a very useful and succinct hash literal syntax when the keys
  are symbols. In this case, the colon moves to the end of the hash key and
  replaces the arrow:*


      numbers = { one: 1, two: 2, three: 3 }


  Note that there may not be any space between the hash key identifier and the
  colon.



- Hash Codes, Equality, and Mutable keys

  Ruby’s hashes are implemented, unsurprisingly, with a data structure known as
  a hash table. Objects used as keys in a hash must have a method named hash
  that returns a Fixnum hashcode for the key. If two keys are equal, they must
  have the same hashcode.  Unequal keys may also have the same hashcode, but
  hash tables are most efficient when duplicate hashcodes are rare.

  The Hash class compares keys for equality with the ### eql? ### method. For
  most Ruby classes, eql? works like the == operator (see §3.8.5 for details).
  If you define a new class that overrides the eql? method, you must also
  override the hash method, or else instances of your class will not work as
  keys in a hash. (We’ll see examples of writing a hash method in Chapter 7.)


  If you define a class and do not override eql?, then instances of that class
  are compared for object identity when used as hash keys. Two distinct
  instances of your class are distinct hash keys even if they represent the same
  content. In this case, the default hash method is appropriate: it returns the
  unique object_id of the object.

  Note that mutable objects are problematic as hash keys. Changing the content
  of an object typically changes its hashcode. If you use an object as a key and
  then alter that object, the internal hash table becomes corrupted, and the
  hash no longer works correctly.

  [ Probably because the object_id did not change, so the eql? method will
  return true; however the hash code is based on the object contents, and since
  those contents changed, the hash key will be different ]

  Because strings are mutable but commonly used hash keys, Ruby treats them as a
  special case and makes private copies of all strings used as keys. This is the
  only special case, however; you must be very cautious when using any other
  mutable object as a hash key. Consider making a private copy or calling the
  freeze method. If you must use mutable hash keys, call the rehash method of
  the Hash every time you mutate a key.


* Ranges

  A Range object represents the values between a start value and an end value.
  Range literals are written by placing two or three dots between the start and
  end value. If two dots are used, then the range is inclusive and the end value
  is part of the range. If three dots are used, then the range is exclusive and
  the end value is not part of the range:


    1..10       # The integers 1 through 10, including 10
    1.0...10.0  # The numbers between 1.0 and 10.0, excluding 10.0 itself

  Test whether a value is included in a range with the include? method (but see
  below for a discussion of alternatives):

    cold_war = 1945..1989
    cold_war.include? birthdate.year

  Implicit in the definition of a range is the notion of ordering. If a range is
  the values between two endpoints, there obviously must be some way to compare
  values to those endpoints. In Ruby, this is done with the comparison operator
  <=>, which compares its two operands and evaluates to –1, 0, or 1, depending
  on their relative order (or equality). Classes such as numbers and strings
  that have an ordering define the <=> operator. A value can only be used as a
  range endpoint if it responds to this operator.  The endpoints of a range and
  the values “in” the range are typically all of the same class.  Technically,
  however, any value that is compatible with the <=> operators of the range
  endpoints can be considered a member of the range.


  The primary purpose for ranges is comparison: to be able to determine whether
  a value is in or out of the range. An important secondary purpose is
  iteration: if the class of the endpoints of a range defines a succ method (for
  successor), then there is a discrete set of range members, and they can be
  iterated with each, step, and Enumerable methods.  Consider the range
  'a'..'c', for example:


        r = 'a'..'c'
        r.each { |l| print "[#{l}" }     # Prints "[a][b][c]"
        r.step(2) { |l| print "[#{l}]" } # Prints "[a][c]"
        r.to_a                           # ['a','b','c']: Enumerate defines to_a


    ***
    The reason this works is that the String class defines a succ method and
    'a'.succ is 'b' and 'b'.succ is 'c'. Ranges that can be iterated like this
    are discrete ranges. Ranges whose endpoints do not define a succ method
    cannot be iterated, and so they can be called continuous. Note that ranges
    with integer endpoints are discrete, but floating- point numbers as
    endpoints are continuous.
    ***


  Ranges with integer endpoints are the most commonly used in typical Ruby
  programs.  Because they are discrete, integer ranges can be used to index
  strings and arrays. They are also a convenient way to represent an enumerable
  collection of ascending values.

  Notice that the code assigns a range literal to a variable, and then invokes
  methods on the range through the variable. If you want to invoke a method
  directly on a range literal, you must parenthesize the literal, or the method
  invocation is actually on the endpoint of the range rather than on the Range
  object itself:

    1..3.to_a      # Tries to call to_a on the number 3
    (1..3).to_a    # [1,2,3]

- Testing membership in a range

  The Range class defines methods for determining whether an arbitrary value is
  a member of (i.e., is included in) a range. Before going into detail on these
  methods, it is necessary to explain that range membership can be defined in
  two different ways that are related to the difference between continuous and
  discrete ranges.

  ##########################################################################
  A value x is a member of the range begin..end by the first definition if:
  ##########################################################################


        begin <= x <= end

  And x is a member of the range begin...end (with three dots) if:

        begin <= x < end

  All range endpoint values must implement the <=> operator, so this definition
  of mem- bership works for any Range object and does not require the endpoints
  to implement the succ method. We’ll call this the continuous membership test.


  The second definition of membership — discrete membership — does depend on
  succ.  It treats a Range begin..end as a set that includes begin, begin.succ,
  begin.succ.succ, and so on. By this definition, range membership is set
  membership, and a value x is included in a range only if it is a value
  returned by one of the succ invocations. Note that testing for discrete
  membership is potentially a much more expensive operation than testing for
  continuous membership.


  With that as background, we can describe the Range methods for testing
  membership.  Ruby 1.8 supports two methods, include? and member?. They are
  synonyms, and both use the ### continuous membership ### test:


    r = 0...100
    r.member? 50            # true
    r.include? 100          # false
    r.include? 99.9         # true

  The situation is different in Ruby 1.9. That version of the language
  introduces a new method, cover?, which works like include? and member? do in
  Ruby 1.8: it always uses the continuous membership test. include? and member?
  are still synonyms in Ruby 1.9.


################################################################################
  If the endpoints of the range are numbers, these methods use the continuous
  mem- bership test, just as they did in Ruby 1.8. If the endpoints are not
  numeric, however, they instead use the discrete membership test. We can
  illustrate these changes with a discrete range of strings (you may want to use
  ri to understand how String.succ works):
################################################################################


    triples = "AAA"..."ZZZ"
    triples.include? "ABC"                  # true; fast in 1.8 and slow in 1.9
    triples.include? "ABCD"                 # true in 1.8, false in 1.9
    triples.cover?  "ABCD"                  # true and fast in 1.9
    triples.to_a.include? "ABCD"            # false and slow in 1.8 and 1.9

  In practice, most ranges have numeric endpoints, and the Range API changes
  between Ruby 1.8 and 1.9 have little impact.


* Symbols

  A typical implementation of a Ruby interpreter maintains a symbol table in
  which it stores the names of all the classes, methods, and variables it knows
  about. This allows such an interpreter to avoid most string comparisons: it
  refers to method names (for example) by their position in this symbol table.
  This turns a relatively expensive string operation into a relatively cheap
  integer operation.

  These symbols are not purely internal to the interpreter; they can also be
  used by Ruby programs. A Symbol object refers to a symbol. A symbol literal is
  written by prefixing an identifier or string with a colon:


        :symbol                 # A symbol literal
        :"symbol"               # The same literal
        :'another long symbol'  # Quotes are useful for symbols with spaces

        s = "string"
        sym = :"#{s}"           # The Symbol :string

  Symbols also have a %s literal syntax that allows arbitrary delimiters in the
  same way that %q and %Q can be used for string literals:

        %s["]            # Same as :'"'

  Symbols are often used to refer to method names in reflective code. For
  example, suppose we want to know if some object has an each method:


        o.respond_to? :each


  Here’s another example. It tests whether a given object responds to a
  specified method, and, if so, invokes that method:

         name = :size

         if o.respond_to? name
            o.send(name)
         end

  You can convert a String to a Symbol using the intern or to_sym methods. And
  you can convert a Symbol back into a String with the to_s method or its alias
  id2name:


            str = "string"
            sym = str.intern      # Convert to a symbol
            sym = str.to_sym      # Another way to do the same thing
            str = sym.to_s        # Convert back to a string
            str = sym.id2name     # Another way to do it

  Two strings may hold the same content and yet be completely distinct objects.
  This is never the case with symbols. Two strings with the same content will
  both convert to exactly the same Symbol object. Two distinct Symbol objects
  will always have different content.


  Whenever you write code that uses strings not for their textual content but as
  a kind of unique identifier, consider using symbols instead. Rather than
  writing a method that expects an argument to be either the string “AM” or
  “PM”, for example, you could write it to expect the symbol :AM or the symbol
  :PM. Comparing two Symbol objects for equality is much faster than comparing
  two strings for equality. For this reason, symbols are generally preferred to
  strings as hash keys.



  In Ruby 1.9, the Symbol class defines a number of String methods, such as
  length, size, the comparison operators, and even the [] and =~ operators. This
  makes symbols somewhat interchangeable with strings and allows their use as a
  kind of immutable (and not garbage-collected) string.


* True, False, and Nil

  We saw in §2.1.5 that true, false, and nil are keywords in Ruby. true and
  false are the two Boolean values, and they represent truth and falsehood, yes
  and no, on and off. nil is a special value reserved to indicate the absence of
  value.


  Each of these keywords evaluates to a special object. true evaluates to an
  object that is a singleton instance of TrueClass. Likewise, false and nil are
  singleton instances of FalseClass and NilClass. Note that there is no Boolean
  class in Ruby. TrueClass and FalseClass both have Object as their superclass.


  If you want to check whether a value is nil, you can simply compare it to nil,
  or use the method nil?:

    o == nil   # Is o nil?
    o.nil?     # Another way to test

  ***
  Note that true, false, and nil refer to objects, not numbers. false and nil
  are not the same thing as 0, and true is not the same thing as 1. When Ruby
  requires a Boolean value, nil behaves like false, and any value other than nil
  or false behaves like true.
  ***


* Objects

  Ruby is a very pure object-oriented language: all values are objects, and
  there is no distinction between primitive types and object types as there are
  in many other lan- guages. In Ruby, all objects inherit from a class named
  Object and share the methods defined by that class. This section explains the
  common features of all objects in Ruby.  It is dense in parts, but it’s
  required reading; the information here is fundamental.


- Object References

  ***
  If you are familiar with C or C++, you can think of a reference as a pointer:
  the address of the object in memory. Ruby does not use pointers, however.
  References in Ruby are opaque and internal to the implementation. There is no
  way to take the address of a value, dereference a value, or do pointer
  arithmetic.
  ***

  When we work with objects in Ruby, we are really working with object
  references. It is not the object itself we manipulate but a reference to it.*
  When we assign a value to a variable, we are not copying an object “into” that
  variable; we are merely storing a reference to an object into that variable.
  Some code makes this clear:


        s = "Ruby"
        t = s           # Copy the reference to t. s and t both refer to the same object
        t[-1] = ""      # Modify the object through the reference in t
        print s         # Prints "Rub"
        t = "Java"      # t now refers to a different object
        print s,t       # Prints "RubJava"

  ##############################################################################
  When you pass an object to a method in Ruby, it is an object reference that is
  passed to the method. It is not the object itself, and it is not a reference
  to the reference to the object. Another way to say this is that method
  arguments are passed by value rather than by reference, but that the values
  passed are object references.
  ##############################################################################


  Because object references are passed to methods, methods can use those
  references to modify the underlying object. These modifications are then
  visible when the method returns.


- Immediate values

  We’ve said that all values in Ruby are objects and all objects are manipulated
  by ref- erence. In the reference implementation, however, Fixnum and Symbol
  objects are actually “immediate values” rather than references. Neither of
  these classes have mutator methods, so Fixnum and Symbol objects are
  immutable, which means that there is really no way to tell that they are
  manipulated by value rather than by reference.

  The existence of immediate values should be considered an implementation
  detail. The only practical difference between immediate values and reference
  values is that imme- diate values cannot have singleton methods defined on
  them. (Singleton methods are explained in §6.1.4.)


- Object Lifetime

  The built-in Ruby classes described in this chapter have literal syntaxes, and
  instances of these classes are created simply by including their values
  literally in your code. Ob- jects of other classes need to be explicitly
  created, and this is most often done with a method named new:


     myObject = myClass.new


  new is a method of the Class class. It allocates memory to hold the new
  object, then it initializes the state of that newly allocated “empty” object
  by invoking its initialize method. The arguments to new are passed directly on
  to initialize. Most classes define an initialize method to perform whatever
  initialization is necessary for instances.


  The new and initialize methods provide the default technique for creating new
  classes, but classes may also define other methods, known as “factory
  methods,” that return instances. We’ll learn more about new, initialize, and
  factory methods in §7.4.


  Ruby objects never need to be explicitly deallocated, as they do in languages
  like C and C++. Ruby uses a technique called garbage collection to
  automatically destroy objects that are no longer needed. An object becomes a
  candidate for garbage collection when it is unreachable—when there are no
  remaining references to the object except from other unreachable objects.


  The fact that Ruby uses garbage collection means that Ruby programs are less
  suscep- tible to memory leaks than programs written in languages that require
  objects and memory to be explicitly deallocated and freed. But garbage
  collection does not mean that memory leaks are impossible: any code that
  creates long-lived references to objects that would otherwise be short-lived
  can be a source of memory leaks. Consider a hash used as a cache. If the cache
  is not pruned using some kind of least-recently-used algorithm, then cached
  objects will remain reachable as long as the hash itself is reach- able. If
  the hash is referenced through a global variable, then it will be reachable as
  long as the Ruby interpreter is running.



- Object Identity

  ##############################################################################
  Every object has an object identifier, a Fixnum, that you can obtain with the
  object_id method. The value returned by this method is constant and unique for
  the lifetime of the object. While the object is accessible, it will always
  have the same ID, and no other object will share that ID.
  ##############################################################################


  The method id is a deprecated synonym for object_id. Ruby 1.8 issues a warning
  if you use it, and it has been removed in Ruby 1.9.


  __id__ is a valid synonym for object_id. It exists as a fallback, so you can
  access an object’s ID even if the object_id method has been undefined or
  overridden.

################################################################################
  The Object class implements the hash method to simply return an object’s ID.
################################################################################


- Object Class and Object Type

  There are several ways to determine the class of an object in Ruby. The
  simplest is simply to ask for it:

      o = "test"   # This is a value
      o.class      # Returns an object representing the String class

  If you are interested in the class hierarchy of an object, you can ask any
  class what its superclass is:


    o.class                         # String: o is a String object
    o.class.superclass              # Object: superclass of String is Object
    o.class.superclass.superclass   # nil: Object has no superclass


  ***
  In Ruby 1.9, Object is no longer the true root of the class hierarchy:

        # Ruby 1.9 only
        Object.superclass       # BasicObject: Object has a superclass in 1.9
        BasicObject.superclass  # nil: BasicObject has no superclass

  See §7.3 for more on BasicObject.
  ***

  So a particularly straightforward way to check the class of an object is by
  direct comparison:

        o.class == String                # true if is o a String

  The instance_of? method does the same thing and is a little more elegant:

        o.instance_of? String            # true if o is a String

  Usually when we test the class of an object, we would also like to know if the
  object is an instance of any subclass of that class. To test this, use the
  is_a? method, or its synonym kind_of?:


    x = 1                       # This is the value we're working with
    x.instanceof? Fixnum        # true
    x.instanceof? Numeric       # false: instance_of? doesn't check inheritance
    x.is_a? Fixnum              # true: x is a Fixnum
    x.is_a? Integer             # true: x is an Integer
    x.is_a? Numeric             # true: x is a Numeric
    x.is_a? Comparable          # true: works with mixin modules, too
    x.is_a? Object              # true for any value of x

  The Class class defines the === operator in such a way that it can be used in
  place of is_a?:

    Numeric === x                   # true: x is_a Numeric

  This idiom is unique to Ruby and is probably less readable than using the more
  traditional is_a? method.

  Every object has a well-defined class in Ruby, and that class never changes
  during the lifetime of the object. An object’s type, on the other hand, is
  more fluid. The type of an object is related to its class, but the class is
  only part of an object’s type.

  ##############################################################################
  When we talk about the type of an object, we mean the set of behaviors that
  characterize the object.  Another way to put it is that the type of an object
  is the set of methods it can respond to. (This definition becomes recursive
  because it is not just the name of the methods that matter, but also the types
  of arguments that those methods can accept.)
  ##############################################################################


  In Ruby programming, we often don’t care about the class of an object, we just
  want to know whether we can invoke some method on it. Consider, for example,
  the << operator. Arrays, strings, files, and other I/O-related classes define
  this as an append operator. If we are writing a method that produces textual
  output, we might write it generically to use this operator. Then our method
  can be invoked with any argument that implements <<. We don’t care about the
  class of the argument, just that we can append to it. We can test for this
  with the respond_to? method:

     o.respond_to? :"<<"                     # true if o has an << operator

  ***
  The shortcoming of this approach is that it only checks the name of a method,
  not the arguments for that method. For example, Fixnum and Bignum implement <<
  as a left-shift operator and expect the argument to be a number instead of a
  string. Integer objects appear to be “appendable” when we use a respond_to?
  test, but they produce an error when our code appends a string. There is no
  general solution to this problem, but an ad-hoc remedy, in this case, is to
  explicitly rule out Numeric objects with the is_a?  method:


    o.respond_to? :"<<" and not o.is_a? Numeric

  Another example of the type-versus-class distinction is the StringIO class
  (from Ruby’s standard library). StringIO enables reading from and writing to
  string objects as if they were IO objects. StringIO mimics the IO API—StringIO
  objects define the same methods that IO objects do. But StringIO is not a
  subclass of IO. If you write a method that expects a stream argument, and test
  the class of the argument with is_a? IO, then your method won’t work with
  StringIO arguments.


  Focusing on types rather than classes leads to a programming style known in
  Ruby as “duck typing.” We’ll see duck typing examples in Chapter 7.


- Object Equality

  Ruby has a surprising number of ways to compare objects for equality, and it
  is important to understand how they work, so you know when to use each method.


  - The equal? method

    The equal? method is defined by Object to test whether two values refer to
    exactly the same object. For any two distinct objects, this method always
    returns false:

            a = "Ruby"
            b = c = "Ruby"

            a.equal?(b)         # false
            b.equal?(c)         # true: b and c refer to the same object

    ###########################################################
    By convention, subclasses never override the equal? method.
    ###########################################################

    Another way to determine if two objects are, in fact, the same object is to
    check their object_id:


      a.object_id == b.object_id               # Works like a.equal?(b)


  - The == operator

    The == operator is the most common way to test for equality. In the Object
    class, it is simply a synonym for equal?, and it tests whether two object
    references are identical.

    ############################################################################
    Most classes redefine this operator to allow distinct instances to be tested
    for equality:
    ############################################################################

        a = "Ruby"     # One String object
        b = "Ruby"     # A different String object with the same content


        a.equal?(b)    # false: a and b do not refer to the same object
        a == b         # true: but these two distinct objects have equal values



     Note that the single equals sign in this code is the assignment operator.
     It takes two equals signs to test for equality in Ruby (this is a
     convention that Ruby shares with many other programming languages).


   Most standard Ruby classes define the == operator to implement a reasonable
   definition of equality. This includes the Array and Hash classes. Two arrays
   are equal according to == if they have the same number of elements, and if
   their corresponding elements are all equal according to ==. Two hashes are ==
   if they contain the same number of key/value pairs, and if the keys and
   values are themselves equal. (Values are compared with the == operator, but
   hash keys are compared with the eql? method, described later in this
   chapter.)


   [ Ruby's convention is just about the opposite of Java's for '==' and equals
   method ]

   The Numeric classes perform simple type conversions in their == operators, so
   that (for example) the Fixnum 1 and the Float 1.0 compare as equal.


   *****************************************************************************
   The == operator of classes, such as String and Array, normally requires both
   operands to be of the same class. If the righthand operand defines a to_str
   or to_ary conversion function (see §3.8.7), then these operators invoke the
   == operator defined by the righthand operand, and let that object decide
   whether it is equal to the lefthand string or array. Thus, it is possible
   (though not common) to define classes with string-like or array-like
   comparison behavior.
   *****************************************************************************


   != (“not-equal”) is used in Ruby to test for inequality. When Ruby sees !=,
   it simply uses the == operator and then inverts the result. This means that a
   class only needs to define the == operator to define its own notion of
   equality. Ruby gives you the != op- erator for free. In Ruby 1.9, however,
   classes can explicitly define their own != operators.


- The eql? method


  ##############################################################################
  The eql? method is defined by Object as a synonym for equal?. *** Classes that
  override it typically use it as a strict version of == that does no type
  conversion. *** For example:
  ##############################################################################

    1 == 1.0                # true: Fixnum and Float objects can be ==
    1.eql?(1.0)             # false: but they are never eql!

  ##############################################################################
  The Hash class uses eql? to check whether two hash keys are equal. If two
  objects are eql?, their hash methods must also return the same value.
  Typically, if you create a class and define the == operator, you can simply
  write a hash method and define eql? to use ==.
  ##############################################################################

- The === operator

  ##############################################################################
  The === operator is commonly called the “case equality” operator and is used
  to test whether the target value of a case statement matches any of the when
  clauses of that statement. (The case statement is a multiway branch and is
  explained in Chapter 5.)
  ##############################################################################

  Object defines a default === operator so that it invokes the == operator. For
  many classes, therefore, case equality is the same as == equality. But certain
  key classes define === differently, and in these cases it is more of a ##
  membership or matching operator ##. Range defines === to test whether a value
  falls within the range. Regexp defines === to test whether a string matches
  the regular expression. And Class defines === to test whether an object is an
  instance of that class. In Ruby 1.9, Symbol defines === to return true if the
  righthand operand is the same symbol as the left or if it is a string holding
  the same text. Examples:


            (1..10) === 5         # true
            /\d+/ === "123"       # true

            String === "s"        # true: "s" is an instance of the class String
            :s === "s"            # true in Ruby 1.9

  It is uncommon to see the === operator used explicitly like this. More
  commonly, its use is simply implicit in a case statement.



- The =~ operator

  The =~ operator is defined by String and Regexp (and Symbol in Ruby 1.9) to
  perform pattern matching, and it isn’t really an equality operator at all. But
  it does have an equals sign in it, so it is listed here for completeness.
  Object defines a no-op version of =~ that always returns false. You can define
  this operator in your own class, if that class defines some kind of
  pattern-matching operation or has a notion of approximate equality, for
  example. !~ is defined as the inverse of =~. It is definable in Ruby 1.9 but
  not in Ruby 1.8.


- Object Order

  Practically every class can define a useful == method for testing its
  instances for equality.  Some classes can also define an ordering. That is:
  for any two instances of such a class, the two instances must be equal, or one
  instance must be “less than” the other. Num- bers are the most obvious classes
  for which such an ordering is defined. Strings are also ordered, according to
  the numeric ordering of the character codes that comprise the strings.  (With
  the ASCII text, this is a rough kind of case-sensitive alphabetical order.) If
  a class defines an ordering, then instances of the class can be compared and
  sorted.

  In Ruby, classes define an ordering by implementing the <=> operator. This
  operator should return –1 if its left operand is less than its right operand,
  0 if the two operands are equal, and 1 if the left operand is greater than the
  right operand. If the two operands cannot be meaningfully compared (if the
  right operand is of a different class, for example), then the operator should
  return nil:


        1 <=> 5       # -1
        5 <=> 5       # 0
        9 <=> 5       # 1
        "1" <=> 5     # nil: integers and strings are not comparable

  The <=> operator is all that is needed to compare values. But it isn’t
  particularly intuitive.  So classes that define this operator typically also
  include the Comparable module as a mixin. (Modules and mixins are covered in
  §7.5.2.) The Comparable mixin defines the following operators in terms of <=>:


        <               Less than
        <=
        ==
        >=
        >

  Comparable does not define the != operator; Ruby automatically defines that
  operator as the negation of the == operator. In addition to these comparison
  operators, Comparable also defines a useful comparison method named between?:


       1.between?(0,10)                # true

  If the <=> operator returns nil, all the comparison operators derived from it
  return false. The special Float value NaN is an example:


        nan = 0.0/0.0
        nan < 0                # false
        nan > 0                # false
        nan == 0               # false
        nan == nan             # false, it is not equal to itself!
        nan.equal?(nan)        # true

  Note that defining <=> and including the Comparable module defines a ==
  operator for your class. Some classes define their own == operator, typically
  when they can imple- ment this more efficiently than an equality test based on
  <=>. It is possible to define classes that implement different notions of
  equality in their == and <=> operators. A class might do case-sensitive string
  comparisons for the == operator, for example, but then do case-insensitive
  comparisons for <=>, so that instances of the class would sort more naturally.
  In general, though, it is best if <=> returns 0 if and only if == returns
  true.



- Object Conversion

  Many Ruby classes define methods that return a representation of the object as
  a value of a different class. The to_s method, for obtaining a String
  representation of an object, is probably the most commonly implemented and
  best known of these methods. The subsections that follow describe various
  categories of conversions.


  - Explicit conversions

    Classes define explicit conversion methods for use by application code that
    needs to convert a value to another representation. The most common methods
    in this category are to_s, to_i, to_f, and to_a to convert to String,
    Integer, Float, and Array, respectively.


    Built-in methods do not typically invoke these methods for you. If you
    invoke a method that expects a String and pass an object of some other kind,
    that method is not expected to convert the argument with to_s. (Values
    interpolated into double-quoted strings, however, are automatically
    converted with to_s.)


    to_s is easily the most important of the conversion methods because string
    represen- tations of objects are so commonly used in user interfaces. An
    important alternative to to_s is the inspect method. to_s is generally
    intended to return a human-readable representation of the object, suitable
    for end users. inspect, on the other hand, is in- tended for debugging use,
    and should return a representation that is helpful to Ruby developers.
    The default inspect method, inherited from Object, simply calls to_s.


  - Implicit conversions

    Sometimes a class has strong characteristics of some other class. The Ruby
    Exception class represents an error or unexpected condition in a program and
    encapsulates an error message. In Ruby 1.8, Exception objects are not merely
    convertible to strings; they are string-like objects and can be treated as
    if they were strings in many contexts.* For example:

    [* Doing so is discouraged, however, and Ruby 1.9 no longer allows the
    implicit conversion of Exception to String.]


        # Ruby 1.8 only
        e = Exception.new("not really an exception")
        msg = "Error: " + e             # String concatenation with an Exception

    Because Exception objects are string-like, they can be used with the string
    concatenation operator. This does not work with most other Ruby classes. The
    reason that Exception objects can behave like String objects is that, in
    Ruby 1.8, Exception imple- ments the implicit conversion method ###to_str
    ###, and the + operator defined by String invokes this method on its
    righthand operand.

    [### Note: It seems that for using "String" + object requires you to
    implement the to_str method ###] [ not to be confused with to_s]

    Other implicit conversion methods are to_int for objects that want to be
    integer-like, to_ary for objects that want to be array-like, and to_hash for
    objects that want to be hash-like. Unfortunately, the circumstances under
    which these implicit conversion methods are called are not well documented.
    Among the built-in classes, these implicit conversion methods are not
    commonly implemented, either.


    We noted earlier in passing that the == operator can perform a weak kind of
    type con- version when testing for equality. The == operators defined by
    String, Array, and Hash check to see if the righthand operand is of the same
    class as the lefthand operand.

    ############################################################################
    If so, they compare them. If not, they check to see if the righthand operand
    has a to_str, to_ary, or to_hash method. They don’t invoke this method, but
    if it exists, they invoke the == method of the righthand operand and allow
        it to decide whether it is equal to the lefthand operand.
    ############################################################################

    In Ruby 1.9, the built-in classes String, Array, Hash, Regexp, and IO all
    define a class method named try_convert. These methods convert their
    argument if it defines an appropriate implicit conversion method, or they
    return nil otherwise.  Array.try_convert(o) returns o.to_ary if o defines
    that method; otherwise, it returns nil. These try_convert methods are
    convenient if you want to write methods that allow implicit conversions on
    their arguments.

        pg 81 Conversion functions

- Conversion functions

################################################################################
  The Kernel module defines four conversion methods that behave as global
  conversion functions. These functions—Array, Float, Integer, and String—have
  the same names as the classes that they convert to, and they are unusual in
  that they begin with a capital letter.
################################################################################


  The Array function attempts to convert its argument to an array by calling
  to_ary. If that method is not defined or returns nil, it tries the to_a
  method. If to_a is not defined or returns nil, the Array function simply
  returns a new array containing the argument as its single element.


  The Float function converts Numeric arguments to Float objects directly. For
  any non- Numeric value, it calls the to_f method.

  The Integer function converts its argument to a Fixnum or Bignum. If the
  argument is a Numeric value, it is converted directly. Floating-point values
  are truncated rather than rounded. If the argument is a string, it looks for a
  radix indicator (a leading 0 for octal, 0x for hexadecimal, or 0b for binary)
  and converts the string accordingly. Unlike String.to_i it does not allow
  nonnumeric trailing characters. For any other kind of argument, the Integer
  function first attempts conversion with to_int and then with to_i.


  Finally, the String function converts its argument to a string simply by
  calling its to_s method.


- Arithmetic operator type coercions

  Numeric types define a conversion method named coerce. The intent of this
  method is to convert the argument to the same type as the numeric object on
  which the method is invoked, or to convert both objects to some more general
  compatible type. The coerce method always returns an array that holds two
  numeric values of the same type.

  The first element of the array is the converted value of the argument to
  coerce. The second element of the returned array is the value (converted, if
  necessary) on which coerce was invoked:

        1.1.coerce(1)      # [1.0, 1.1]: coerce Fixnum to Float
        require "rational" # Use Rational numbers
        r = Rational(1, 3) # One third as a Rational number
        r.coerce(2)        # [Rational(2, 1), Rational(1, 3)]: Fixnum to Rational

  The coerce method is used by the arithmetic operators. The + operator defined
  by Fixnum doesn’t know about Rational numbers, for example, and if its
  righthand oper- and is a Rational value, it doesn’t know how to add it. coerce
  provides the solution.  Numeric operators are written so that if they don’t
  know the type of the righthand operand, they invoke the coerce method of the
  righthand operand, passing the lefthand operand as an argument. Returning to
  our example of adding a Fixnum and a Rational, the coerce method of Rational
  returns an array of two Rational values. Now the + operator defined by Fixnum
  can simply invoke + on the values in the array.


- Boolean type conversions

  Boolean values deserve a special mention in the context of type conversion.
  Ruby is very strict with its Boolean values: true and false have to_s methods,
  which return “true” and “false” but define no other conversion methods. And
  there is no to_b method to convert other values to Booleans.


  In some languages, false is the same thing as 0, or can be converted to and
  from 0. In Ruby, the values true and false are their own distinct objects, and
  there are no implicit conversions that convert other values to true or false.
  This is only half the story, how- ever. Ruby’s Boolean operators and its
  conditional and looping constructs that use Boolean expressions can work with
  values other than true and false. The rule is simple: in Boolean expressions,
  any value other than false or nil behaves like (but is not converted to) true.
  nil, on the other hand behaves like false.


  Suppose you want to test whether the variable x is nil or not. In some
  languages, you must explicitly write a comparison expression that evaluates to
  true or false:


        if x != nil
            puts x          # Print x if it is defined
        end

  This code works in Ruby, but it is more common simply to take advantage of the
  fact that all values other than nil and false behave like true:


        if x            # If x is non-nil
                puts x  # Then print it
        end

  It is important to remember that values like 0, 0.0, and the empty string ""
  behave like true in Ruby, which is surprising if you are used to languages
  like C or JavaScript.


- Copying Objects

  The Object class defines two closely related methods for copying objects. Both
  clone and dup return a shallow copy of the object on which they are invoked.
  If the copied object includes one internal state that refers to other objects,
  only the object references are copied, not the referenced objects themselves.


  If the object being copied defines an initialize_copy method, then clone and
  dup sim- ply allocate a new, empty instance of the class and invoke the
  initialize_copy method on this empty instance. The object to be copied is
  passed as an argument, and this “copy constructor” can initialize the copy
  however it desires. For example, the initialize_copy method could recursively
  copy the internal data of an object so that the resulting object is not a
  simple shallow copy of the original.


  Classes can also override the clone and dup methods directly to produce any
  kind of copy they desire.


  There are two important differences between the clone and dup methods defined
  by Object. First, clone copies both the frozen and tainted state (defined
  shortly) of an object, whereas dup only copies the tainted state; calling dup
  on a frozen object returns an unfrozen copy. Second, clone copies any
  singleton methods of the object, whereas dup does not.


- Marshaling Objects

  You can save the state of an object by passing it to the class method
  Marshal.dump. If you pass an I/O stream object as the second argument,
  Marshal.dump writes the state of the object (and, recursively, any objects it
  references) to that stream. Otherwise, it simply returns the encoded state as
  a binary string.

  To restore a marshaled object, pass a string or an I/O stream containing the
  object to Marshal.load.


  Marshaling an object is a very simple way to save its state for later use, and
  these meth- ods can be used to provide an automatic file format for Ruby
  programs. Note, however, that the binary format used by Marshal.dump and
  Marshal.load is version-dependent, and newer versions of Ruby are not
  guaranteed to be able to read marshaled objects written by older versions of
  Ruby.


  Another use for Marshal.dump and Marshal.load is to create deep copies of
  objects:


        def deepcopy(o)
                Marshal.load(Marshal.dump(o))
        end

  Note that files and I/O streams, as well as Method and Binding objects, are
  too dynamic to be marshaled; there would be no reliable way to restore their
  state.

  YAML (“YAML Ain’t Markup Language”) is a commonly used alternative to the
  Marshal module that dumps objects to (and loads objects from) a human-readable
  text format. It is in the standard library, and you must require 'yaml' to use
  it.



- Freezing Objects

  Any object may be frozen by calling its freeze method. A frozen object becomes
  immutable—none of its internal state may be changed, and an attempt to call
  any of its mutator methods fails:


            s = "ice"    # Strings are mutable objects
            s.freeze     # Make this string immutable
            s.frozen?    # true
            s.upcase!    # TypeError: can't modify frozen string
            x[0] = "ni"  # TypeError: can't modify frozen string

  Freezing a class object prevents the addition of any methods to that class.

  You can check whether an object is frozen with the frozen? method. Once
  frozen, there is no way to “thaw” an object. If you copy a frozen object with
  clone, the copy will also be frozen. If you copy a frozen object with dup,
  however, the copy will not be frozen.


- Tainting Objects

  Web applications must often keep track of data derived from untrusted user
  input to avoid SQL injection attacks and similar security risks. Ruby provides
  a simple solution to this problem: any object may be marked as tainted by
  calling its taint method. Once an object is tainted, any objects derived from
  it will also be tainted. The taint of an object can be tested with the
  tainted? method:


        s = "untrusted"      # Objects are normally untainted
        s.taint              # Mark this untrusted object as tainted
        s.tainted?           # true
        s.upcase.tainted?    # ture: derived objects are tainted
        s[3,4].tainted?      # true: substrings are tainted

  User input—such as command-line arguments, environment variables, and strings
  read with gets—are automatically tainted.

  Copies of tainted objects made with clone and dup remain tainted. A tainted
  object may be untainted with the untaint method. You should only do this, of
  course, if you have examined the object and are convinced that it presents no
  security risks.


  The object tainting mechanism of Ruby is most powerful when used with the
  global variable $SAFE. When this variable is set to a value greater than zero,
  Ruby restricts various built-in methods so that they will not work with
  tainted data. See Chapter 10 for further details on the $SAFE variable.



* Expressions and Operators

  An expression is a chunk of Ruby code that the Ruby interpreter can evaluate
  to produce a value. Here are some sample expressions:


        2                # A numeric literal
        x                # A local variable reference
        Math.sqrt(2)     # A method invocation
        x = Math.sqrt(2) # Assignment
        x*x              # Multiplication with the * operator


  As you can see, primary expressions—such as literals, variable references, and
  method invocations—can be combined into larger expressions with operators,
  such as the assignment operator and the multiplication operator.

  Many programming languages distinguish between low-level expressions and
  higher- level statements, such as conditionals and loops. In these languages,
  statements control the flow of a program, but they do not have values. They
  are executed, rather than evaluated.


#################################################################
   statements == loops, conditionals
   expressions == stuff you can evaluate and can return a value
#################################################################

  In Ruby, there is no clear distinction between statements and expressions;
  everything in Ruby, including class and method definitions, can be evaluated
  as an expression and will return a value. It is still useful, however, to
  distinguish syntax typ- ically used as expressions from syntax typically used
  as statements. Ruby expressions that affect flow-of-control are documented in
  Chapter 5. Ruby expressions that define methods and classes are covered in
  Chapters 6 and 7.


  This chapter covers the simpler, more traditional sort of expressions. The
  simplest expressions are literal values, which we already documented in
  Chapter 3. This chapter explains variable and constant references, method
  invocations, assignment, and compound expressions created by combining smaller
  expressions with operators.


- Literals and Keyword Literals

  Literals are values such as 1.0, 'hello world', and [] that are embedded
  directly into your program text. We introduced them in Chapter 2 and
  documented them in detail in Chapter 3.


  It is worth noting that many literals, such as numbers, are primary
  expressions—the simplest possible expressions not composed of simpler
  expressions. Other literals, such as array and hash literals and double-quoted
  strings that use interpolation, include subexpressions and are therefore not
  primary expressions.


  Certain Ruby keywords are primary expressions and can be considered keyword
  literals or specialized forms of variable reference:


        nil           Evaluates to the nil value, of class NilClass

        true          Evaluates to the singleton instance of class TrueClass

        false         Evaluates to the singleton instance of calss FalseClass

        self          Evaluates to the current object

        __FILE__      Evaluates to a string that names the file that the Ruby
                      interpreter is executing. This can be useful in error
                      messages

        __LINE__      Evaluates to an integer that specifies the line number
                      within __FILE__ of the current line of code

        __ENCODING__  Evaluates to an Encoding object that specifies the
                      encoding of the current file (Ruby 1.9)

- Variable References

  A variable is simply a name for a value. Variables are created and values
  assigned to them by assignment expressions, which are covered later in this
  chapter. When the name of a variable appears in a program anywhere other than
  the lefthand side of an assignment, it is a variable reference expression and
  evaluates to the value of the variable:


        one = 1.0 # This is an assignment expression
        one       # This varible reference expression evaluates to 1.0

  As explained in Chapter 2, there are four kinds of variables in Ruby, and
  lexical rules govern their names.


  Variables that begin with $ are global variables, visible throughout a Ruby
  program. Variables that begin with @ and @@ are instance variables and class
  variables, used in object-oriented programming and explained in Chapter 7.

  And variables whose names begin with an underscore or a lowercase letter are
  local variables, defined only within the current method or block. (See §5.4.3
  for more about the scope of local variables.)

  ##############################################################################
  Variables always have simple, unqualified names. If a . or :: appears in an
  expression, then that expression is either a reference to a constant or a
  method invocation. For example, Math::PI is a reference to a constant, and the
  expression item.price is an invocation of the method named price on the value
  held by the variable item.
  ##############################################################################

  The Ruby interpreter predefines a number of global variables when it starts
  up. See Chapter 10 for a list of these variables.


- Uninitialized Variables

  In general, you should always assign a value to, or initialize, your variables
  before using them in expressions. In some circumstances, however, Ruby will
  allow you to use var- iables that have not yet been initialized. The rules are
  different for different kinds of variables:



  [Class variables]    Class variables must always have a value assigned to them
                       before they are used.  Ruby raises a NameError if you
                       refer to a class variable to which no value has been
                       assigned.

  [Instance variables] If you refer to an uninitialized instance variable, Ruby
                       returns nil. It is considered bad programming to rely on
                       this behavior, however. Ruby will issue a warning about
                       the uninitialized variable if you run it with the -w
                       option.

  [Global variables]   Uninitialized global variables are like uninitialized
                       instance variables: they evaluate to nil, but cause a
                       warning when Ruby is run with the -w flag.

                       #########################################################
[Local variables]      This case is more complicated than the others because
                       local variables don’t have a punctuation character as a
                       prefix. This means that local variable references look
                       just like method invocation expressions. If the Ruby
                       interpreter has seen an assignment to a local variable,
                       it knows it is a variable and not a method, and it can
                       return the value of the variable. If there has been no
                       assignment, then Ruby treats the expression as a method
                       invocation. If no method by that name exists, Ruby raises
                       a NameError.
                       #########################################################

                       In general, therefore, attempting to use a local variable
                       before it has been initialized results in an error. There
                       is one quirk—a variable comes into existence when the
                       Ruby interpreter sees an assignment expression for that
                       variable. This is the case even if that assignment is not
                       actually executed. A variable that exists but has not
                       been assigned a value is given the default value nil. For
                       example:


                       a = 0.0 if false # This assignment is never executed
                       print a          # Prints nil: the variable exists but is not assigned
                       print b          # NameError: no variable or metohd named b exists

- Constant References

  A constant in Ruby is like a variable, except that its value is supposed to
  remain constant for the duration of a program. The Ruby interpreter does not
  actually enforce the con- stancy of constants, but it does issue a warning if
  a program changes the value of a constant. Lexically, the names of constants
  look like the names of local variables, except that they begin with a capital
  letter. By convention, most constants are written in all uppercase with
  underscores to separate words, LIKE_THIS. Ruby class and module names are also
  constants, but they are conventionally written using initial capital letters
  and camel case, LikeThis.

  ##############################################################################
  Although constants look like local variables with capital letters, they have
  the visibility of global variables: they can be used anywhere in a Ruby
  program without regard to scope. Unlike global variables, however, constants
  can be defined by classes and modules and can therefore have qualified names.
  ##############################################################################

  A constant reference is an expression that evaluates to the value of the named
  constant.  The simplest constant references are primary expressions—they
  consist simply of the name of the constant:


        CM_PER_INCH = 2.54

  In addition to simple references like this one, constant references can also
  be compound expressions. In this case, :: is used to separate the name of the
  constant from the class or module in which it is defined. The lefthand side of
  the :: may be an arbitrary ex- pression that evaluates to a class or module
  object. (Usually, however, this expression is a simple constant reference that
  just names the class or module.) The righthand side of the :: is the name of a
  constant defined by the class or module. For example:

         Conversion::CM_PER_INCH  # Constant defined in the Conversions module
         modules[0]::NAME         # Constant defined by an element of an array

  Modules may be nested, which means that constants may be defined in nested
  name- spaces like this:

        Conversions::Area::HECTARES_PER_ACRE

  The lefthand side of the :: may be omitted, in which case the constant is
  looked up in the global scope:


       ::ARGV                          # The global constant ARGV

  ##############################################################################
  Note that there is not actually a “global scope” for constants. Like global
  functions, global constants are defined (and looked up) within the Object
  class. The expression ::ARGV, therefore, is simply shorthand for Object::ARGV.
  ##############################################################################

  When a constant reference expression is qualified with a ::, Ruby knows
  exactly where to look up the specified constant. When there is no qualifying
  ::, however, the Ruby interpreter must search for an appropriate definition of
  the constant. It searches the lexically enclosing scope as well as the
  inheritance hierarchy of the enclosing class or module. Complete details are
  in §7.9.


  When Ruby evaluates a constant reference expression, it returns the value of
  the con- stant, or it raises a NameError exception if no constant by that name
  could be found.  Note that constants do not exist until a value is actually
  assigned to them. This is unlike variables that can come into existence when
  the interpreter sees, but does not execute, an assignment.


  The Ruby interpreter predefines some constants when it starts up. See Chapter
  10 for a list.


- Method Invocations

  A method invocation expression has four parts:


  An arbitrary expression whose value is the object on which the method is
  invoked.  This expression is followed by . or :: to separate it from the
  method name that follows. The expression and separator are optional; if
  omitted, the method is invoked on self.

  The name of the method being invoked. This is the only required piece of a
  method invocation expression.

  The argument values being passed to the method. The list of arguments may be
  enclosed in parentheses, but these are usually optional. (Optional and
  required parentheses are discussed in detail in §6.3.) If there is more than
  one argument, they are separated from each other with commas. The number and
  type of argu- ments required depend on the method definition. Some methods
  expect no arguments.

  An optional block of code delimited by curly braces or by a do/end pair. The
  method may invoke this code using the yield keyword. This ability to associate
  arbitrary code with any method invocation is the basis for Ruby’s powerful
  iterator methods.  We’ll learn much more about blocks associated with method
  invocations in §5.3 and §5.4.


  A method name is usually separated from the object on which it is invoked with
  a .. :: is also allowed, but it is rarely used because it can make method
  invocations look more like constant reference expressions.

  When the Ruby interpreter has the name of a method and an object on which it
  is to be invoked, it finds the appropriate definition of that named method
  using a process known as “method lookup” or “method name resolution.” The
  details are not important here, but they are explained thoroughly in §7.8.


  The value of a method invocation expression is the value of the last evaluated
  expression in the body of the method. We’ll have more to say about method
  definitions, method invocations, and method return values in Chapter 6. Here,
  however, are some examples of method invocations:


        puts "hello world"  # "puts" invoked on self, with one string arg
        Math.sqrt(2)        # "sqrt" invoked on object Math with one arg
        message.length      # "length" invoked on object message; no args
        a.each {|x| p x }   # "each" invoked on object a, with an asociated block

        *** Invoking Global Functions ***

  Look again at this method invocation shown earlier:

        puts "hello world"


  This is an invocation of the Kernel method puts. Methods defined by Kernel are
  global functions, as are any methods defined at the top-level, outside of any
  classes. Global functions are defined as private methods of the Object class.
  We’ll learn about private methods in Chapter 7. For now, you just need to know
  that private methods are not allowed to be explicitly invoked on a receiver
  object—they are always implicitly in- voked on self. self is always defined,
  and no matter what its value is, that value is an Object. Because global
  functions are methods of Object, these methods can always be invoked
  (implicitly) in any context, regardless of the value of self.


  **********************************************************


  One of the method invocation examples shown earlier was message.length. You
  may be tempted to think of it as a variable reference expression, evaluating
  to the value of the variable length in the object message.


  This is not the case, however. Ruby has a very pure object-oriented
  programming model: Ruby objects may encapsulate any number of internal
  instance variables, but they expose only methods to the outside world. Be-
  cause the length method expects no arguments and is invoked without optional
  parentheses, it looks like a variable reference. In fact, this is intentional.


  Methods like these are called attribute accessor methods, and we say that the
  message object has a length attribute.

  As we’ll see, it is possible for the message object to define a method named
  length=. If this method expects a single argument, then it is an attribute
  setter method and Ruby invokes it in response to assignment. If such a method
  is defined, then these two lines of code would both invoke the same method:


        message.length=(3)     # Traditional method invocation
        message.length = 3     # Method invocation masquerading as assignment

  Now consider the following line of code, assuming that the variable a holds an
  array:


       a[0]

  You might again think that this is a special kind of variable reference
  expression, where the variable in question is actually an array element.
  Again, however, this is method invocation. The Ruby interpreter converts the
  array access into this:


       a.[](0)


  The array access becomes an invocation of the method named [] on the array,
  with the array index as its argument. This array access syntax is not limited
  to arrays. Any object is allowed to define a method named []. When the object
  is “indexed” with square brackets, any values within the brackets will be
  passed to the method. If the [] method is written to expect three arguments,
  then you should put three comma-separated expressions within the square
  brackets.


  Assignment to arrays is also done via method invocation. If the object o
  defines a method named []=, then the expression o[x]=y becomes o.[]=(x,y), and
  the expression o[x,y]=z becomes o.[]=(x,y,z).

  We’ll see later in this chapter that many of Ruby’s operators are defined as
  methods, and expressions like x+y are evaluated as x.+(y), where the method
  name is +. The fact that many of Ruby’s operators are defined as methods means
  that you can redefine these operators in your own classes.


  Now let’s consider this very simple expression:

      x

  ##############################################################################
  If a variable named x exists (that is, if the Ruby interpreter has seen an
  assignment to x), then this is a variable reference expression. If no such
  variable exists, then this is an invocation of the method x, with no
  arguments, on self.
  ##############################################################################

  The Ruby-reserved word super is a special kind of method invocation
  expression. This keyword is used when creating a subclass of another class. By
  itself, super passes the arguments of the current method to the method with
  the same name in the superclass.  It can also be used as if it were actually
  the name of a method and can be followed by an arbitrary argument list. The
  super keyword is covered in detail in §7.3.3.


- Assignments

  An assignment expression specifies one or more values for one or more lvalues.
  lvalue is the term for something that can appear on the lefthand side of an
  assignment operator. (Values on the righthand side of an assignment operator
  are sometimes called rvalues by contrast.) Variables, constants, attributes,
  and array elements are lvalues in Ruby. The rules for and the meaning of
  assignment expressions are somewhat different for different kinds of lvalues,
  and each kind is described in detail in this section.


  There are three different forms of assignment expressions in Ruby. Simple
  assignment involves one lvalue, the = operator, and one rvalue. For example:


     x = 1                   # Set the lvalue x to the value 1

  Abbreviated assignment is a shorthand expression that updates the value of a
  variable by applying some other operation (such as addition) to the current
  value of the variable.  Abbreviated assignment uses assignment operators like
  += and *= that combine binary operators with an equals sign:


    x += 1                  # Set the lvalue x to the value x + 1

  Finally, parallel assignment is any assignment expression that has more than
  one lvalue or more than one rvalue. Here is a simple example:

    x,y,z = 1,2,3           # Set x to 1, y to 2 and z to 3

  Parallel assignment is more complicated when the number of lvalues is not the
  same as the number of rvalues or when there is an array on the right. Complete
  details follow.


  The value of an assignment expression is the value (or an array of the values)
  assigned.  Also, the assignment operator is “right-associative”—if multiple
  assignments appear in a single expression, they are evaluated from right to
  left. This means that the assign- ment can be chained to assign the same value
  to multiple variables:


    x = y = 0               # Set x and y to 0

  Note that this is not a case of parallel assignment—it is two simple
  assignments, chained together: y is assigned the value 0, and then x is
  assigned the value (also 0) of that first assignment.


   *** Assignment and Side Effects

  More important than the value of an assignment expression is the fact that
  assignments set the value of a variable (or other lvalue) and thereby affect
  program state. This effect on program state is called a side effect of the
  assignment.

  Many expressions have no side effects and do not affect program state. They
  are idem- potent. This means that the expression may be evaluated over and
  over again and will return the same value each time. And it means that
  evaluating the expression has no effect on the value of other expressions.
  Here are some expressions without side effects:

     x + y

     Math.sqrt(2)

#######################################################################
  It is important to understand that assignments are not idempotent:
#######################################################################


  Some methods, such as Math.sqrt, are idempotent: they can be invoked without
  side effects. Other methods are not, and this largely depends on whether those
  methods perform assignments to nonlocal variables.


- Assigning to Variables

  When we think of assignment, we usually think of variables, and indeed, these
  are the most common lvalues in assignment expressions. Recall that Ruby has
  four kinds of variables: local variables, global variables, instance
  variables, and class variables. These are distinguished from each other by the
  first character in the variable name. Assign- ment works the same for all four
  kinds of variables, so we do not need to distinguish between the types of
  variables here.


  Keep in mind that the instance variables of Ruby’s objects are never visible
  outside of the object, and variable names are never qualified with an object
  name. Consider this assignment:

     point.x, point.y = 1, 2

  The lvalues in this expression are not variables; they are attributes, and are
  explained shortly.


  Assignment to a variable works as you would expect: the variable is simply set
  to the specified value. The only wrinkle has to do with variable declaration
  and an ambiguity between local variable names and method names. Ruby has no
  syntax to explicitly declare a variable: variables simply come into existence
  when they are assigned. Also, local variable names and method names look the
  same—there is no prefix like $ to distinguish them.


################################################################################
  Thus, a simple expression such as x could refer to a local variable named x or
  a method of self named x. To resolve this ambiguity, Ruby treats an iden-
  tifier as a local variable if it has seen any previous assignment to the
  variable. It does this even if that assignment was never executed. The
  following code demonstrates:
################################################################################

        class Ambiguous
            def x; 1; end        # A method named "x". Always returns 1

            def test
                    puts x       # No variable has been seen;
                                 # refers to method above: prints 1

            # The line below is never evaluated, because of hte "if false" clause. But
            # the parser sees it and treats x as a variable for the rest of the method

            x = 0 if false

            puts x             # x is a variable, but has never been assigned to: prints nil

            x = 2              # This assignment does get evaluated
            puts x             # So now this line prints 2
            end
        end

- Assigning to Constants

  Constants are different from variables in an obvious way: their values are
  intended to remain constant throughout the execution of a program. Therefore,
  there are some special rules for assignment to constants:


        - Assignment to a constant that already exists causes Ruby to issue a
          warning. Ruby does execute the assignment, however, which means that
          constants are not really constant.

        - Assignment to constants is not allowed within the body of a method.
          Ruby assumes that methods are intended to be invoked more than once;
          if you could assign to a constant in a method, that method would issue
              warnings on every invocation after the first. So, this is simply
              not allowed.

################################################################################
################################################################################
  Unlike variables, constants do not come into existence until the Ruby
  interpreter actually executes the assignment expression. A nonevaluated
  expression like the following does not create a constant:
################################################################################
################################################################################


                N = 100 if false

################################################################################
################################################################################
  Note that this means a constant is never in an uninitialized state. If a
  constant exists, then it has a value assigned to it. A constant will only have
  the value nil if that is actually the value it was given.
################################################################################
################################################################################

- Assigning to Attributes and Array Elements

  Assignment to an attribute or array element is actually Ruby shorthand for
  method invocation. Suppose an object o has a method named m=: the method name
  has an equals sign as its last character. Then o.m can be used as an lvalue in
  an assignment expression.  Suppose, furthermore, that the value v is assigned:

         o.m = v

  The Ruby interpreter converts this assignment to the following method
  invocation:


   o.m=(v)  # If we omit the parens and add a space, this looks like assignment!

  That is, it passes the value v to the method m=. That method can do whatever
  it wants with the value. Typically, it will check that the value is of the
  desired type and within the desired range, and it will then store it in an
  instance variable of the object. Methods like m= are usually accompanied by a
  method m, which simply returns the value most recently passed to m=. We say
  that m= is a setter method and m is a getter method.


  ##############################################################################
  When an object has this pair of methods, we say that it has an attribute m.
  Attributes are sometimes called “properties” in other languages. We’ll learn
  more about attributes in Ruby in §7.1.5.
  ##############################################################################

  ##############################################################################
  Assigning values to array elements is also done by method invocation. If an
  object o defines a method named []= (the method name is just those three
  punctuation char- acters) that expects two arguments, then the expression o[x]
  = y is actually executed as:
  ##############################################################################

       o.[]=(x,y)

   If an object has a []= method that expects three arguments, then it can be
   indexed with two values between the square brackets. The following two
   expressions are equivalent in this case:


                o[x,y]  = z
                o.[]=(x,y,z)

- Abbreviated Assignment

  Abbreviated assignment is a form of assignment that combines assignment with
  some other operation. It is used most commonly to increment variables:

                x+= 1

  += is not a real Ruby operator, and the expression above is simply an
  abbreviation for:

                x = x + 1

  Abbreviated assignment cannot be combined with parallel assignment: it only
  works when there is a single lvalue on the left and a single value on the
  right. It should not be used when the lvalue is a constant because it will
  reassign the constant and cause a warning. Abbreviated assignment can,
  however, be used when the lvalue is an attribute.  The following two
  expressions are equivalent:


                o.m += 1
                o.m=(o.m() + 1)

  Abbreviated assignment even works when the lvalue is an array element. These
  two expressions are equivalent:


                o[x] -= 2
                o.[]=(x,o.[](x) - 2)

  Note that this code uses -= instead of +=. As you might expect, the -=
  pseudooperator subtracts its rvalue from its lvalue.

  In addition to += and -=, there are 11 other pseudooperators that can be used
  for abbreviated assignment. They are listed in Table 4-1. Note that these are
  not true op- erators themselves, they are simply shorthand for expressions
  that use other operators.  The meanings of those other operators are described
  in detail later in this chapter. Also, as we’ll see later, many of these other
  operators are defined as methods. If a class defines a method named +, for
  example, then that changes the meaning of abbreviated assignment with += for
  all instances of that class.


       +=, -=, *=, /=, %=, **=, &&=, ||=, &=, |=, ^=, <<=, >>=


   *** The ||= Idiom

  As noted at the beginning of this section, the most common use of abbreviated
  assign- ment is to increment a variable with +=. Variables are also commonly
  decremented with -=. The other pseudooperators are much less commonly used.
  One idiom is worth knowing about, however. Suppose you are writing a method
  that computes some val- ues, appends them to an array, and returns the array.
  You want to allow the user to specify the array that the results should be
  appended to. But if the user does not specify the array, you want to create a
  new, empty array. You might use this line:


       results ||= []

  It expands to::

      results = results || []


  If you know the || operator from other languages, or if you’ve read ahead to
  learn about || in Ruby, then you know that the righthand side of this
  assignment evaluates to the value of results, unless that is nil or false. In
  that case, it evaluates to a new, empty array. This means that the abbreviated
  assignment shown here leaves results unchanged, unless it is nil or false, in
  which case it assigns a new array.

  [ notice that it does not produce a boolean true, but returns the object. if
  the object is nil or false, then return and empty array instead ]

  The abbreviated assignment operator ||= actually behaves slightly differently
  than the expansion shown here. If the lvalue of ||= is not nil or false, no
  assignment is actually performed. If the lvalue is an attribute or array
  element, the setter method that performs assignment is not invoked.

  ******************************************************************************


- Parallel Assignment

  Parallel assignment is any assignment expression that has more than one
  lvalue, more than one rvalue, or both. Multiple lvalues and multiple rvalues
  are separated from each other with commas. lvalues and rvalues may be prefixed
  with *, which is sometimes called the splat operator, though it is not a true
  operator. The meaning of * is explained later in this section.

  Most parallel assignment expressions are straightforward, and it is obvious
  what they mean. There are some complicated cases, however, and the following
  subsections explain all the possibilities.


- Same number of lvalues and rvalues

  Parallel assignment is at its simplest when there are the same number of
  lvalues and rvalues:


      x,y,z = 1,2,3           # x=1; y=2;, z =3


  In this case, the first rvalue is assigned to the first lvalue; the second
  rvalue is assigned to the second lvalue; and so on.


  These assignments are effectively performed in parallel, not sequentially. For
  example, the following two lines are not the same:


    x,y = y,x             # Parallel: swap the value of two variables

    x = y; y = x          # Sequential: both variables have same value

- One lvalue, multiple rvalues

  When there is a single lvalue and more than one rvalue, Ruby creates an array
  to hold the rvalues and assigns that array to the lvalue:


    x = 1, 2, 3           # x = [1, 2, 3]

  You can place an * before the lvalue without changing the meaning or the
  return value of this assignment.


  If you want to prevent the multiple rvalues from being combined into a single
  array, follow the lvalue with a comma. Even with no lvalue after that comma,
  this makes Ruby behave as if there were multiple lvalues:


    x, = 1, 2, 3          # x = 1; other values are discarded

- Multiple lvalues, single array rvalue

  When there are multiple lvalues and only a single rvalue, Ruby attempts to
  expand the rvalue into a list of values to assign. If the rvalue is an array,
  Ruby expands the array so that each element becomes its own rvalue. If the
  rvalue is not an array but implements a to_ary method, Ruby invokes that
  method and then expands the array it returns:


    x,y,z = [1,2,3]         # Same as x,y,z = 1,2,3

  The parallel assignment has been transformed so that there are multiple
  lvalues and zero (if the expanded array was empty) or more rvalues. If the
  number of lvalues and rvalues are the same, then assignment occurs as
  described earlier in §4.5.5.1. If the numbers are different, then assignment
  occurs as described next in §4.5.5.4.

  We can use the trailing-comma trick described above to transform an ordinary
  non- parallel assignment into a parallel assignment that automatically unpacks
  an array on the right:


        x = [1,2]               # x becomes [1,2]

        x, = [1,2]              # x becomes 1

- Different numbers of lvalues and rvalues

  If there are more lvalues than rvalues, and no splat operator is involved,
  then the first rvalue is assigned to the first lvalue, the second rvalue is
  assigned to the second lvalue, and so on, until all the rvalues have been
  assigned. Next, each of the remaining lvalues is assigned nil, overwriting any
  existing value for that lvalue:


       x,y,z =  1,2            # x = 1, y = 2, z = nil

  If there are more rvalues than lvalues, and no splat operator is involved,
  then rvalues are assigned—in order—to each of the lvalues, and the remaining
  rvalues are discarded:


       x,y = 1,2,3   # x =1 ; y = 2; 3 is not assigned anywhere


 - The splat operator

################################################################################
   When an rvalue is preceded by an asterisk, it means that that value is an
   array (or an array-like object) and that its elements should each be rvalues.
   The array elements replace the array in the original rvalue list, and
   assignment proceeds as described above:


     x,y,z = 1, *[2,3]       # same as x,y,z=1,2,3

################################################################################

   In Ruby 1.8, a splat may only appear before the last rvalue in an assignment.
   In Ruby 1.9, the list of rvalues in a parallel assignment may have any number
   of splats, and they may appear at any position in the list. It is not legal,
   however, in either version of the language, to attempt a “double splat” on a
   nested array:


       x,y = **[[1,2]]

   In Ruby 1.8, array, range, and hash rvalues can be splatted. In Ruby 1.9,
   array, range, and enumerator (see §5.3.4) rvalues can be splatted. If you
   apply a splat to a value of some other class, that value simply expands to
   itself. You can define your own splattable classes. In Ruby 1.8, define a
   to_ary method that returns an array of values. In Ruby 1.9, name the method
   to_splat instead.


   When an lvalue is preceded by an asterisk, it means that all extra rvalues
   should be placed into an array and assigned to this lvalue. The value
   assigned to that lvalue is always an array, and it may have zero, one, or
   more elements:


################################################################################
        x,*y =  1,2,3           # x =1; y =[2,3]
        x,*y = 1 ,2             # x=1; y = [2]
        x,*y = 1                # x =1; y=[]
################################################################################

   In Ruby 1.8, a splat may only precede the last lvalue in the list. In Ruby
   1.9, the lefthand side of a parallel assignment may include one splat
   operator, but it may appear at any position in the list:


                # Ruby 1.9 only

                *x,y = 1,2,3                    # x=[1,2]; y=3
                *x,y = 1,2                      # x=[1]; y=2
                *x,y=1                          # x=[]; y=1

   Note that splats may appear on both sides of a parallel assignment
   expression:


       x,y, *z = 1, *[2,3,4]                   # x=1, y=2, z =[3,4]

   Finally, recall that earlier we described two simple cases of parallel
   assignment in which there is a single lvalue or a single rvalue. Note that
   both of these cases behave as if there is a splat before the single lvalue or
   rvalue. Explicitly including a splat in these cases has no additional effect.


   [ splat related to array]

- Parantheses in parallel assignment

  One of the least-understood features of parallel assignment is that the
  lefthand side can use parentheses for “subassignment.” If a group of two or
  more lvalues is enclosed in parentheses, then it is initially treated as a
  single lvalue. Once the corresponding rvalue has been determined, the rules of
  parallel assignment are applied recursively—that rvalue is assigned to the
  group of lvalues that was in parentheses. Consider the following assignment:


      x,(y,z) = a, b

   This is effectively two assignments executed at the same time:


        x = a
        y,z = b

   But note that the second assignment is itself a parallel assignment. Because
   we used parentheses on the lefthand side, a recursive parallel assignment is
   performed. In order for it to work, b must be a splattable object such as an
   array or enumerator.

   Here are some concrete examples that should make this clearer. Note that
   parentheses on the left act to “unpack” one level of nested array on the
   right:


        x,y,z = 1,[2,3]         # x=1;y=[2,3],z=nil
        x,(y,z) = 1,[2,3]       # x=1;y=2,z=3

        a,b,c,d = [1,[2,[3,4]]]         # a = 1, b = [2,[3,4]], c = d = nil
        a,(b,(c,d)) = [1,[2,[3,4]]]     # a = 1, b = 2, c = 3, d = 4

- The value of parallel assignment

  The return value of a parallel assignment expression is the array of rvalues
  (after being augmented by any splat operators).


   *** Parallel Assignment and Method Invocation


  As an aside, note that if a parallel assignment is prefixed with the name of a
  method, the Ruby interpreter will interpret the commas as method argument
  separators rather than as lvalue and rvalue separators. If you want to test
  the return value of a parallel assignment, you might write the following code
  to print it out:


        puts x,y=1,2

  This doesn’t do what you want, however; Ruby thinks you’re invoking the puts
  method with three arguments: x, y=1, and 2. Next, you might try putting the
  parallel assignment within parentheses for grouping:


        puts (x,y=1,2)

  This doesn’t work, either; the parentheses are interpreted as part of the
  method invo- cation (though Ruby complains about the space between the method
  name and the opening parenthesis). To actually accomplish what you want, you
  must use nested parentheses:


        puts((x,y=1,2))


   This is one of those strange corner cases in the Ruby grammar that comes as
   part of the expressiveness of the grammar. Fortunately, the need for syntax
   like this rarely arises.


- Operators

  An operator is a token in the Ruby language that represents an operation (such
  as addition or comparison) to be performed on one or more operands. ### The
  operands are expressions ###, and operators allow us to combine these operand
  expressions into larger expressions. The numeric literal 2 and the operator +,
  for example, can be combined into the expression 2+2. And the following
  expression combines a numeric literal, a method invocation expression, and a
  variable reference expression with the multipli- cation operator and the
  less-than operator:


    2 * Math.sqrt(2) < limit


  Table 4-2 later in this section summarizes each of Ruby’s operators, and the
  sections that follow describe each one in detail. To fully understand
  operators, however, you need to understand operator arity, precedence, and
  associativity.


  The arity of an operator is the number of operands it operates on. Unary
  operators expect a single operand. Binary operators expect two operands.
  Ternary operators (there is only one of these) expect three operands. The
  arity of each operator is listed in column N of Table 4-2. Note that the
  operators + and – have both unary and binary forms.


  The precedence of an operator specifies how “tightly” an operator is bound to
  its op- erands, and affects the order of evaluation of an expression. Consider
  this expression, for example:


       1 + 2 * 3

  The multiplication operator has higher precedence than the addition operator,
  so the multiplication is performed first and the expression evaluates to 7.
  Table 4-2 is arranged in order from high-precedence operators to
  low-precedence operators. Note that there are both high- and low-precedence
  operators for Boolean AND, OR, and NOT operations.

  Operator precedence only specifies the default order of evaluation for an
  expression.  You can always use parentheses to group subexpressions and
  specify your own order of evaluation. For example:


      (1 + 2) * 3


  The associativity of an operator specifies the order of evaluation when the
  same operator (or operators with the same precedence) appear sequentially in
  an expression. Column A of Table 4-2 specifies the associativity of each
  operator. The value “L” means that expressions are evaluated from left to
  right. The value “R” means that expressions are evaluated from right to left.
  And the value “N” means that the operator is nonassocia- tive and cannot be
  used multiple times in an expression without parentheses to specify the
  evaluation order.

  Most arithmetic operators are left-associative, which means that 10-5-2 is
  evaluated as (10-5)-2 instead of 10-(5-2). Exponentiation, on the other hand,
  is right-associative, so 2**3**4 is evaluated as 2**(3**4). Assignment is
  another right-associative operator.  In the expression a=b=0, the value 0 is
  first assigned to the variable b. Then the value of

  Ruby implements a number of its operators as methods, allowing classes to
  define new meanings for those operators. Column M of Table 4-2 specifies which
  operators are methods. Operators marked with a “Y” are implemented with
  methods and may be redefined, and operators marked with an “N” may not. In
  general, classes may define their own arithmetic, ordering, and equality
  operators, but they may not redefine the various Boolean operators. We
  categorize operators in this chapter according to their most common purpose
  for the standard Ruby classes. Other classes may define different meanings for
  the operators. The + operator, for example, performs numeric addition and is
  categorized as an arithmetic operator. But it is also used to concatenate
  strings and arrays. A method-based operator is invoked as a method of its
  lefthand operand (or its only operand, in the case of unary operators). The
  righthand operand is passed as an argument to the method.  You can look up a
  class’s definition of any method- based operator as you would look up any
  other method of a class. For example, use ri to look up the definition of the
  * operator for strings:



      ri 'String.*'

  To define unary + and unary – operators, use method names +@ and -@ to avoid
  ambi- guity with the binary operators that use the same symbols. The != and !~
  operators are defined as the negation of the == and =~ operators. In Ruby 1.9,
  you can redefine != and !~. In earlier versions of the language, you cannot.
  Ruby 1.9 also allows the unary ! operator to be redefined.


  pg 102 for table

- Unary + and -

  The unary minus operator changes the sign of its numeric argument. The unary
  plus is allowed, but it has no effect on numeric operands—it simply returns
  the value of its operand. It is provided for symmetry with unary minus, and
  can, of course, be rede- fined. Note that unary minus has slightly lower
  precedence than unary plus; this is described in the next section on the **
  operator.


  The names of these unary operators as methods are -@ and +@. Use these names
  when redefining the operators, invoking the operators as methods, or looking
  up documen- tation for the operators. These special names are necessary to
  disambiguate the unary plus and minus operators from binary plus and minus.


- Exponentiation: **

  ** performs exponentiation, raising its first argument to the power of the
  second. Note that you can compute roots of a number by using a fractional
  number as the second operand. For example, the cube root of x is x**(1.0/3.0).
  Similarly, x**-y is the same as 1/(x**y). The ** operator is
  right-associative, so x**y**z is the same thing as x**(y**z). Finally, note
  that ** has higher precedence than the unary minus operator, so -1**0.5 is the
  same thing as -(1**0.5). If you really want to take the square root of -1, you
  must use parentheses: (-1)**0.5. (The imaginary result is not-a-number, and
  the expression evaluates to NaN.)


- Arithmetic: +, -, *,/, and %

  The operators +, –, *, and / perform addition, subtraction, multiplication,
  and division on all Numeric classes. Integer division returns an integer
  result and discards any re- mainder. The remainder can be computed with the
  modulo operator %. Integer division by zero raises ZeroDivisionError.
  Floating-point division by zero returns plus or minus Infinity. Floating-point
  division of zero by zero returns NaN. See §3.1.3 for further details on Ruby’s
  integer and floating-point arithmetic.

  The String class uses the + operator for string concatenation, the * operator
  for string repetition, and the % operator for sprintf argument substitution
  into a string.

  The Array class uses + for array concatenation and – for array subtraction.
  Array uses the * operator in different ways, depending on the class of the
  second operand. When an array is “multiplied” by a number, the result is a new
  array that repeats the contents of the operand array the specified number of
  times. But when an array is multiplied by a string, the result is the same as
  calling the join method of the array and passing that string as the argument.


- Shift and Append: << and >>

  The Fixnum and Bignum classes define the << and >> operators to shift the bits
  of the lefthand argument to the left and to the right. The righthand argument
  is the number of positions to shift the bits, and negative values result in a
  shift in the opposite direc- tion: a left-shift of –2 is the same as a
  right-shift of 2. High-order bits are never “shifted off” when a Fixnum is
  shifted left. If the result of a shift does not fit in a Fixnum, a Bignum
  value is returned. Right shifts, however, always discard the low-order bits of
  the argument.


  Shifting a number left by 1 bit is the same as multiplication by 2. Shifting a
  number right by 1 bit is the same as integer division by 2. Here are some
  examples that express numbers in binary notation and then convert their
  results back to binary form:


        (0b1011 << 1).to_s(2)           # "10110"
        (0b10110 >> 2).to_s(2)          # "101"

  The << operator is also used as an append operator, and it’s probably more
  common in this form. The String, Array, and IO classes define it in this way,
  as do a number of other “appendable” classes from the standard library, such
  as Queue and Logger:

        message = "hello"
        messages = []
        message << " world"
        messages << message
        STDOUT << message         # Print the message to standard output stream

- Complement, Union, Intersection: ~, &, |, and ^

  Fixnum and Bignum define these operators to perform bitwise NOT, AND, OR, and
  XOR operations. ~ is a high-precedence unary operator, and the others are
  medium- precedence binary operators.

  ~ changes each 0 bit of its integer operand to a 1, and each 1 bit to a 0,
  producing the binary 1s-complement of a number. For any integer x, ~x is the
  same as -x-1.


  & is the bitwise AND operator for two numbers. The bits of the result are set
  to 1 only if the corresponding bit in each operand is set to 1. For example:


      (0b1010 & 0b1100).to_s(2)                # => "1000"

  is the bitwise OR operator for two integers. A bit in the result is 1 if
  either corre- sponding bit in the operands is 1. For example:

      (0b1010 | 0b1100).to_s(2)                # => "1110"

  ^ is the bitwise XOR (exclusive-OR) for integers. A bit in the result is 1 if
  one (but not both) of the corresponding bits in the operands is 1. For
  example:


      (0b1010 ^ 0b1100).to_s(2)                # => "110"

  Other classes use these operators as well, usually in ways that are compatible
  with their logical AND, OR, and NOT meanings. Arrays use & and | for set
  intersection and union operations. When & is applied to two arrays, it returns
  a new array that contains only those elements that appear in the lefthand
  array AND the righthand array. When | is applied to two arrays, it returns a
  new array that contains any elements that appear in either the lefthand array
  OR the righthand array. See §9.5.2.7 for details and examples.

  TrueClass, FalseClass, and NilClass define &, |, and ^ (but not ~), so that
  they can be used as Boolean operators. Note, however, that this is rarely the
  correct thing to do.  The Boolean operators && and || (described later in
  §4.6.8) are intended for Boolean operands, and are more efficient because they
  do not evaluate their righthand operand unless its value will affect the
  result of the operation.


- Comparison: <, <=, >, >=, and <=>

  Some classes define a natural order for their values. Numbers are ordered by
  magnitude; strings are ordered alphabetically; dates are ordered
  chronologically. The less-than (<), less-than-or-equal-to (<=),
  greater-than-or-equal-to (>=), and greater-than (>) op- erators make
  assertions about the relative order of two values. They evaluate to true if
  the assertion is true, and they evaluate to false otherwise. (And they
  typically raise an exception if their arguments are of incomparable types.)

  Classes may define the comparison operators individually. It is easier and
  more com- mon, however, for a class to define the single <=> operator. This is
  a general-purpose comparison operator, and its return value indicates the
  relative order of the two oper- ands. If the lefthand operand is less than the
  righthand operand, then <=> returns –1.  If the lefthand operand is greater,
  it returns +1. If the two operands are equal, the op- erator returns 0. And if
  the two operands are not comparable, it returns nil.* Once the <=> operator is
  defined, a class may simply include the module Comparable, which defines the
  other comparison operators (including the == operator) in terms of <=>.

  The Module class deserves special mention: it implements the comparison
  operators to indicate subclass relationships (Module is the superclass of
  Class). For classes A and B, A < B is true if A is a subclass or descendant of
  B. In this case, “less than” means “is more specialized than” or “is a
  narrower type than.” As a mnemonic, note that (as we’ll learn in Chapter 7)
  the < character is also used when declaring a subclass:


        # Declare class A as a subclass of B

        class A < B
        end

  Module defines > to work like < with its operands reversed. And it defines <=
  and >= so that they also return true if the two operands are the same class.
  The most interesting things about these Module comparison operators is that
  Module only defines a partial ordering on its values. Consider the classes
  String and Numeric. Both are subclasses of Object, and neither one is a
  subclass of the other. In this case, when the two operands are unrelated, the
  comparison operators return nil instead of true or false:


    String < Object         # true
    Object > Numeric        # true          # Object more general than Numeric

    Numeric < Integer       # false
    String < Numeric        # nil: String and Numeric are not related

  If a class defines a total ordering on its values, and a < b is not true, then
  you can be sure that a >= b is true. But when a class, like Module, defines
  only a partial ordering, you must not make this assumption.


- Equality: ==, !=, =~, !~, and ===


  == is the equality operator. It determines whether two values are equal,
  according to the lefthand operand’s definition of “equal.” The != operator is
  simply the inverse of ==: it calls == and then returns the opposite. You can
  redefine != in Ruby 1.9 but not in Ruby 1.8. See §3.8.5 for a more detailed
  discussion of object equality in Ruby.


  =~ is the pattern-matching operator. Object defines this operator so that it
  always re- turns false. String redefines it so that it expects a Regexp as its
  righthand argument.  And Regexp redefines the operator so that it expects a
  String as its righthand argument.  Both of these operators return nil if the
  string does not match the pattern. If the string does match the pattern, the
  operators return the integer index at which the match begins. (Note that in
  Boolean expressions, nil works like false and any integer works like true.)

  The !~ operator is the inverse of =~: it calls =~ and returns true if =~
  returned nil or false if =~ returned an integer. You can redefine !~ in Ruby
  1.9 but not in Ruby 1.8.

  The === operator is the case-equality operator. It is used implicitly by case
  statements (see Chapter 5). Its explicit use is much less common than ==.
  Range, Class, and Regexp define this operator as a kind of membership or
  pattern-matching operator.  Other classes inherit Object’s definition, which
  simply invokes the == operator instead.  See §3.8.5. Note that there is no !==
  operator; if you want to negate ===, you must do it yourself.


- Boolean Operators: &&, ||, !, and, or, not

  Ruby’s Boolean operators are built into the language and are not based on
  methods: classes, for example, cannot define their own && method. The reason
  for this is that Boolean operators can be applied to any value and must behave
  consistently for any kind of operand. Ruby defines special true and false
  values but does not have a Boolean type. For the purposes of all Boolean
  operators, the values false and nil are considered false. And every other
  value, including true, 0, NaN, "", [], and {}, is considered true.  Note that
  ! is an exception; you can redefine this operator in Ruby 1.9 (but not in Ruby
  1.8). Note also that you can define methods named and, or, and not, but these
  methods are ordinary methods and do not alter the behavior of the operators
  with the same name.


  Another reason that Ruby’s Boolean operators are a core part of the language
  rather than redefinable methods is that the binary operators are
  “short-circuiting.” If the value of the operation is completely determined by
  the lefthand operand, then the righthand operand is ignored and is never even
  evaluated. If the righthand operand is an expres- sion with side effects (such
  as assignment, or an invocation of a method with side effects), then that side
  effect may or may not occur, based on the value of the lefthand operand.


  && is a Boolean AND operator. It returns a true value if both its left operand
  AND its right operand are true values. Otherwise, it returns a false value.
  Note that this de- scription says “a true value” and “a false value” instead
  of “the true value” and “the false value.” && is often used in conjunction
  with comparison operators, such as == and <, in expressions like this:


         x == 0 && y > 1


     [ x== 0 evaluates to a boolean, y > 1 evaluates to a boolean,
      so boolean && boolean.]

################################################################################
  The comparison and equality operators actually evaluate to the values true and
  false, and in this case, the && operator is operating on actual Boolean
  values. But this is not always the case. The operator can also be used like
  this:
################################################################################

    x && y

################################################################################
  In this case, x and y can be anything. The value of the expression is either
  the value of x or it is the value of y. If both x and y are true values, then
  the value of the expression is the value of y. If x is a false value, then the
  value of the expression is x. Otherwise, y must be a false value, and the
  value of the expression is y.
################################################################################

  Here’s how the && operator actually works. First, it evaluates its lefthand
  operand. If this operand is nil or false, then it returns that value and skips
  the righthand operand altogether. Otherwise, the lefthand operand is a true
  value and the overall value of the && operator depends on the value of the
  righthand operand. In this case, the operator evaluates its righthand operand
  and returns that value.



  The fact that && may skip its righthand operand can be used to advantage in
  your code.  Consider this expression:


    x && print(x.to_s)

  This code prints the value of x as a string, but only if x is not nil or
  false.


  [ if you have haha = "g" and hoho = "h",
  haha && hoho will return "h"
  hoho && haha will return "g"

  the && needs to evaluate from left to right and will return the rightmost if
  no nil/false expressions are encountered.

  for ||, if the leftmost expressions is NOT nil nor false, then it is going to
  return that.  otherwise, move to the next on the right and again repeat]


  The || operator returns the Boolean OR of its operands. It returns a true
  value if either of its operands is a true value. If both operands are false
  values, then it returns a false value. Like &&, the || operator ignores its
  righthand operand if its value has no impact on the value of the operation.
  The || operator works like this: first, it evaluates its lefthand operand. If
  this is any value other than nil or false, it simply returns that value.
  Otherwise, it evaluates its righthand operand and returns that value.

  || can be used as a conjunction to join multiple comparison or equality
  expressions:

       x < 0 || y < 0 || z < 0

  In this case, the operands to || will be actual true or false values, and the
  result will also be true or false. But || is not restricted to working with
  true and false. One idiomatic use of || is to return the first non-nil value
  in a series of alternatives:


    # If the argument x is nil, then get its value from a hash of user
    # preferences or from a constant default value

    x = x || preferences[:x] || Defaults::X

  [smart!]

  Note that && has higher precedence than ||. Consider this expression:


      1 || 2 && nil                   # 1

  The && is performed first, and the value of this expression is 1. If the ||
  was performed first, however, the value would be nil:


      (1 || 2) && nil                 # nil

  The ! operator performs a unary Boolean NOT. If the operand is nil or false,
  then the ! operator returns true. Otherwise, ! returns false.

  The ! operator is at the highest precedence. This means that if you want to
  compute the logical inverse of an expression that itself uses operators, you
  must use parentheses:


    !(a && b)

  Incidentally, one of the principles of Boolean logic allows the expression
  above to be rewritten as:


     !a || !b

  The and, or, and not operators are low-precedence versions of &&, ||, and !.
  One reason to use these variants is simply that their names are English and
  this can make your code easier to read. Try reading this line of code, for
  example:


     if x > 0 and y > 0 and not defined? d then d = Math.sqrt(x*x + y*y) end

  Another reason for these alternate versions of the Boolean operators is the
  fact that they have lower precedence than the assignment operator. This means
  that you can write a Boolean expression such as the following that assigns
  values to variables until it encounters a false value:


    [ it allows the assignment first, then do the comparison ]


    if a = f(x) and b = f(y) and c = f(z) then d = g(a,b,c) end

  This expression simply would not work if written with && instead of and.


  You should note that and and or have the same precedence (and not is just
  slightly higher). Because and and or have the same precedence, and && and ||
  have different precedences, the following two expressions compute different
  values:


    x || y && nil                   # && is performed first   => x
    x or y and nil                  # evaluated left-to-right => nil

- Ranges and Flip-Flops: .. and ...

  We’ve seen .. and ... before in §3.5 where they were described as part of the
  Range literal syntax. When the start and end points of a range are themselves
  integer literals, as in 1..10, the Ruby interpreter creates a literal Range
  object while parsing. But if the start and end point expressions are anything
  more complicated than integer literals, as in x..2*x, then it is not really
  accurate to call this a Range literal. Instead, it is a range creation
  expression. It follows, therefore, that .. and ... are operators rather than
  just range literal syntax.

  The .. and ... operators are not method-based and cannot be redefined. They
  have relatively low precedence, which means that they can usually be used
  without putting parentheses around the left or right operands:

     x+1..x*x

  The value of these operators is a Range object. x..y is the same as:

     Range.new(x,y)

  And x...y is the same as:

    Range.new(x,y,true)

- Boolean flip-flops

  When the .. and ... operators are used in a conditional, such as an if
  statement, or in a loop, such as a while loop (see Chapter 5 for more about
  conditionals and loops), they do not create Range objects. Instead, they
  create a special kind of Boolean expression called a flip-flop. A flip-flop
  expression evaluates to true or false, just as comparison and equality
  expressions do. The extraordinarily unusual thing about a flip-flop
  expression, however, is that its value depends on the value of previous evalu-
  ations. This means that a flip-flop expression has state associated with it;
  it must remember information about previous evaluations. Because it has state,
  you would expect a flip-flop to be an object of some sort. But it isn’t—it’s a
  Ruby expression, and the Ruby interpreter stores the state (just a single
  Boolean value) it requires in its internal parsed representation of the
  expression.

  With that background in mind, consider the flip-flop in the following code.
  Note that the first .. in the code creates a Range object. The second one
  creates the flip-flop expression:


      (1..10).each {|x| print x if x==3..x==5 }

  The flip-flop consists of two Boolean expressions joined with the .. operator,
  in the context of a conditional or loop. A flip-flop expression is false
  unless and until the lefthand expression evaluates to true. Once that
  expression has become true, the ex- pression “flips” into a persistent true
  state. It remains in that state, and subsequent evaluations return true until
  the righthand expression evaluates to true. When that happens, the flip-flop
  “flops” back to a persistent false state. Subsequent evaluations of the
  expression return false until the lefthand expression becomes true again.


  In the code example, the flip-flop is evaluated repeatedly, for values of x
  from 1 to 10. It starts off in the false state, and evaluates to false when x
  is 1 and 2. When x==3, the flip-flop flips to true and returns true. It
  continues to return true when x is 4 and 5. When x==5, however, the flip-flop
  flops back to false, and returns false for the remaining values of x. The
  result is that this code prints 345.

  Flip-flops can be written with either .. or .... The difference is that when a
  .. flip-flop flips to true, it returns true but also tests its righthand
  expression to see if it should flop its internal state back to false. The ...
  form waits for its next evaluation before testing the righthand expression.
  Consider these two lines:


    # Prints "3". Flips and flops back when x == 3
    (1..10).each { |x| print x if x==3..x>=3 }

    # Prints "34". Flips when x == 3 and flops when x ==4

    (1..10).each { |x| print x if x==3...x>=3 }  # Prints "34"

  Flip-flops are a fairly obscure feature of Ruby and are probably best avoided
  in your code. They are not unique to Ruby, however. Ruby inherits this feature
  from Perl, which in turn inherits them from the Unix text-processing tools sed
  and awk.* Flip-flops were originally intended for matching the lines of a text
  file between a start pattern and an end pattern. This continues to be a useful
  way to use them. The following simple Ruby program demonstrates a flip-flop.
  It reads a text file line-by-line and prints any line that contains the text
  “TODO”. It then continues printing lines until it reads a blank line:


    ARGF.each do |line|                         # For each line of standard in or of named files
        print line if line=~/TODO/..line=~/^$/  # Print lines when flip-flop is true
    end


  It is difficult to formally describe the precise behavior of a flip-flop. It
  is easier to un- derstand flip-flops by studying code that behaves in an
  equivalent way. The following function behaves like the flip-flop x==3..x==5.
  It hardcodes the lefthand and righthand conditions into the function itself,
  and it uses a global variable to store the state of the flip-flop:

    $state = false                          # Global storage for flip-flop state

    def flipflop(x)                         # test value of x against flip-flop

            if !$state                      # if saved state is false
                    resut = ( x ==3)        # Result is value of lefthand operand

                    if result
                            $state = !(x == 5)      # then saved state is not of the righthand operand
                    end
                    result                          # Return result
            else
                    $state = !(x ==5)               # then save the inverse of the righthand operand
                    true
            end
    end

  With this flip-flop function defined, we can write the following code, which
  prints 345 just like our earlier example:

      (1..10).each {|x| print x if flipflop(x) }


   The following function simulates the behavior of the three-dot flip-flop
   x==3...x>=3:


            $state2 = false
                    def flipflop2(x)
                    if !$state2
                            $state2 = (x == 3)
                    else
                            $state2 = !(x >= 3)
                            true
                    end
            end

            (1..10).each {|x| print x if x==3...x>=3 } # Prints "34"
            (1..10).each {|x| print x if flipflop2(x) } # Prints "34"


- Conditional: ?

  The ?: operator is known as the conditional operator. It is the only ternary
  operator (three operands) in Ruby. The first operand appears before the
  question mark. The second operand appears between the question mark and the
  colon. And the third operand appears after the colon.

  The ?: operator always evaluates its first operand. If the first operand is
  anything other than false or nil, the value of the expression is the value of
  the second operand.  Otherwise, if the first operand is false or nil, then the
  value of the expression is the value of the third operand. In either case, one
  of the operands is never evaluated (which matters if it includes side effects
  like assignment). Here is an example use of this operator:


       "You have #{n} #{n==1 ? 'message' : 'messages'}"

  As you can see, the ?: operator acts like a compact if/then/else statement.
  (Ruby’s if conditional is described in Chapter 5.) The first operand is the
  condition that is being tested, like the expression after the if. The second
  operand is like the code that follows the then. And the third operand is like
  the code that follows the else. The difference between the ?: operator and the
  if statement, of course, is that the if statement allows arbitrary amounts of
  code in its then and else clauses, whereas the ?: operator allows only
  single expressions.

  The ?: operator has fairly low precedence, which means that it is usually not
  necessary to put parentheses around the operands. If the first operand uses
  the defined? operator, or if the second and third operands perform
  assignments, then parentheses are neces- sary. Remember that Ruby allows
  method names to end with a question mark. If the first operand of the ?:
  operator ends with an identifier, you must put parentheses around the first
  operand or include a disambiguating space between that operand and the
  question mark. If you don’t do this, the Ruby interpreter thinks that the
  question mark of the operator is part of the previous identifier.


        x==3?y:z      # This is legal
        3==x?y:z      # Syntax error: x? is interpreted as a method name
        (3==x)?y:z    # Okay: parentheses fix the problem
        3==x ?y:z     # Spaces also resolve the problem

  The question mark must appear on the same line as the first argument. In Ruby
  1.8, the colon must appear on the same line as the second argument. In Ruby
  1.9, however, a newline is allowed before the colon. You must follow the colon
  by a space in this case, however, so it doesn’t appear to introduce a symbol
  literal.


  Table 4-2 (earlier in this chapter) says that the ?: operator is
  right-associative. If the operator is used twice in the same expression, the
  rightmost one is grouped:


        a ? b : c ? d : e      # This expression...
        a ? b : (c ? d : e)    # is evaluated like this..
        (a ? b : c) ? d : e    # NOT like this

  This kind of ambiguity is actually fairly rare with the ?: operator. The
  following ex- pression uses three conditional operators to compute the maximum
  value of three variables. No parentheses are required (although spaces are
  required before the question marks), as there is only one possible way to
  parse the statement:


        max = x>y ? x>z ? x : z : y>z ? y : z
        max = x>y ? (x>z ? x : z) : (y>z ? y : z)    # With explicit parentheses

- Assignment Operators

  You’ve already read about assignment expressions in §4.5. It is worth noting
  here a few points about the assignment operators used in those expressions.
  First, the value of an assignment expression is the value (or an array of the
  values) that appears on the righthand side of the assignment operator. Second,
  assignment operators are right- associative. Points one and two together are
  what make expressions like this one work:

            x = y = z = 0
            x = (y = (z = 0))

   Third, note that assignment has very low precedence. Precedence rules mean
   that just about anything that follows an assignment operator will be
   evaluated before the assignment is performed. The main exceptions are the
   and, or, and not operators.

   Finally, note that although assignment operators cannot be defined as
   methods, the compound assignment operators like += use redefinable operators
   like +. Redefining the + operator does not affect the assignment performed by
   the += operator, but it does affect the addition performed by that operator.


- The defined? Operator


   defined? is a unary operator that tests whether its operand is defined or
   not. Normally, using an undefined variable or method raises an exception.
   When the expression on the right of the defined? operator uses an undefined
   variable or method (including operators defined as methods), defined? simply
   returns nil. Similarly, defined? returns nil if the operand is an expression
   that uses yield or super in an inappropriate context (i.e., when there is no
   block to yield to, or no superclass method to invoke). It is important to
   understand that the expression that is the operand to defined? is not
   actually evaluated; it is simply checked to see whether it could be evaluated
   without error. Here is a typical use of the defined? operator:


            # Compute f(x), but only if f and x are both defined
            y = f(x) if defined? f(x)

    If the operand is defined, the defined? operator returns a string. The
    content of this returned string is usually unimportant; what matters is that
    it is a true value—neither nil nor false. It is possible, however, to
    inspect the value returned by this operator to learn something about the
    type of the expression on the righthand side. Table 4-3 lists the possible
    return values of this operator.

            pg 113 for table

  The defined? operator has very low precedence. If you want to test whether two
  variables are defined, use and instead of &&:

            defined? a and defined? b

            defined? a && defined? b   # Evaluated as: defined?((a && defined? b))

- Statement Modifiers

  rescue, if, unless, while, and until are conditional, looping, and
  exception-handling statements that affect the flow-of-control of a Ruby
  program. They can also be used as statement modifiers, in code like this:


            print x if x

  In this modifier form, they can be considered operators in which the value of
  the right- hand expression affects the execution of the lefthand expression.
  (Or, in the case of the rescue modifier, the exception status of the lefthand
  expression affects the execution of the righthand operand.)

  It is not particularly useful to describe these keywords as operators. They
  are docu- mented, in both their statement and expression modifier form, in
  Chapter 5. The keywords are listed in Table 4-2 simply to show their
  precedence relative to other operators. Note that they all have very low
  precedence, but that the rescue statement modifier has higher precedence than
  assignment.


- Nonoperators

  Most of Ruby’s operators are written using punctuation characters. Ruby’s
  grammar also uses a number of punctuation characters that are not operators.
  Although we’ve seen (or will see) much of this nonoperator punctuation
  elsewhere in this book, let’s review it here:


    () Parentheses are an optional part of method definition and invocation
       syntax. It is better to think of method invocation as a special kind of
       expression than to think of () as a method-invocation operator.
       Parentheses are also used for grouping to affect the order of evaluation
       of subexpressions.

    [] Square brackets are used in array literals and for querying and setting
       array and hash values. In that context, they are syntactic sugar for
       method invocation and behave somewhat like redefinable operators with
       arbitrary arity. See §4.4 and §4.5.3.

    {} Curly braces are an alternative to do/end in blocks, and are also used in
       hash literals.  In neither case do they act as operators.

     . and ..  . and :: are used in qualified names, separating the name of a
       method from the object on which it is invoked, or the name of a constant
       from the module in which it is defined. These are not operators because
       the righthand side is not a value but an identifier.

       ;, ,, and => These punctuation characters are separators rather than
                    operators. The semicolon (;) is used to separate statements
                    on the same line; the comma (,) is used to separate method
                    arguments and the elements of array and hash literals; and
                    the arrow (=>) is used to separate hash keys from hash
                    values in hash literals.

                 :  A colon is used to prefix symbol literals and is also used
                    in Ruby 1.9 hash syntax.

      *, &, and <  These punctuation characters are operators in some contexts,
                   but they are also used in ways that are not operators.
                   Putting * before an array in an assignment or method
                   invocation expression expands or unpacks the array into its
                   individual elements. Although it is sometimes known as the
                   splat operator, it is not really an operator; *a cannot stand
                   alone as an expression.

                   & can be used in a method declaration before the name of the
                   last method argument, and this causes any block passed to the
                   method to be assigned to that argument.  (See Chapter 6.) It
                   can also be used in method invocation to pass a proc to a
                   method as if it were a block.

                 < is used in class definitions to specify the superclass of
                   class.



pg 117 new chapter

* Statements and Control Structures

  Consider the following Ruby program. It adds two numbers passed to it on the
  command line and prints the sum:


        x = ARGV[0].to_f                # Converts first argument to a number
        y = ARGV[1].to_f                # Converts second argument to a number

        sum = x + y                     # Add the arguments
        puts sum                        # Print the sum


  This is a simple program that consists primarily of variable assignment and
  method invocations. What makes it particularly simple is its purely sequential
  execution. The four lines of code are executed one after the other without
  branching or repetition. It is a rare program that can be this simple. This
  chapter introduces Ruby’s control struc- tures, which alter the sequential
  execution, or flow-of-control, of a program. We cover:


               Conditinals
               Loops
               Iterators and blocks
               Flow-altering statements like return and break
               Exceptions
               The special-case BEGIN and END statements
               The esoteric control structures known as fibers and continuations


- Conditionals

  The most common control structure, in any programming language, is the
  conditional. This is a way of telling the computer to conditionally execute
  some code: to execute it only if some condition is satisfied. The condition is
  an expression—if it evaluates to any value other than false or nil, then the
  condition is satisfied.

  Ruby has a rich vocabulary for expressing conditionals. The syntax choices are
  described in the subsections that follow. When writing Ruby code, you can
  choose the one that seems most elegant for the task at hand.



- if

  The most straightforward of the conditionals is if. In its simplest form, it
  looks like this:


                        if expression
                                code
                        end

  The code between if and end is executed if (and only if) the expression
  evaluates to something other than false or nil. The code must be separated
  from the expression with a newline or semicolon or the keyword then.* Here are
  two ways to write the same simple conditional:

    [* Ruby 1.8 also allows a colon, but this syntax is no longer legal in 1.9.]

          if x < 10                     # newline seperator
                  x += 1
          end

          if x < 10 then x += 1 end   # then seperator

  You can also use then as the separator token, and follow it with a newline.
  Doing so makes your code robust; it will work even if the newline is
  subsequently removed:


                if x < 10 then
                        x += 1
                end

  Programmers who are used to C, or languages whose syntax is derived from C,
  should note two important things about Ruby’s if statement:


  Parentheses are not required (and typically not used) around the conditional
  expression. The newline, semicolon, or then keyword serves to delimit the
  expres- sion instead.


  The end keyword is required, even when the code to be conditionally executed
  consists of a single statement. The modifier form of if, described below,
  provides a way to write simple conditionals without the end keyword.


- else

  An if statement may include an else clause to specify code to be executed if
  the condition is not true:


                if expression
                        code
                else
                        code
                end

  The code between the if and else is executed if expression evaluates to
  anything other than false or nil. Otherwise (if expression is false or nil),
  the code between the else and end is executed. As in the simple form of if,
  the expression must be separated from the code that follows it by a newline, a
  semicolon, or the keyword then. The else and end keywords fully delimit the
  second chunk of code, and no newlines or additional delimiters are required.


  Here is an example of a conditional that includes an else clause:

                if data                # If the array exists
                        data << x      # then append a value to it
                else                   # Otherwise
                        data = [x]     # create a new array that holds the value
                end

- elsif

  If you want to test more than one condition within a conditional, you can add
  one or more elsif clauses between an if and an else. elsif is a shortened form
  of “else if.” Note that there is only one e in elsif. A conditional using
  elsif looks like this:


                if expression1
                        code1
                elsif expression2
                        code2
                          .
                          .
                elsif expressionN
                        codeN
                else
                        code
                end

  If expression1 evaluates to anything other than false or nil, then code1 is
  executed.  Otherwise, expression2 is evaluated. If it is anything other than
  false or nil, then code2 is executed. This process continues until an
  expression evaluates to something other than false or nil, or until all elsif
  clauses have been tested. If the expression associated with the last elsif
  clause is false or nil, and the elsif clause is followed by an else clause,
  then the code between else and end is executed. If no else clause is present,
  then no code is executed at all.

  elsif is like if: the expression must be separated from the code by a newline,
  a semi- colon, or a then keyword.


- Return value

  In most languages, the if conditional is a statement. In Ruby, however,
  everything is an expression, even the control structures that are commonly
  called statements. The return value of an if “statement” (i.e., the value that
  results from evaluating an if expression) is the value of the last expression
  in the code that was executed, or nil if no block of code was executed.

  The fact that if statements return a value means that, for example, the
  multiway conditional shown previously can be elegantly rewritten as follows:



            name = if  x == 1 then "one"
                elsif  x == 2 then "two"
                elsif  x == 3 then "three"
                elsif  x == 4 then "four"
                else  "many"
                end

- if As a Modifier

  When if is used in its normal statement form, Ruby’s grammar requires that it
  be terminated with the end keyword. For simple, single-line conditionals, this
  is somewhat awkward. This is just a parsing problem, and the solution is to
  use the if keyword itself as the delimiter that separates the code to be
  executed from the conditional expression. Instead of writing:


         if expression then code end

  we can simply write:

         code if expression

  When used in this form, if is known as a statement (or expression) modifier.
  If you’re a Perl programmer, you may be accustomed to this syntax. If not,
  please note that the code to execute comes first, and the expression follows.
  For example:


      puts message if message                 # Output message, if it is defined

  This syntax places more emphasis on the code to be executed, and less emphasis
  on the condition under which it will be executed. Using this syntax can make
  your code more readable when the condition is a trivial one or when the
  condition is almost always true.

  Even though the condition is written last, it is evaluated first. If it
  evaluates to anything other than false or nil, then the code is evaluated, and
  its value is used as the return value of the modified expression. Otherwise,
  the code is not executed, and the return value of the modified expression is
  nil. Obviously, this syntax does not allow any kind of else clause.

  To use if as a modifier, it must follow the modified statement or expression
  immedi- ately, with no intervening line break. Inserting a newline into the
  previous example turns it into an unmodified method invocation followed by an
  incomplete if statement:


        puts message             # Unconditional
        if message               # Incomplete

  The if modifier has very low precedence and binds more loosely than the
  assignment operator. Be sure you know just what expression you are modifying
  when you use it.  For example, the following two lines of code are different:


        y = x.invert if x.respond_to? :invert
        y = (x.invert if x.respond_to? :invert)


  In the first line, the modifier applies to the assignment expression. If x
  does not have a method named invert, then nothing happens at all, and the
  value of y is not modified.  In the second line, the if modifier applies only
  to the method call. If x does not have an invert method, then the modified
  expression evaluates to nil, and this is the value that is assigned to y.

  An if modifier binds to the single nearest expression. If you want to modify
  more than one expression, you can use parentheses or a begin statement for
  grouping. But this approach is problematic because readers don’t know that the
  code is part of a condi- tional until they reach the bottom. Also, using an if
  modifier in this way gives up the conciseness that is the primary benefit of
  this syntax. When more than one line of code is involved, you should typically
  use a traditional if statement rather than an if modi- fier. Compare the
  following three side-by-side alternatives:


        if expression      begin                   (
                line 1              line1               line1
                line 2              line2               line2
        end                 end if expression       ) end if expression

  Note that an expression modified with an if clause is itself an expression
  that can be modified. It is therefore possible to attach multiple if modifiers
  to an expression:


    # Output message if message exists and the output method is defined
    puts message if message if defined? puts

  Repeating an if modifier like this is hard to read, however, and it makes more
  sense to combine the two conditions into a single expression:

   puts message if message and defined? puts


- Unless

  unless, as a statement or a modifier, is the opposite of if: it executes code
  only if an associated expression evaluates to false or nil. Its syntax is just
  like if, except that elsif clauses are not allowed:

    # single-way unless statement
    unless condition
            code
    end

    # two-way unless statement
    unless condition
            code
    else
            code
    end

    # unless modifier
    code unless condition

  The unless statement, like the if statement, requires that the condition and
  the code are separated by a newline, a semicolon, or the then keyword. Also
  like if, unless statements are expressions and return the value of the code
  they execute, or nil if they execute nothing:


        x = unless o.nil?    # Call the to_s method on object o, unless o is nil
                o.to_x
        end

        s = unless o.nil? then o.to_s end    # then seperator

  For single-line conditionals like this, the modifier form of unless is usually
  clearer:


       s = o.to_s unless o.nil?

  Ruby has no equivalent of the elsif clause for an unless conditional. You can
  still write a multiway unless statement, however, if you’re willing to be a
  little more verbose:


        unless x == 0
                blablabal
        else
                unless y == 0
                        blablabal

                else
                        blablabla
                end
        end


- case

  The case statement is a multiway conditional. There are two forms of this
  statement.  The simple (and infrequently used) form is nothing more than an
  alternative syntax for if/elsif/else. These two side-by-side expressions are
  equivalent:


        name = case
            when x == 1 then "one"
            when x == 2 then "two"
            else "many"
            end

  As you can see from this code, the case statement returns a value, just as the
  if statement does. As with the if statement, the then keyword following the
  when clauses can be replaced with a newline or semicolon:*


        case
        when x == 1
          "one"
        when x == 2
          "two"
        when x == 3
          "three"
        end

  The case statement tests each of its when expressions in the order they are
  written until it finds one that evaluates to true. If it finds one, it
  evaluates the statements that come between that when and the following when,
  else, or end. The last expression evaluated becomes the return value of the
  case statement. Once a when clause that evaluates to true has been found,
  no other when clauses are considered.


  The else clause of a case statement is optional, but if it appears, it must
  come at the end of the statement, after all when clauses. If no when clause is
  true, and there is an else clause, then the code between else and end is
  executed. The value of the last expression evaluated in this code becomes the
  value of the case statement. If no when clause is true and there is no else
  clause, then no code is executed and the value of the case statement is nil.

  A when clause within a case statement may have more than one (comma-separated)
  expression associated with it. If any one of these expressions evaluates to
  true, then the code associated with that when is executed. In this simple form
  of the case statement, the commas aren’t particularly useful and act just like
  the || operator:


    case
    when x == 1, y ==0 then "x is one or y is zero"     # Obscure syntax
    when x == 2 || y == 1 then "x is tow or y is one"   # Easier to understand
    end

  All the case examples we’ve seen so far demonstrate the simpler, less common
  form of the statement. case is really more powerful than this. Notice that in
  most of the exam- ples, the left side of each when clause expression is the
  same. In the common form of case, we factor this repeated lefthand expression
  of the when clause and associate it with the case itself:


    name = case x
               when 1               # Just the value to compare to x
                  "one"
               when 2 then "two"
               when 3; "three"
               else "many"
               end

  In this form of the case statement, the expression associated with the case is
  evaluated once, and then it’s compared to the values obtained by evaluating
  the when expression.  The comparisons are performed in the order in which the
  when clauses are written, and the code associated with the first matching when
  is executed. If no match is found, the code associated with the else clause
  (if there is one) is executed. The return value of this form of the case
  statement is the same as the return value of the simpler form: the value of
  the last expression evaluated, or nil if no when or else matches.


  The important thing to understand about the case statement is how the values
  of the when clauses are compared to the expression that follows the case
  keyword. This com- parison is done using the === operator. This operator is
  invoked on the value of the when expression and is passed the value of the
  case expression. Therefore, the case statement above is equivalent to the
  following (except that x is only evaluated once in the code above):


        name = case
            when 1 == x then "one"
              ...
            else "many"
         end

   === is the case equality operator. For many classes, such as the Fixnum class
   used earlier, the === operator behaves just the same as ==. But certain
   classes define this operator in interesting ways. The Class class defines ===
   so that it tests whether the righthand operand is an instance of the class
   named by the lefthand operand. Range defines this operator to test whether
   the value on the right falls within the range on the left.  Regexp defines it
   so that it tests whether the text on the right matches the pattern on the
   left. In Ruby 1.9, Symbol defines === so that it tests for symbol or string
   equality.  With these definitions of case equality, we are able to write
   interesting case statements like the following:


    # Take different acutions depending on the class of x

            puts case x
                    when String then "string"
                    when Numeric then "number"
                    when TrueClass, FalseClass then "boolean"
                    else "other"

    # Compute 2006 U.S. income tax using case and Range objects

            tax = case income
            when 0..7550
                    income * 0.1
            when 7550..30650
                    755 + (income-7550)*0.15
            when 30650..74200
                    4220 + (income-30655)*0.25
            when 74200..154800
                    15107.5 + (income-74201)*0.28
            when 154800..336550
                    37675.5 + (income-154800)*0.33
            else
                    97653 + (income-336550)*0.35
            end


            # when the user enters the word "quit"
            while line=gets.chomp do
                    case line
                    when /^\s*#/       # If input looks like a comment
                        next           # skip to the next line
                    when /^quit$/i     # If input is "quit" (case insensitive)
                            break      # exit the loop
                    else
                            puts line.reverse   # reverse the user's input and print it
                    end
            end

  A when clause can have more than one expression associated with it. Multiple
  expres- sions are separated by commas, and the === operator is invoked on each
  one. That is, it is possible to trigger the same block of code with more than
  one value:


        def hasValue?(x)
                case x
                when nil, [], "", 0  # if nil===x || []===x || ""===x || 0===x then
                    false
                else
                    true
                end
        end


   *** case v/s switch

  Java programmers and others accustomed to C-derived language syntax are
  familiar with a multiway conditional switch statement, which is similar to
  Ruby’s case state- ment. There are, however, a number of important
  differences:


    - In Java and related languages, the name of the statement is switch and its
      clauses are labeled with case and default. Ruby uses case as the name of
      the statement, and when and else for the clauses.

    - The switch statement of other languages simply transfers control to the
      start of the appropriate case. From there, control continues and can “fall
      through” to other cases, until it reaches the end of the switch statement
      or encounters a break or return statement. This fall-through behavior
      allows multiple case clauses to refer to the same block of code. In Ruby,
      this same purpose is served by allowing mul- tiple comma-separated
      expressions to be associated with each when clause. Ruby’s case statement
      never allows fall-through.

    - In Java and most compiled languages with C-like syntax, the expressions
      associ- ated with each case label must be compile-time constants rather
      than arbitrary runtime expressions. This often allows the compiler to
      implement the switch statement using a very fast lookup table. There is no
      such restriction on Ruby’s case statement, and its performance is
      equivalent to using an if statement with repeated elsif clauses.

- The ?: Operator

  The conditional operator ?:, described earlier in §4.6.10, behaves much like
  an if statement, with ? replacing then and : replacing else. It provides a
  succinct way to express conditionals:


    def how_many_messages(n)
        "You have " + n.to_s + ( n == 1 ? "message." : " messages.")
    end

- Loops

  This section documents Ruby’s simple looping statements: while, until, and
  for. Ruby also includes the ability to define custom looping constructs known
  as iterators. Iter- ators (see §5.3) are probably more commonly used than
  Ruby’s built-in looping statements; they are documented in later in this
  chapter.

- while and until

  Ruby’s basic looping statements are while and until. They execute a chunk of
  code while a certain condition is true, or until the condition becomes true.
  For example:


        x = 10
        while x >=0 do
                puts x
                x = x - 1
        end


        x = 0
        until x > 10 do         # Loop until x is greater than 10
                puts x
                x = x + 1
        end

  The loop condition is the Boolean expression that appears between the while or
  until and do keywords. The loop body is the Ruby code that appears between the
  do and the end keyword. The while loop evaluates its condition. If the value
  is anything other than false or nil, it executes its body, and then loops to
  evaluate its condition again. In this way, the body is executed repeatedly,
  zero or more times, while the condition remains true (or, more strictly,
  non-false and non-nil).

  The until loop is the reverse. The condition is tested and the body is
  executed if the condition evaluates to false or nil. This means that the body
  is executed zero or more times while the condition is false or nil. Note that
  any until loop can be converted to a while simply by negating the condition.
  Most programmers are familiar with while loops, but many have not used until
  loops before. For this reason, you may want to use while loops except when
  until truly improves the clarity of your code.

  The do keyword in a while or until loop is like the then keyword in an if
  statement: it may be omitted altogether as long as a newline (or semicolon)
  appears between the loop condition and the loop body.*


- while and until as Modifiers

  If the body of a loop is a single Ruby expression, you can express that loop
  in a partic- ularly compact form by using while or until as a modifier after
  the expression. For example:

        x = 0
        puts x = x + 1 while  x < 10

  This modifier syntax uses the while keyword itself to separate the loop body
  from the loop condition, and avoids the need for the do (or newline) and end
  keywords. Contrast this code with the more traditional while loop written on a
  single line:

        x = 0
        while x < 10 puts x = x + 1 end

  until can be used as a modifier just as while can be:

        puts a.pop until a.empty?

  Note that when while and until are used as modifiers, they must appear on the
  same line as the loop body that they modify. If there is a newline between the
  loop body and the while or until keyword, the Ruby interpreter will treat the
  loop body as an unmodified expression and the while or until as the beginning
  of a regular loop.

  When while and until are used as modifiers for a single Ruby expression, the
  loop condition is tested first, even though it is written after the loop body.
  The loop body is executed zero or more times, just as if it were formatted as
  a regular while or until loop.


  There is a special-case exception to this rule. When the expression being
  evaluated is a compound expression delimited by begin and end keywords, then
  the body is executed first before the condition is tested:



        x = 10
        begin
                puts x
                x = x - 1
        end until x == 0

  This results in a construct much like the do/while loop of C, C++, and Java.
  Despite its similarity to the do/while loop of other languages, this
  special-case behavior of loop modifiers with the begin statement is
  counterintuitive and its use is discouraged.  Future releases of Ruby may
  forbid the use of while and until modifiers with begin/end.


  Note that if you group multiple statements with parentheses and apply an until
  modifier to that grouped expression, you do not get this special case
  behavior:

  x = 0
  (                   # start a compound expression: may be executed 0 times
        puts x        # output x
        x = x - 1     # decrement x
  ) until x == 0      # end compound expression and modify it with a loop


- The for/in loop

  The for loop, or for/in loop, iterates through the elements of an enumerable
  object (such as an array). On each iteration, it assigns an element to a
  specified loop variable and then executes the body of the loop. A for loop
  looks like this:


    for var in collection do
            body
    end

  var is a variable or a comma-separated list of variables. collection is any
  object that has an each iterator method. Arrays and hashes define the each
  method, and many other Ruby objects do, too. The for/in loop calls the each
  method of the specified object. As that iterator yields values, the for loop
  assigns each value (or each set of values) to the specified variable (or
  variables) and then executes the code in body. As with the while and until
  loops, the do keyword is optional and may be replaced with a newline or
  semicolon.


        array = [1,2,3,4,5]

        for element in array
                puts element
        end

        hash = {:a => 1, :b=>2, :c=>3}

        for key,value in hash
                puts "#{key} => #{value}"
        end

  The loop variable or variables of a for loop are not local to the loop; they
  remain defined even after the loop exits. Similarly, new variables defined
  within the body of the loop continue to exist after the loop exits.


  The fact that the for loop depends on the each iterator method implies that
  for loops are much like iterators. For example, the for loop shown above for
  enumerating the keys and values of a hash could also be written with an
  explicit use of the each iterator:


        hash = {:a =>1,:b => 2, :c => 3}
        hash.each do |key,value|
                puts "#{key} => #{value}"
        end

  The only difference between the for version of the loop and the each version
  is that the block of code that follows an iterator does define a new variable
  scope. Details are in the discussion of iterators later in this chapter.


- Iterators and Enumerable Objects

  Although while, until, and for loops are a core part of the Ruby language, it
  is probably more common to write loops using special methods known as
  iterators. Iterators are one of the most noteworthy features of Ruby, and
  examples such as the following are common in introductory Ruby tutorials:


        3.times { puts "thank you!" }
        data.each {|x| puts x}         # Print each element x of data

        [1,2,3].map { |x| x * x}       # Compute squares of array elements
        factorial = 1                  # Compute the factorial of n
        2.upto(n) { |x| factorial *= x} #



   [ Note:

   2.upto(5) do |x|
        puts x
   end

   is the same as:

   2.upto(5) {|x| puts x } ]


  The times, each, map, and upto methods are all iterators, and they interact
  with the block of code that follows them. The complex control structure behind
  this is yield.

  The yield statement temporarily returns control from the iterator method to
  the meth- od that invoked the iterator. Specifically, control flow goes from
  the iterator to the block of code associated with the invocation of the
  iterator. When the end of the block is reached, the iterator method regains
  control and execution resumes at the first state- ment following the yield. In
  order to implement some kind of looping construct, an iterator method will
  typically invoke the yield statement multiple times.  Figure 5-1 illustrates
  this complex flow of control. Blocks and yield are described in detail in §5.4
  below; for now, we focus on the iteration itself rather than the control
  structure that enables it.
  [pg 131 for figure]

  As you can see from the previous examples, blocks may be parameterized.
  Vertical bars at the start of a block are like parentheses in a method
  definition—they hold a list of parameter names. The yield statement is like a
  method invocation; it is followed by zero or more expressions whose values are
  assigned to the block parameters.

     *** Iterators that Don't Iterate

  We use the term iterator in this book to mean any method that uses the yield
  statement.  They do not actually have to serve an iteration or looping
  function.* The tap method defined (in Ruby 1.9) by the Object class is an
  example. It invokes the associated block once, passing the receiver as the
  only argument. Then it returns the receiver. It is handy for “tapping into” a
  method chain, as in the following code which uses tap to output debugging
  messages:


        chars = "hello world".tap {|x| puts "original object: #{x.inspect}"}
                  .each_char .tap {|x| puts "each_char returns: #{x.inspect}"}


  Another common function for iterators is automatic resource deallocation. The
  File.open method can be used as an iterator, for example. It opens the named
  file, creating a File object to represent it. If no block is associated with
  the invocation, it simply returns the File object and leaves the
  responsibility for closing the file with the calling code. If there is a block
  associated with the File.open call, however, it passes the new File object to
  that block and then automatically closes the file when the block returns. This
  ensures that files will always be closed and frees programmers from this
  housekeeping detail. In this case, when a block is associated with the call to
  File.open, the return value of method is not a File object but whatever value
  the block returned.
  ******************************************************************************


- Numeric Iterators

  The core Ruby API provides a number of standard iterators. The Kernel method
  loop behaves like an infinite loop, running its associated block repeatedly
  until the block executes a return, break, or other statement that exits from
  the loop.

  The Integer class defines three commonly used iterators. The upto method
  invokes its associated block once for each integer between the integer on
  which it is invoked and the integer which is passed as an argument. For
  example:


      4.upto(6) {|x| print x}    # => prints "456"

  As you can see, upto yields each integer to the associated block, and it
  includes both the starting point and the end point in the iteration. In
  general, n.upto(m) runs its block m-n+1 times.

  The downto method is just like upto but iterates from a larger number down to
  a smaller number.


  When the Integer.times method is invoked on the integer n, it invokes its
  block n times, passing values 0 through n-1 on successive iterations. For
  example:

     3.times {|x| print x}  # prints "012"

  In general, n.times is equivalent to 0.upto(n-1).

  If you want to do a numeric iteration using floating-point numbers, you can
  use the more complex step method defined by the Numeric class. The following
  iterator, for example, starts at 0 and iterates in steps of 0.1 until it
  reaches Math::PI:


    0.step(Math::PI, 0.1) {|x| puts Math.sin(x) }

- Enumerable Objects

  Array, Hash, Range, and a number of other classes define an each iterator that
  passes each element of the collection to the associated block. This is perhaps
  the most com- monly used iterator in Ruby; as we saw earlier, the for loop
  only works for iterating over objects that have each methods. Examples of each
  iterators:


  [1,2,3].each {|x| print x }  # Prints "123"
  (1..3).each {|x| print x }   # Prints "123" Same as 1.upto(3)

  The each iterator is not only for traditional “data structure” classes. Ruby’s
  IO class defines an each iterator that yields lines of text read from the
  Input/Output object. Thus, you can process the lines of a file in Ruby with
  code like this:


    File.open(filename) do |f|
            f.each { |line| print line }
    end

  Most classes that define an each method also include the Enumerable module,
  which defines a number of more specialized iterators that are implemented on
  top of the each method. One such useful iterator is each_with_index, which
  allows us to add line numbering to the previous example:


    File.open(filename) do |f|
        f.each_with_index do |line,number|
                    print "#{number}:#{line}"
            end
    end

  Some of the most commonly used Enumerable iterators are the rhyming methods
  collect, select, reject, and inject. The collect method (also known as map)
  executes its associated block for each element of the enumerable object, and
  collects the return values of the blocks into an array:


    squares = [1,2,3].collect { |x| x*x }           # [1,4,9]

  The select method invokes the associated block for each element in the
  enumerable object, and returns an array of elements for which the block
  returns a value other than false or nil. For example:

    evens = (1..10).select { |x| x % 2 == 0 }       # [2,4,6,8,10]

  The reject method is simply the opposite of select; it returns an array of
  elements for which the block returns nil or false. For example:

    odd = (1..10).reject { |x| x % 2 == 0 }         # [1,3,5,7,9]

  The inject method is a little more complicated than the others. It invokes the
  associated block with two arguments. The first argument is an accumulated
  value of some sort from previous iterations. The second argument is the next
  element of the enumerable object. The return value of the block becomes the
  first block argument for the next iteration, or becomes the return value of
  the iterator after the last iteration. The initial value of the accumulator
  variable is either the argument to inject, if there is one, or the first
  element of the enumerable object. (In this case, the block is invoked just
  once for the first two elements.) Examples make inject more clear:


    data = [2, 5, 3, 4]
    sum = data.inject {|sum, x| sum + x }        # 14         2 + 5 + 3 + 4
    floatprod = data.inject(1.0) {|p,x| p*x }    # 120.0      1.0 * 2 * 5 * 3 * 4
    max = data.inject {|m,x| m>x ? m : x }       # 5          largest element

pg 133 writing custom iterators

- Writing Custom Iterators

  The defining feature of an iterator method is that it invokes a block of code
  associated with the method invocation. You do this with the yield statement.
  The following method is a trivial iterator that just invokes its block twice:


        def twice
                yield
                yield
        end

  To pass argument values to the block, follow the yield statement with a comma-
  separated list of expressions. As with method invocation, the argument values
  may optionally be enclosed in parentheses. The following simple iterator shows
  a use of yield:


    # This method expects a block. It generates n values of the form
    # m*1 + c, for i from 0..n-1, and yields them, one at a time,
    # to the associated block.
    def sequence(n, m, c)
        i = 0
        while (i < n)
                yield m*i + c     # Invoke the block, and pass a value to it
                i += 1            # Increment i each time
        end
    end


sequence (3,5,1) {|y| puts y}



   *** Nomenclature: yield and Iterators

  Depending on your programming background, you may find the terms “yield” and
  “iterator” confusing. The sequence method shown earlier is a fairly clear
  example of why yield has the name it does. After computing each number in the
  sequence, the method yields control (and yields the computed number) to the
  block, so that the block can work with it. It is not always this clear,
  however; in some code it may seem as if it is the block that is yielding a
  result back to the method that invoked it.

  A method such as sequence that expects a block and invokes it multiple times
  is called an iterator because it looks and behaves like a loop. This may be
  confusing if you are used to languages like Java in which iterators are
  objects. In Java, the client code that uses the iterator is in control and
  “pulls” values from the iterator when it needs them.  In Ruby, the iterator
  method is in control and “pushes” values to the block that wants them.

  This nomenclature issue is related to the distinction between “internal
  iterators” and “external iterators,” which is discussed later in this section.
  ******************************************************************************


  Here is another example of a Ruby iterator; it passes two arguments to its
  block. It is worth noticing that the implementation of this iterator uses
  another iterator internally:

    # Generate n points evenly spaced around the circumference of a circle of
    # radius r centered at (0,0). Yield the x and y coordinates of each point to
    # the associated block.
    def circle(r,n)
            n.times do |i|      # Notice that this method is implemented with a block
                    angle = Math::PI * 2 * i / n
                    yield r*Math.cos(angle), r*Math.sin(angle)
            end
    end

    circle(1,4) {|x,y| printf "(%.2f,%.2f) ", x, y }

  Using the yield keyword really is a lot like invoking a method. (See Chapter 6
  for complete details on method invocation.) Parentheses around the arguments
  are optional. You can use * to expand an array into individual arguments.
  yield even allows you to pass a hash literal without the curly braces around
  it. Unlike a method invocation, however, a yield expression may not be
  followed by a block. You cannot pass a block to a block.


  If a method is invoked without a block, it is an error for that method to
  yield, because there is nothing to yield to. Sometimes you want to write a
  method that yields to a block if one is provided but takes some default action
  (other than raising an error) if invoked with no block.

  To do this, use block_given? to determine whether there is a block associated
  with the invocation. block_given?, and its synonym iterator?, are Kernel
  methods, so they act like global functions. Here is an example:


    def sequence (n, m, c)
            i, s = 0, []
            while (i < n)
                    y = m*i + c
                    yield y if block_given?
                    s << y
                    i += 1
            end
            s         # return the array of values
    end

- Enumerators

#############################################################
#############################################################
  A class which allows both internal and external iteration.
#############################################################
#############################################################

  An enumerator is an Enumerable object whose purpose is to enumerate some other
  object. To use enumerators in Ruby 1.8, you must require 'enumerator'. In Ruby
  1.9, enumerators are built-in and no require is necessary. (As we’ll see
  later, the built-in enumerators of Ruby 1.9 have substantially more
  functionality than that provided by the enumerator library of Ruby 1.8.)

  Enumerators are of class Enumerable::Enumerator. Although this class can be
  instanti- ated directly with new, this is not how enumerators are typically
  created. Instead, use to_enum or its synonym enum_for, which are methods of
  Object.

  With no arguments, to_enum returns an enumerator whose each method simply
  calls the each method of the target object. Suppose you have an array and a
  method that expects an enumerable object. You don’t want to pass the array
  object itself, because it is mutable, and you don’t trust the method not to
  modify it. Instead of making a defensive deep copy of the array, just call
  to_enum on it, and pass the resulting enumerator instead of the array itself.
  In effect, you’re creating an enumerable but immutable proxy object for your
  array:


        process(data.to_enum) # instead of just process(data)

  You can also pass arguments to to_enum, although the enum_for synonym seems
  more natural in this case. The first argument should be a symbol that
  identifies an iterator method. The each method of the resulting Enumerator
  will invoke the named method of the original object. Any remaining arguments
  to enum_for will be passed to that named method. In Ruby 1.9, the String class
  is not Enumerable, but it defines three iterator methods: each_char,
  each_byte, and each_line. Suppose we want to use an Enumerable method, such as
  map, and we want it to be based on the each_char iterator.  We do this by
  creating an enumerator:


    s = "hello"
    s.enum_for(:each_char).map {|c| c.succ }     # ["i", "f", "m","m","p"]

################################################################################
################################################################################
  In Ruby 1.9, it is usually not even necessary to use to_enum or enum_for
  explicitly as we did in the previous examples. This is because the built-in
  iterator methods of Ruby 1.9 (which include the numeric iterators times, upto,
  downto, and step, as well as each and related methods of Enumerable)
  automatically return an enumerator when invoked with no block. So, to pass an
  array enumerator to a method rather than the array itself, you can simply call
  the each method:
################################################################################
################################################################################


    process(data.each_char)   # Instead of just process(data)

  This syntax is even more natural if we use the chars alias* in place of
  each_char. To map the characters of a string to an array of characters, for
  example, just use .chars.map:


    "hello".chars.map {|c| c.succ }

  Here are some other examples that rely on enumerator objects returned by
  iterator methods. Note that it is not just iterator methods defined by
  Enumerable that can return enumerator objects; numeric iterators like times
  and upto do the same:


    enumerator = 3.times                    # An enumerator object
    enumerator.each { |x| print x }         # Prints "012"

  You can duplicate this behavior in your own iterator methods by returning
  self.to_enum when no block is supplied. Here, for example, is a version of the
  twice iterator shown earlier that can return an enumerator if no block is
  provided:


################################################################################
################################################################################
                def twice
                        if block_given?
                                yield
                                yield
                        else
                                self.to_enum(:twice)
                        end
                end
################################################################################
################################################################################


                if you 'yield 5' then the enum will be:

                        hihi = twice            # hihi is an enumerator

                        hihi {|x| print x }     # 55

                        for i in hihi
                                print i         # 55
                        end

                I think that the for in loop in ruby only accepts enumerators


  In Ruby 1.9, enumerator objects define a with_index method that is not
  available in the Ruby 1.8 enumerator module. with_index simply returns a new
  enumerator that adds an index parameter to the iteration. For example, the
  following returns an enumerator that yields the characters of a string and
  their index within the string:


                enumerator = x.each_char.with_index

  Finally, keep in mind that enumerators, in both Ruby 1.8 and 1.9, are
  Enumerable objects that can be used with the for loop. For example:

                for line, number in text.each_line.with_index
                        print "#{number + 1}: #{line}"
                end

- External iterators

  Our discussion of enumerators has focused on their use as Enumerable proxy
  objects.  ### In Ruby 1.9, however, enumerators have another very important
  use: they are external iterators. ### You can use an enumerator to loop
  through the elements of a collection by repeatedly calling the next method.
  When there are no more elements, this method raises a StopIteration exception:


        iterator = 9.downto(1)
        begin                                     # So we can use rescue below
                print iterator.next while true    # Call the next method repeatedly
        rescue StopIteration                      # When there are no more values
                puts "...blastoff!"               # An expected, nonexceptional condition
        end

               *** Internal vs External Iterators

  The “gang of four” define and contrast internal and external iterators quite
  clearly in their design patterns book:*


        A fundamental issue is deciding which party controls the iteration, the
        iterator or the client that uses the iterator. When the client controls
        the iteration, the iterator is called an external iterator, and when the
        iterator controls it, the iterator is an internal iterator. Clients that
        use an external iterator must advance the traversal and request the next
        element explicitly from the iterator. In contrast, the client hands an
        internal iterator an operation to perform, and the iterator applies that
        operation to every element....


        External iterators are more flexible than internal iterators. It’s easy
        to compare two collections for equality with an external iterator, for
        example, but it’s practi- cally impossible with internal iterators....
        But on the other hand, internal iterators are easier to use, because
        they define the iteration logic for you.


  In Ruby, iterator methods like each are internal iterators; they control the
  iteration and “push” values to the block of code associated with the method
  invocation. Enumerators have an each method for internal iteration, but in
  Ruby 1.9 and later, they also work as external iterators—client code can
  sequentially “pull” values from an enumerator with next.
  ******************************************************************************

  External iterators are quite simple to use: just call next each time you want
  another element. When there are no more elements left, next will raise a
  StopIteration excep- tion. This may seem unusual—an exception is raised for an
  expected termination condition rather than an unexpected and exceptional
  event. (StopIteration is a de- scendant of StandardError and IndexError; note
  that it is one of the only exception classes that does not have the word
  “error” in its name.) Ruby follows Python in this external iteration
  technique. By treating loop termination as an exception, it makes your looping
  logic extremely simple; there is no need to check the return value of next for
  a special end-of-iteration value, and there is no need to call some kind of
  next? predicate before calling next.


  To simplify looping with external iterators, the Kernel.loop method includes
  (in Ruby 1.9) an implicit rescue clause and exits cleanly when StopIteration
  is raised. Thus, the countdown code shown earlier could more easily be written
  like this:

#############################################################
  loop is a kernel method which takes a block.  A block
  introduces new local variable scope.

  Loop will continue indefinitely until it meets with some break statement
  somewhere in its loop body.

  furthermore loop do has an implicit rescue clause for a StopIteration
  exception
#############################################################

    iterator = 9.downto(1)
    loop do                                 # Loop until StopIteration is raised
            print iterator.next             # Print next item
    end
    puts "...blastoff!"

 Many external iterators can be restarted by calling the rewind method. Note,
 however, that rewind is not effective for all enumerators. If an enumerator is
 based on an object like a File which reads lines sequentially, calling rewind
 will not restart the iteration from the beginning. In general, if new
 invocations of each on the underlying Enumerable object do not restart the
 iteration from the beginning, then calling rewind will not restart it either.


 Once an external iteration has started (i.e., after next has been called for
 the first time), an enumerator cannot be cloned or duplicated. It is typically
 possible to clone an enu- merator before next is called, or after StopIteration
 has been raised or rewind is called.

 Normally, enumerators with next methods are created from Enumerable objects
 that have an each method. If, for some reason, you define a class that provides
 a next method for external iteration instead of an each method for internal
 iteration, you can easily implement each in terms of next. In fact, turning an
 externally iterable class that im- plements next into an Enumerable class is as
 simple as mixing in (with include—see §7.5) a module like this:



     module Iterable
        include Enumerable                  # Define iterators on top of each
        def each                            # And define each on top of next
            loop { yield self.next }
        end
     end

  Another way to use an external iterator is to pass it to an internal iterator
  method like this one:

                def iterate(iterator)
                     loop { yield iterator.next }
                end

                iterate(9.downto(1)) { |x| print x }

  The earlier quote from Design Patterns alluded to one of the key features of
  external iterators: they solve the parallel iteration problem. Suppose you
  have two Enumerable collections and need to iterate their elements in pairs:
  the first elements of each collec- tion, then the second elements, and so on.
  Without an external iterator, you must convert one of the collections to an
  array (with the to_a method defined by Enumerable) so that you can access its
  elements while iterating the other collection with each.


  Example 5-1 shows the implementation of three iterator methods. All three
  accept an arbitrary number of Enumerable objects and iterate them in different
  ways. One is a simple sequential iteration using only internal iterators; the
  other two are parallel iterations and can only be done using the external
  iteration features of enumerators.



            # Call the each method of each collection in turn
            # This is not a parallel iteration and does not require enumerators
            def sequence(*enumerables, &block)
                    enumerables.each do |enumerable|
                            enumerable.each(&block)
                    end
            end

            # Iterate the specified collections, intrealeaving their elements.
            # This can't be done efficiently without external iterators
            # Note the use of the uncommon else clause in begin/rescue

            def interleave(*enumerables)

                    # Convert enumerable collections to an array of enumerators
                    enumerators = enumerables.map { | e| e.to_enum }
                    # Loop until we don't have any more enumerators

                    until enumerators.empty?
                            begin
                                    e = enumerators.shift       # take the first enumerator
                                    yield e.next                # Get its next and pass to the block
                            rescue StopIteration                # If no more elements, do nothing
                            else                                # If no exception occurred
                                    enumerators << e            # Put the enumerator back
                            end
                    end
             end

            # Iterate the specified collections, yielding tuples of values,
            # one value from each of the collections. See also Enumerable.zip.

            def bundle(*enumerables)
                    enumerators = enumerables.map { |e| e.to_enum }
                    loop {yield enumerators.map { |e| e.next} }
            end

            # Examples of how these iterator methods work
            a,b,c = [1,2,3],4..6, 'a'..'e'

            sequence(a,b,c) {|x| print x}   # prints 123456abcde
            interleave(a,b,c) {|x| print x} # prints 14a25b36cde
            bundle(a,b,c) {|x| print x}    '[1,4,"a"][2,5,"b"][3,6,"c"]'


  The bundle method of Example 5-1 is similar to the Enumerable.zip method. In
  Ruby 1.8, zip must first convert its Enumerable arguments to arrays and then
  use those arrays while iterating through the Enumerable object it is called
  on. In Ruby 1.9, however, the zip method can use external iterators. This
  makes it (typically) more efficient in space and time, and also allows it to
  work with unbounded collections that could not be converted into an array of
  finite size.

- Iteration and concurrent modification

  In general, Ruby’s core collection of classes iterate over live objects rather
  than private copies or “snapshots” of those objects, and they make no attempt
  to detect or prevent concurrent modification to the collection while it is
  being iterated. If you call the each method of an array, for example, and the
  block associated with that invocation calls the shift method of the same
  array, the results of the iteration may be surprising:

        a = [1,2,3,4,5]
        a.each {|x| puts "#{x}, #{a.shift}" } # prints "1,1\n3,2\n5,3"

  You may see similarly surprising behavior if one thread modifies a collection
  while another thread is iterating it. One way to avoid this is to make a
  defensive copy of the collection before iterating it. The following code,
  for example, adds a method each_in_snapshot to the Enumerable module:


      module Enumerable
          def each_in_snapshot &block
            snapshot = self.dup       # Make a private copy of the Enumerable object
            snapshot.each &block      # And iterate on the cop
          end
      end

- Blocks

  The use of blocks is fundamental to the use of iterators. In the previous
  section, we focused on iterators as a kind of looping construct.

- Block Syntax

  Blocks may not stand alone; they are only legal following a method invocation.
  You can, however, place a block after any method invocation; if the method is
  not an iterator and never invokes the block with yield, the block will be
  silently ignored.

  Blocks are delimited with curly braces or with do and end keywords. The
  opening curly brace or the do keyword must be on the same line as the method
  invocation, or else Ruby in- terprets the line terminator as a statement
  terminator and invokes the method without the block:


        1.upto(10) {|x| puts x }
        1.upto(10) do |x|
                puts x
        end

        1.upto(10)              # No block specified
        {|x| puts x }           # Syntax error: block not after an invocation

  One common convention is to use curly braces when a block fits on a single
  line, and to use do and end when the block extends over multiple lines.


  This is not completely a matter of convention, however; the Ruby parser binds
  { tightly to the token that pre- cedes it. If you omit the parentheses around
  method arguments and use curly brace delimiters for a block, then the block
  will be associated with the last method argument rather than the method
  itself, which is probably not what you want. To avoid this case, put
  parentheses around the arguments or delimit the block with do and end:


        1.upto(3) {|x| puts x }      # Parens and curly braces work
        1.upto 3 do |x| puts x end   # No parens, block delimited with do/end
        1.upto 3 {|x| puts x }       # Syntax error: trying to pass a block of 3!

  Blocks can be parameterized, just as methods can. Block parameters are
  separated with commas and delimited with a pair of vertical bar (|)
  characters, but they are otherwise much like method parameters:


        hash.each do |key,value|
                puts "#{key}: #{value}"
        end

  It is a common convention to write the block parameters on the same line as
  the method invocation and the opening brace or do keyword, but this is not
  required by the syntax.


- The value of a block

  In the iterator examples shown so far in this chapter, the iterator method has
  yielded values to its associated block but has ignored the value returned by
  the block. This is not always the case, however. Consider the Array.sort
  method. If you associate a block with an invocation of this method, it will
  yield pairs of elements to the block, and it is the block’s job to sort them.
  The block’s return value (–1, 0, or 1) indicates the ordering of the two
  arguments. The “return value” of the block is available to the iterator method
  as the value of the yield statement.

  The “return value” of a block is simply the value of the last expression
  evaluated in the block. So, to sort an array of words from longest to
  shortest, we could write:


        # The block takes two words and "returns" their relative order
        words.sort! {|x,y| y <=> x }

  We’ve been placing the phrase “return value” in quotes for a very important
  reason: you should not normally use the return keyword to return from a block.
  A return inside a block causes the containing method (not the iterator method
  that yields to the block, but the method that the block is part of) to return.


################################################################################
  There are, of course, times when this is exactly what you want to do. But
  don’t use return if you just want to return from a block to the method that
  called yield. If you need to force a block to return to the invoking method
  before it reaches the last expression, or if you want to return more than one
  value, you can use next instead of return. (return, next, and the related
  state- ment break are explained in detail in §5.5.) Here is an example that
  uses next to return from the block:
################################################################################

        array.collect do |x|
                next 0 if x == nil              # Return prematurely if x is nil
                next x, x*x                     # Return two values
        end

  Note that it is not particularly common to use next in this way, and the code
  above is easily rewritten without it:

        array.collect do |x|
                if x == nil
                        0
                else
                        [x, x*x]
                end
        end

- Blocks and Variable Scope

  Blocks define a new variable scope: variables created within a block exist
  only within that block and are undefined outside of the block.


  Be cautious, however; the local variables in a method are available to any
  blocks within that method. So if a block assigns a value to a variable that is
  already defined outside of the block, this does not create a new block-local
  variable but instead assigns a new value to the already-existing variable.
  Sometimes, this is exactly the behavior we want:



        total = 0
        data.each {|x| total += x }    # Sum the elements of the data array
        puts total                     # Print out the sum

  Sometimes, however, we do not want to alter variables in the enclosing scope,
  but we do so inadvertently. This problem is a particular concern for block
  parameters in Ruby 1.8. In Ruby 1.8, if a block parameter shares the name of
  an existing variable, then invocations of the block simply assign a value to
  that existing variable rather than cre- ating a new block-local variable. The
  following code, for example, is problematic because it uses the same
  identifier i as the block parameter for two nested blocks:


    1.upto(10) do |i|                  # 10 rows
            1.upto(10) do |i|          # Each has 10 columns
                    print "#{i} "      # Print column number
            end
            print " ==> Row #{i}\n"    # Try to print row number, but get column number
    end


  Ruby 1.9 is different: block parameters are always local to their block, and
  invocations of the block never assign values to existing variables. If Ruby
  1.9 is invoked with the -w flag, ### it will warn you if a block parameter has
  the same name as an existing variable. ### This helps you avoid writing code
  that runs differently in 1.8 and 1.9.


  Ruby 1.9 is different in another important way, too. Block syntax has been
  extended to allow you to declare block-local variables that are guaranteed to
  be local, even if a variable by the same name already exists in the enclosing
  scope. To do this, follow the list of block parameters with a semicolon and a
  comma-separated list of block local variables. Here is an example:


        x = y = 0
        1.upto(4) do |x;y|    # x and y are local to block
                              # x and y "shadow" the outer variables

                y = x + 1     # Use y as a scratch variable
                puts y*y      # Prints 4,9,16,25
        end
        [x,y]                 # => [0,0]: block does not alter these


  In this code, x is a block parameter: it gets a value when the block is
  invoked with yield.  y is a block-local variable. It does not receive any
  value from a yield invocation, but it has the value nil until the block
  actually assigns some other value to it. The point of declaring these
  block-local variables is to guarantee that you will not inadvertently clobber
  the value of some existing variable. (This might happen if a block is cut-and-
  pasted from one method to another, for example.) If you invoke Ruby 1.9 with
  the -w option, it will warn you if a block-local variable shadows an existing
  variable.

  Blocks can have more than one parameter and more than one local variable, of
  course.  Here is a block with two parameters and three local variables:


       hash.each { |key,value; i,j,k| ... }

- Passing Arguments to a Block

  We’ve said previously that the parameters to a block are much like the
  parameters to a method. They are not strictly the same, however. The argument
  values that follow a yield keyword are assigned to block parameters following
  rules that are closer to the rules for variable assignment than to the rules
  for method invocation. Thus, when an iterator executes yield k,v to invoke a
  block declared with parameters |key, value|, it is equivalent to this
  assignment statement:


      key,value = k,v

  The Hash.each_pair iterator yields a key/value pair like this:*

      {:one=>1}.each_pair {|key,value| ... }        # key=:one, value=1

  In Ruby 1.8, it is even more clear that block invocation uses variable
  assignment. Recall that in Ruby 1.8 parameters are only local to the block if
  they are not already in use as local variables of the containing method. If
  they are already local variables, then they are simply assigned to. In fact,
  Ruby 1.8 allows any kind of variable to be used as a block parameter,
  including global variables and instance variables:


    {:one=>1}.each_pair {|$key, @value| ... }      # No longer works in Ruby 1.9

  This iterator sets the global variable $key to :one and sets the instance
  variable @value to 1. As already noted, Ruby 1.9 makes block parameters local
  to the block. This also means that block parameters can no longer be global or
  instance variables.

  The Hash.each iterator yields key/value pairs as two elements of a single
  array. It is very common, however, to see code like this:


  hash.each {|k,v| ... }            # key and value assigned to params k and v

  This also works by parallel assignment. The yielded value, a two-element
  array, is assigned to the variables k and v:

############################################
           k,v = [key,value]
###########################################

  By the rules of parallel assignment (see §4.5.5), a single array on the right
  is expanded to and its elements assigned to the multiple variables on the
  left.


  Block invocation does not work exactly like parallel assignment. Imagine an
  iterator that passes two values to its block. By the rules of parallel
  assignment, we might expect be able to declare a block with a single parameter
  and have the two values automatically filled into an array for us. But it does
  not work that way:


        def two; yield 1,2; end   # An iterator that yields two values

        two {|x| p x }            # Ruby 1.8: warns and prints [1,2]
        two {|x| p x }            # Ruby 1.9: prints 1, no warning
        two {|*x| p x }           # Either version: prints [1,2]; no warning
        two {|x,| p x}            # Either version: prints 1; no warning

        [probably done because of maps ]
        map.each { |key| puts map[:key] }
        otherwise key would just be an array
        of key and value

  In Ruby 1.8, multiple arguments are packed into an array when there is a
  single block parameter, but this is deprecated and generates a warning
  message. In Ruby 1.9, the first value yielded is assigned to the block
  parameter and the second value is silently discarded. If we want multiple
  yielded values to be packed into an array and assigned to a single block
  parameter, we must explicitly indicate this by prefixing the parameter with an
  *, exactly as we’d do in a method declaration. (See Chapter 6 for a thorough
  discussion of method parameters and method declaration.) Also note that we can
  explicitly discard the second yielded value by declaring a block parameter
  list that ends with a comma, as if to say: “There is another parameter, but it
  is unused and I can’t be bothered to pick a name for it.”



  Although block invocation does not behave like parallel assignment in this
  case, it does not behave like method invocation, either. If we declare a
  method with one argument and then pass two arguments to it, Ruby doesn’t just
  print a warning, it raises an error.

  In Ruby 1.8, only the last block parameter may have an * prefix. Ruby 1.9
  lifts this restriction and allows any one block parameter, regardless of its
  position in the list, to have an * prefix:


        def five; yield 1,2,3,4,5; end
        five do |head, *body, tail|
                print head,body,tail       # Prints "1[2,3,4]5"
        end

  The yield statement allows bare hashes as the last argument value, just as
  method invocations (see §6.4.4) do. That is, if the last argument to yield is
  a hash literal, you may omit the curly braces. Because it is not common for
  iterators to yield hashes, we have to contrive an example to demonstrate this:


    def hashiter; yield :a=>1, :b=>2; end    # Note no curly braces
    hashiter {|hash| puts hash[:a]           # Prints 1

  In Ruby 1.9, the final block parameter may be prefixed with & to indicate that
  it is to receive any block associated with the invocation of the block.
  Recall, however, that a yield invocation may not have a block associated with
  it. We’ll learn in Chapter 6 that a block can be converted into a Proc, and
  blocks can be associated with Proc invocations.  The following code example
  should make sense once you have read Chapter 6:

    # This Proc expects a block
    printer = lambda {|&b| puts b.call }  # Print value returned by b
    printer.call {"hi"}                   # Pass a block to the block!

  An important difference between block parameters and method parameters is that
  block parameters are not allowed to have default values assigned as method
  parameters are. That is, it is not legal to write this:

    [1,2,3].each {|x,y=10| print x*y }   # SyntaxError!

  Ruby 1.9 defines a new syntax for creating Proc objects and this new syntax
  does allow argument defaults. Details will have to wait until you’ve read
  about Proc objects in Chapter 6, but this code can be rewritten as follows:


   [1,2,3].each &->(x,y=10) { print x*y}  # Prints "102030"

- Altering Control Flow

  In addition to conditionals, loops, and iterators, Ruby supports a number of
  statements that alter the flow-of-control in a Ruby program. These statements
  are:


    return          Causes a method to exit and return a value to its caller.
    break           Causes a loop (or iterator) to exit.
    next            Causes a loop (or iterator) to skip the rest of the current
                    iteration and move on to the next iteration.
    redo            Restarts a loop or iterator from the beginning.
    retry           Restarts an iterator, reevaluating the entire expression.
                    The retry keyword can also be used in exception handling, as
                    we’ll see later in the chapter.

    throw/catch     A very general control structure that is named like and
                    works like an exception propagation and handling mechanism.
                    throw and catch are not Ruby’s primary exception mechanism
                    (that would be raise and rescue, described later in this
                    chapter). Instead, they are used as a kind of multilevel or
                    labeled break.


- return

  The return statement causes the enclosing method to return to its caller. If
  you know C, Java, or a related language, you probably already have an
  intuitive understanding of the return statement.

  return may optionally be followed by an expression, or a comma-separated list
  of ex- pressions. If there is no expression, then the return value of the
  method is nil. If there is one expression, then the value of that expression
  becomes the return value of the method. If there is more than one expression
  after the return keyword, then the return value of the method is an array
  containing the values of those expressions.


  Note that most methods do not require the return statement. When
  flow-of-control reaches the end of a method, the method automatically returns
  to its caller. The return value in this case is the value of the last
  expression in the method. Most Ruby pro- grammers omit return when it is not
  necessary. Instead of writing return x as the last line of a method, they
  would simply write x.


  return is useful if you want to return from a method prematurely, or if you
  want to return more than one value. For example:



        # Return two copies of x, if x is not nil

        def double(x)
                return nil if x == nil   # Return prematurely
                return x, x.dup          # Return multiple values
        end

  When first learning about Ruby blocks, it is natural to think of them as some
  kind of nested function or mini-method. And if you think of them this way, you
  might expect return simply to cause the block to return to the iterator that
  yielded to it. But blocks are not methods, and the return keyword does not
  work this way. In fact, return is remarkably consistent; it always causes the
  enclosing method to return, regardless of how deeply nested within blocks it
  is.


  Note that the enclosing method is not the same thing as the invoking method.
  When the return statement is used in a block, it does not just cause the block
  to return. And it does not just cause the iterator that invokes the block to
  return. return always causes the enclosing method to return. The enclosing
  method, also called the lexically enclos- ing method, is the method that the
  block appears inside of when you look at the source code. Figure 5-2
  illustrates the behavior of the return statement in a block.
  [pg146]

  The following code defines a method that uses return to return from inside a
  block:

        # Return the index of the first occurence of target within array or nil
        # Note that this code just duplicates the Array.index method

        def find(array, target)
                array.each_with_index do |element, index|
                        return index if (element == target) # return from find
                end
                nil          # If we didn't find the element, return nil
        end

  The return statement in this code does not just cause the block to return to
  the iterator that invoked it. And it does not just cause the each_with_index
  iterator to return. It causes the find method to return a value to its caller.



- break

  When used within a loop, the break statement transfers control out of the loop
  to the first expression following the loop. Readers who know C, Java, or a
  similar language will already be familiar with the use of break in a loop:


        while(line = gets.chop)
                break if line == "quit"    # If this break statement is executed
                puts eval(line)
        end
        puts "Good bye"

  When used in a block, break transfers control out of the block, out of the
  iterator that invoked the block, and to the first expression following the
  invocation of the iterator.


        f.each do |line|
                break if line == "quit\n"
                puts eval(line)
        end
        puts "Good bye"      # Control is transferred here from break statement

  As you can see, using break inside a block is lexically the same as using it
  inside a loop.  If you consider the call stack, however, break in a block is
  more complicated because it forces the iterator method that the block is
  associated with to return. Figure 5-3 illustrates this.

  Note that unlike return, break never causes the lexically enclosing method to
  return.  break can only appear within a lexically enclosing loop or within a
  block. Using it in any other context causes a LocalJumpError.


  - break with a value

    Recall that all syntactic constructs in Ruby are expressions, and all can
    have a value.  The break statement can specify a value for the loop or
    iterator it is breaking out of.  The break keyword may be followed by an
    expression or a comma-separated list of expressions. If break is used with
    no expression, then the value of the loop expression, or the return value of
    the iterator method, is nil. If break is used with a single expression, then
    the value of that expression becomes the value of the loop expression or the
    return value of the iterator. And if break is used with multiple
    expressions, then the values of those expressions are placed into an array,
    and that array becomes the value of the loop expression or the return value
    of the iterator.


    By contrast, a while loop that terminates normally with no break always has
    a value of nil. The return value of an iterator that terminates normally is
    defined by the iterator method. Many iterators, such as times and each,
    simply return the object on which they were invoked.

- next

  The next statement causes a loop or iterator to end the current iteration and
  begin the next. C and Java programmers know this control structure by the name
  continue. Here is next in a loop:

        while(line = gets.chop)
        # A loop starts here
            next if line[0,1] == "#" # If this line is a comment, go on to the next
            puts eval(line)
        # Control goes here when the next statement is executed
        end

  When next is used within a block, it causes the block to exit immediately,
  returning control to the iterator method, which may then begin a new iteration
  by invoking the block again:

    f.each do |line|                         # Iterate over the lines in file f
            next if line[0,1] == "#"         # If this line is a comment, go to the next
            puts eval(line)
            # Control goes here when the next statement is executed
    end

  Using next in a block is lexically the same as using it in a while, until, or
  for/in loop.  When you consider the calling sequence, however, the block case
  is more complicated, as Figure 5-4 illustrates.
  [pg149]

********************************************************************************
  next, break, and return

  It is instructive to contrast Figure 5-4 with Figures 5-2 and 5-3. The next
  statement causes a block to return to the iterator method that invoked it. The
  break statement causes the block to return to its iterator and the iterator to
  return to the enclosing method. And the return statement causes the block to
  return to the iterator, the iterator to return to the enclosing method, and
  the enclosing method to return to its caller.

********************************************************************************

  next may only be used within a loop or a block; it raises a LocalJumpError
  when used in any other context.


- next and block value

  Like the return and break keywords, next may be used alone, or it may be
  followed by an expression or a comma-separated list of expressions. When next
  is used in a loop, any values following next are ignored. In a block, however,
  the expression or expres- sions become the “return value” of the yield
  statement that invoked the block. If next is not followed by an expression,
  then the value of the yield is nil. If next is followed by one expression,
  then the value of that expression becomes the value of the yield. And if next
  is followed by a list of expressions, then the value of the yield is an array
  of the value of those expressions.


  In our earlier discussion of the return statement, we were careful to explain
  that blocks are not functions, and that the return statement does not make a
  block return to the iterator that invoked it. As you can see, this is exactly
  what the next statement does.  Here is code where you might use it in this
  way:


        squareroots = data.collect do |x|
                next 0 if x < 0 # Return 0 for negative values
                Math.sqrt(x)
        end

  Normally, the value of a yield expression is the value of the last expression
  in the block.  As with the return statement, it is not often necessary to
  explicitly use next to specify a value. This code could also have been written
  like this, for example:

        squareroots = data.collect do |x|
                if (x < 0) then 0 else Math.sqrt(x) end
        end


- redo

  The redo statement restarts the current iteration of a loop or iterator. This
  is not the same thing as next. next transfers control to the end of a loop or
  block so that the next iteration can begin, whereas redo transfers control
  back to the top of the loop or block so that the iteration can start over. If
  you come to Ruby from C-like languages, then redo is probably a new control
  structure for you.

  redo transfers control to the first expression in the body of the loop or in a
  block. It does not retest the loop condition, and it does not fetch the next
  element from an iterator. The following while loop would normally terminate
  after three iterations, but a redo statement makes it iterate four times:


        i = 0
        while(i < 3)     # Prints "0123" instead of "012"
                # Control returns here when redo is executed
                print i
                i += 1
                redo if i == 3
        end

  redo is not a commonly used statement, and many examples, like this one, are
  con- trived. One use, however, is to recover from input errors when prompting
  a user for input. The following code uses redo within a block for this
  purpose:


    puts "Please enter the first word you think of"
    words = %w(apple banana cherry)  # shorthand for ["apple", "banana", "cherry"]
    response = words.collect do |word|
    # Control returns here when redo is executed
            print word + "> "        # Prompt the user
            response = gets.chop     # Get a response
            if response.size == 0    # If user entered nothing
                    word.upcase!     # Emphasize the prompt with uppercase
                    redo             # And skip to the top of the block
            end
            response                 # Return the response
    end

- retry
################################################################################
  The retry statement is normally used in a rescue clause to reexecute a block
  of code that raised an exception. This is described in §5.6.3.5. In Ruby 1.8,
  however, retry has another use: it restarts an iterator-based iteration (or
  any method invocation) from the beginning. This use of the retry statement is
  extremely rare, and it has been removed from the language in Ruby 1.9. It
  should, therefore, be considered a deprecated language feature and should not
  be used in new code.
################################################################################

  In a block, the retry statement does not just redo the current invocation of
  the block; it causes the block and the iterator method to exit and then
  reevaluates the iterator expression to restart the iteration. Consider the
  following code:


        n = 10
        n.times do |x|
                print x
                if x == 9
                        n -= 1
                        retry
                end
        end

  The code uses retry to restart the iterator, but it is careful to avoid an
  infinite loop. On the first invocation, it prints the numbers 0123456789 and
  then restarts. On the second invocation, it prints the numbers 012345678 and
  does not restart.

  The magic of the retry statement is that it does not retry the iterator in
  exactly the same way each time. It completely reevaluates the iterator
  expression, which means that the arguments to the iterator (and even the
  object on which it is invoked) may be different each time the iterator is
  retried. If you are not used to highly dynamic languages like Ruby, this
  reevaluation may seem counterintuitive to you.

  The retry statement is not restricted to use in blocks; it always just
  reevaluates the nearest containing method invocation. This means that it can
  be used (prior to Ruby 1.9) to write iterators like the following that works
  like a while loop:


    # This method behaves like a while loop: if x is non-nil and non-false,
    # invoke the block and then retry to restart the loop and test the
    # condition again. This method is slightly different than a true while loop:
    # you can use C-style curly braces to delimit the loop body. And
    # variables used only within the body of the loop remain local to the block.

    def repeat_while(x)
            if x            # If the condition was not nil or false
                    yield   # Run the body of the loop
                    retry   # Retry and re-evaluate loop condition
            end
    end


- throw and catch

  throw and catch are Kernel methods that define a control structure that can be
  thought of as a multilevel break. throw doesn’t just break out of the current
  loop or block but can actually transfer out any number of levels, causing the
  block defined with a catch to exit. The catch need not even be in the same
  method as the throw. It can be in the calling method, or somewhere even
  further up the call stack.


  Languages like Java and JavaScript allow loops to be named or labeled with an
  arbitrary prefix. When this is done, a control structure known as a “labeled
  break” causes the named loop to exit. Ruby’s catch method defines a labeled
  block of code, and Ruby’s throw method causes that block to exit. But throw
  and catch are much more general than a labeled break. For one, it can be used
  with any kind of statement and is not restricted to loops. More profoundly, a
  throw can propagate up the call stack to cause a block in an invoking method
  to exit.


  If you are familiar with languages like Java and JavaScript, then you probably
  recognize throw and catch as the keywords those languages use for raising and
  handling excep- tions. Ruby does exceptions differently, using raise and
  rescue, which we’ll learn about later in this chapter. But the parallel to
  exceptions is intentional. Calling throw is very much like raising an
  exception. And the way a throw propagates out through the lexical scope and
  then up the call stack is very much the same as the way an exception prop-
  agates out and up. (We’ll see much more about exception propagation later in
  the chapter.) Despite the similarity to exceptions, it is best to consider
  throw and catch as a general-purpose (if perhaps infrequently used) control
  structure rather than an ex- ception mechanism. If you want to signal an error
  or exceptional condition, use raise instead of throw.


  The following code demonstrates how throw and catch can be used to “break out”
  of nested loops:



  for matrix in data do # Process a deeply nested
      catch :missing_data do # Label this statement so
          for row in matrix do
              for value in row do
                  throw :missing_data unless value # Break out of two
                  # Otherwise, do some actual data processing here.
              end
          end
      end
    # We end up here after the nested loops finish processing
    # We also get here if :missing_data is thrown.
   end

################################################################################
  Note that the catch method takes a symbol argument and a block. It executes
  the block and returns when the block exits or when the specified symbol is
  thrown. throw also expects a symbol as its argument and causes the
  corresponding catch invocation to return. If no catch call matches the symbol
  passed to throw, then a NameError exception is raised. Both catch and throw
  can be invoked with string arguments instead of symbols.  These are converted
  internally to symbols.
################################################################################


  One of the features of throw and catch is that they work even when the throw
  and catch are in different methods. We could refactor this code to put the
  innermost loop into a separate method, and the control flow would still work
  correctly.


  If throw is never called, a catch invocation returns the value of the last
  expression in its block. If throw is called, then the return value of the
  corresponding catch is, by default, nil. You can, however, specify an
  arbitrary return value for catch by passing a second argument to throw. The
  return value of catch can help you distinguish normal com- pletion of the
  block from abnormal completion with throw, and this allows you to write code
  that does any special processing necessary to respond to the throw.


  throw and catch are not commonly used in practice. If you find yourself using
  catch and throw within the same method, consider refactoring the catch into a
  separate method definition and replacing the throw with a return.


- Exceptions and Exception Handling

  An exception is an object that represents some kind of exceptional condition;
  it indicates that something has gone wrong. This could be a programming
  error—attempting to divide by zero, attempting to invoke a method on an object
  that does not define the method, or passing an invalid argument to a method.
  Or it could be the result from some kind of external condition—making a
  network request when the network is down, or trying to create an object when
  the system is out of memory.

  When one of these errors or conditions occurs, an exception is raised (or
  thrown). By default, Ruby programs terminate when an exception occurs. But it
  is possible to de- clare exception handlers. An exception handler is a block
  of code that is executed if an exception occurs during the execution of some
  other block of code. In this sense, exceptions are a kind of control
  statement. Raising an exception transfers the flow-of- control to exception
  handling code. This is like using the break statement to exit from a loop. As
  we’ll see, though, exceptions are quite different from the break statement;
  they may transfer control out of many enclosing blocks and even up the call
  stack in order to reach the exception handler.


  Ruby uses the Kernel method raise to raise exceptions, and uses a rescue
  clause to handle exceptions. Exceptions raised by raise are instances of the
  Exception class or one of its many subclasses. The throw and catch methods
  described earlier in this chap- ter are not intended to signal and handle
  exceptions, but a symbol thrown by throw propagates in the same way that an
  exception raised by raise does. Exception objects, exception propagation, the
  raise method, and the rescue clause are described in detail in the subsections
  that follow.


- Exception Classes and Exception Objects

  Exception objects are instances of the Exception class or one of its
  subclasses. Numer- ous subclasses exist. These subclasses do not typically
  define new methods or new behavior, but they allow exceptions to be
  categorized by type.
  [pg 155]

  You don’t need to be familiar with each of these exception subclasses. Their
  names tell you what they are used for. It is important to note that most of
  these subclasses extend a class known as StandardError. These are the “normal”
  exceptions that typical Ruby programs try to handle. The other exceptions
  represent lower-level, more serious, or less recoverable conditions, and
  normal Ruby programs do not typically attempt to handle them.

  If you use ri to find documentation for these exception classes, you’ll find
  that most of them are undocumented. This is in part because most of them add
  no new methods to those defined by the base Exception class. The important
  thing to know about a given exception class is when it can be raised. This is
  typically documented by the methods that raise the exception rather than by
  the exception class itself.

- The methods of exception objects

  The Exception class defines two methods that return details about the
  exception. The message method returns a string that may provide human-readable
  details about what went wrong. If a Ruby program exits with an unhandled
  exception, this message will typically be displayed to the end user, but the
  primary purpose of this message is to aid a programmer in diagnosing the
  problem.

  The other important method of exception objects is backtrace. This method
  returns an array of strings that represents the call stack at the point that
  the exception was raised. Each element of the array is a string of the form:


     filename : linenumber in methodname

  The first element of the array specifies the position at which the exception
  was raised; the second element specifies the position at which the method that
  raised the exception was called; the third element specifies the position at
  which that method was called; and so on. (The Kernel method caller returns a
  stack trace in this same format; you can try it out in irb.) Exception objects
  are typically created by the raise method. When this is done, the raise method
  sets the stack trace of the exception appropriately. If you create your own
  exception object, you can set the stack trace to whatever you want with the
  set_backtrace method.


- Creating exception objects

  Exception objects are typically created by the raise method, as we’ll see
  below. How- ever, you can create your own objects with the normal new method,
  or with another class method named exception. Both accept a single optional
  string argument. If speci- fied, the string becomes the value of the message
  method.

- Defining new exception classes

  If you are defining a module of Ruby code, it is often appropriate to define
  your own subclass of StandardError for exceptions that are specific to your
  module. This may be a trivial, one-line subclass:

      class MyError < StandardError; end

- Raising exceptions with raise

  The Kernel method raise raises an exception. fail is a synonym that is
  sometimes used when the expectation is that the exception will cause the
  program to exit. There are several ways to invoke raise:


  - If raise is called with no arguments, it creates a new RuntimeError object
    (with no message) and raises it. Or, if raise is used with no arguments
    inside a rescue clause, it simply re-raises the exception that was being
    handled.

  - If raise is called with a single Exception object as its argument, it raises
    that exception. Despite its simplicity, this is not actually a common way to
    use raise.

  - If raise is called with a single string argument, it creates a new
    RuntimeError exception object, with the specified string as its message, and
    raises that exception.  This is a very common way to use raise.

  - If the first argument to raise is an object that has an exception method,
    then raise invokes that method and raises the Exception object that it
    returns. The Exception class defines an exception method, so you can specify
    the class object for any kind of exception as the first argument to raise.

    raise accepts a string as its optional second argument. If a string is
    specified, it is passed to the exception method of the first argument. This
    string is intended for use as the exception message.

    raise also accepts an optional third argument. An array of strings may be
    specified here, and they will be used as the backtrace for the exception
    object. If this third argument is not specified, raise sets the backtrace of
    the exception itself (using the Kernel method caller).


  The following code defines a simple method that raises an exception if invoked
  with a parameter whose value is invalid:

        def factorial(n)
                raise "bad argument" if n < 1
                return 1 if n == 1
                n * factorial(n-1)
        end

  This method invokes raise with a single string argument. These are some
  equivalent ways to raise the same exception:

        raise RuntimeError, "bad argument" if n < 1
        raise RuntimeError.new("bad argument") if n < 1
        raise RuntimeError.exception("bad argument") if n < 1

  In this example, an exception of class ArgumentError is probably more
  appropriate than RuntimeError:

       raise ArgumentError if n < 1

  And a more detailed error message would be helpful:

       raise ArgumentError, "Expected argument >= 1. Got #{n}" if n < 1

  The intent of the exception we’re raising here is to point out a problem with
  the invo- cation of the factorial method, not with the code inside the method.
  The exception raised by the code here will have a backtrace whose first
  element identifies where raise was called. The second element of the array
  will actually identify the code that called factorial with the bad argument.
  If we want to point directly to the problem code, we can provide a custom
  stack trace as the third argument to raise with the Kernel method caller:


    if n < 1
            raise ArgumentError, "Expected argument >= 1. Got #{n}", caller
    end

  Note that the factorial method checks whether its argument is in the correct
  range, but it does not check whether it is of the right type. We might add
  more careful error- checking by adding the following as the first line of the
  method:

  raise TypeError, "Integer argument expected" if not n.is_a? Integer


  On the other hand, notice what happens if we pass a string argument to the
  factorial method as it is written above. Ruby compares the argument n to the
  integer 1 with the < operator. If the argument is a string, the comparison
  makes no sense, and it fails by raising a TypeError. If the argument is an
  instance of some class that does not define the < operator, then we get a
  NoMethodError instead.

  The point here is that exceptions can occur even if we do not call raise in
  our own code. It is important, therefore, to know how to handle exceptions,
  even if we never raise them ourselves. Handling exceptions is covered in the
  next section.


- Handling Exceptions with rescue

  raise is a Kernel method. A rescue clause, by contrast, is a fundamental part
  of the Ruby language. rescue is not a statement in its own right, but rather a
  clause that can be attached to other Ruby statements. Most commonly, a rescue
  clause is attached to a begin statement. The begin statement exists simply to
  delimit the block of code within which exceptions are to be handled. A begin
  statement with a rescue clause looks like this:

        begin
                # Any number of Ruby statements go here.
                # Usually, they are executed without exceptions and
                # execution continues after the end statement.
        rescue
                # This is the rescue clause; exception-handling code goes here.
                # If an exception is raised by the code above, or propagates up
                # from one of the methods called above, then execution jumps here.
        end

- Naming the exception object

  In a rescue clause, the global variable $! refers to the Exception object that
  is being handled. The exclamation mark is a mnemonic: an exception is kind of
  like an exclamation. If your program includes the line:

        require 'English'

  then you can use the global variable $ERROR_INFO instead.

  A better alternative to $! or $ERROR_INFO is to specify a variable name for
  the exception object in the rescue clause itself:

    rescue => ex

  The statements of this rescue clause can now use the variable ex to refer to
  the Exception object that describes the exception.


    begin
            x = factorial(-1)
            rescue => ex
            puts "#{ex.class}: #{ex.message}"
    end

  Note that a rescue clause does not define a new variable scope, and a variable
  named in the rescue clause is visible even after the end of the rescue clause.
  If you use a variable in a rescue clause, then an exception object may be
  visible after the rescue is complete, even when $! is no longer set.


- Handling exceptions by type

  The rescue clauses shown here handle any exception that is a StandardError (or
  sub- class) and ignore any Exception object that is not a StandardError. If
  you want to handle nonstandard exceptions outside the StandardError hierarchy,
  or if you want to handle only specific types of exceptions, you must include
  one or more exception classes in the rescue clause. Here’s how you would write
  a rescue clause that would handle any kind of exception:

    rescue Exception


  Here’s how you would write a rescue clause to handle an ArgumentError and
  assign the exception object to the variable e:

    rescue ArgumentError => e

  Recall that the factorial method we defined earlier can raise ArgumentError or
  TypeError. Here’s how we would write a rescue clause to handle exceptions of
  either of these types and assign the exception object to the variable error:

    rescue ArgumentError, TypeError => error

  Here, finally, we see the syntax of the rescue clause at its most general. The
  rescue keyword is followed by zero or more comma-separated expressions, each
  of which must evaluate to a class object that represents the Expression class
  or a subclass. These expressions are optionally followed by => and a variable
  name.

  Now suppose we want to handle both ArgumentError and TypeError, but we want to
  handle these two exceptions in different ways. We might use a case statement
  to run different code based on the class of the exception object. It is more
  elegant, however, to simply use multiple rescue clauses. A begin statement can
  have zero or more of them:


        begin
                x = factorial(1)
                rescue ArgumentError => ex
                        puts "Try again with a value >= 1"
                rescue TypeError => ex
                        puts "Try again with an integer"
        end

  Note that the Ruby interpreter attempts to match exceptions to rescue clauses
  in the order they are written. Therefore, you should list your most specific
  exception sub- classes first and follow these with more general types. If you
  want to handle EOFError differently than IOError, for example, be sure to put
  the rescue clause for EOFError first or the IOError code will handle it. If
  you want a “catch-all” rescue clause that handles any exception not handled by
  previous clauses, use rescue Exception as the last rescue clause.


- Propagation of exceptions

  Now that we’ve introduced rescue clauses, we can explain in more detail the
  propa- gation of exceptions. When an exception is raised, control is
  immediately transferred outward and upward until a suitable rescue clause is
  found to handle the exception.  When the raise method executes, the Ruby
  interpreter looks to see whether the con- taining block has a rescue clause
  associated with it. If not (or if the rescue clause is not declared to handle
  that kind of exception), then the interpreter looks at the containing block of
  the containing block. If there is no suitable rescue clause anywhere in the
  method that called raise, then the method itself exits.

  When a method exits because of an exception, it is not the same thing as a
  normal return. The method does not have a return value, and the exception
  object continues propagating from the site of the method invocation. The
  exception propagates outward through the enclosing blocks, looking for a
  rescue clause declared to handle it. And if no such clause is found, then this
  method returns to its caller. This continues up the call stack. If no
  exception handler is ever located, then the Ruby interpreter prints the
  exception message and backtrace and exits. For a concrete example, consider
  the following code:


            def explode
            # This method raises a RuntimeError 10% of the time
                raise "bam!" if rand(10) == 0
            end

            def risky
                begin
                    10.times do
                        explode
                    end
                rescue TypeError  # This rescue clause cannot handle a runtimeexception
                    puts $!       # so skip it and propagate out
                end
               "hello"         # This is the normal return value, if no exception occurs
            end

            def defuse
                begin
                    puts risky
                rescue RuntimeError => e
                    puts e.message
                end
            end

            defuse


  An exception is raised in the method explode. That method has no rescue
  clause, so the exception propagates out to its caller, a method named risky.
  risky has a rescue clause, but it is only declared to handle TypeError
  exceptions, not RuntimeError exceptions. The exception propagates out through
  the lexical blocks of risky and then propagates up to the caller, a method
  named defuse. defuse has a rescue clause for RuntimeError exceptions, so
  control is transferred to this rescue clause and the exception stops
  propagating.


  Note that this code includes the use of an iterator (the Integer.times method)
  with an associated block. For simplicity, we said that the exception simply
  propagated outward through this lexical block. The truth is that blocks behave
  more like method invocations for the purposes of exception propagation. The
  exception propagates from the block up to the iterator that invoked the block.
  Predefined looping iterators like Integer.times do no exception handling of
  their own, so the exception propagates up the call stack from the times
  iterator to the risky method that invoked it.


- Exceptions during exception handling

  If an exception occurs during the execution of a rescue clause, the exception
  that was originally being handled is discarded, and the new exception
  propagates from the point at which it was raised. Note that this new exception
  cannot be handled by rescue clauses that follow the one in which it occurred.


  - retry in a rescue clause

    When the retry statement is used within a rescue clause, it reruns the block
    of code to which the rescue is attached. When an exception is caused by a
    transient failure, such as an overloaded server, it might make sense to
    handle the exception by simply trying again. Many other exceptions, however,
    reflect programming errors (TypeError, ZeroDivisionError) or nontransient
    failures (EOFError or NoMemoryError). retry is not a suitable handling
    technique for these exceptions.

    Here is a simple example that uses retry in an attempt to wait for a network
    failure to be resolved. It tries to read the contents of a URL, and retries
    upon failure. It never tries more than four times in all, and it uses
    “exponential backoff” to increase the wait time between attempts:


        require 'open-uri'
        tries = 0       # How many times have we tried to read the URL
        begin           # This is where a retry begins
            tries += 1  # Try to print out the contents of a URL
            open('http://www.example.com/') {|f| puts f.readlines }
            rescue OpenURI::HTTPError => e  # If we get an HTTP error
                puts e.message             # Print the error message
                if (tries < 4)             # If we haven't tried 4 times yet...
                   sleep(2**tries)         # Wait for 2, 4, or 8 seconds
                   retry                   # And then try again!
                end
            end

- The else Clause

  A begin statement may include an else clause after its rescue clauses. You
  might guess that the else clause is a catch-all rescue: that it handles any
  exception that does not match a previous rescue clause. This is not what else
  is for. The else clause is an alternative to the rescue clauses; it is used if
  none of the rescue clauses are needed. That is, the code in an else clause is
  executed if the code in the body of the begin statement runs to completion
  without exceptions.

  Putting code in an else clause is a lot like simply tacking it on to the end
  of the begin clause. The only difference is that when you use an else clause,
  any exceptions raised by that clause are not handled by the rescue statements.

  The use of an else clause is not particularly common in Ruby, but they can be
  stylis- tically useful to emphasize the difference between normal completion
  of a block of code and exceptional completion of a block of code.

  Note that it does not make sense to use an else clause without one or more
  rescue clauses. The Ruby interpreter allows it but issues a warning. No rescue
  clause may appear after an else clause.

  Finally, note that the code in an else clause is only executed if the code in
  the begin clause runs to completion and “falls off” the end. If an exception
  occurs, then the else clause will obviously not be executed. But break,
  return, next, and similar state- ments in the begin clause may also prevent
  the execution of the else clause.


- The ensure Clause

  A begin statement may have one final clause. The optional ensure clause, if it
  appears, must come after all rescue and else clauses. It may also be used by
  itself without any rescue or else clauses.

  The ensure clause contains code that always runs, no matter what happens with
  the code following begin:

  - If that code runs to completion, then control jumps to the else clause—if
    there is one—and then to the ensure clause.

  - If the code executes a return statement, then the execution skips the else
    clause and jumps directly to the ensure clause before returning.

  - If the code following begin raises an exception, then control jumps to the
    appro- priate rescue clause, and then to the ensure clause.

  - If there is no rescue clause, or if no rescue clause can handle the
    exception, then control jumps directly to the ensure clause. The code in the
    ensure clause is exe- cuted before the exception propagates out to
    containing blocks or up the call stack.

  The purpose of the ensure clause is to ensure that housekeeping details such
  as closing files, disconnecting database connections, and committing or
  aborting transactions get taken care of. It is a powerful control structure,
  and you should use it whenever you allocate a resource (such as a file handle
  or database connection) to ensure that proper deallocation or cleanup occurs.

  Note that ensure clauses complicate the propagation of exceptions. In our
  earlier ex- planation, we omitted any discussion of ensure clauses. When an
  exception propagates, it does not simply jump magically from the point where
  it is raised to the point where it is handled. There really is a propagation
  process. The Ruby interpreter searches out through containing blocks and up
  through the call stack. At each begin statement, it looks for a rescue clause
  that can handle the exception. And it looks for associated ensure clauses, and
  executes all of them that it passes through.

  An ensure clause can cancel the propagation of an exception by initiating some
  other transfer of control. If an ensure clause raises a new exception, then
  that new exception propagates in place of the original. If an ensure clause
  includes a return statement, then exception propagation stops, and the
  containing method returns. Control statements such as break and next have
  similar effects: exception propagation is abandoned, and the specified control
  transfer takes place.

  An ensure clause also complicates the idea of a method return value. Although
  ensure clauses are usually used to ensure that code will run even if an
  exception occurs, they also work to ensure that code will be run before a
  method returns. If the body of a begin statement includes a return statement,
  the code in the ensure clause will be run before the method can actually
  return to its caller. Furthermore, if an ensure clause contains a return
  statement of its own, it will change the return value of the method.  The
  following code, for example, returns the value 2:


        begin
                return 1
        ensure
                return 2
        end

  Note that an ensure clause does not alter the return value of a method unless
  it explicitly uses a return statement. The following method, for example,
  returns 1, not 2:

        def test
                begin return 1 ensure 2 end
        end

  If a begin statement does not propagate an exception, then the value of the
  statement is the value of the last expression evaluated in the begin, rescue,
  or else clauses. The code in the ensure clause is guaranteed to run, but it
  does not affect the value of the begin statement.


- rescue with Method, Class, and Module Definitions

  Throughout this discussion of exception handling, we have described the
  rescue, else, and ensure keywords as clauses of a begin statement. In fact,
  they can also be used as clauses of the def statement (defines a method), the
  class statement (defines a class), and the module statement (defines a
  module). Method definitions are covered in Chap- ter 6; class and module
  definitions are covered in Chapter 7.


  The following code is a sketch of a method definition with rescue, else, and
  ensure clauses:


    def method_name(x)
                    # The body of the method goes here.
                    # Usually, the method body runs to completion without exceptions
                    # and returns to its caller normally.
            rescue
                    # Exception-handling code goes here.
                    # If an exception is raised within the body of the method, or if
                    # one of the methods it calls raises an exception, then control
                    # jumps to this block.
            else
                    # If no exceptions occur in the body of the method
                    # then the code in this clause is executed.
            ensure
                    # The code in this clause is executed no matter what happens in the
                    # body of the method. It is run if the method runs to completion, if
                    # it throws an exception, or if it executes a return statement.
    end

- rescue as a statement modifier

  In addition to its use as a clause, rescue can also be used as a statement
  modifier. Any statement can be followed by the keyword rescue and another
  statement. If the first statement raises an exception, the second statement is
  executed instead. For example:

        # Compute factorial of x, or use 0 if the method raises an exception
        y = factorial(x) rescue 0

  This is equivalent to:

        y = begin
              factorial(x)
              rescue
              0
            end

  The advantage of the statement modifier syntax is that the begin and end
  keywords are not required. When used in this way, rescue must be used alone,
  with no exception class names and no variable name. A rescue modifier handles
  any StandardError exception but does not handle exceptions of other types.
  Unlike if and while modifiers, the rescue modifier has higher precedence (see
  Table 4-2 in the previous chapter) than assignment operators. This means that
  it applies only to the righthand side of an as- signment (like the example
  above) rather than to the assignment expression as a whole.


- BEGIN and END

  BEGIN and END are reserved words in Ruby that declare code to be executed at
  the very beginning and very end of a Ruby program. (Note that BEGIN and END in
  capital letters are completely different from begin and end in lowercase.) If
  there is more than one BEGIN statement in a program, they are executed in the
  order in which the interpreter encounters them. If there is more than one END
  statement, they are executed in the reverse of the order in which they are
  encountered—that is, the first one is executed last. These statements are not
  commonly used in Ruby. They are inherited from Perl, which in turn inherited
  them from the awk text-processing language.


  BEGIN and END must be followed by an open curly brace, any amount of Ruby
  code, and a close curly brace. The curly braces are required; do and end are
  not allowed here. For example:


        BEGIN {
                # Global initialization code goes here
        }

        END {
                # Global shutdown code goes here
        }

  The BEGIN and END statements are different from each other in subtle ways.
  BEGIN state- ments are executed before anything else, including any
  surrounding code. This means that they define a local variable scope that is
  completely separate from the surrounding code. It only really makes sense to
  put BEGIN statements in top-level code; a BEGIN within a conditional or loop
  will be executed without regard for the conditions that surround it. Consider
  this code:


        if (false)
                BEGIN {
                        puts "if";     # This will be printed
                        a = 4;         # This variable only defined here
                }
        else
                BEGIN { puts "else" }   # Also printed
        end

        10.times {BEGIN { puts "loop" }} # Only printed once


  The code associated with all three BEGIN statements will be executed once, and
  only once, regardless of the context in which it appears. Variables defined
  within BEGIN blocks will not be visible outside the block, and no variables
  outside the block will have been defined yet.

  END statements are different. They are executed during normal program
  execution, so they share local variables with the surrounding code. If an END
  statement is within a conditional that is not executed, then the code
  associated with it is never registered for execution at program termination.
  If an END statement is within a loop and is executed more than once, then the
  code associated with it is still only registered once:


            a = 4;
            if (true)
                    END {                   # This END is executed
                            puts "if";      # This code is registered
                            puts a          # The variable is visible; prints "4"
                    }
            else
                    END { puts "else" }     # This is not executed
            end

            10.times {END { puts "loop" }}  # Only executed once


  The Kernel method at_exit provides an alternative to the END statement; it
  registers a block of code to be executed just before the interpreter exits. As
  with END blocks, the code associated with the first at_exit call will be
  executed last. If the at_exit method is called multiple times within a loop,
  then the block associated with it will be executed multiple times when the
  interpreter exits.


- Threads, Fibers and Continuations

  This section introduces threads, which are Ruby’s control structure for
  concurrent execution, and also two more esoteric control structures, called
  fibers and continuations.

- Threads for Concurrency

  A thread of execution is a sequence of Ruby statements that run (or appear to
  run) in parallel with the main sequence of statements that the interpreter is
  running. Threads are represented by Thread objects, but they can also be
  thought of as control structures for concurrency. Concurrent programming in
  Ruby is covered in detail in §9.9. This section is just a simple overview that
  shows how to create threads.

  Ruby’s use of blocks makes it very easy to create new threads. Simply call
  Thread.new and associate a block with it. A new thread of execution will be
  created and will start running the code in the block. Meanwhile, the original
  thread will return from the Thread.new call and will continue with the
  following statement. The newly created thread will exit when the block exits.
  The return value of the block becomes available through the value method of
  the Thread object. (If you call this method before the thread has completed,
  the caller will block until the thread returns a value.)

  The following code shows how you might use threads to read the contents of
  multiple files in parallel:


        # This method expects an array of filenames.
        # It returns an array of strings holding the content of the named files.
        # The method creates one thread for each named file.

        def readfiles(filenames)

                # Create an array of threads from the array of filenames.
                # Each thread starts reading a file.

                threads = filenames.map do |f|
                                        Thread.new { File.read(f) }
                                end

                # Now create an array of file contents by calling the value
                # method of each thread. This method blocks, if necessary,
                # until the thread exits with a value

                threads.map {|t| t.value }
        end

  See §9.9 for much more about threads and concurrency in Ruby.


- Fibers for Coroutines

  Ruby 1.9 introduces a control structure known as a fiber and represented by an
  object of class Fiber. The name “fiber” has been used elsewhere for a kind of
  lightweight thread, but Ruby’s fibers are better described as coroutines or,
  more accurately, semi- coroutines. The most common use for coroutines is to
  implement generators: objects that can compute a partial result, yield the
  result back to the caller, and save the state of the computation so that the
  caller can resume that computation to obtain the next result. In Ruby, the
  Fiber class is used to enable the automatic conversion of internal iterators,
  such as the each method, into enumerators or external iterators.

  Note that fibers are an advanced and relatively obscure control structure; the
  majority of Ruby programmers will never need to use the Fiber class directly.
  If you have never programed with coroutines or generators before, you may find
  them difficult to understand at first. If so, study the examples carefully and
  try out some examples of your own.

  A fiber has a body of code like a thread does. Create a fiber with Fiber.new,
  and associate a block with it to specify the code that the fiber is to run.
  Unlike a thread, the body of a fiber does not start executing right away. To
  run a fiber, call the resume method of the Fiber object that represents it.
  The first time resume is called on a fiber, control is transferred to the
  beginning of the fiber body. That fiber then runs until it reaches the end of
  the body, or until it executes the class method Fiber.yield. The Fiber.yield
  method transfers control back to the caller and makes the call to resume
  return. It also saves the state of the fiber, so that the next call to resume
  makes the fiber pick up where it left off. Here is a simple example:



    f = Fiber.new {                          # Line 1: Create a new Fiber
            puts "Fiber says Hello"          # Line 2:
            Fiber.yield                      # Line 3: goto line 9
            puts "Fiber says Goodbye"        # Line 4:
    }                                        # Line 5: goto line 11
                                             # Line 6:
    puts "Caller says Hello"                 # Line 7:
    f.resume                                 # Line 8: goto line 2
    puts "Caller says Goodbye"               # Line 9:
    f.resume                                 # Line 10: goto line 4

  The body of the fiber does not run when it is first created, so this code
  creates a fiber but does not produce any output until it reaches line 7. The
  resume and Fiber.yield calls then transfer control back and forth so that the
  messages from the fiber and the caller are interleaved. The code produces the
  following output:

         Caller says Hello
         Fiber says Hello
         Caller says Goodbye
         Fiber says Goodbye

  It is worth noting here that the “yielding” performed by Fiber.yield is
  completely different than the yielding performed by the yield statement.
  Fiber.yield yields control from the current fiber back to the caller that
  invoked it. The yield statement, on the other hand, yields control from an
  iterator method to the block associated with the method.


- Fiber arguments and return values

  Fibers and their callers can exchange data through the arguments and return
  values of resume and yield. The arguments to the first call to resume are
  passed to the block associated with the fiber: they become the values of the
  block parameters. On subsequent calls, the arguments to resume become the
  return value of Fiber.yield.  Conversely, any arguments to Fiber.yield become
  the return value of resume. And when the block exits, the value of the last
  expression evaluated also becomes the return value of resume. The following
  code demonstrates this:


        f = Fiber.new do |message|
                puts "Caller said: #{message}"
                message2 = Fiber.yield("Hello")     # "Hello" returned by first resume
                puts "Caller said: #{message2}"
                "Fine"                              # "Fine" returned by second resume
        end

        response = f.resume("Hello")                # "Hello" passed to block
        puts "Fiber said: #{response}"
        response2 = f.resume("How are you?")        # "How are you?" returned by Fiber.yield
        puts "Fiber said: #{response2}"

  The caller passes two messages to the fiber, and the fiber returns two
  responses to the caller. It prints:

            Caller said: Hello
            Fiber said: Hello
            Caller said: How are you?
            Fiber said: Fine


  In the caller’s code, the messages are always arguments to resume, and the
  responses are always the return value of that method. In the body of the
  fiber, all messages but the first are received as the return value of
  Fiber.yield, and all responses but the last are passed as arguments to
  Fiber.yield. The first message is received through block parameters, and the
  last response is the return value of the block itself.



- Implementing generators with fibers

  The fiber examples shown so far have not been terribly realistic. Here we
  demonstrate some more typical uses. First, we write a Fibonacci number
  generator—a Fiber object that returns successive members of the Fibonacci
  sequence on each call to resume:

        # Return a Fiber to compute Fibonacci numbers
        def fibonacci_generator(x0,y0)             # Base the sequence on x0,y0
                Fiber.new do
                        x,y = x0, y0               # Initialize x and y
                        loop do                    # This fiber runs forever
                                Fiber.yield y      # Yield the next number in the sequence
                                x,y = y,x+y        # Update x and y
                        end
                end
        end

        g = fibonacci_generator(0,1)              # Create a generator
        10.times { print g.resume, " " }          # And use it


  The code above prints the first 10 Fibonacci numbers:
                        1 1 2 3 5 8 13 21 34 55

  Because Fiber is a confusing control structure, we might prefer to hide its
  API when writing generators. Here is another version of a Fibonacci number
  generator. It defines its own class and implements the same next and rewind
  API that enumerators do:


        class FibonacciGenerator
                def initialize
                        @x,@y = 0,1
                        @fiber = Fiber.new do
                                loop do
                                        @x,@y = @y, @x+@y
                                        Fiber.yield @x
                                end
                        end
                end

                def next                  # Return the next Fibonacci number
                        @fiber.resume
                end

                def rewind                # Restart the sequence
                        @x, @y = 0,1
                end
        end

        g = FibonacciGenerator.new
        10.times { print g.next, " " }   # Print first 10 numbers
        g.rewind; puts                   # Start over, on a new line
        10.times { print g.next, " " }   # Print the first 10 again


  Note that we can make this FibonacciGenerator class Enumerable by including
  the Enumerable module and adding the following each method (which we first
  used in §5.3.5):

        def each
                loop { yield self.next }
        end

  Conversely, suppose we have an Enumerable object and want to make an
  enumerator- style generator out of it. We can use this class:

                [pg 170]


  Although it is useful to study the implementation of this Generator class, the
  class itself doesn’t provide any functionality over that provided by the
  to_enum method.


- Advanced fiber features

  The fiber module in the standard library enables additional, more powerful
  features of the fibers. To use these features, you must:

        require 'fiber'

  However, you should avoid using these additional features wherever possible,
  because:

  - They are not supported by all implementations. JRuby, for example, cannot
    support them on current Java VMs.

  - They are so powerful that misusing them can crash the Ruby VM.


  The core features of the Fiber class implement semicoroutines. These are not
  true co- routines because there is a fundamental asymmetry between the caller
  and the fiber: the caller uses resume and the fiber uses yield. If you require
  the fiber library, however, the Fiber class gets a transfer method that allows
  any fiber to transfer control to any other fiber.


  [eg on page 171]

  [ cover section on Continuations pg 172 -- too long!]

* Methods, Procs, Lambdas, and Closures

  A method is a named block of parameterized code associated with one or more
  objects.  A method invocation specifies the method name, the object on which
  it is to be invoked (sometimes called the receiver), and zero or more argument
  values that are assigned to the named method parameters. The value of the last
  expression evaluated in the method becomes the value of the method invocation
  expression.

  Many languages distinguish between functions, which have no associated object,
  and methods, which are invoked on a receiver object. Because Ruby is a purely
  object- oriented language, all methods are true methods and are associated
  with at least one object. We have not covered class definitions in Ruby yet,
  so the example methods defined in this chapter look like global functions with
  no associated object. In fact, Ruby implicitly defines and invokes them as
  private methods of the Object class.

  Methods are a fundamental part of Ruby’s syntax, but they are not values that
  Ruby programs can operate on. That is, Ruby’s methods are not objects in the
  way that strings, numbers, and arrays are. It is possible, however, to obtain
  a Method object that represents a given method, and we can invoke methods
  indirectly through Method objects.


  Methods are not Ruby’s only form of parameterized executable code. Blocks,
  which we introduced in §5.4, are executable chunks of code and may have
  parameters. Unlike methods, blocks do not have names, and they can only be
  invoked indirectly through an iterator method.

  Blocks, like methods, are not objects that Ruby can manipulate. But it’s
  possible to create an object that represents a block, and this is actually
  done with some frequency in Ruby programs. A Proc object represents a block.
  Like a Method object, we can execute the code of a block through the Proc that
  represents it. There are two varieties of Proc objects, called procs and
  lambdas, which have slightly different behavior. Both procs and lambdas are
  functions rather than methods invoked on an object. An important feature of
  procs and lambdas is that they are closures: they retain access to the local
  variables that were in scope when they were defined, even when the proc or
  lambda is invoked from a different scope.


  Methods have a rich and fairly complex syntax in Ruby, and the first four
  sections of this chapter are dedicated to them. We begin by explaining how to
  define simple meth- ods, and then follow this introductory section with three
  more advanced sections covering methods names, method parentheses, and method
  parameters.


- Defining Simple Methods

  Methods are defined with the def keyword. This is followed by the method name
  and an optional list of parameter names in parentheses. The Ruby code that
  constitutes the method body follows the parameter list, and the end of the
  method is marked with the end keyword. Parameter names can be used as
  variables within the method body, and the values of these named parameters
  come from the arguments to a method invocation.  Here is an example method:


    # Define a method named 'factorial' with a single parameter 'n'
    def factorial(n)
            if n < 1                             # Test the argument value for validity
                    raise "argument must be > 0"
            elsif n == 1                         # If the argument is 1
                    1                            # then the value of the method invocation is 1
            else                                 # Otherwise, the factorial of n is n times
                    n * factorial(n-1)           # the factorial of n-1
            end
    end

  This code defines a method named factorial. The method has a single parameter
  named n. The identifier n is used as a variable within the body of the method.
  This is a recursive method, so the body of the method includes an invocation
  of the method.  The invocation is simply the name of the method followed by
  the argument value in parentheses.


- Method Return Value

  Methods may terminate normally or abnormally. Abnormal termination occurs when
  the method raises an exception. The factorial method shown earlier terminates
  ab- normally if we pass it an argument less than 1. If a method terminates
  normally, then the value of the method invocation expression is the value of
  the last expression eval- uated within the method body. In the factorial
  method, that last expression will either be 1 or n*factorial(n-1).

  The return keyword is used to force a return prior to the end of the method.
  If an expression follows the return keyword, then the value of that expression
  is returned.  If no expression follows, then the return value is nil. In the
  following variant of the factorial method, the return keyword is required:

        def factorial(n)
                raise "bad argument" if n < 1
                return 1 if n == 1
                n * factorial(n-1)
        end

  We could also use return on the last line of this method body to emphasize
  that this expression is the method’s return value. In common practice,
  however, return is omitted where it is not required.

  Ruby methods may return more than one value. To do this, use an explicit
  return statement, and separate the values to be returned with commas:

    # Convert the Cartesian point (x,y) to polar (magnitude, angle) coordinates
    def polar(x,y)
            return Math.hypot(y,x), Math.atan2(y,x)
    end

  When there is more than one return value, the values are collected into an
  array, and the array becomes the single return value of the method. Instead of
  using the return statement with multiple values, we can simply create an array
  of values ourselves:

    # Convert polar coordinates to Cartesian coordinates
    def cartesian(magnitude, angle)
            [magnitude*Math.cos(angle), magnitude*Math.sin(angle)]
    end

  Methods of this form are typically intended for use with parallel assignment
  (see §4.5.5) so that each return value is assigned to a separate variable:

    distance, theta = polar(x,y)
    x,y = cartesian(distance,theta)

- Methods and Exception Handling

  A def statement that defines a method may include exception-handling code in
  the form of rescue, else, and ensure clauses, just as a begin statement can.
  These exception- handling clauses go after the end of the method body but
  before the end of the def statement. In short methods, it can be particularly
  tidy to associate your rescue clauses with the def statement. This also means
  you don’t have to use a begin statement and the extra level of indentation
  that comes with it. See §5.6.6 for further details.


- Invoking a Method on an Object

  Methods are always invoked on an object. (This object is sometimes called the
  receiver in a reference to an object-oriented paradigm in which methods are
  called “messages” and are “sent to” receiver objects.) Within the body of a
  method, the key- word self refers to the object on which the method was
  invoked. If we don’t specify an object when invoking a method, then the method
  is implicitly invoked on self.

  You’ll learn how to define methods for classes of objects in Chapter 7.
  Notice, however, that you’ve already seen examples of invoking methods on
  objects, in code like this:


     first = text.index(pattern)

  Like most object-oriented languages, Ruby uses . to separate the object from
  the meth- od to be invoked on it. This code passes the value of the variable
  pattern to the method named index of the object stored in the variable text,
  and stores the return value in the variable first.


- Defining Singleton Methods

  The methods we’ve defined so far are all global methods. If we place a def
  statement like the ones shown earlier inside a class statement, then the
  methods that are defined are instance methods of the class; these methods are
  defined on all objects that are instances of the class. (Classes and instance
  methods are explained in Chapter 7.)

  It is also possible, however, to use the def statement to define a method on a
  single specified object. Simply follow the def keyword with an expression that
  evaluates to an object. This expression should be followed by a period and the
  name of the method to be defined. The resulting method is known as a singleton
  method because it is available only on a single object:

    o = "message"        # A string is an object
    def o.printme        # Define a singleton method for this object
            puts self
    end
    o.printme            # Invoke the singleton

  Class methods (covered in Chapter 7) such as Math.sin and File.delete are
  actually singleton methods. Math is a constant that refers to a Module object,
  and File is a constant that refers to a Class object. These two objects have
  singleton methods named sin and delete, respectively.

  Ruby implementations typically treat Fixnum and Symbol values as immediate
  values rather than as true object references. (See §3.8.1.1.) For this reason,
  singleton methods may not be defined on Fixnum and Symbol objects. For
  consistency, singletons are also prohibited on other Numeric objects.


- Undefining Methods

  Methods are defined with the def statement and may be undefined with the undef
  statement:

        def sum(x,y); x+y; end
        puts sum(1,2)
        undef sum

  In this code, the def statement defines a global method, and undef undefines
  it. undef also works within classes (which are the subject of Chapter 7) to
  undefine the instance methods of the class. Interestingly, undef can be used
  to undefine inherited methods, without affecting the definition of the method
  in the class from which it is inherited.  Suppose class A defines a method m,
  and class B is a subclass of A and therefore inherits m. (Subclasses and
  inheritance are also explained in Chapter 7.) If you don’t want to allow
  instances of class B to be able to invoke m, you can use undef m within the
  body of the subclass.

  undef is not a commonly used statement. In practice, it is much more common to
  redefine a method with a new def statement than it is to undefine or delete
  the method.

  Note that the undef statement must be followed by a single identifier that
  specifies the method name. It cannot be used to undefine a singleton method in
  the way that def can be used to define such a method.

  Within a class or module, you can also use undef_method (a private method of
  Module) to undefine methods. Pass a symbol representing the name of the method
  to be undefined.

- Method Names

  By convention, method names begin with a lowercase letter. (Method names can
  begin with a capital letter, but that makes them look like constants.) When a
  method name is longer than one word, the usual convention is to separate the
  words with underscores like_this rather than using mixed case likeThis.

  Method names may (but are not required to) end with an equals sign, a question
  mark, or an exclamation point. An equals sign suffix signifies that the method
  is a setter that can be invoked using assignment syntax. Setter methods are
  described in §4.5.3 and additional examples are provided in §7.1.5. The
  question mark and exclamation point suffixes have no special meaning to the
  Ruby interpreter, but they are allowed because they enable two extraordinarily
  useful naming conventions.

  The first convention is that any method whose name ends with a question mark
  returns a value that answers the question posed by the method invocation. The
  empty? method of an array, for example, returns true if the array has no
  elements. Methods like these are called predicates and. Predicates typically
  return one of the Boolean values true or false, but this is not required, as
  any value other than false or nil works like true when a Boolean value is
  required. (The Numeric method nonzero?, for example, returns nil if the number
  it is invoked on is zero, and just returns the number otherwise.)


  The second convention is that any method whose name ends with an exclamation
  mark should be used with caution. The Array object, for example, has a sort
  method that makes a copy of the array, and then sorts that copy. It also has a
  sort! method that sorts the array in place. The exclamation mark indicates
  that you need to be more careful when using that version of the method.


  Often, methods that end with an exclamation mark are mutators, which alter the
  in- ternal state of an object. But this is not always the case; there are many
  mutators that do not end with an exclamation mark, and a number of nonmutators
  that do. Mutating methods (such as Array.fill) that do not have a nonmutating
  variant do not typically have an exclamation point.

  Consider the global function exit: it makes the Ruby program stop running in a
  con- trolled way. There is also a variant named exit! that aborts the program
  immediately without running any END blocks or shutdown hooks registered with
  at_exit. exit! isn’t a mutator; it’s the “dangerous” variant of the exit
  method and is flagged with ! to remind a programmer using it to be careful.


- Operator Methods

  Many of Ruby’s operators, such as +, *, and even the array index operator [],
  are im- plemented with methods that you can define in your own classes. You
  define an operator by defining a method with the same “name” as the operator.
  (The only ex- ceptions are the unary plus and minus operators, which use
  method names +@ and -@.) Ruby allows you to do this even though the method
  name is all punctuation. You might end up with a method definition like this:


                def +(other)                    # Define binary plus operator: x + y is x.+(y)
                        self.concatenate(other)
                end

  Table 4-2 in Chapter 4 specifies which of Ruby’s operators are defined as methods.
  These operators are the only punctuation-based method names that you can use: you
  can’t invent new operators or define methods whose names consist of other sequences
  of punctuation characters. There are additional examples of defining method-based
  operators in §7.1.6.

  Methods that define a unary operator are passed no arguments. Methods that define
  binary operators are passed one argument and should operate on self and the argu-
  ment. The array access operators [] and []= are special because they can be invoked
  with any number of arguments. For []=, the last argument is always the value being
  assigned.

- Method Aliases

  It is not uncommon for methods in Ruby to have more than one name. The language
  has a keyword alias that serves to define a new name for an existing method. Use it
  like this:

                alias aka also_known_as          # alias new_name existing_name

  After executing this statement, the identifier aka will refer to the same method thats
  also_known_as does.

  Method aliasing is one of the things that makes Ruby an expressive and natural lan-
  guage. When there are multiple names for a method, you can choose the one that seems
  most natural in your code. The Range class, for example, defines a method for testing
  whether a value falls within the range. You can call this method with the name
  include? or with the name member?. If you are treating a range as a kind of set, the name
  member? may be the most natural choice.

  A more practical reason for aliasing methods is to insert new functionality into a
  method. The following is a common idiom for augmenting existing methods:


                def hello                                                                # A nice simple method
                        puts "Hello World"                                       # Suppose we want to augment it...
                end

                alias original_hello hello                               # Give the method a backup name

                def hello                                                                # Now we define a new method with the old name
                        puts "Your attention please"             # That does some stuff
                        original_hello                                           # Then calls the original method
                        puts "This has been a test"              # Then does some more stuff
                end

  In this code, we’re working on global methods. It is more common to use alias with
  the instance methods of a class. (We’ll learn about this in Chapter 7.) In this situation,
  alias must be used within the class whose method is to be renamed. Classes in Ruby
  can be “reopened” (again, this is discussed in Chapter 7)—which means that your code
  can take an existing class, ‘open’ it with a class statement, and then use alias as shown
  in the example to augment or alter the existing methods of that class. This is called
  “alias chaining” and is covered in detail in §8.11.


----- Aliasing is Not Overloading

       A Ruby method may have two names, but two methods cannot share a single name. In
           statically typed languages, methods can be distinguished by the number and type of
           their arguments, and two or more methods may share the same name as long as they
           expect different numbers or types of arguments. This kind of overloading is not possible
           in Ruby.

           On the other hand, method overloading is not really necessary in Ruby. Methods can
           accept arguments of any class and can be written to do different things based on the
           type of the arguments they are passed. Also (as we’ll see later), Ruby’s method argu-
           ments can be declared with default values, and these arguments may be omitted form
           method invocations. This allows a single method to be invoked with differing numbers
           of arguments.
-------------------------------------------------------------------------------------------

- Methods and Parantheses

  Ruby allows parentheses to be omitted from most method invocations. In simple cases,
  this results in clean-looking code. In complex cases, however, it causes syntactic am-
  biguities and confusing corner cases. We’ll consider these in the sections that follow.


- Optional Parantheses

  Parentheses are omitted from method invocations in many common Ruby idioms. The
  following two lines of code, for example, are equivalent:

                puts "Hello World"
                puts("Hello World")

  In the first line, puts looks like a keyword, statement, or command built in to the
  language. The equivalent second line demonstrates that it is simply the invocation of
  a global method, with the parentheses omitted. Although the second form is clearer,
  the first form is more concise, more commonly used, and arguably more natural.

  Next, consider this code:

                greeting = "Hello"
                size = greeting.length

  If you are accustomed to other object-oriented languages, you may think that length
  is a property, field, or variable of string objects. Ruby is strongly object oriented, how-
  ever, and its objects are fully encapsulated; the only way to interact with them is by
  invoking their methods. In this code, greeting.length is a method invocation. The
  length method expects no arguments and is invoked without parentheses. The
  following code is equivalent:

                size = greeting.length()

  Including the optional parentheses emphasizes that a method invocation is occurring.
  Omitting the parentheses in method invocations with no arguments gives the illusion
  of property access, and is a very common practice.

  Parentheses are very commonly omitted when there are zero or one arguments to the
  invoked method. Although it is less common, the parentheses may be omitted even
  when there are multiple arguments, as in the following code:

                x = 3
                x.between? 1,5

  Parentheses may also be omitted around the parameter list in method definitions,
  though it is hard to argue that this makes your code clearer or more readable. The
  following code, for example, defines a method that returns the sum of its arguments:

                def sum x,y
                        x + y
                end

- Required Parantheses

  Some code is ambiguous if the parentheses are omitted, and here Ruby requires that
  you include them. The most common case is nested method invocations of the form
  f g x, y. In Ruby, invocations of that form mean f(g(x,y)). Ruby 1.8 issues a warning,
  however, because the code could also be interpreted as f(g(x),y). The warning has
  been removed in Ruby 1.9. The following code, using the sum method defined above,
  prints 4, but issues a warning in Ruby 1.8:

                puts sum 2, 2

  To remove the warning, rewrite the code with parentheses around the arguments:

                puts sum(2,2)

  Note that using parentheses around the outer method invocation does not resolve the
  ambiguity:

                puts(sum 2,2)                    # Does this mean puts(sum(2,2)) or puts(sum(2), 2)?

  An expression involving nested function calls is only ambiguous when there is more
  than one argument. The Ruby interpreter can only interpret the following code in one
  way:

                puts factorial x                 # This can only mean puts(factorial(x))

  Despite the lack of ambiguity here, Ruby 1.8 still issues a warning if you omit the
  parentheses around the x.

  Sometimes omitting parentheses is a true syntax error rather than a simple warning.
  The following expressions, for example, are completely ambiguous without parenthe-
  ses, and Ruby doesn’t even attempt to guess what you mean:


                puts 4, sum 2,2
                [sum 2,2]

  There is another wrinkle that arises from the fact that parentheses are optional. When
  you do use parentheses in a method invocation, the opening parenthesis must imme-
  diately follow the method name, with no intervening space. This is because parentheses
  do double-duty: they can be used around an argument list in a method invocation, and
  they can be used for grouping expressions. Consider the following two expressions,
  which differ only by a single space:

                square(2+2)*2            # square(4)*2 = 16*2 = 32
                square (2+2)*2           # square(4*2) = square(8) = 64

  In the first expression, the parentheses represent method invocation. In the second,
  they represent expression grouping. To reduce the potential for confusion, you should
  always use parentheses around a method invocation if any of the arguments use
  parentheses. The second expression would be written more clearly as:

                square((2+2)*2)

  We’ll end this discussion of parentheses with one final twist. Recall that the following
  expression is ambiguous and causes a warning:

                puts(sum 2,2)            # Does this mean puts(sum(2,2)) or puts(sum(2), 2)?

  The best way to resolve this ambiguity is to put parentheses around the arguments to
  the sum method. Another way is to add a space between puts and the opening
  parenthesis:

                puts (sum 2,2)

  Adding the space converts the method invocation parentheses into expression grouping
  parentheses. Because these parentheses group a subexpression, the comma can no
  longer be interpreted as an argument delimiter for the puts invocation.


- Method Arguments

  Simple method declarations include a comma-separated list of argument names (in
  optional parentheses) after the method name. But there is much more to Ruby’s method
  arguments. The subsections that follow explain:

  - How to declare an argument that has a default value, so that the argument can be
        omitted when the method is invoked

  - How to declare a method that accepts any number of arguments

  - How to simulate named method arguments with special syntax for passing a hash
        to a method

  - How to declare a method so that the block associated with an invocation of the
        method is treated as a method argument


- Parameter Defaults

  When you define a method, you can specify default values for some or all of the
  parameters. If you do this, then your method may be invoked with fewer argument
  values than the declared number of parameters. If arguments are omitted, then the
  default value of the parameter is used in its place. Specify a default value by following
  the parameter name with an equals sign and a value:

                def prefix(s, len=1)
                        s[0,len]
                end

  This method declares two parameters, but the second one has a default. This means
  that we can invoke it with either one argument or two:

                prefix("Ruby", 3)
                prefix("Ruby")

  Argument defaults need not be constants: they may be arbitrary expressions, and can
  be referred to instance variables and to previous parameters in the parameter list. For
  example:

                # Return the last character of s or the substring from index to the end
                def suffix(s, index=s.size-1)
                        s[index, s.size-index]
                end

  Parameter defaults are evaluated when a method is invoked rather than when it is
  parsed. In the following method, the default value [] produces a new empty array on
  each invocation, rather than reusing a single array created when the method is defined:

                # Append the value x to the array a, return a.
                # If no array is specified, start with an empty one.
                def append(x, a=[])
                        a << x
                end

  In Ruby 1.8, method parameters with default values must appear after all ordinary
  parameters in the parameter list. Ruby 1.9 relaxes this restriction and allows ordinary
  parameters to appear after parameters with defaults. It still requires all parameters with
  defaults to be adjacent in the parameter list—you can’t declare two parameters with
  default values with an ordinary parameter between them, for example. When a method
  has more than one parameter with a default value, and you invoke the method with an
  argument for some, but not all, of these parameters, they are filled in from left to right.
  Suppose a method has two parameters, and both of those parameters have defaults.
  You can invoke this method with zero, one, or two arguments. If you specify one ar-
  gument, it is assigned to the first parameter and the second parameter uses its default
  value. There is no way, however, to specify a value for the second parameter and use
  the default value of the first parameter.

- Variable-Length Argument Lists ans Arrays

  Sometimes we want to write methods that can accept an arbitrary number of argu-
  ments. To do this, we put an * before one of the method’s parameters. Within the body
  of the method, this parameter will refer to an array that contains the zero or more
  arguments passed at that position. For example:


                # Return the largest of the one or more arguments passed
                def max(first, *rest)
                        # Assume that the required first argument is the largest
                        max = first
                        # Now loop through each of the optional arguments looking for bigger ones
                        rest.each {|x| max = x if x > max }
                        # Return the largest one we found
                        max
                end

  The max method requires at least one argument, but it may accept any number of ad-
  ditional arguments. The first argument is available through the first parameter. Any
  additional arguments are stored in the rest array. We can invoke max like this:


                max(1)                   # first=1, rest=[]
                max(1,2)                 # first=1, rest=[2]
                max(1,2,3)               # first=1, rest=[2,3]

  Note that in Ruby, all Enumerable objects automatically have a max method, so the
  method defined here is not particularly useful.


  No more than one parameter may be prefixed with an *. In Ruby 1.8, this parameter
  must appear after all ordinary parameters and after all parameters with defaults speci-
  fied. It should be the last parameter of the method, unless the method also has a
  parameter with an & prefix (see below). In Ruby 1.9, a parameter with an * prefix must
  still appear after any parameters with defaults specified, but it may be followed by
  additional ordinary parameters. It must also still appear before any &-prefixed
  parameter.


- Passing arrays to methods

  We’ve seen how * can be used in a method declaration to cause multiple arguments to
  be gathered or coalesced into a single array. It can also be used in a method invocation
  to scatter, expand, or explode the elements of an array (or range or enumerator) so that
  each element becomes a separate method argument. The * is sometimes called the splat
  operator, although it is not a true operator. We’ve seen it used before in the discussion
  of parallel assignment in §4.5.5.


  Suppose we wanted to find the maximum value in an array (and that we didn’t know
  that Ruby arrays have a built-in max method!). We could pass the elements of the array
  to the max method (defined earlier) like this:


                        data = [3, 2, 1]
                        m = max(*data)                   # first = 3, rest=[2,1] => 3

  Consider what happens without the *:

                        m = max(data)                    # first = [3,2,1], rest=[] => [3,2,1]

  In this case, we’re passing an array as the first and only argument, and our max method
  returns that first argument without performing any comparisons on it.

  The * can also be used with methods that return arrays to expand those arrays for use
  in another method invocation. Consider the polar and cartesian methods defined
  earlier in this chapter:


                # Convert the point (x,y) to Polar coordinates, then back to Cartesian
                x,y = cartesian(*polar(x, y))

##########################################################################################
  In Ruby 1.9, enumerators are splattable objects. To find the largest letter in a string,
  for example, we could write:

                max(*"hello world".each_char)                    # => 'w'
##########################################################################################

- Mapping Arguments to Parameters

  When a method definition includes parameters with default values or a parameter pre-
  fixed with an *, the assignment of argument values to parameters during method
  invocation gets a little bit tricky.

  In Ruby 1.8, the position of the special parameters is restricted so that argument values
  are assigned to parameters from left to right. The first arguments are assigned to the
  ordinary parameters. If there are any remaining arguments, they are assigned to the
  parameters that have defaults. And if there are still more arguments, they are assigned
  to the array argument.

  Ruby 1.9 has to be more clever about the way it maps arguments to parameters because
  the order of the parameters is no longer constrained. Suppose we have a method that
  is declared with o ordinary parameters, d parameters with default values, and one array
  parameter prefixed with *. Now assume that we invoke this method with a arguments.


  If a is less than o, an ArgumentError is raised; we have not supplied the minimum
  required number of arguments.

  If a is greater than or equal to o and less than or equal to o+d, then the leftmost a–o
  parameters with defaults will have arguments assigned to them. The remaining (to the
  right) o+d–a parameters with defaults will not have arguments assigned to them, and
  will just use their default values.

  If a is greater than o+d, then the array parameter whose name is prefixed with an * will
  have a–o–d arguments stored in it; otherwise, it will be empty.

  Once these calculations are performed, the arguments are mapped to parameters from
  left to right, assigning the appropriate number of arguments to each parameter.


- Hashes for Names Arguments

  When a method requires more than two or three arguments, it can be difficult for the
  programmer invoking the method to remember the proper order for those arguments.
  Some languages allow you to write method invocations that explicitly specify a pa-
  rameter name for each argument that is passed. Ruby does not support this method
  invocation syntax, but it can be approximated if you write a method that expects a hash
  as its argument or as one of its arguments:


                # This method returns an array a of n numbers. For any index i, 0 <= i < n,
                # the value of element a[i] is m*i+c. Arguments n, m, and c are passed
                # as keys in a hash, so that it is not necessary to remember their order

                def sequence(args)

                        # Extract the arguments from the hash.
                        # Note the use of the || operator to specify defaults used
                        # if the hash does not define a key that we are interested in.

                        n = args[:n] || 0
                        m = args[:m] || 1
                        c = args[:c] || 0
                        a = []
                        n.times {|i| a << m*i+c }
                        a
                end

  You might invoke this method with a hash literal argument like this:

                sequence({:n=>3, :m=>5})                         # => [0, 5, 10]

  In order to better support this style of programming, Ruby allows you to omit the curly
  braces around the hash literal if it is the last argument to the method (or if the only
  argument that follows it is a block argument, prefixed with &). A hash without braces
  is sometimes called a bare hash, and when we use one it looks like we are passing
  separate named arguments, which we can reorder however we like:


                sequence(:m=>3, :n=>5)

  As with other ruby methods, we can omit the parentheses, too:

                sequence c:1, m:3, n:5

  If you omit the parentheses, then you must omit the curly braces. If curly braces follow
  the method name outside of parentheses, Ruby thinks you’re passing a block to the
  method:

                sequence {:m=>3, :n=>5}                          # Syntax error!

- Block Arguments

  Recall from §5.3 that a block is a chunk of Ruby code associated with a method invo-
  cation, and that an iterator is a method that expects a block. Any method invocation
  may be followed by a block, and any method that has a block associated with it may
  invoke the code in that block with the yield statement.

        def sequence2(n, m, c)
                i = 0
                while(i < n)                     # loop n times
                        yield i*m + c            # pass next element of the sequence to the block
                        i += 1
                end
        end

        sequence2(5, 2, 2) {|x| puts x }                # Print numbers 2, 4, 6, 8, 10

  One of the features of blocks is their anonymity. They are not passed to the method in
  a traditional sense, they have no name, and they are invoked with a keyword rather
  than with a method.


  If you prefer more explicit control over a block (so that you can
  pass it on to some other method, for example), add a final argument to your method,
  and prefix the argument name with an ampersand.
  If you do this, then that argument
  will refer to the block—if any—that is passed to the method. The value of the argument
  will be a Proc object, and instead of using yield, you invoke the call method of the Proc:


                        def sequence3(n, m, c, &b)                      # Explicit argument to get block as a Proc
                                i = 0

                                while(i < n)
                                        b.call(i*m + c)                         # Invoke the Proc with its call method
                                        i += 1
                                end
                        end

                        # Note that the block is still passed outside of the parentheses
                        sequence3(5, 2, 2) {|x| puts x }

##########################################################################################
  Notice that using the ampersand in this way changes only the method definition. The
  method invocation remains the same. We end up with the block argument being
  declared inside the parentheses of the method definition, but the block itself is still
  specified outside the parentheses of the method invocation.
##########################################################################################



  ------- Passing Proc Objects explicitly -------------

                        # This version expects an explicitly-created Proc object, not a block
                        def sequence4(n, m, c, b)                                                        # No ampersand used for argument b
                                i = 0
                                while(i < n)
                                        b.call(i*m + c)                                                          # Proc is called explicitly
                                        i += 1
                                end
                        end

                        p = Proc.new {|x| puts x }                                                       # Explicitly create a Proc object

                        sequence4(5, 2, 2, p)                                                            # And pass it as an ordinary argument

---------------------------------------------------------------------


  Twice before in this chapter, we’ve said that a special kind of parameter must be the
  last one in the parameter list. Block arguments prefixed with ampersands must really
  be the last one. Because blocks are passed unusually in method invocations, named
  block arguments are different and do not interfere with array or hash parameters in
  which the brackets and braces have been omitted.


            def sequence5(args, &b)                          # Pass arguments as a hash and follow with a block
                    n, m, c = args[:n], args[:m], args[:c]
                    i = 0
                    while(i < n)
                            b.call(i*m + c)
                            i += 1
                    end
            end

            # Expects one or more arguments, followed by a block
            def max(first, *rest, &block)
                    max = first
                    rest.each {|x| max = x if x > max }
                    block.call(max)
                    max
            end

  These methods work fine, but notice that you can avoid the complexity of these cases
  by simply leaving your blocks anonymous and calling them with yield.

  It is also worth noting that the yield statement still works in a method defined with an
  & parameter. Even if the block has been converted to a Proc object and passed as an
  argument, it can still be invoked as an anonymous block, as if the block argument was
  not there.


- Using the & in method invocation

  We’ve just seen that & in
  a method definition allows an ordinary block associated with a method invocation to
  be used as a named Proc object inside the method. When & is used before a Proc object
  in a method invocation, it treats the Proc as if it was an ordinary block following the
  invocation.


  Consider the following code which sums the contents of two arrays:

                a, b = [1,2,3], [4,5]
                sum = a.inject(0) {|total,x| total+x }
                sum = b.inject(sum) {|total,x| total+x }

  We described the inject iterator earlier in §5.3.2. If you don’t remember, you can look
  up its documentation with ri Enumerable.inject. The important thing to notice about
  this example is that the two blocks are identical. Rather than having the Ruby inter-
  preter parse the same block twice, we can create a Proc to represent the block, and use
  the single Proc object twice:

                a, b = [1,2,3], [4,5]                                                            # Start with some data.
                summation = Proc.new {|total,x| total+x }                        # A Proc object for summations.
                sum = a.inject(0, &summation)                                            # => 6
                sum = b.inject(sum, &summation)                                          # => 15

  If you use & in a method invocation, it must appear before the last argument in the
  invocation. Blocks can be associated with any method call, even when the method is
  not expecting a block, and never uses yield. In the same way, any method invocation
  may have an & argument as its last argument.


  In a method invocation an & typically appears before a Proc object. But it is actually
  allowed before any object with a to_proc method. The Method class (covered later in
  this chapter) has such a method, so Method objects can be passed to iterators just as
  Proc objects can.


  In Ruby 1.9, the Symbol class defines a to_proc method, allowing symbols to be prefixed
  with & and passed to iterators. When a symbol is passed like this, it is assumed to be
  the name of a method. The Proc object returned by the to_proc method invokes the
  named method of its first argument, passing any remaining arguments to that named
  method. The canonical case is this: given an array of strings, create a new array of those
  strings, converted to uppercase. Symbol.to_proc allows us to accomplish this elegantly
  as follows:


                        words = ['and', 'but', 'car']                    # An array of words
                        uppercase = words.map &:upcase                   # Convert to uppercase with String.upcase
                        upper = words.map {|w| w.upcase }                # This is the equivalent code with a block

- Procs and Lambdas

  Blocks are syntactic structures in Ruby; they are not objects, and cannot be manipulated
  as objects. It is possible, however, to create an object that represents a block. Depending
  on how the object is created, it is called a proc or a lambda. Procs have block-like
  behavior and lambdas have method-like behavior. Both, however, are instances of class
  Proc.


- Creating Procs

  We’ve already seen one way to create a Proc object: by associating a block with a method
  that is defined with an ampersand-prefixed block argument. There is nothing prevent-
  ing such a method from returning the Proc object for use outside the method:

                        # This method creates a proc from a block
                        def makeproc(&p) # Convert associated block to a Proc and store in p
                                p                        # Return the Proc object
                        end

  With a makeproc method like this defined, we can create a Proc object for ourselves:

                        adder = makeproc {|x,y| x+y }

  The variable adder now refers to a Proc object. Proc objects created in this way are procs,
  not lambdas. All Proc objects have a call method that, when invoked, runs the code
  contained by the block from which the proc was created.

                        sum = adder.call(2,2)

  In addition to being invoked, Proc objects can be passed to methods, stored in data
  structures and otherwise manipulated like any other Ruby object.

  As well as creating procs by method invocation, there are three methods that create
  Proc objects (both procs and lambdas) in Ruby. These methods are commonly used,
  and it is not actually necessary to define a makeproc method like the one shown earlier.
  In addition to these Proc-creation methods, Ruby 1.9 also supports a new literal syntax
  for defining lambdas. The subsections that follow discuss the methods Proc.new,
  lambda, and proc, and also explain the Ruby 1.9 lambda literal syntax.


- Proc.new

  This is the normal new method that most classes support, and it’s the most obvious way
  to create a new instance of the Proc class. Proc.new expects no arguments, and returns
  a Proc object that is a proc (not a lambda). When you invoke Proc.new with an associated
  block, it returns a proc that represents the block.

                p = Proc.new {|x,y| x + y }
##############################################################################################
  If Proc.new is invoked without a block from within a method that does have an asso-
  ciated block, then it returns a proc representing the block associated with the containing
  method. Using Proc.new in this way provides an alternative to using an ampersand-
  prefixed block argument in a method definition. The following two methods are
  equivalent, for example:

                def invoke(&b)
                        b.call
                end


                def invoke
                        Proc.new.call
                end
##############################################################################################

- Kernel.lambda

  Another technique for creating Proc objects is with the lambda method. lambda is a
  method of the Kernel module, so it behaves like a global function. As its name suggests,
  the Proc object returned by this method is a lambda rather than a proc. lambda expects
  no arguments, but there must be a block associated with the invocation:

                        is_positive = lambda {|x| x > 0 }

- Kernel.proc

  In Ruby 1.8, the global proc method is a synonym for lambda. Despite its name, it returns
  a lambda, not a proc. Ruby 1.9 fixes this; in that version of the language, proc is a
  synonym for Proc.new.

  Because of this ambiguity, you should never use proc in Ruby 1.8 code. The behavior
  of your code might change if the interpreter was upgraded to a newer version. If you
  are using Ruby 1.9 code and are confident that it will never be run with a Ruby 1.8
  interpreter, you can safely use proc as a more elegant shorthand for Proc.new.

- Lambda Literals

  Ruby 1.9 supports an entirely new syntax for defining lambdas as literals. We’ll begin
  with a Ruby 1.8 lambda, created with the lambda method:

                succ = lambda { |x| x + 1}

  In Ruby 1.9, we can convert this to a literal as follows:

        Replace the method name 'lambda' with the punctuation '->'
        Move the list of arguments outside of and just before the curly braces
        Change the argument list delimiters from || to ()

                succ = ->(x) { x + 1}

        succ now holds a Proc object, which we can use just like any other:

                succ.call(2)            # => 3

    The introduction of this syntax into Ruby was controversial, and it takes some getting
        used to. Note that the arrow characters -> are different from those used in hash literals.
        A lambda literal uses an arrow made with a hyphen, whereas a hash literal uses an arrow
        made with an equals sign.


        As with blocks in Ruby 1.9, the argument list of a lambda literal may include the dec-
        laration of block-local variables that are guaranteed not to overwrite variables with the
        same name in the enclosing scope. Simply follow the parameter list with a semicolon
        and a list of local variables:

                        f = ->(x,y; i,j,k) { ... }

        One benefit of this new lambda syntax over the traditional block-based lambda creation
        methods is that the Ruby 1.9 syntax allows lambdas to be declared with argument
        defaults, just as methods can be:

                        zoom = ->(x,y,factor=2) { [x*factor, y*factor] }

    As with method declarations, the parentheses in lambda literals are optional, because
        the parameter list and local variable lists are completely delimited by the ->, ;, and {.
        We could rewrite the three lambdas above like this:

                        succ = ->x { x+1 }
                        f = -> x,y; i,j,k { ... }
                        zoom = ->x,y,factor=2 { [x*factor, y*factor] }

    Lambda parameters and local variables are optional, of course, and a lambda literal can
        omit this altogether. The minimal lambda, which takes no arguments and returns
        nil, is the following:

                        ->{}

    One benefit of this new syntax is its succinctness. It can be helpful when you want to
        pass a lambda as an argument to a method or to another lambda:

                        def compose(f,g)                         # Compose 2 lambdas
                        ->(x) { f.call(g.call(x)) }
                        end
                        succOfSquare = compose(->x{x+1}, ->x{x*x})
                        succOfSquare.call(4)             # => 17: Computes (4*4)+1

  Lambda literals create Proc objects and are not the same thing as blocks. If you want
  to pass a lambda literal to a method that expects a block, prefix the literal with &, just
  as you would with any other Proc object. Here is how we might sort an array of numbers
  into descending order using both a block and a lambda literal:

                        data.sort {|a,b| b-a }           # The block version
                        data.sort &->(a,b){ b-a }        # The lambda literal version

- Invoking Procs and Lambdas

  Procs and lambdas are objects, not methods, and they cannot be invoked in the same
  way that methods are. If p refers to a Proc object, you cannot invoke p as a method. But
  because p is an object, you can invoke a method of p. We’ve already mentioned that
  the Proc class defines a method named call. Invoking this method executes the code
  in the original block. The arguments you pass to the call method become arguments
  to the block, and the return value of the block becomes the return value of the call
  method:

                f = Proc.new {|x,y| 1.0/(1.0/x + 1.0/y) }
                z = f.call(x,y)

  The Proc class also defines the array access operator to work the same way as call. This
  means that you can invoke a proc or lambda using a syntax that is like method
  invocation, where parentheses have been replaced with square brackets. The proc
  invocation above, for example, could be replaced with this code:

                        z = f[x,y]

   Ruby 1.9 offers an additional way to invoke a Proc object; as an alternative to square
   brackets, you can use parentheses prefixed with a period:

                        z = f.(x,y)

   .() looks like a method invocation missing the method name. This is not an operator
   that can be defined, but rather is syntactic-sugar that invokes the call method. It can
   be used with any object that defines a call method and is not limited to Proc objects.



- The Arity of a Proc

  The arity of a proc or lambda is the number of arguments it expects. (The word is
  derived from the “ary” suffix of unary, binary, ternary, etc.) Proc objects have an
  arity method that returns the number of arguments they expect.

                        lambda{||}.arity                         # => 0. No arguments expected
                        lambda{|x| x}.arity                      # => 1. One argument expected
                        lambda{|x,y| x+y}.arity          # => 2. Two arguments expected

  The notion of arity gets confusing when a Proc accepts an arbitrary number of argu-
  ments in an *-prefixed final argument. When a Proc allows optional arguments, the
  arity method returns a negative number of the form -n-1. A return value of this form
  indicates that the Proc requires n arguments, but it may optionally take additional ar-
  guments as well. -n-1 is known as the one’s-complement of n, and you can invert it
  with the ~ operator. So if arity returns a negative number m, then ~m (or -m-1) gives you
  the number of required arguments:

        lambda {|*args|}.arity           # => -1.  ~-1 = -(-1)-1 = 0 arguments required
        lambda {|first, *rest|}.arity    # => -2.  ~-2 = -(-2)-1 = 1 argument required

  There is one final wrinkle to the arity method. In Ruby 1.8, a Proc declared without
  any argument clause at all (that is, without any || characters) may be invoked with any
  number of arguments (and these arguments are ignored). The arity method returns
  –1 to indicate that there are no required arguments. This has changed in Ruby 1.9: a
  Proc declared like this has an arity of 0. If it is a lambda, then it is an error to invoke it
  with any arguments:

                        puts lambda {}.arity                     # –1 in Ruby 1.8; 0 in Ruby 1.9

- Proc Equality

  The Proc class defines an == method to determine whether two Proc objects are equal.
  It is important to understand, however, that merely having the same source code is not
  enough to make two procs or lambdas equal to each other:

                lambda {|x| x*x } == lambda {|x| x*x }           # => false

  The == method only returns true if one Proc is a clone or duplicate of the other:

                p = lambda {|x| x*x }
                q = p.dup
                p == q                                           # => true: the two procs are equal
                p.object_id == q.object_id       # => false: they are not the same object


- How Lambdas Differ from Procs

  A proc is the object form of a block, and it behaves like a block. A lambda has slightly
  modified behavior and behaves more like a method than a block. Calling a proc is like
  yielding to a block, whereas calling a lambda is like invoking a method. In Ruby 1.9,
  you can determine whether a Proc object is a proc or a lambda with the instance method
  lambda?. This predicate returns true for lambdas and false for procs. The subsections
  that follow explain the differences between procs and lambdas in detail.

- Return in blocks, procs, and lambdas

  Recall from Chapter 5 that the return statement returns from the lexically enclosing
  method, even when the statement is contained within a block. The return statement
  in a block does not just return from the block to the invoking iterator, it returns from
  the method that invoked the iterator.

  A proc is like a block, so if you call a proc that executes a return statement, it attempts
  to return from the method that encloses the block that was converted to the proc.

                        def test
                        puts "entering method"
                        p = Proc.new { puts "entering proc"; return }
                        p.call                   # Invoking the proc makes method return
                        puts "exiting method"    # This line is never executed
                        end

  Using a return statement in a proc is tricky, however, because procs are often passed
  around between methods. By the time a proc is invoked, the lexically enclosing method
  may already have returned:

                        def procBuilder(message)                                 # Create and return a proc
                                Proc.new { puts message; return }        # return returns from procBuilder
                                # but procBuilder has already returned here!
                        end

                        def test
                                puts "entering method"
                                p = procBuilder("entering proc")
                                p.call                                   # Prints "entering proc" and raises LocalJumpError!
                                puts "exiting method"    # This line is never executed
                        end

                        test

  By converting a block into an object, we are able to pass that object around and use it
  “out of context.” If we do this, we run the risk of returning from a method that has
  already returned, as was the case here. When this happens, Ruby raises a
  LocalJumpError.

  The fix for this contrived example is to remove the unnecessary return statement, of
  course. But a return statement is not always unnecessary, and another fix is to use a
  lambda instead of a proc. As we said earlier, lambdas work more like methods than
  blocks. A return statement in a lambda, therefore, returns from the lambda itself, not
  from the method that surrounds the creation site of the lambda:

                def test
                        puts "entering method"
                        p = lambda { puts "entering lambda"; return }
                        p.call                                           # Invoking the lambda does not make the method return
                        puts "exiting method"            # This line *is* executed now
                end
                test

  The fact that return in a lambda only returns from the lambda itself means that we
  never have to worry about LocalJumpError:

                def lambdaBuilder(message)                       # Create and return a lambda
                        lambda { puts message; return }  # return returns from the lambda
                end

                def test
                        puts "entering method"
                        l = lambdaBuilder("entering lambda")
                        l.call                                                   # Prints "entering lambda"
                        puts "exiting method"                    # This line is executed
                end
                test

- Break in blocks, procs and lambdas

  Figure 5-3 illustrated the behavior of the break statement in a block; it causes the block
  to return to its iterator and the iterator to return to the method that invoked it. Because
  procs work like blocks, we expect break to do the same thing in a proc.


  We can’t easily
  test this, however. When we create a proc with Proc.new, Proc.new is the iterator that
  break would return from.

  And by the time we can invoke the proc object, the iterator
  has already returned. So it never makes sense to have a top-level break statement in a
  proc created with Proc.new:


                        def test
                                puts "entering test method"
                                proc = Proc.new { puts "entering proc"; break }
                                proc.call                                        # LocalJumpError: iterator has already returned
                                puts "exiting test method"
                        end
                        test

  If we create a proc object with an & argument to the iterator method, then we
  can invoke it and make the iterator return:

                        def iterator(&proc)
                                puts "entering iterator"
                                proc.call                                        # invoke the proc
                                puts "exiting iterator"          # Never executed if the proc breaks
                        end

                        def test
                                iterator { puts "entering proc"; break }
                        end
                        test

  Lambdas are method-like, so putting a break statement at the top-level of a
  lambda, without an enclosing loop or iteration to break out of, doesn’t
  actually make any sense!  We might expect the following code to fail because
  there is nothing to break out of in the lambda. In fact, the top-level break
  just acts like a return:

                def test
                        puts "entering test method"
                        lambda = lambda { puts "entering lambda"; break; puts "exiting lambda" }
                        lambda.call
                        puts "exiting test method"
                end
                test

                entering test method
                entering lambda
                exiting test method

- Other control-flow statements

  A top-level next statement works the same in a block, proc, or lambda: it
  causes the yield statement or call method that invoked the block, proc, or
  lambda to return. If next is followed by an expression, then the value of that
  expression becomes the return value of the block, proc, or lambda.


  redo also works the same in procs and lambdas: it transfers control back to
  the begin- ning of the proc or lambda.

  retry is never allowed in procs or lambdas: using it always results in a
  LocalJumpError.

  raise behaves the same in blocks, procs, and lambdas. Exceptions always
  propagate up the call stack. If a block, proc, or lambda raises an exception
  and there is no local rescue clause, the exception first propagates to the
  method that invoked the block with yield or that invoked the proc or lambda
  with call.



- Argument passing to procs and lambdas

  Invoking a block with yield is similar to, but not the same as, invoking a
  method. There are differences in the way argument values in the invocation are
  assigned to the argu- ment variables declared in the block or method. The
  yield statement uses yield semantics, whereas method invocation uses
  invocation semantics. Yield semantics are similar to parallel assignment and
  are described in §5.4.4. As you might expect, invoking a proc uses yield
  semantics and invoking a lambda uses invocation semantics:


                p = Proc.new {|x,y| print x,y }
                p.call(1)               # x,y = 1               prints 1nil
                p.call(1,2)             # x,y = 1,2             prints 12
                p.call(1,2,3)   # x,y=1,2,3             prints 12
                p.call([1,2])   # x,y=[1,2]             prints 12

  This code demonstrates that the call method of a proc handles the arguments it
  receives flexibly: silently discarding extras, silently adding nil for omitted
  arguments, and even unpacking arrays. (Or, not demonstrated here, packing
  multiple arguments into a single array when the proc expects only a single
  argument.)


  Lambdas are not flexible in this way; like methods, they must be invoked with
  precisely the number of arguments they are declared with:


                l = lambda { |x,y| print x,y }
                l.call(1,2)             # works
                l.call(1)               # wrong number of arguments
                l.call(1,2,3)   # ^^
                l.call([1,2]    # ^^
                l.call(*[1,2])  # works


- Closures

  In Ruby, procs and lambdas are closures. The term “closure” comes from the
  early days of computer science; it refers to an object that is both an
  invocable function and a variable binding for that function. When you create a
  proc or a lambda, the resulting Proc object holds not just the executable
  block but also bindings for all the variables used by the block.


  You already know that blocks can use local variables and method arguments that
  are defined outside the block. In the following code, for example, the block
  associated with the collect iterator uses the method argument n:


                # multiply each element of the data array by n
                def multiply(data, n)
                        data.collect {|x| x*n }
                end
                puts multiply([1,2,3], 2)                        # Prints 2,4,6

  What is more interesting, and possibly even surprising, is that if the block
  were turned into a proc or lambda, it could access n even after the method to
  which it is an argument had returned. The following code demonstrates:

                # Return a lambda that retains or "closes over" the argument n
                def multiplier(n)
                        lambda {|data| data.collect{|x| x*n } }
                end
                doubler = multiplier(2)                  # Get a lambda that knows how to double
                puts doubler.call([1,2,3])               # Prints 2,4,6

  The multiplier method returns a lambda. Because this lambda is used outside of
  the scope in which it is defined, we call it a closure; it encapsulates or
  “closes over” (or just retains) the binding for the method argument n.

- Closures and Shared Variables

  It is important to understand that a closure does not just retain the value of
  the variables it refers to—it retains the actual variables and extends their
  lifetime.  Another way to say this is that the variables used in a lambda or
  proc are not statically bound when the lambda or proc is created. Instead, the
  bindings are dynamic, and the values of the variables are looked up when the
  lambda or proc is executed.

  As an example, the following code defines a method that returns two lambdas.
  Because the lambdas are defined in the same scope, they share access to the
  variables in that scope. When one lambda alters the value of a shared
  variable, the new value is available to the other lambda:

    # Return a pair of lambdas that share access to a local variable.
    def accessor_pair(initialValue=nil)
    value = initialValue            # A local variable shared by the returned lambdas.
    getter = lambda { value }       # Return value of local variable.
    setter = lambda {|x| value = x } # Change value of local variable.
    return getter,setter            # Return pair of lambdas to caller.
    end
    getX, setX = accessor_pair(0)   # Create accessor lambdas for initial value 0.
    puts getX[]         # Prints 0. Note square brackets instead of call.
    setX[10]            # Change the value through one closure.
    puts getX[]         # Prints 10. The change is visible through the other.

  The fact that lambdas created in the same scope share access to variables can
  be a feature or a source of bugs. Any time you have a method that returns more
  than one closure, you should pay particular attention to the variables they
  use. Consider the following code:

    # Return an array of lambdas that multiply by the arguments
    def multipliers(*args)
        x = nil
        args.map {|x| lambda {|y| x*y  } }
    end

    double,triple = multipliers(2,3)
    puts double.call(2)          # Prints 6 in Ruby 1.8

    # ... because the secong lambda updates x to 3

    This multipliers method uses the map iterator and a block to return an array
    of lambdas (created inside the block ). In Ruby 1.8, block arguments are not
    always local to the block (see §5.4.3 ), and so all of the lambdas that are
    created end up sharing access to x, which is a local variable of the
    multipliers method. As noted above, closures don't capture the current value
    of the variable: they capture the variable itself.  Each of the lambdas
    created here share the variable x. That variable has only one value, and all
    of the returned lambdas use that same value. That is why the lambda we name
    double ends up tripling its argument instead of doubling it.

  In this particular code, the issue goes away in Ruby 1.9 because block
  arguments are always block-local in that version of the language. Still, you
  can get yourself in trouble any time you create lambdas within a loop and use
  a loop variables (such as an array index) within the lambda.


- Closures and Bindings

  The Proc class defines a method named binding. Calling this method on a proc
  or lambda returns a Binding object that represents the bindings in effect for
  that closure.


  *** More about Bindings

  We’ve been discussing the bindings of a closure as if they were simply a
  mapping from variable names to variable values. In fact, bindings involve more
  than just variables.  They hold all the information necessary to execute a
  method, such as the value of self, and the block, if any, that would be
  invoked by a yield.

  *** ***

  A Binding object doesn’t have interesting methods of its own, but it can be
  used as the second argument to the global eval function (see §8.2 ), providing
  a context in which to evaluate a string of Ruby code. In Ruby 1.9, Binding has
  its own eval method, which you may prefer to use. (Use ri to learn more about
  Kernel.eval and Binding.eval. )

  The use of a Binding object and the eval method gives us a back door through
  which we can manipulate the behavior of a closure. Take another look at this
  code from earlier:

    # Return a lambda that retains or "closes over" the argument n
    def multiplier(n)
        lambda {|data| data.collect{|x| x*n  }  }
    end

    doubler = multiplier(2)

    # Get a lambda that knows how to double
    puts doubler.call([1,2,3])      # Prints 2,4,6

  Now suppose we want to alter the behavior of doubler:

    eval("n=3", doubler.binding) # Or doubler.binding.eval("n=3") in Ruby 1.9
    puts doubler.call([1,2,3])   # Now this prints 3,6,9!

  As a shortcut, the eval method allows you to pass a Proc object directly
  instead of passing the Binding object of the Proc. So we could replace the
  eval invocation above with:

    eval("n=3", doubler)

  Bindings are not only a feature of closures. The Kernel.binding method returns
  a Binding object that represents the bindings in effect at whatever point you
  happen to call it.



- Method Objects

  Ruby’s methods and blocks are executable language constructs, but they are not
  objects. Procs and lambdas are object versions of blocks; they can be
  executed and also manipulated as data.

  Ruby has powerful metaprogramming (or reflection ) capabilities, and methods
  can actually be represented as instances of the Method class.  (Metaprog-
  ramming is covered in Chapter 8, but Method objects are introduced here.) You
  should note that invoking a method through a Method object is less efficient
  than invoking it directly. Method objects are not typically used as often as
  lambdas and procs.

  The Object class defines a method named method. Pass it a method name, as a
  string or a symbol, and it returns a Method object representing the named
  method of the receiver (or throws a NameError if there is no such method ).
  For example:


        m = 0.method(:succ) # A Method representing the succ method of Fixnum 0

  In Ruby 1.9, you can also use public_method to obtain a Method object. It
  works like method does but ignores protected and private methods

  The Method class is not a subclass of Proc, but it behaves much like it.
  Method objects are invoked with the call method (or the [] operator ), just as
  Proc objects are. And Method defines an arity method just like the arity
  method of Proc. To invoke the Method m:

        puts m.call # Same as puts 0.succ. Or use puts m[].

  Invoking a method through a Method object does not change the invocation
  semantics, nor does it alter the meaning of control-flow statements such as
  return and break. The call method of a Method object uses method-invocation
  semantics, not yield semantics.  Method objects, therefore, behave more like
  lambdas than like procs.

  Method objects work very much like Proc objects and can usually be used in
  place of them. When a true Proc is required, you can use Method.to_proc to
  convert a Method to a Proc. This is why Method objects can be prefixed with an
  ampersand and passed to a method in place of a block. For example:

        def square(x); x*x; end
        puts (1..10).map(&method(:square))


  *** Defining Methods with Procs

  In addition to obtaining a Method object that represents a method and
  converting it to a Proc, we can also go in the other direction. The
  define_method method (of Module ) expects a Symbol as an argument, and creates
  a method with that name using the asso- ciated block as the method body.
  Instead of using a block, you can also pass a Proc or a Method object as the
  second argument.
  *** ***

  One important difference between Method objects and Proc objects is that
  Method objects are not closures. Ruby’s methods are intended to be completely
  self-contained, and they never have access to local variables outside of their
  own scope. The only binding retained by a Method object, therefore, is the
  value of self—the object on which the method is to be invoked.

  In Ruby 1.9, the Method class defines three methods that are not available in
  1.8: name returns the name of the method as a string; owner returns the class
  in which the method was defined; and receiver returns the object to which the
  method is bound. For any method object m, m.receiver.class must be equal to or
  a subclass of m.owner.


- Unbound Method Objects

  In addition to the Method class, Ruby also defines an UnboundMethod class. As
  its name suggests, an UnboundMethod object represents a method, without a
  binding to the object on which it is to be invoked. Because an UnboundMethod
  is unbound, it cannot be invoked, and the UnboundMethod class does not define
  a call or [] method.

  To obtain an UnboundMethod object, use the instance_method method of any class
  or module:

        unbound_plus = Fixnum.instance_method("+")

  In Ruby 1.9, you can also use public_instance_method to obtain an
  UnboundMethod object. It works like instance_method does, but it ignores
  protected and private methods (see §7.2 ).

  In order to invoke an unbound method, you must first bind it to an object
  using the bind method:

        plus_2 = unbound_plus.bind(2)    # Bind the method to the object 2

  The bind method returns a Method object, which can be invoked with its call
  method:

        sum = plus_2.call(2)             # => 4

  Another way to obtain an UnboundMethod object is with the unbind method of the
  Method class:

        plus_3 = plus_2.unbind.bind(3)

  In Ruby 1.9, UnboundMethod has name and owner methods that work just as they
  do for the Method class.



- Functional Programming

  Ruby is not a functional programming language in the way that languages like
  Lisp and Haskell are, but Ruby’s blocks, procs, and lambdas lend themselves
  nicely to a func- tional programming style. Any time you use a block with an
  Enumerable iterator like map or inject, you’re programming in a functional
  style. Here are examples using the map and inject iterators:

        # Compute the average and standard deviation of an array of numbers
        mean = a.inject {|x,y| x+y  } / a.size
        sumOfSquares = a.map{|x| (x-mean)**2  }.inject{|x,y| x+y  }
        standardDeviation = Math.sqrt(sumOfSquares/(a.size-1))

  If the functional programming style is attractive to you, it is easy to add
  features to Ruby’s built-in classes to facilitate functional programming. The
  rest of this chapter explores some possibilities for working with functions.

[pg 205 - skipped ]






* Classes and Modules pg 213


  Ruby is an object-oriented language in a very pure sense: every value in Ruby
  is (or at least behaves like) an object. Every object is an instance of a
  class. A class defines a set of methods that an object responds to. Classes
  may extend or subclass other classes, and inherit or override the methods of
  their superclass. Classes can also include—or inherit methods from—modules.

  In contrast to the strict encapsulation of object state, Ruby’s classes are
  very open. Any Ruby program can add methods to existing classes, and it is
  even possible to add “singleton methods” to individual objects.


- Defining a Simple Class

  We begin our coverage of classes with an extended tutorial that develops a
  class named Point to represent a geometric point with X and Y coordinates.

- Creating a class


    class Point
    end

  Like most Ruby constructs, a class definition is delimited with an end. In
  addition to defining a new class, the class keyword creates a new constant to
  refer to the class. The class name and the constant name are the same, so all
  class names must begin with a capital letter.

  Within the body of a class, but outside of any instance methods defined by the
  class, the self keyword refers to the class being defined.

  Like most statements in Ruby, class is an expression. The value of a class
  expression is the value of the last expression within the class body.
  Typically, the last expression within a class is a def statement that defines
  a method. The value of a def statement is always nil.


- Instantiating a Point

        p = Point.new

  The constant Point holds a class object that represents our new class. All
  class objects have a method named new that creates a new instance.

  We can’t do anything very interesting with the newly created Point object
  we’ve stored in the local variable p, because we haven’t yet defined any
  methods for the class. We can, however, ask the new object what kind of object
  it is:


        p.class          # => Point
        p.is_a? Point    # => true


- Initializing a Point

  When we create new Point objects, we want to initialize them with two numbers
  that represent their X and Y coordinates. In many object-oriented languages,
  this is done with a “constructor.” In Ruby, it is done with an initialize
  method:

    class Point
        def  initialize(x, y)
            @x, @y = x, y
        end
    end

  This is only three new lines of code, but there are a couple of important
  things to point out here. We explained the def keyword in detail in Chapter 6.
  But that chapter focused on defining global functions that could be used from
  anywhere. When def is used like this with an unqualified method name inside of
  a class definition, it defines an instance method for the class. An instance
  method is a method that is invoked on an instance of the class. When an
  instance method is called, the value of self is an instance of the
  class in which the method is defined.


  The next point to understand is that the initialize method has a special
  purpose in Ruby. The new method of the class object creates a new instance
  object, and then it automatically invokes the initialize method on that
  instance. Whatever arguments you passed to new are passed on to initialize.
  Because our initialize method expects two arguments, we must now supply two
  values when we invoke Point.new:

        p = Point.new(0,0)

  In addition to being automatically invoked by Point.new, the initialize method
  is automatically made private. An object can call initialize on itself, but
  you cannot explicitly call initialize on p to reinitialize its state.

  Now, let’s look at the body of the initialize method. It takes the two values
  we’ve passed it, stored in local variables x and y, and assigns them to
  instance variables @x and @y. Instance variables always begin with @, and they
  always “belong to” whatever object self refers to. Each instance of our Point
  class has its own copy of these two variables, which hold its own X and Y
  coordinates.




  *** Instance Variable Encapsulation

  The instance variables of an object can only be accessed by the instance
  methods of that object. Code that is not inside an instance method cannot read
  or set the value of an instance variable (unless it uses one of the reflective
  techniques that are described in Chapter 8).

  *** ***


  Finally, a caution for programmers who are used to Java and related languages.
  In statically typed languages, you must declare your variables, including
  instance varia- bles. You know that Ruby variables don’t need to be declared,
  but you might still feel that you have to write something like this:


    # Incorrect code!
    class Point
        @x = 0 # Create instance variable @x and assign a default. WRONG!
        @y = 0 # Create instance variable @y and assign a default. WRONG!

        def initialize(x,y)
            @x, @y = x, y # Now initialize previously created @x and @y.
        end
     end

  This code does not do at all what a Java programmer expects. Instance
  variables are always resolved in the context of self. When the initialize
  method is invoked, self holds an instance of the Point class. But the code
  outside of that method is executed as part of the definition of the Point
  class. When those first two assignments are exe- cuted, self refers to the
  Point class itself, not to an instance of the class.  The @x and @y variables
  inside the initialize method are completely different from those outside it.


- Defining a to_s method

  Just about any class you define should have a to_s instance method to return a
  string representation of the object. This ability proves invaluable when
  debugging.  Here’s how we might do this for Point:

    class Point
        def initialize(x,y)
            @x, @y = x, y
        end

        def to_s
            "(#@x,#@y)"
        end
    end

  With this new method defined, we can create points and print them out:

        p = new Point(1,2)   # Create a new Point object
        puts p               # Displays "(1,2)"


- Accessors and Attributes

  Our Point class uses two instance variables. As we’ve noted, however, the
  value of these variables are only accessible to other instance methods. If we
  want users of the Point class to be able to use the X and Y coordinates of a
  point, we’ve got to provide accessor methods that return the value of the
  variables:

    class Point
        def initialize(x,y)
            @x, @y = x, y
        end

        def x
            @x
        end

        def y
            @y
        end
    end

  With these methods defined, we can write code like this:


    p = Point.new(1,2)
    q = Point.new(p.x*2, p.y*3 )

  The expressions p.x and p.y may look like variable references, but they are,
  in fact, method invocations without parentheses.

  If we wanted our Point class to be mutable (which is probably not a good
  idea), we would also add setter methods to set the value of the instance
  variables:

    class MutablePoint

        def initialize(x,y); @x, @y = x, y; end
        def x; @x; end # The getter method for @x
        def y; @y; end # The getter method for @y

        def x=(value) # The setter method for @x
            @x = value
        end

        def y=(value)
            @y = value
        end

    end


    p = Point.new(1,1)
    p.x = 0
    p.y = 0


  *** Using Setters Inside a Class

  Once you’ve defined a setter method like x= for your class, you might be
  tempted to use it within other instance methods of your class. That is,
  instead of writing @x=2, you might write x=2, intending to invoke x=(2)
  implicitly on self. It doesn’t work, of course; x=2 simply creates a new local
  variable.

  This is a not-uncommon mistake for novices who are just learning about setter
  methods and assignment in Ruby. The rule is that assignment expressions will
  only invoke a setter method when invoked through an object. If you want to use
  a setter from within the class that defines it, invoke it explicitly through
  self. For example: self.x=2.
  *** ***

  This combination of instance variable with trivial getter and setter methods
  is so com- mon that Ruby provides a way to automate it. The attr_reader and
  attr_accessor methods are defined by the Module class. All classes are
  modules, (the Class class is a subclass of Module) so you can invoke these
  method inside any class definition. Both methods take any number of symbols
  naming attributes. attr_reader creates trivial getter methods for the instance
  variables with the same name. attr_accessor creates getter and setter methods.
  Thus, if we were defining a mutable Point class, we could write:


    class Point
        attr_accessor :x, :y # Define accessor methods for our instance variables
    end


  And if we were defining an immutable version of the class, we’d write:


    class Point
        attr_reader :x, :y
    end


  Each of these methods can accept an attribute name or names as a string rather
  than as a symbol. The accepted style is to use symbols, but we can also write
  code like this:

    attr_reader "x", "y"

  attr is a similar method with a shorter name but with behavior that differs in
  Ruby 1.8 and Ruby 1.9. In 1.8, attr can define only a single attribute at a
  time.  With a single symbol argument, it defines a getter method. If the
  symbol is followed by the value true, then it defines a setter method as well:

    attr :x       # Define a trivial getter method x for @x
    attr :y, true # Define getter and setter methods for @y

  In Ruby 1.9, attr can be used as it is in 1.8, or it can be used as a synonym
  for attr_reader.



  The attr, attr_reader, and attr_accessor methods create instance methods for
  us.  This is an example of metaprogramming, and the ability to do it is a
  powerful feature of Ruby. There are more examples of metaprogramming in
  Chapter 8. Note that attr and its related methods are invoked within a class
  definition but outside of any method definitions. They are only executed once,
  when the class is being defined.  There are no efficiency concerns here: the
  getter and setter methods they create are just as fast as handcoded ones.
  Remember that these methods are only able to create trivial getters and
  setters that map directly to the value of an instance variable with the same
  name.  If you need more complicated accessors, such as setters that set a
  differently named variable, or getters that return a value computed from two
  different variables, then you’ll have to define those yourself.

- Defining operators

  We’d like the + operator to perform vector addition of two Point objects, the
  * operator
  to multiply a Point by a scalar, and the unary – operator to do the equivalent
  of mul- tiplying by –1. Method-based operators such as + are simply methods
  with punctuation for names. Because there are unary and binary forms of the –
  operator, Ruby uses the method name –@ for unary minus. Here is a version of
  the Point class with mathematical operators defined:


    class Point
        attr_reader :x, :y   # Define accessor methods for our instance variables

        def initialize(x,y)
            @x,@y = x, y
        end

        def +(other)         # Define + to do vector addition
            Point.new(@x + other.x, @y + other.y )
        end

        def -@ # Define unary minus to negate both coordinates
            Point.new(-@x, -@y )
        end
        def *(scalar)    # Define * to perform scalar multiplication
            Point.new(@x*scalar, @y*scalar )
        end
    end

  Take a look at the body of the + method. It is able to use the @x instance
  variable of self —the object that the method is invoked on. But it cannot
  access @x in the other Point object. Ruby simply does not have a syntax for
  this; all instance variable references implicitly use self. Our + method,
  therefore, is dependent on the x and y getter meth- ods. (We’ll see later that
  it is possible to restrict the visibility of methods so that objects of the
  same class can use each other’s methods, but code outside the class cannot use
  them.)

  *** Type Checking and Duck Typing

  Our + method does not do any type checking; it simply assumes that it has been
  passed a suitable object. It is fairly common in Ruby programming to be loose
  about the def- inition of “suitable.” In the case of our + method, any object
  that has methods named x and y will do, as long as those methods expect no
  arguments and return a number of some sort. We don’t care if the argument
  actually is a point, as long as it looks and behaves like a point. This
  approach is sometimes called “duck typing,” after the adage “if it walks like
  a duck and quacks like a duck, it must be a duck.”

  If we pass an object to + that is not suitable, Ruby will raise an exception.
  Attempting to add 3 to a point, for example, results in this error message:

        NoMethodError: undefined method `x' for 3:Fixnum
        from ./point.rb:37:in `+'

  Translated, this tells us that the Fixnum 3 does not have a method named x,
  and that this error arose in the + method of the Point class. This is all the
  information we need to figure out the source of the problem, but it is
  somewhat obscure. Checking the class of method arguments may make it easier to
  debug code that uses that method.  Here is a version of the method with class
  verification:

        def +(other)
            raise TypeError, "Point argument expected" unless other.is_a? Point
            Point.new(@x + other.x, @y + other.y )
        end

  Here is a looser version of type checking that provides improved error
  messages but still allows duck typing:

        def +(other)
            raise TypeError, "Point-like argument expected" unless
               other.respond_to? :x and other.respond_to? :y
            Point.new(@x + other.x, @y + other.y )
        end

  Note that this version of the method still assumes that the x and y methods
  return numbers. We’d get an obscure error message if one of these methods
  returned a string, for example.

  Another approach to type checking occurs after the fact. We can simply handle
  any exceptions that occur during execution of the method and raise a more
  appropriate exception of our own:

    def +(other)        # Assume that other looks like a Point
            Point.new(@x + other.x, @y + other.y )
        rescue           # If anything goes wrong above
        raise TypeError, # Then raise our own exception
        "Point addition with an argument that does not quack like a Point!"
    end
  *** ***

  Note that our * method expects a numeric operand, not a Point. If p is point,
  then we can write p*2. As our class is written, however, we cannot write 2*p.
  That second expression invokes the * method of the Integer class, which
  doesn’t know how to work with Point objects. Because the Integer class doesn’t
  know how to multiply by a Point, it asks the point for help by calling its
  coerce method. (See §3.8.7.4 for more details.) If we want the expression 2*p
  to return the same result as p*2, we can define a coerce method:

    # If we try passing a Point to the * method of an Integer, it will call
    # this method on the Point and then will try to multiply the elements of
    # the array. Instead of doing type conversion, we switch the order of
    # the operands, so that we invoke the * method defined above.
    def coerce(other)
        [self, other ]
    end

- Array and Hash Access with []

  Ruby uses square brackets for array and hash access, and allows any class to
  define a [] method and use these brackets itself. Let’s define a [] method for
  our class to allow Point objects to be treated as read-only arrays of length
  2, or as read-only hashes with keys :x and :y:

        # Define [] method to allow a Point to look like an array or
        # a hash with keys :x and :y
        def [](index)

            case index
            when 0, -2: @x # Index 0 (or -2 ) is the X coordinate
            when 1, -1: @y # Index 1 (or -1 ) is the Y coordinate
            when :x, "x": @x # Hash keys as symbol or string for X
            when :y, "y": @y # Hash keys as symbol or string for Y

            else nil
            end
        end

- Enumerating Coordinates

  If a Point object can behave like an array with two elements, then perhaps we
  ought to be able to iterate through those elements as we can with a true
  array. Here is a definition of the each iterator for our Point class. Because
  a Point always has exactly two elements, our iterator doesn’t have to loop; it
  can simply call yield twice:

    # This iterator passes the X coordinate to the associated block, and then
    # passes the Y coordinate, and then returns. It allows us to enumerate
    # a point as if it were an array with two elements. This each method is
    # required by the Enumerable module.
    def each
        yield @x
        yield @y
    end


  With this iterator defined, we can write code like this:

    p = Point.new(1,2)
    p.each {|x| print x  } # Prints "12"

  More importantly, defining the each iterator allows us to mix in the methods
  of the Enumerable module, all of which are defined in terms of each. Our class
  gains over 20 iterators by adding a single line:

    include Enumerable

  If we do this, then we can write interesting code like this:

    # Is the point P at the origin?
    p.all? {|x| x == 0  } # True if the block is true for all elements



- Point Equality

  As our class is currently defined, two distinct Point instances are never
  equal to each other, even if their X and Y coordinates are the same. To remedy
  this, we must provide an implementation of the == operator. (You may want to
  reread §3.8.5 in Chapter 3 to refresh your memory about Ruby’s various notions
  of equality.)


    def ==(o)
        if o.is_a? Point
            @x==o.x && @y==o.y
        elsif
            false
        end
    end


  *** Duck Typing and Equality

  The + operator we defined earlier did no type checking at all: it works with
  any argument object with x and y methods that return numbers. This == method
  is implemented differently; instead of allowing duck typing, it requires that
  the argument is a Point.  This is an implementation choice. The implementation
  of == above chooses to define equality so that an object cannot be equal to a
  Point unless it is itself a Point.

  Implementations may be stricter or more liberal than this. The implementation
  above uses the is_a? predicate to test the class of the argument. This allows
  an instance of a subclass of Point to be equal to a Point. A stricter
  implementation would use instance_of? to disallow subclass instances.
  Similarly, the implementation above uses == to compare the X and Y
  coordinates. For numbers, the == operator allows type conversion, which means
  that the point (1,1) is equal to (1.0,1.0). This is probably as it should be,
  but a stricter definition of equality could use eql? to compare the
  coordinates.

  A more liberal definition of equality would support duck typing. Some caution
  is required, however. Our == method should not raise a NoMethodError if the
  argument object does not have x and y methods. Instead, it should simply
  return false:

        def ==(o)
            @x == o.x && @y == o.y # Assume o has proper x and y methods
        rescue                     # If that assumption fails
            false
        end


  Recall from §3.8.5 that Ruby objects also define an eql? method for testing
  equality.  By default, the eql? method, like the == operator, tests object
  identity rather than equality of object content. Often, we want eql? to work
  just like the == operator, and we can accomplish this with an alias:

        class Point
            alias eql? ==
        end


  On the other hand, there are two reasons we might want eql? to be different
  from ==.  First, some classes define eql? to perform a stricter comparison
  than ==. In Numeric and its subclasses, for example, == allows type conversion
  and eql? does not. If we believe that the users of our Point class might want
  to be able to compare instances in two different ways, then we might follow
  this example. Because points are just two num- bers, it would make sense to
  follow the example set by Numeric here. Our eql?  method would look much like
  the == method, but it would use eql? to compare point coordi- nates instead of
  ==:


    def eql?(o)
        if o.instance_of? Point
            @x.eql?(o.x) && @y.eql?(o.y)
        elsif
            false
        end
    end

  As an aside, note that this is the right approach for any classes that
  implement collec- tions (sets, lists, trees ) of arbitrary objects. The ==
  operator should compare the members of the collection using their ==
  operators, and the eql? method should compare the members using their eql?
  methods.


  The second reason to implement an eql? method that is different from the ==
  operator is if you want instances of your class to behave specially when used
  as a hash key. The Hash class uses eql? to compare hash keys (but not values
  ). If you leave eql?  undefined, then hashes will compare instances of your
  class by object identity. This means that if you associate a value with a key
  p, you will only be able to retrieve that value with the exact same object p.
  An object q won’t work, even if p == q. Mutable objects do not work well as
  hash keys, but leaving eql? undefined neatly sidesteps the problem. (See
  §3.4.2 for more on hashes and mutable keys.)

  Because eql? is used for hashes, you must never implement this method by
  itself. If you define an eql? method, you must also define a hash method to
  compute a hashcode for your object. If two objects are equal according to
  eql?, then their hash methods must return the same value. (Two unequal objects
  may return the same hashcode, but you should avoid this to the extent
  possible.)

  Implementing optimal hash methods can be very tricky. Fortunately, there is a
  simple way to compute perfectly adequate hashcodes for just about any class:
  simply combine the hashcodes of all the objects referenced by your class.
  (More precisely: combine the hashcodes of all the objects compared by your
  eql? method.) The trick is to combine the hashcodes in the proper way. The
  following hash method is not a good one:

    def hash
        @x.hash + @y.hash
    end

  The problem with this method is that it returns the same hashcode for the
  point (1,0) as it does for the point (0,1). This is legal, but it leads to
  poor performance when points are used as hash keys. Instead, we should mix
  things up a bit:


    def hash
        code = 17
        code = 37*code + @x.hash
        code = 37*code + @y.hash
        # Add lines like this for each significant instance variable
        code # Return the resulting code
    end

- Ordering Points

  Suppose we wish to define an ordering for Point objects so that we can compare
  them and sort them. There are a number of ways to order points, but we’ll
  chose to arrange them based on their distance from the origin. This distance
  (or magnitude ) is computed by the Pythagorean theorem: the square root of the
  sum of the squares of the X and Y coordinates.

  To define this ordering for Point objects, we need only define the <=>
  operator (see §4.6.6) and include the Comparable module. Doing this mixes in
  implementations of the equality and relational operators that are based on our
  implementation of the gen- eral <=> operator we defined. The <=> operator
  should compare self to the object it is passed. If self is less than that
  object (closer to the origin, in this case), it should return –1. If the two
  objects are equal, it should return 0. And if self is greater than the argu-
  ment object, the method should return 1. (The method should return nil if the
  argument object and self are of incomparable types.) The following code is our
  im- plementation of <=>. There are two things to note about it. First, it
  doesn’t bother with the Math.sqrt method and instead simply compares the sum
  of the squares of the co- ordinates. Second, after computing the sums of the
  squares, it simply delegates to the <=> operator of the Float class:

        include Comparable   # Mix in methods from the Comparable module.
        # Define an ordering for points based on their distance from the origin.
        # This method is required by the Comparable module.
        def <=>(other)
            return nil unless other.instance_of? Point
            @x**2 + @y**2 <=> other.x**2 + other.y**2
        end

  Note that the Comparable module defines an == method that uses our definition
  of <=>. Our distance-based comparison operator results in an == method that
  considers the points (1,0) and (0,1) to be equal. Because our Point class
  explicitly defines its own == method, however, the == method of Comparable is
  never invoked. Ideally, the == and <=> operators should have consistent
  definitions of equality. This was not pos- sible in our Point class, and we
  end up with operators that allow the following:

    p,q = Point.new(1,0), Point.new(0,1)
    p == q       # => false: p is not equal to q
    p < q        # => false: p is not less than q
    p > q        # => false: p is not greater than q

  Finally, It is worth noting here that the Enumerable module defines several
  methods, such as sort, min, and max, that only work if the objects being
  enumerated define the <=> operator.


- A Mutable Point

  The Point class we’ve been developing is immutable: once a point object has
  been cre- ated, there is no public API to change the X and Y coordinates of
  that point.  This is probably as it should be. But let’s detour and
  investigate some methods we might add if we wanted points to be mutable.


  First of all, we’d need x= and y= setter methods to allow the X and Y
  coordinates to be set directly. We could define these methods explicitly, or
  simply change our attr_reader line to attr_accessor:

        attr_accessor :x, :y

  Next, we’d like an alternative to the + operator for when we want to add the
  coordinates of point q to the coordinates of point p, and modify point p
  rather than creating and returning a new Point object. We’ll call this method
  add!, with the exclamation mark indicating that it alters the internal state
  of the object on which it is invoked:

    def add!(p)
        @x += p.x
        @y += p.y
        self
    end

  When defining a mutator method, we normally only add an exclamation mark to
  the name if there is a nonmutating version of the same method. In this case,
  the name add! makes sense if we also define an add method that returns a new
  object, rather than altering its receiver. A nonmutating version of a mutator
  method is often written simply by creating a copy of self and invoking the
  mutator on the copied object:

    def add(p)
        q = self.dup
        q.add!(p)
    end

  In this trivial example, our add method works just like the + operator we’ve
  already defined, and it’s not really necessary. So if we don’t define a
  nonmutating add, we should consider dropping the exclamation mark from add!
  and allowing the name of the method itself (“add” instead of “plus”) to
  indicate that it is a mutator.



- Quick and Easy Mutable Classes

  If you want a mutable Point class, one way to create it is with Struct. Struct
  is a core Ruby class that generates other classes. These generated classes
  have accessor methods for the named fields you specify. There are two ways to
  create a new class with Struct.new:

        Struct.new("Point", :x, :y)  # Creates new class Struct::Point
        Point = Struct.new(:x, :y )  # Creates new class, assigns to Point




  *** Naming Anonymous Classes

  The second line in the code relies on a curious fact about Ruby classes: if
  you assign an unnamed class object to a constant, the name of that constant
  becomes the name of a class. You can observe this same behavior if you use the
  Class.new constructor:


        C = Class.new    # A new class with no body, assigned to a constant
        c = C.new        # Create an instance of the class
        c.class.to_s     # => "C": constant name becomes class name
  *** ***


  Once a class has been created with Struct.new, you can use it like any other
  class. Its new method will expect values for each of the named fields you
  specify, and its instance methods provide read and write accessors for those
  fields:

    p = Point.new(1,2)  # => #<struct Point x=1, y=2>
    p.x                 # => 1
    p.y                 # => 2
    p.x = 3             # => 3
    p.x                 # => 3

  Structs also define the [] and []= operators for array and hash-style
  indexing, and even provide each and each_pair iterators for looping through
  the values held in an instance of the struct:

    p[:x] = 4                       # => 4: same as p.x =
    p[:x]                           # => 4: same as p.x
    p[1]                            # => 2: same as p.y
    p.each {|c| print c }           # prints "42"
    p.each_pair {|n,c| print n,c  } # prints "x4y2"

  Struct-based classes have a working == operator, can be used as hash keys
  (though caution is necessary because they are mutable), and even define a
  helpful to_s method:

    q = Point.new(4,2)
    q == p           # => true
    h = {q => 1 }    # Create a hash using q as a key
    h[p]             # => 1: extract value using p as key
    q.to_s           # => "#<struct Point x=4, y=2>"

  A Point class defined as a struct does not have point-specific methods like
  add! or the <=> operator defined earlier in this chapter. There is no reason
  we can’t add them, though. Ruby class definitions are not static. Any class
  (including classes defined with Struct.new) can be “opened” and have methods
  added to it. Here’s a Point class initially defined as a Struct, with
  point-specific methods added:

    Point = Struct.new(:x, :y )
    class Point
        def add!(other)
            self.x += other.x
            self.y += other.y
            self
        end

        include Comparable   # Include a module for the class
        def <=>(other)       # Define the <=> operator
            return nil unless other.instance_of? Point
            self.x**2 + self.y**2 <=> other.x**2 + other.y**2
        end
    end


  As noted at the beginning of this section, the Struct class is designed to
  create mutable classes. With just a bit of work, however, we can make a
  Struct-based class immutable:

        Point = Struct.new(:x, :y )
        class Point
            undef x=,y=,[]=
        end






- A Class Method

  Let’s take another approach to adding Point objects together. Instead of
  invoking an instance method of one point and passing another point to that
  method, let’s write a method named sum that takes any number of Point objects,
  adds them together, and returns a new Point. This method is not an instance
  method invoked on a Point object.  Rather, it is a class method, invoked
  through the Point class itself. We might invoke the sum method like this:

        total = Point.sum(p1, p2, p3 ) # p1, p2 and p3 are Point objects

  Keep in mind that the expression Point refers to a Class object that
  represents our point class. To define a class method for the Point class, what
  we are really doing is defining a singleton method of the Point object. (We
  covered singleton methods in §6.1.4. ) To define a singleton method, use the
  def statement as usual, but specify the object on which the method is to be
  defined as well as the name of the method. Our class method sum is defined
  like this:

    class Point
        attr_reader :x, :y # Define accessor methods for our instance variables

        def Point.sum(*points) # Return the sum of an arbitrary number of points
            x = y = 0
            points.each {|p| x += p.x; y += p.y  }
            Point.new(x,y)
        end
    # ...the rest of class omitted here...
    end

  This definition of the class method names the class explicitly, and mirrors
  the syntax used to invoke the method. Class methods can also be defined using
  self instead of the class name. Thus, this method could also be written like
  this:

    def self.sum(*points) # Return the sum of an arbitrary number of points
        x = y = 0
        points.each {|p| x += p.x; y += p.y  }
        Point.new(x,y)
    end


  Using self instead of Point makes the code slightly less clear, but it’s an
  application of the DRY (Don’t Repeat Yourself) principle. If you use self
  instead of the class name, you can change the name of a class without having
  to edit the definition of its class methods.

  There is yet another technique for defining class methods. Though it is less
  clear than the previously shown technique, it can be handy when defining
  multiple class methods, and you are likely to see it used in existing code:

    # Open up the Point object so we can add methods to it
    class << Point          # Syntax for adding methods to a single object
        def sum(*points)    # This is the class method Point.sum
            x = y = 0
            points.each {|p| x += p.x; y += p.y  }
            Point.new(x,y)
        end
    # Other class methods can be defined here
    end


  This technique can also be used inside the class definition, where we can use
  self instead of repeating the class name:

    class Point
        # Instance methods go here
        class << self
            # Class methods go here
        end
    end


- Constants

  Many classes can benefit from the definition of some associated constants.
  Here are some constants that might be useful for our Point class:

    class Point
        def initialize(x,y)      # Initialize method
            @x,@y = x, y
        end
        ORIGIN = Point.new(0,0)
        UNIT_X = Point.new(1,0)
        UNIT_Y = Point.new(0,1)

    # Rest of class definition goes here
    end

  Inside the class definition, these constants can be referred to by their
  unqualified names.  Outside the definition, they must be prefixed by the name
  of the class, of course:

    Point::UNIT_X + Point::UNIT_Y        # => (1,1)

  Note that because our constants in this example refer to instances of the
  class, we cannot define the constants until after we’ve defined the initialize
  method of the class.  Also, keep in mind that it is perfectly legal to define
  constants in the Point class from outside the class:

    Point::NEGATIVE_UNIT_X = Point.new(-1,0)



- Class Variables

  Class variables are visible to, and shared by, the class methods and the
  instance methods of a class, and also by the class definition itself. Like
  instance variables, class variables are encapsulated; they can be used by the
  implementation of a class, but they are not visible to the users of a class.
  Class variables have names that begin with @@.


  There is no real need to use class variables in our Point class, but for the
  purposes of this tutorial, let’s suppose that we want to collect data about
  the number of Point objects that are created and their average coordinates.
  Here’s how we might write the code:

    class Point
    # Initialize our class variables in the class definition itself
        @@n = 0          # How many points have been created
        @@totalX = 0     # The sum of all X coordinates
        @@totalY = 0     # The sum of all Y coordinates

        def initialize(x,y)  # Initialize method
            @x,@y = x, y     # Sets initial values for instance variables

            # Use the class variables in this instance method to collect data
            @@n += 1         # Keep track of how many Points have been created
            @@totalX += x    # Add these coordinates to the totals
            @@totalY += y
        end

        # A class method to report the data we collected
        def self.report
        # Here we use the class variables in a class method
            puts "Number of points created: #@@n"
            puts "Average X coordinate: #{@@totalX.to_f/@@n}"
            puts "Average Y coordinate: #{@@totalY.to_f/@@n}"
        end
    end

  The thing to notice about this code is that class variables are used in
  instance methods, class methods, and in the class definition itself, outside
  of any method.  Class variables are fundamentally different than instance
  variables. We’ve seen that instance variables are always evaluated in
  reference to self. That is why an instance variable reference in a class
  definition or class method is completely different from an instance variable
  reference in an instance method. Class variables, on the other hand, are
  always evalu- ated in reference to the class object created by the enclosing
  class definition statement.



- Class Instance Variables

  Classes are objects and can have instance variables just as other objects can.
  The instance variables of a class—often called class instance variables—are
  not the same as class variables. But they are similar enough that they can
  often be used instead of class variables.

  An instance variable used inside a class definition but outside an instance
  method definition is a class instance variable. Like class variables, class
  instance variables are associated with the class rather than with any
  particular instance of the class. A disadvantage of class instance variables
  is that they cannot be used within instance methods as class variables can.
  Another disadvantage is the potential for confusing them with ordinary
  instance variables. Without the distinctive punctuation prefixes, it may be
  more difficult to remember whether a variable is associated with instances or
  with the class object.


  One of the most important advantages of class instance variables over class
  variables has to do with the confusing behavior of class variables when
  subclassing an existing class. We’ll return to this point later in the
  chapter.

  Let’s port our statistics-gathering version of the Point class to use class
  instance varia- bles instead of class variables. The only difficulty is that
  because class instance variables cannot be used from instance methods, we must
  move the statistics gathering code out of the initialize method (which is an
  instance method ) and into the new class method used to create points:

    class Point
        # Initialize our class instance variables in the class definition itself
        @n = 0       # How many points have been created
        @totalX = 0  # The sum of all X coordinates
        @totalY = 0  # The sum of all Y coordinates

        def initialize(x,y) # Initialize method
            @x,@y = x, y    # Sets initial values for instance variables
        end

        def self.new(x,y)   # Class method to create new Point objects
        # Use the class instance variables in this class method to collect data
            @n += 1         # Keep track of how many Points have been created
            @totalX += x    # Add these coordinates to the totals
            @totalY += y

            super   # Invoke the real definition of new to create a Point
                    # More about super later in the chapter
        end

        # A class method to report the data we collected
        def self.report
        # Here we use the class instance variables in a class method
            puts "Number of points created: #@n"
            puts "Average X coordinate: #{@totalX.to_f/@n}"
            puts "Average Y coordinate: #{@totalY.to_f/@n}"
        end
    end

  Because class instance variables are just instance variables of class objects,
  we can use attr, attr_reader, and attr_accessor to create accessor methods for
  them. The trick, however, is to invoke these metaprogramming methods in the
  right context.  Recall that one way to define class methods uses the syntax
  class << self. This same syntax allows us to define attribute accessor methods
  for class instance variables:

        class << self
            attr_accessor :n, :totalX, :totalY
        end

  With these accessors defined, we can refer to our raw data as Point.n,
  Point.totalX, and Point.totalY.

pg 232


