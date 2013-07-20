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
