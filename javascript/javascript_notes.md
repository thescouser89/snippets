# Javascript Notes

## Where to put your script
```html
<script src="script.js"></script>
```

## Variables
```javascript
var surname = prompt("Ohai!");
```

You declare a variable with `var`.

```javascript
var age = 20;
var str = "Hello";
```

## Equality
```javascript
15.6 === 15.7

15.7 !== 15.8
```
It evaluates to _true_ of _false_.

## Conditionals
Conditionals are the same as in Java.

## Looping
Same as in Java.

## Functions
To call a function:

```javascript
doSomething();
```

To create a function:

```javascript
var add = function(a, b) {
    return a + b;
};
```

## Objects
```javascript
var jedi = {
    name: "yoda",
    age: 53,
    talk: function() { alert('haha'); }
}

jedi.name;
jedi.age;
jedi.talk();

jedi.name = "haha";
```

### Nested object
```javascript
var person = {
    age: 122
};

person.name = {
    first: "jeanne",
    last: "Calment"
}
```

```javascript
var dog = {};

dog.bark = function() { alert("woof!"); }
```

## Arrays
```javascript
var list = ['haha', 'hoho', 'hihi'];

list[1];

list.length;

list.push('hohohoh');

list.pop();
```

## DOM
DOM stands for _Document Object Model_.

HTML is an XML-like structure in that the elements form a structure of parents’
nodes with children, like the branches of a tree. There is one root element
(html) with branches like head and body, each with their own branches. For this
reason, the DOM is also called the DOM tree.

## Getting an element

### By Id
```javascript
var pageHeader = document.getElementById('page-header');
```
The pageHeader element can then be manipulated - its size and color can be
changed, and other code can be declared to handle the element being clicked on
or hovered over. It’s supported in pretty much all the browsers you need to
worry about.

### By TagName
```javascript
document.getElementsByTagName('p');
```

This returns a Nodelist, which is an array of DOM elements.

### By ClassName
`document.getElementsByClassName` returns the same kind of NodeList as
getElementsByTagName, except that you pass a class name to be matched, not a tag
name.

### By CSS selector
A couple of new methods are available in modern browsers that make selecting
elements easier by allowing the use of CSS selectors. They are
`document.querySelector` and `document.querySelectorAll`.

```javascript
var pageHeader = document.querySelector('#header');
var buttons = document.querySelectorAll(.btn);
```

querySelector, like getElementById, returns only one element whereas
querySelectorAll returns a NodeList. If multiple elements match the selector you
pass to querySelector, only the first will be returned.

## Events and Callbacks
```javascript
var handleClick = function (event) {
        // do something!

};
var button = document.querySelector('#big-button');
button.addEventListener('click', handleClick);
```
addEventListener is a method found on all DOM elements. Here it’s being called
on an element saved in the button variable. The first argument is a string - the
name of the event to listen for. Here’s it’s click - that’s a click of the mouse
or a tap of the finger. The second is the callback function - here it’s
handleClick.

Here’s an example event you might see into a click event callback like
handleClick.

```Javascript
{
    offsetX: 74,
    offsetY: 10,
    pageX: 154,
    pageY: 576,
    screenX: 154,
    screenY: 489,
    target: h2,
    timeStamp: 1363131952985,
    type: "click",
    x: 154,
    y: 395
}
```

## AJAX
Eh, use JQuery :)

## JSON
```javascript
{ "name": "Yoda", age: 894, "lightsaber" : { "color": "green"  } }
```

To convert to and from JSON, use the `stringify` and `parse` command
respectively.

```javascript
var jsonString = JSON.stringify({
    make: "McLaren",
    model: "MP4-12C",
    miles: 5023
});
```

```javascript
var car = JSON.parse(jsonString);

car.model = "P1";
```

## JQuery
```javascript
$('.btn').click(function () {
        // do something
});
```

This code attaches a click handler to all elements with a class of btn. This
selector syntax is core to jQuery.

To add JQuery,
```html
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
```

### DOM API

