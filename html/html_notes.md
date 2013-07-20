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
