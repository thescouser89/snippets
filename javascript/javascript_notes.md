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
In the example below $('.note') selects all the elements with a class of note on
the page and then we set the background of all of the note boxes to red and
their heights to 100px.

```javascript
$('.note').css('background', 'red'}).height(100);
```

jQuery uses a really neat chainable syntax that allows code like the above. This
works because, for any kind of “setting” method, jQuery returns the same thing
as the selector function (“$”) does: $ is a function that returns a jQuery
wrapper around an element. .css is a method of that jQuery wrapper and it too
returns the same wrapper. .height sets the height (duh) of the element selected,
and of course there’s an equivalent for width.

#### Getters and Setters
In the above example we used .css and .height to set the value of the element
but these methods are also getters. Calling .height without any value returns
the current element’s height and calling .css with just a CSS property name
retrieves the property’s value.

```javascript
var currentHeight = $('.note').height(),
    currentColor = $('.note').css('color');
```

If you’ve got more than one element selected (you have lots of note elements,
say) a getter will retrieve the value for the first of them.

#### Context
It’s sometimes useful to limit the area of the DOM from which an element can be
selected. The area of the DOM used is also known as a different context.

To tell jQuery which area you want to select from you pass a second argument
that can be a DOM element, a string selector (selecting an element that jQuery
will find and use) or a jQuery object. jQuery will only search within this
context for your selector.

Here’s an example. Notice that the variables that are used to store jQuery
objects begin with a dollar. This a convention to help you and readers of your
code understand that it’s a jQuery object being saved.

```javascript
var $header = $('header'),
    $headerBoxes = $('.note', header);
```

### AJAX
$.ajax is the main method, allowing you to manually construct your AJAX request
- the others are shortcuts to common configurations, like getting data or
posting it.

```javascript
$.ajax({
    url: '/data.json',
    method: 'GET',
    success: function (data) {
        console.log(data);
    }
});
```

```javascript
$.get('/data.json', function (data) {
    console.log(data);
});
```
You can also provide an error callback, which will let you know if something
goes wrong and the server can’t be reached:
```javascript
$.get('/data.json', function (data) {
    console.log(data);
}).fail(function () {
    // Uh oh, something went wrong
});
```

Sending data to a server is just as easy, using the $.post method. The second
argument is the data to be sent - it can be almost anything except a function:
jQuery will figure out how to send it for you. How convenient!

```javascript
$.post('/save', { username: 'tom' }, function (data) {
    console.log(data);
}).fail(function () {
    // Uh oh, something went wrong
});
```
Of course, if you want more control over how data is sent, use $.ajax to set
the request up manually.

```javascript
$.ajax({
    url: '/save',
    method: 'POST',
    data: { username: 'tom' },
    success: function (data) {
        console.log(data);
    }),
    error: function () {
        // Uh oh, something went wrong
    }
});
```

## DOMContentLoaded
Sometimes you will want to run JavaScript only when the DOM is loaded and ready
(but before stylesheets are fully loaded) - for example, to move elements to a
different location in the page, or create new ones. We can do this in pure
JavaScript (although this will not work in all browsers):

[Done in jquery]
```javascript
var doSomething = function() {}

$(document).ready(doSomething);
// or
$(doSomething);
```

In other situations it’s better to wait for the page to fully load - that is,
when all stylesheets and images have been downloaded.
```javascript
$(window).load(doSomething);
```

### Type Checking
```javascript
$.isArray([1, 2, 3]);
$.isFunction(function () { });
$.isNumeric(10);
$.isPlainObject({ name: 'Tom' });
```

## Object Oriented Code
A powerful tool available to you when building applications using objects is
called inheritance. This is where an object inherits properties and methods
from another object. An object can alter the properties and methods it inherits
and add additional properties and methods too.

So, for example, you could create a moose object that inherits behavior from a
mammal object. The moose could alter the mammal’s furriness, for example. You
could then create a pangolin object that also inherits from a mammal. But, of
course, pangolins aren’t furry, and they might have a different scaliness
property.

JavaScript uses prototypal inheritance. This means that, when an object
inherits from another, the parent object is known as the child’s prototype.

There are many ways to achieve inheritance in JavaScript. The most commonly
used is the constructor pattern. In this pattern, a function called a
constructor is used to create new objects. Constructors are used in combination
with the new keyword to create objects.

```javascript
var Person = function (name) {
    this.name = name;
};

var tom = new Person('tom');
```

This produces an object like this:
```javascript
{
    name: "Tom"
}
```

In the constructor pattern you manually create the object from which the new
objects will inherit by adding properties and methods to the prototype property
of the constructor function. Like this:
```javascript
Person.prototype.say = function (words) {
    alert(this.name + ' says "' + words + '"');
};
```

Now, objects created from the constructor will have the say method.
```javascript
var tom = new Person("tom");
tom.say("Hello");
```

## Creating Elements
Here’s an example that creates a div, adds some text to it and appends it as
the last element in the body:

```javascript
var div = document.createElement('div');
div.textContent = "Sup, y'all?";
div.setAttribute('class', 'note');
document.body.appendChild(div);
```
In fact, all elements have the appendChild method, so having done the above
it’s possible to do the following:

```javascript
var span = document.createElement('span');
span.textContent = "Hello!";
div.appendChild(span);
```
The span will be added to the end of the div element.

## Removing an element
Removing elements is just as fun. Each DOM element has a property that’s
actually the DOM element’s parent. To remove an element, you call the
removeChild method of the parent, passing the child element you want to remove.
Something like this:

```javascript
div.parentNode.removeChild(div);
```

## Creating with jQuery
```javascript
var div = $('<div/>').text("Sup, y'all?").appendTo(document.body);
$('<span/>').text('Hello!').appendTo(div);
```

## Canvas
Canvas is a new DOM API for drawing on a 2- or 3-dimensional (you guessed it)
canvas. What follows just looks at the 2D version, but the 3D technology is
called WebGL and there are some incredible things being done with it.

The first thing to know is that canvas is a new element in the HTML 5
specification. To begin drawing on the canvas, you grab hold of it and retrieve
a particular context - either 2d or webgl:

```javascript
var canvas = document.querySelector('canvas'),
    ctx = canvas.getContext('2d');
```
From there you can begin drawing, filling and stroking shapes and text on the
canvas. Here’s an example that draws a simple square on a canvas.

```html
<canvas></canvas>

<script>
    var canvas = document.querySelector('canvas'),
        ctx = canvas.getContext('2d');
    ctx.fillRect(10, 10, 10, 10);
</script>
```

## Errors and Exception
```javascript
try {
    JSON.parse("a"); // Produces a SyntaxError
} catch (error) {
    // Handle the error
    alert(error.message);
}
```

#### Creating errors
```javascript
throw new Error("I hungry. Fridge empty.");
```

## Regular Expressions
```javascript
var regex = /^[a-z\s]+$/;

var lowerCaseString = 'some characters';

if (lowerCaseString.match(regex)) {
    alert('Yes, all lowercase');
}

var text = "Everything and nothing.";
text = text.replace(/(every|no)thing/gi, "something");
```
## Closures
```javascript
var add = function (a) {
    return function (b) {
        return a + b;
    };
};
var addFive = add(5);
alert(addFive(10));
```
## Backbone
Backbone.js gives structure to web applications by providing models with
key-value binding and custom events, collections with a rich API of enumerable
functions, views with declarative event handling, and connects it all to your
existing API over a RESTful JSON interface.

Models are where you keep your data, and in Backbone they are special
JavaScript objects created from a Backbone’s built-in Model, optionally
extended by you to add functionality. Making a Model looks something like this: 

```javascript
var jedi = new Backbone.Model({
    name: 'Yoda',
    age: 874
});
```
You can then connect this model up to a View that displays it to the user, via
a template. The template is just HTML with special tags or other syntax used to
indicate where the model’s data should go.

```javascript
var jediView = new Backbone.View({
     model: jedi,
    tagName: 'div',
    jediTpl: _.template($('#jedi-template').html()),
     render: function () {
          this.$el.html(this.jediTpl(this.model.toJSON())));
          return this;
     }
});

jediView.$el.appendTo('body');
jediView.render();
```
A template, often kept in a script element with a type of “template”, contains
the HTML that the view should use. For the above example, it might look
something like this:

```javascript
<script type="template" id="jedi-template">
     <h1><%- name %></h1>
     <h2><%- age %></h2>
</script>
```

## Angular js
AngularJS is an open-source client-side JavaScript framework that uses HTML as
its templating language. It’s notable for it’s philosophy that declarative
programming is better than imperative programming for wiring up user interfaces
and creating modular components.

Angular is MVC but it works quite differently from Backbone.

Templates and views in Angular are analogous, and are just regular HTML with
some added sugar. In fact, you can put together a (very) simple Angular app
without a single line of JavaScript:

```html
<input ng-model="name">

<h1>Hello {{ name }}</h1>
```
The ng-model attribute on the input element connects the value of the input to
a model called "name". Angular creates this model for us; it doesn’t need to be
declared elsewhere. Then, in the h1, we bind to the value of the "name" model.
When you update the input, the h1 will update too.

When you want to build something useful in Angular, you use a controller, which
is just a JavaScript function:

```javascript
var AppCtrl = function ($scope) {
    $scope.name = "Yoda";
};
```
A controller has a scope, which is an area of DOM it has access to. Giving a
controller a scope looks like this:

```javascript
<div ng-controller="AppCtrl">
    <input ng-model="name">
     <h1>Hello {{ name }}</h1>
</div>
```

A model exists within a controller’s scope, so in the above example the "name"
model would be set to "Yoda" by default, but the input would update the model
and the h1 as you typed.

You’ll notice the $scope variable that the controller takes as an argument, but
that seems to come from nowhere. This is injected into the controller using a
system called dependency injection. It’s a complex area, but is a useful tool
for building modular apps.
