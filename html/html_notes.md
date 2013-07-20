# HTML notes

`<!DOCTYPE html>` tells the browser the flavor of HTML you are using. The stuff
between `<body>` and `</body>`is the main content of the document that
will appear in the browser window.

Not all tags have closing tags like this (`<html></html>`) some tags, which do not
wrap around content will close themselves (`<br>`). Using `<br/>` instead of
`<br>` is a remnant of XHTML. HTML will be happy with any format.

## Tags, Attributes and Elements

```html
<tag attribute="value">
    element
</tag>
```
## Title
```html
<!DOCTYPE html>
<html>
    <head>
        <title>My first web page</title>
    </head>
    <body>
        This is my first web page
    </body>
</html>
```

The head tag appears before the body tag and contains information _about_ the
page. The information in the head element does not appear in the browser window.

The title is also used when we create bookmarks.

## Paragraghs, emphasis, line breaks

Paragraphs
: `<p>haha</p>`

Emphasis
: `<em>hoho</em>`

Line breaks
: `<br>`

## Headings, Lists

Headings go from _h1_ to _h6_.

Lists start with the `<ul>` tag for _unordered_ lists, and `<ol>` for the
_ordered_ lists. To list an item in that list, use the `<li>` tag.

```html
<ul>
    <li>haha</li>
    <li>hoho</li>
</ul>
```
e.g

<ul>
    <li>haha</li>
    <li>hoho</li>
</ul>

## Links and Images

Links
: `<a href="http://www.htmldog.com">HTML Dog</a>` or `<a href="#moss">moss</a>.`
The latter is to jump to a section with id _moss_.

Images
: `<img src="http://www.htm.com/1.gif" width="120" height="90" alt="HTML Dog">`
The _alt_ text is used for accessibility consideration.

## Tables
```html
<table>
    <tr>
        <td>Row 1, cell 1</td>
        <td>Row 1, cell 2</td>
        <td>Row 1, cell 3</td>
    </tr>
    <tr>
        <td>Row 2, cell 1</td>
        <td>Row 2, cell 2</td>
        <td>Row 2, cell 3</td>
    </tr>
    <tr>
        <td>Row 3, cell 1</td>
        <td>Row 3, cell 2</td>
        <td>Row 3, cell 3</td>
    </tr>
    <tr>
        <td>Row 4, cell 1</td>
        <td>Row 4, cell 2</td>
        <td>Row 4, cell 3</td>
    </tr>
</table>
```
e.g
<table>
    <tr>
        <td>Row 1, cell 1</td>
        <td>Row 1, cell 2</td>
        <td>Row 1, cell 3</td>
    </tr>
    <tr>
        <td>Row 2, cell 1</td>
        <td>Row 2, cell 2</td>
        <td>Row 2, cell 3</td>
    </tr>
    <tr>
        <td>Row 3, cell 1</td>
        <td>Row 3, cell 2</td>
        <td>Row 3, cell 3</td>
    </tr>
    <tr>
        <td>Row 4, cell 1</td>
        <td>Row 4, cell 2</td>
        <td>Row 4, cell 3</td>
    </tr>
</table>

### Tables: rowspan and colspan

```html
<table>
    <tr>
        <th>Column 1 heading</th>
        <th>Column 2 heading</th>
        <th>Column 3 heading</th>
    </tr>
    <tr>
        <td>Row 2, cell 1</td>
        <td colspan="2">Row 2, cell 2, also spanning Row 2, cell 3</td>
    </tr>
    <tr>
        <td rowspan="2">Row 3, cell 1, also spanning Row 4, cell 1</td>
        <td>Row 3, cell 2</td>
        <td>Row 3, cell 3</td>
    </tr>
    <tr>
        <td>Row 4, cell 2</td>
        <td>Row 4, cell 3</td>
    </tr>
</table>
```

e.g

<table>
    <tr>
        <th>Column 1 heading</th>
        <th>Column 2 heading</th>
        <th>Column 3 heading</th>
    </tr>
    <tr>
        <td>Row 2, cell 1</td>
        <td colspan="2">Row 2, cell 2, also spanning Row 2, cell 3</td>
    </tr>
    <tr>
        <td rowspan="2">Row 3, cell 1, also spanning Row 4, cell 1</td>
        <td>Row 3, cell 2</td>
        <td>Row 3, cell 3</td>
    </tr>
    <tr>
        <td>Row 4, cell 2</td>
        <td>Row 4, cell 3</td>
    </tr>
</table>

_th_ is the header cell.

_colspan_ and _rowspan_ attributes have also been used in some of the td tags.
If you look at this code in a browser, you will see that on the second row
there are now two cells instead of three, the second cell spanning the second
and third column. The colspan attribute, which means “column span” will span
the cell over the number of cells that is specified. This means, in this
example, that there is no need for a third td element - two cells are merged
into one.

The rowspan attribute is similar to colspan, except, obviously, it will span
across rows rather than columns. Again, the cells that it spans should be
removed. In this example, because it spans over the fourth row, there is only
two cells in that row.
## Forms
```html
<form action="processingscript.php" method="post">
    <input type="text">
    <input type="password">
    <input type="checkbox">
    <input type="radio">
    <input type="submit" value="Ooo. Look. Text on a button. Wow">.

    <select>
        <option>Option 1</option>
        <option>Option 2</option>
        <option value="third option">Option 3</option>
    </select>

    <p><input type="radio" name="areyou" value="male"> Male</p>
    <p><input type="radio" name="areyou" value="female"> Female</p>
    <p><input type="radio" name="areyou" value="hermaphrodite">e</p>
    <p><input type="radio" name="areyou" value="asexual">Asexual</p>
<form>
```

When the form is submitted, the value of the selected option will be sent. This
value will be the text between the selected opening and closing option tag
unless an explicit value is specified with the value attribute, in which case
this will be sent instead.

All of the tags mentioned above will look very nice presented on the page but if
you hook up your form to a form-handling script, they will all be ignored. This
is because the form fields need names. So to all of the fields, the attribute
name needs to be added.

## Span and Div

The difference between span and div is that a span element is in-line and
usually used for a small chunk of HTML inside a line (such as inside a
paragraph) whereas a div (division) element is block-line (which is basically
equivalent to having a line-break before and after it) and used to group larger
chunks of code.

```html
<div id="scissors">
    <p>This is <span class="paper">crazy</span></p>
</div>
```

## Abbreviation, quotations, and code

Abbreviation
: `<p>This is about <abbr title="HyperText Markup Language">HTML</abbr></p>`

e.g
<p>This is about <abbr title="HyperText Markup Language">HTML</abbr></p>

Quotations
: _blockquote_ and _q_ are used for quotations.

_q_ is used for inline quotations, whereas _blockquote_ is used for standalone
quotes.

```html
<p>So I said <q>I know as much
about quotations as I do about pigeon fancying</q>. Luckily, I found HTML Dog
and it said:</p>

<blockquote cite="http://www.htmldog.com/guides/html/intermediate/text/">
    <p>blockquote and q are used for quotations. blockquote is generally used
       for standalone often multi-line quotations whereas q is used for shorter,
       in-line quotations.</p>
</blockquote>
```
e.g
<p>So I said <q>I know as much
about quotations as I do about pigeon fancying</q>. Luckily, I found HTML Dog
and it said:</p>

<blockquote cite="http://www.htmldog.com/guides/html/intermediate/text/">
    <p>blockquote and q are used for quotations. blockquote is generally used
       for standalone often multi-line quotations whereas q is used for shorter,
       in-line quotations.</p>
</blockquote>

Blockquotes work very well with _figure_ and _figurecaption_.
```html
<figure>
    <blockquote>[Big old quotation about evolution]</blockquote>
    <figcaption>Charles Darwin</figcaption>
</figure>
```
e.g
<figure>
    <blockquote>[Big old quotation about evolution]</blockquote>
    <figcaption>Charles Darwin</figcaption>
</figure>

Citations
: `<p>According to <cite>the Bible</cite>, after six days God said <q>screw this
for a lark, I'm having a nap</q>.</p>`

<p>According to <cite>the Bible</cite>, after six days God said <q>screw this
for a lark, I'm having a nap</q>.</p>

Code
: code is used to represent any form of computer code. Further, var can be used
  for variables (which could be a variable in anything, not just in code - it
  could be a variable in an equation, for example), samp for sample output,
  and kbd (keyboard) for user input.

```html
<p>If you add the line <code><var>givevaderachuckle</var> = true;</code> to the
   <code>destroy_planet</code> subroutine and then type <kbd>ilovejabba</kbd> into
   the console, the big bad green Death Star laser will etch <samp>Slug
   Lover!</samp> on the planet's surface.</p>
```

e.g
<p>If you add the line <code><var>givevaderachuckle</var> = true;</code> to the
   <code>destroy_planet</code> subroutine and then type <kbd>ilovejabba</kbd> into
   the console, the big bad green Death Star laser will etch <samp>Slug
   Lover!</samp> on the planet's surface.</p>
`
`pre` is preformatted text and is unusual in HTML tags that it takes notice of
every character in it, including the white space (whereas other elements will
ignore a consecutive space or a line-break, for example). It is most commonly
used for blocks of code, where spacing, such as indentations, can be relevant.

```html
<pre><code>
&lt;div id="intro"&gt;
    &lt;h1&gt;Some heading&lt;/h1&gt;
    &lt;p&gt;Some paragraph paragraph thing thing thingy.&lt;/p&gt;
&lt;/div&gt;
</code></pre>
```
e.g
<pre><code>
&lt;div id="intro"&gt;
    &lt;h1&gt;Some heading&lt;/h1&gt;
    &lt;p&gt;Some paragraph paragraph thing thing thingy.&lt;/p&gt;
&lt;/div&gt;
</code></pre>

## Meta tags
Meta tags don’t do anything to the content that is presented in the browser
window, but they are used by the likes of search engines to catalogue
information about the web page.

There is one meta tag which can be used as many times as you desire inside a
head element and they can contain the attributes charset, name, http-equiv, and
content.

The _name_ attribute can be anything you like. The most commonly used names are
author, description, and keywords. author is used to explicitly state one of the
HTML page’s authors and description is often used by search engines (such as
Google) to display a description of a web page in its search results.

The _http-equiv_ attribute can be used instead of the name attribute and will make
an HTTP header, which is information sent to the server where the web page is
held. The attribute should rarely be used (although see charset note, below) but
the value can be:

- _content-type_, an encoding declaration, defining what character set is being
  used,
- _default-style_, the preferred stylesheet from a selection of link or style
  elements,
- or _refresh_, which defines how often (in seconds) a page automatically
  refreshes or if it should automatically redirect to another page. Not great
  for accessibility.

```html
<head>
    <title>Air conditioners? YEAH conditioners!</title>
    <meta charset="utf-8">
    <meta http-equiv="refresh" content="3"><!--not recommended for sane
    people-->
    <meta name="description" content="This is my really, really,
    REALLY exciting web page about air conditioners">
</head>
```

## Definition lists
```html
<dl>
    <dt>HTML</dt>
    <dd>Abbreviation for HyperText Markup Language - a language used to make web
        pages.</dd>

    <dt>Dog</dt>
    <dd>Any carnivorous animal belonging to the family Canidae.</dd>
    <dd>The domesticated sub-species of the family Canidae, Canis lupus
        familiaris.</dd>

    <dt>Moo juice</dt>
    <dt>Cat beer</dt>

    <dt>Milk</dt>
    <dd>A white liquid produced by cows and used for human consumption.</dd>
</dl>
```
e.g

<dl>
    <dt>HTML</dt>
    <dd>Abbreviation for HyperText Markup Language - a language used to make web
        pages.</dd>

    <dt>Dog</dt>
    <dd>Any carnivorous animal belonging to the family Canidae.</dd>
    <dd>The domesticated sub-species of the family Canidae, Canis lupus
        familiaris.</dd>

    <dt>Moo juice</dt>
    <dt>Cat beer</dt>

    <dt>Milk</dt>
    <dd>A white liquid produced by cows and used for human consumption.</dd>
</dl>

## Addresses, Definitions, Bi-directional, and Editorial
_address_ should be used specifically for the contact details relating either to
the entire web page (and so only used once) or to an article element

```html
<h3>Author contact details</h3>
<address>
<ul>
    <li>0123-456-7890</li>
    <li>author_dude@noplaceinteresting.com</li>
    <li>http://www.noplaceinteresting.com/contactme/</li>
</ul>
</address>
```
e.g
<h3>Author contact details</h3>
<address>
<ul>
    <li>0123-456-7890</li>
    <li>author_dude@noplaceinteresting.com</li>
    <li>http://www.noplaceinteresting.com/contactme/</li>
</ul>
</address>

_Definition terms_
: _dfn_ is a definition term and is used to highlight the first use of a term.
  Like abbr, the title attribute can be used to describe the term.

```html
<p>Bob's <dfn title="Dog">canine</dfn> mother and <dfn
   title="Horse">equine</dfn> father sat him down and carefully explained that he
   was an <dfn title="A mutation that combines two or more sets of chromosomes from
   different species">allopolyploid</dfn> organism.</p>
```
e.g
<p>Bob's <dfn title="Dog">canine</dfn> mother and <dfn
   title="Horse">equine</dfn> father sat him down and carefully explained that he
   was an <dfn title="A mutation that combines two or more sets of chromosomes from
   different species">allopolyploid</dfn> organism.</p>

Bi-directional text
: _bdo_ can be used to reverse the direction of the text, and can be used to
  display languages that read right to left. The value of the required attribute
  _dir_ can be _ltr_ (left to right) or _rtl_ (right to left).

```html
<bdo dir="rtl">god lmth</bdo>
```
e.g
<bdo dir="rtl">god lmth</bdo>


Editorial
: _ins_ and _del_ are used to display editorial insertions and deletions
  respectively. Strictly speaking, they aren’t limited to text and can be used
  over whole swathes of content but, typically, they are used in moderation just
  like “Track Changes” feature in word processors tend to be.

  They can have the attributes datetime to indicate when the edit was made and
  cite, to point to a description as to why the edit has been made.

```html
<p>I have decided to <del datetime="2013-01-26">decrease</del> <ins
   cite="http://www.icecreamforall.com/changeofpolicy/">increase</ins> the amount
   of free ice cream that the State will provide for its citizens.</p>
```
e.g
<p>I have decided to <del datetime="2013-01-26">decrease</del> <ins
cite="http://www.icecreamforall.com/changeofpolicy/">increase</ins> the amount
of free ice cream that the State will provide for its citizens.</p>

