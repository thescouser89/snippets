<nav id="insert_nav_document">
<ul>
  <li><a href="#css-notes">CSS Notes</a></li>
  <ul>
    <li><a href="#applying-css">Applying CSS</a></li>
    <li><a href="#selectors-properties-and-values">Selectors, properties, and values</a></li>
    <ul>
      <li><a href="#length-and-percentage">Length and Percentage</a></li>
    </ul>
    <li><a href="#colors">Colors</a></li>
    <li><a href="#text">Text</a></li>
    <li><a href="#the-box-model">The Box Model</a></li>
    <li><a href="#class-and-id-selectors">Class and ID selectors</a></li>
    <li><a href="#grouping">Grouping</a></li>
    <li><a href="#nesting">Nesting</a></li>
    <li><a href="#pseudo-classes">Pseudo Classes</a></li>
    <ul>
      <li><a href="#links">Links</a></li>
      <li><a href="#dynamic-pseudo-classes">Dynamic Pseudo Classes</a></li>
      <li><a href="#first-children">First children</a></li>
    </ul>
  </ul>
</ul>
</nav>
# CSS Notes

## Applying CSS
```html
<head>
    <title>My first web page</title>
    <link rel="stylesheet" href="style.css">
</head>
```

## Selectors, properties, and values
For each selector there are “properties” inside curly brackets.
```css
body {
    font-size: 14px;
    color: navy;
}
```
### Length and Percentage
Units used:
- `px`: unit in pixels
- `em`: unit for the calculated size of a font
- `pt`: unit for points, for measurements typically in printed media
- `%` : percentages

When a value is zero, you do not need to state a unit.

## Colors
Predefined color names include aqua, black, blue, fuchsia, gray, green, lime,
maroon, navy, olive, orange, purple, red, silver, teal, white, and yellow.
transparent is also a valid value.

Colors can also be specified using hex numbers. The hex number is prefixed with
a hash character (#) and can be three or six digits in length. Basically, the
three-digit version is a compressed version of the six-digit.
(#ff0000 becomes #f00, #cc9966 becomes #c96, etc.)

The six-digit version gives you more control over the exact color.

```css
h1 {
    color: yellow;
    background-color: blue;
}
```
You can apply the color and background-color properties to most HTML elements,
including body, which will change the colors of the page and everything in it.

## Text

font-family
: This is the font itself, such as Times New Roman, Arial, or Verdana.

The user’s browser has to be able to find the font you specify, which, in most
cases, means it needs to be on their computer so there is little point in using
obscure fonts that are only sitting on your computer. There are a select few
“safe” fonts (the most commonly used are Arial, Verdana and Times New Roman),
but you can specify more than one font, separated by commas. The purpose of this
is that if the user does not have the first font you specify, the browser will
go through the list until it finds one it does have.

Note: if the name of a font is more than one word, it should be put in quotation
marks, such as font-family: "Times New Roman".

```css
font-family: arial, helvetica, serif
```

font-size
: The size of the font

font-weight
: This states whether the text is bold or not. Most commonly this is used as
font-weight: bold or font-weight: normal but other values are bolder, lighter,
100, 200, 300, 400 (same as normal), 500, 600, 700 (same as bold), 800 or 900.

font-style
: This states whether the text is italic or not. It can be font-style: italic or
font-style: normal.

text-decoration
: underline, overline, line-through, none

text-transform
: capitalize, uppercase, lowercase, none

text spacing
: The letter-spacing and word-spacing properties are for spacing between letters
or words. The value can be a length or normal.

The line-height property sets the height of the lines in an element, such as a
paragraph, without adjusting the size of the font. It can be a number (which
specifies a multiple of the font size, so “2” will be two times the font size,
for example), a length, a percentage, or normal.

The text-align property will align the text inside an element to left, right,
center, or justify.

The text-indent property will indent the first line of a paragraph, for
example, to a given length or percentage. This is a style traditionally used
in print, but rarely in digital media such as the web.

## The Box Model

Element -> Padding -> Border -> Margin

```css
margin: 20px;
padding: 40px;
```
The four sides of an element can also be set individually. margin-top,
margin-right, margin-bottom, margin-left, padding-top, padding-right,
padding-bottom and padding-left are the self-explanatory properties you can use.

border
: To make a border around an element, all you need is border-style. The values
can be solid, dotted, dashed, double, groove, ridge, inset and outset.

_border-width_ sets the width of the border, most commonly using pixels as a
value. There are also properties for border-top-width, border-right-width,
border-bottom-width and border-left-width.

Finally, border-color sets the color.

```css
h2 {
    border-style: dashed;
    border-width: 3px;
    border-left-width: 10px;
    border-right-width: 10px;
    border-color: red;
}
```

## Class and ID selectors
In the CSS, a class selector is a name preceded by a full stop (“.”) and an ID
selector is a name preceded by a hash character (“#”).

```css
#top {
    background-color: #ccc;
    padding: 20px
}
.intro {
    color: red;
    font-weight: bold;
}
```

```html
<div id="top">
    <h1>Chocolate curry</h1>
    <p class="intro">This is my recipe for making curry purely with chocolate</p>
    <p class="intro">Mmm mm mmmmm</p>
</div>
```
The difference between an ID and a class is that an ID can be used to identify
one element, whereas a class can be used to identify more than one.

You can also apply a selector to a specific HTML element by simply stating the
HTML selector first, so p.jam { /* whatever */  } will only be applied to
paragraph elements that have the class “jam”.

## Grouping
You can give the same properties to a number of selectors without having to
repeat them.

```css
h2 {
    color: red;
}
.thisOtherClass {
    color: red;
}
.yetAnotherClass {
    color: red;
}
```

into...

```css
h2, .thisOtherClass, .yetAnotherClass {
    color: red;
}
```

## Nesting
```css
#top {
    background-color: #ccc;
    padding: 1em
}

#top h1 {
    color: #ff0;
}
#top p {
    color: red;
    font-weight: bold;
}
```

```html
<div id="top">
    <h1>Chocolate curry</h1>
    <p>This is my recipe for making curry purely with chocolate</p>
    <p>Mmm mm mmmmm</p>
</div>
```

## Pseudo Classes
Pseudo classes are bolted on to selectors to specify a state or relation to the
selector. They take the form of selector:pseudo_class { property: value; },
simply with a colon in between the selector and the pseudo class.

### Links
```css
a:link {
    color: blue;
}

a:visited {
    color: purple;
}
```
### Dynamic Pseudo Classes
Also commonly used for links, the dynamic pseudo classes can be used to apply
styles when something happens to something.

- `active` is for when something activated by the user, such as when a link is
clicked on.

- `hover` is for a when something is passed over by an input from the user,
    such as when a cursor moves over a link.

- `focus` is for when something gains focus, that is when it is selected by, or
is ready for, keyboard input.

`focus` is most often used on form elements but can be used for links. Although
most users will navigate around and between pages using a pointing device such
as a mouse those who choose note to, or are unable to do so, such as those with
motor disabilities, may navigate using a keyboard or similar device. Links can
be jumped between using a tab key and they will gain focus one at a time.

``css
a:active {
    color: red;
}

a:hover {
    text-decoration: none;
    color: blue;
    background-color: yellow;
}

input:focus, textarea:focus {
    background: #eee;
}
```

### First children
Finally (for this article, at least), there is the first-child pseudo class.
This will target something only if it is the very first descendant of an
element. So, in the following HTML…

```html
<body>
    <p>I’m the body’s first paragraph child. I rule. Obey me.</p>
    <p>I resent you.</p>
</body>
```

if you only want to style the first paragraph, you could use the following CSS:
```css
p:first-child {
    font-weight: bold;
    font-size: 40px;
}
```
