<nav id="insert_nav_document">
<ul>
  <li><a href="#html-notes">HTML notes</a></li>
  <ul>
    <li><a href="#tags-attributes-and-elements">Tags, Attributes and Elements</a></li>
    <li><a href="#title">Title</a></li>
    <li><a href="#paragraghs-emphasis-line-breaks">Paragraghs, emphasis, line breaks</a></li>
    <li><a href="#headings-lists">Headings, Lists</a></li>
    <li><a href="#links-and-images">Links and Images</a></li>
    <li><a href="#tables">Tables</a></li>
    <ul>
      <li><a href="#tables-rowspan-and-colspan">Tables: rowspan and colspan</a></li>
      <li><a href="#columns">Columns</a></li>
      <li><a href="#caption">Caption</a></li>
      <li><a href="#headers-and-footer">Headers and Footer</a></li>
    </ul>
    <li><a href="#forms">Forms</a></li>
    <ul>
      <li><a href="#accessible-forms">Accessible Forms</a></li>
      <li><a href="#field-sets-and-legends">Field sets and legends</a></li>
      <li><a href="#option-groups">Option Groups</a></li>
      <li><a href="#navigating-fields">Navigating Fields</a></li>
      <li><a href="#additional-input-types">Additional Input Types</a></li>
      <ul>
        <li><a href="#search">Search</a></li>
        <li><a href="#telephone-url-and-email-addresses">Telephone, URL and email addresses</a></li>
        <li><a href="#numbers-and-ranges">Numbers and Ranges</a></li>
        <li><a href="#date-and-time">Date and Time</a></li>
        <li><a href="#color">Color</a></li>
      </ul>
      <li><a href="#placeholder-text">Placeholder text</a></li>
      <li><a href="#autofocus">Autofocus</a></li>
      <li><a href="#datalists">Datalists</a></li>
    </ul>
    <li><a href="#span-and-div">Span and Div</a></li>
    <li><a href="#abbreviation-quotations-and-code">Abbreviation, quotations, and code</a></li>
    <li><a href="#meta-tags">Meta tags</a></li>
    <li><a href="#definition-lists">Definition lists</a></li>
    <li><a href="#addresses-definitions-bi-directional-and-editorial">Addresses, Definitions, Bi-directional, and Editorial</a></li>
    <li><a href="#sectioning">Sectioning</a></li>
    <ul>
      <li><a href="#articles">Articles</a></li>
      <li><a href="#headers-and-footers">Headers and Footers</a></li>
      <li><a href="#asides">Asides</a></li>
      <li><a href="#navigation">Navigation</a></li>
    </ul>
    <li><a href="#time-mark-and-presentational">Time, Mark, and Presentational</a></li>
    <ul>
      <li><a href="#time">Time</a></li>
      <li><a href="#mark">Mark</a></li>
      <li><a href="#presentational">Presentational</a></li>
    </ul>
    <li><a href="#conditional-comments">Conditional Comments</a></li>
    <li><a href="#access-keys">Access Keys</a></li>
    <li><a href="#skipping-html">Skipping HTML</a></li>
    <li><a href="#embedded-content-video-audio-and-canvas">Embedded Content: Video, Audio, and Canvas</a></li>
    <ul>
      <li><a href="#fallback-for-video">Fallback for video</a></li>
      <li><a href="#alternative-content">Alternative content</a></li>
      <li><a href="#audio">Audio</a></li>
      <li><a href="#canvas">Canvas</a></li>
    </ul>
  </ul>
</ul>
</nav>
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

Users who do not or cannot use pointing devices can tab through links and, as
such, links should be in a logical tabbing order. The tabindex attribute allows
you to define this order although if the HTML is linear, as it should be, a
logical tabbing order should automatically fall into place.

```html
<ul>
    <li><a href="here.html" tabindex="1">Here</a></li>
    <li><a href="there.html" tabindex="3">There</a></li>
    <li><a href="limbo.html" tabindex="2">Limbo</a></li>
</ul>
```

If you have a link that isn’t self-descriptive, or the link destination could
benefit from being explained in more detail, you can add information to a link
using the title attribute.

```html
<p>I'm really bad at writing link text. <a href="inept.html" title="Why I'm
   rubbish at writing link text: An explanation and an apology.">Click here</a> to
   find out more.</p>
```

e.g
<p>I'm really bad at writing link text. <a href="inept.html" title="Why I'm
   rubbish at writing link text: An explanation and an apology.">Click here</a> to
   find out more.</p>


Images
: `<img src="http://www.htm.com/1.gif" width="120" height="90" alt="HTML Dog">`
The _alt_ text is used for accessibility consideration.

You can also use this:
```html
<figure>
    <img src="obelisk.jpg">
    <figcaption>Tixall Obelisk</figcaption>
</figure>
```
Note that the img element doesn’t need an alt attribute IF the figcaption
(that’s “figure caption”, in case you need it spelling out) does that job.

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

### Columns
```html
<table>
    <colgroup>
        <col>
        <col class="alternative">
        <col>
    </colgroup>
    <tr>
        <td>This</td>
        <td>That</td>
        <td>The other</td>
    </tr>
    <tr>
        <td>Ladybird</td>
        <td>Locust</td>
        <td>Lunch</td>
    </tr>
</table>
```
In this example the styles of the CSS class “alternative” will be applied to
the second column, or the second cell in every row.

You can also use the span attribute in a similar way to rowspan and colspan.
Using it with the colgroup tag will define the number of rows that the column
group will belong to, for example `colgroup span="2"></colgroup>` would group
the first two columns. Using span in the col tag is usually more useful, and
could, for example, be applied to the above example like this:

```html
<table>
    <colgroup>
        <col>
        <col span="2" class="alternative">
    </colgroup>
<!-- and so on -->
```

### Caption
A brief and easy accessibility consideration is to apply a caption to the
table. The caption element defines the caption and should be used straight
after the opening table tag.

```html
<table>
    <caption>Locust mating habits</caption>
<!-- etc. -->
```
A caption will appear above the table by default, although using the CSS
caption-side: bottom will, well, do what you would expect.

### Headers and Footer
`thead`, `tfoot` and `tbody` allow you to separate the table into header, footer and
body, which can be handy when dealing with larger tables.

Whereas `thead` needs to come first, `tfoot` can, in fact come before a `tbody` (and
you can have more than one `tbody`, if it takes your fancy) although browsers
will render the `tfoot` element at the bottom of the table.

```html
<table>
    <thead>
        <tr>
            <td>Header 1</td>
            <td>Header 2</td>
            <td>Header 3</td>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <td>Footer 1</td>
            <td>Footer 2</td>
            <td>Footer 3</td>
        </tr>
    </tfoot>
    <tbody>
        <tr>
            <td>Cell 1</td>
            <td>Cell 2</td>
            <td>Cell 3</td>
        </tr>
        <!-- etc. -->
    </tbody>
</table>
```

e.g
<table>
    <thead>
        <tr>
            <td>Header 1</td>
            <td>Header 2</td>
            <td>Header 3</td>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <td>Footer 1</td>
            <td>Footer 2</td>
            <td>Footer 3</td>
        </tr>
    </tfoot>
    <tbody>
        <tr>
            <td>Cell 1</td>
            <td>Cell 2</td>
            <td>Cell 3</td>
        </tr>
        <!-- etc. -->
    </tbody>
</table>

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

### Accessible Forms
Each form field should have its own explicit label. The label tag sorts this
out, with a for attribute that associates it to a form element.

```html
<form>
    <label for="yourName">Your Name</label>
    <input name="yourName" id="yourName">
    <!-- etc. -->
```
Labels have the added bonus of visual browsers rendering the labels themselves
clickable, putting the focus on the associated form field.

Both name and id attributes are typically required; the name for the form to
handle that field and the id for the label to associate it to.

### Field sets and legends
You can group fields, for example name (first, last, middle, title etc.) or
address (line 1, line 2, county, country, postal code, country etc.) using the
fieldset tag.

```html
<form action="somescript.php" >
    <fieldset>
        <legend>Name</legend>
        <p>First name <input name="firstName"></p>
        <p>Last name <input name="lastName"></p>
    </fieldset>
    <fieldset>
        <legend>Address</legend>
        <p>Address <textarea name="address"></textarea></p>
        <p>Postal code <input name="postcode"></p>
    </fieldset>
    <!-- etc. -->
</form>
```

### Option Groups
The optgroup element groups options in a select box. It requires a label
attribute, the value of which is displayed as a non-selectable pseudo-heading
preceding that group in the drop-down list of visual browsers.

```html
<select name="country">
    <optgroup label="Africa">
        <option value="gam">Gambia</option>
        <option value="mad">Madagascar</option>
        <option value="nam">Namibia</option>
    </optgroup>
    <optgroup label="Europe">
        <option value="fra">France</option>
        <option value="rus">Russia</option>
        <option value="uk">UK</option>
    </optgroup>
    <optgroup label="North America">
        <option value="can">Canada</option>
        <option value="mex">Mexico</option>
        <option value="usa">USA</option>
    </optgroup>
</select>
```
### Navigating Fields
Like links, form fields (and field sets) need to be navigated to without the
use of a pointing device, such as a mouse. The same methods used in links to
make this task easier can be used on form elements - tab stops and access keys.

```html
<input name="firstName" accesskey="f" tabindex="1">
```

### Additional Input Types

#### Search
Used for a search query text box, this performs exactly as a standard text input
should.

```html
<input type="search" name="search">
```

The main intention of the inclusion of this input type in the HTML5
specification is one of style. As well as making your HTML clearer, you can also
target this element with a CSS attribute selector:

```css
input[type=search] { background: url(magnifyingglass.png) right no-repeat)  }
```

#### Telephone, URL and email addresses
```html
<input type="tel" name="telephone_number">
<input type="url" name="web_address">
<input type="email" name="email_address">
```

You can use the :valid and :invalid CSS3 pseudo classes to style these fields
depending on whether their content is considered valid.

```css
input[type=email]:valid { background: green }
input[type=email]:invalid { background: red }
```
#### Numbers and Ranges
A simple text box that also allows a user to directly type in a number, or
cycle through numbers (usually using an up and down arrow to the side of the
field), can be achieved with type="number".

```html
<input type="number" name="quantity" step="2" min="20" max="30">
```
You can use the :valid and :invalid pseudo classes in relation to this, too. If
the user were to type “12”, for example, that would be invalid, because it
isn’t between 20 and 30. If they typed “23” that would also be invalid because
it isn’t a multiple of 2.

An alternative to the digits-in-a-text-box approach can be achieved using
type="range". By default, this should be displayed as a horizontal bar with a
slider in the middle of it. The user can then adjust the slider left and right,
the far left resulting in a value of “0” and the far right a value of “100”.
This range can be adjusted using the min and max attributes.

```html
<input type="range" name="temperature" min="15" max="25" step="0.5" value="18.5">
```

#### Date and Time

    type="datetime"
    type="date"
    type="month"
    type="week"
    type="time"
    type="datetime-local"

_step_, _min_, and _max_ attributes can be used with dates and times, too, as
can the CSS pseudo classes to style according to validity.

#### Color
Finally, type="color" is designed to allow a user to select a color, sending a
six-digit hex code as its value.

```html
<input name="color" type="color" value="#ff8800">
```

### Placeholder text
The placeholder attribute can be used with text input fields (and their
text-like cousins, such as type="email" and type="number") as well as textarea
elements. It is intended as a hint, rather than a label, for which a label
element should still be used.

```html
<label for="email_address">Email address</label>
<input type="email" placeholder="you@somewhere.com" name="email_address" id="email_address">
```

### Autofocus
You might want focus to land on a form field when a page loads. If you think of
a search engine, for example, when you land on its home page you don’t normally
need to click on the search box to start typing - you can do so straight away
because it already has focus. The autofocus attribute is a quick way to achieve
this effect.

```html
<input name="query" autofocus>
```

### Datalists

A data list takes the form of a list of suggestions that accompanies a text
field:

```html
<input name="country" list="country_name">
<datalist id="country_name">
    <option value="Afghanistan">
    <option value="Albania">
    <option value="Algeria">
    <option value="Andorra">
    <option value="Armenia">
    <option value="Australia">
    <option value="Austria">
    <option value="Azerbaijan">
    <!-- etc. -->
</datalist>
```

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

## Sectioning
Whereas _div_ elements can be used to contain sections, used primarily as
scaffolding on which to hang CSS, they don’t hold a great deal of meaning.
Sectioning involves a handful of tags that can be used to define specific parts
of a page, such as articles, headers, footers, and navigation.

### Articles
An _article_ element can be used to mark up a standalone section of content. This
could be used just once, if you think of a blog post as an article, for example,
or a number of times, if you imagine replicating a traditional newspaper page
with numerous articles.

A _section_ element represents a more general section and could be used to split
up an article, or to represent chapters, for example.

```html
<article>
    <section id="intro">
        <p>[An introduction]</p>
    </section>
    <section id="main_content">
        <p>[Content]</p>
    </section>
    <section id="related">
        <ul>
            <li><a href="that.html">That related article</a></li>
            <li><a href="this.html">This related article</a></li>
        </ul>
    </section>
</article>
```

The HTML5 specifications suggest that you can use h1 elements at the start of
each section, which would become a sub-heading of anything preceding that
section (so, in the example above, if you had an h1 immediately following the
opening article tag, an h1 immediately after an opening section tag would be a
sub-heading of that initial h1). This screws backwards compatibility, however,
and any user agents (including screen readers) that don’t understand this won’t
apply properly structured heading levels. We suggest sticking to the headings
levels you would use if you didn’t use sections (so h1, followed by h2, etc,
regardless of the sectioning). This doesn’t break anything or detract from the
meaning or semantics.

### Headers and Footers
_header_ and _footer_ provide further specialized, self-descriptive, sections.

```html
<body>
<article>
    <header>
        <h1>Alternatively&hellip;</h1>
        <p>[An introduction]</p>
    </header>
    <section id="main_content">
        <p>[Content]</p>
    </section>
    <footer>
        <p>[End notes]</p>
    </footer>
</article>
<footer>
    <p>[Copyright bumf]</p>
</footer>
</body>
```

### Asides
An aside can be used to represent content that is related the content
surrounding it.

```html
<section id="main_content">
    <h1>Tixall</h1>
    <p>[All about Tixall]</p>
    <aside>
        <h2>Tixall Obelisk</h2>
        <p>[A short note about Tixall Obelisk]</p>
    </aside>
    <p>[Maybe a bit more about Tixall]</p>
</section>
```

### Navigation
```html
<nav id="main_nav">
    <ul>
        <li><a href="/tutorials/">Tutorials</a></li>
        <li><a href="/reference/">Reference</a></li>
        <li><a href="/articles/">Articles</a></li>
        <li><a href="/about/">About us</a></li>
    </ul>
</nav>
```
## Time, Mark, and Presentational

### Time
The text sandwiched in the middle of the opening and closing tag can be any
format of date of time - the whole precise lot, or just one part, such as a day.
It is made more helpful, however, by the datetime attribute, the value of which
should be a machine-readable date and/or time.

```html
<p>Written by Doctor Who on <time datetime="2052-11-21">Thursday 21st November
2052</time>.</p>
```
e.g
<p>Written by Doctor Who on <time datetime="2052-11-21">Thursday 21st November
2052</time>.</p>

Valid datetime values can take the format of a year-month-day date (as above),
of as a “fuzzy” date, such as “2052-11”, of a time, such as “09:30” (always
using a 24-hour clock) or a combination, such as “2052-11-21 09:30”. This can
also accommodate time zones and durations.

If the textual content of the time element is already machine readable, you
don’t need the datetime attribute but it is required if it isn’t.

### Mark
Text can be highlighted, as if with a marker pen, using mark:

```html
<p>He wants to play with his <mark>Legos</mark></p>
```
e.g
<p>He wants to play with his <mark>Legos</mark></p>

### Presentational
`<hr>`
: thematic break between paragraphs

`<small>`
: small print

`<s>`
: strikethrough

`<u>`
: underlined? unarticulated

`<i>`
: italic, alternate voice

`<b>`
: bold

`<sub>`, `<sup>`
: subscript and superscript


## Conditional Comments
Conditional comments, which are nothing more than simple HTML comments that IE
(up to version 9) happens to take a peep at, are used to throw a chunk of HTML
at these browsers and only these browsers.

```html
<!--[if IE gt 6]>… for IE versions greater than 6
<!--[if IE gte 8]>… for IE versions greater than or equal to than 8
<!--[if IE lt 7]>… for IE versions less than 7
<!--[if IE lte 7]>… for IE versions less than or equal to 7
```

## Access Keys
Access keys allow easier navigation by assigning a keyboard shortcut to a link
(which will usually gain focus when the user presses “Alt” or “Ctrl” + the
access key).

```html
<a href="somepage.html" accesskey="s">Some page</a>
```

## Skipping HTML
To aid tabbing, you can supply links that allow users to jump over chunks of
your web page.

```html
<a href="#content">Skip to content</a>
```

## Embedded Content: Video, Audio, and Canvas

Video
: `<video src="kitties.mp4" controls></video>`
or
`<video src="kitties.mp4" width="300"
        height="200" loop muted autoplay controls></video>`

You can specify a placeholder image, which will be displayed before the video
is played, with the poster attribute.

```html
<video src="kitties.mp4" poster="fluffy.jpg" controls></video>
```

### Fallback for video
```html
<video src="kitties.mp4" controls>
    <img src="hahahaha.jpg" alt="Hilarious cat and caption saying 'soz'.">
</video>
```

### Alternative content
As already noted, it’s not only compatibility with the tag we need to worry
about, but also compatibility with the source video itself. Luckily, more than
one video source file can be offered up with the source element along with
indications of the requirements of the file in the value of the type attribute.
The browser will then take the first one it’s happy with.

```html
<video controls>
    <source src="kitties.mp4" type="video/mp4; codecs='avc1, mp4a'">
    <source src="kitties.webm" type="video/webm; codecs='vp8.0, vorbis'">
    <p>Browser no likey HTML 5.</p>
</video>
```

Here, a browser should figure out if it can handle the “video/mp4” MIME type
and if it has the stated codec to decipher it. If it doesn’t, it should move on
to the next and try again with the details set out in the second source
element.

### Audio
```html
<audio src="meow_mix.mp3" controls>
    Your stupid browser doesn't support HTML 5 audio.
</audio>
```
Alternative content can also be defined in exactly the same way as with the
video and source tags.

### Canvas
A major addition to HTML5 is the canvas element. It is designed to provide a
canvas onto which JavaScript can be used to paint all manner of dynamic images
such as graphs, animated sprites, or daft cat pictures.

```html
<canvas id="wittykitty" width="800" height="450">
    <!-- Fall-back content here, just like with video and audio -->
</canvas>
```
