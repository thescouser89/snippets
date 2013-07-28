# Servlets and JSP

## MIME type
The mime type mentions what kind of content is included in the body.

```
Content-Type: text/html
```
## URL
<protocol><server><port><path><resource><query string>

The resource is the last item in the link. e.g beer1.html

## Server
The web server will delegate the dynamic stuff to a program that knows how to do
it.

e.g CGI program

The web application launches the helper program, the helper app constructs the
brand new page, and sends the HTML back to the server. As far as the web server
is concerned, the HTML from the helper app is a static page.

The helper application is shut down.

Servlets and CGI both play the role of a helper app in the web server.

## Servlets
1. Build the directory tree
2. Write a servlet
3. Create a deployment descriptor named web.xml

## Web App Architecture
When a request comes in, sombody has to instantiate the servlet or at least make
a new thread. That somebody is a web container.

Servlets don't have a main() method. They are under the control of another Java
application called a _Container_.

When a web server app gets a request for a servlet, the server hands the request
not to the servlet itself, but to the container in which the servlet is
_deployed_.

The container provides an easy way for your servlets to talk to your web server.
The container also controls the life and death of your servlets. It takes care
of loading the classes, instantiating and initializing the servlets, invoking
the servlet methods, and making servlet instances eligible for garbage
collection.

The container also automatically creates a new Java thread for every servlet
request it receives.

With a container, you get to use an XML deployment descriptor to configure
security without having to hard-code it into your servlet.

JSP support.

### How it works
The container creates and allocates a thread for the request, and passes the
request and response objects to the servlet thread. The container calls the
servlet's service() method. Depending on the type of request, the service()
method calls either the doGet() or doPost() method.

The doGet() method generates the dynamic page and stuffs the page into the
response object. The thread completes, the container converts the response
object into an HTTP response, sends it back to the client, then deletes the
request and response objects.

```java
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Ch2Servlet extends HttpServlet {
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
                      throws IOException {
        PrintWriter out = response.getWriter();
        java.util.Date today = new java.util.Date();
        out.println(today);
    }
}
```

The mapping of URLs to servlets might be handled in a number of different ways,
and it's one of hte most fundamental issues you'll face as a web app developer.

A servlet has a file path name, a special deployment name (secret internal name
that doesn't have to be the same as the class or file name. It can be the same
as the servlet class name). Finally the servlet has a public URL name, the name
the client knows about.

URL register/registerMe -> EnrollServlet -> SignUpServlet.java

By mapping the name instead of coding the real file and path name, you have the
flexibility of moving things around without having the maintenance nightmare of
tracking down and changing client code that refers to the old location of the
servlet files.

Also, for security reasons, the client won't know how to navigate directly to
the servlet.

### Using the Deployment Descriptor
```xml
<web-app ...>
<servlet>
    <servlet-name>Internal name 1</servlet-name>
    <servlet-class>foo.Servlet1</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>Internal name 1</servlet-name>
    <url-pattern>/Public1</url-pattern>
</servlet-mapping>
```
Besides mapping URLs to actual servlets, you can use the DD to customize other
aspects of your web application including security roles, error pages, tag
libraries etc.

BAD: mixing business logic into a servlet <- you can't reuse the business logic
for some other kind of view.

## MVC
The servlet is the controller, the view is JSP, and the model holds the real
business logic and state. The model knows the rules for getting and updating the
state.

A shopping cart contents and rules for what to do with it would be part of the
Model in the MVC. It's the only part of the system that talks to the database.

The view is responsible for the presentation. It gets the state of the model
from the controller. It's also the part that gets the user input that goes back
to the controller.

The controller takes user input from the request and figures out what it means
to the model. It tells the model to update itself, and makes the new model state
available from the view. (servlet)


A fully-compliant J2EE application server must have both a web container and an
EJB container.


## Time to create and deploy an MVC web app
Build a web application that gives beer advice.

The servlet receives the request, gets infro from the model,, generate the
result page and gives it to the user.

```html
<html><body>
<form method="POST" action="SelectBeer.do">
Color:
<select name="color" size="1">
    <option value="light">light</option>
    <option value="amber">amber</option>
    <option value="brown">brown</option>
    <option value="dark">dark</option>
</select>
<input type="submit">
</form>
</body></html>
```

SelectBeer.do is a logical name, not an actual name. It's simply the name we
want the client to use. We'll use the XML Deployment Descriptor (web.xml) to map
from what the client requests to an actual servlet class.

In web.xml:
```xml
<web-app xmlns="http://java.sun.com/xml/ns/j2ee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee/wep-app_2_4.xsd"
         version="2.4">

<servlet>
    <servlet-name>Ch3 Beer</servlet-name>
    <servlet-class>com.example.web.BeerSelect</servlet-class>
</servlet>

<servlet-mapping>
    <servlet-name>Ch3 Beer</servlet-name>
    <url-pattern>/SelectBeer.do</url-pattern>
</servlet-mapping>

</web-app>
```

Servlet code:
```java
public void doPost (.. request, .. response) throws Exception {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.println("Beer Selection Advice");
    String c = request.getParameter("color");
    BeerExpert be = new BeerExpert();
    List result = be.getBrands(c);

    for (String s : result) {
        out.print("try: " + s);
    }
}
```

Model:
```java
public class BeerExpert {
    public List getBrands(String color) {
        List brands = new ArrayList();
        if (color.equals("amber")) {
            brands.add("Jack Amber");
            brands.add("Red Moose");
        } else {
            brands.add("Jail Pale Ale");
            brands.add("Gout Stout");
        }
        return brands;
    }
}
```

We could use a jsp code (result.jsp):
```xml
<%@ page import="java.util.*" %>
<html>
<body>
<%
    List styles = (List) request.getAttribute("styles");
    for (String s : styles) {
        out.print("try: " + s);
    }
%>
</body>
</html>
```

Servlet code that uses JSP:
```java
...
List result = be.getBrands(c);
requet.setAttribute("styles", result);
RequestDispatcher view = request.getRequestDispatcher("result.jsp");
```

## Being a servlet
The init() method in the servlet will be called when it is instantiated only
once. The service() method is used to handle client requests. It calls doGet()
or doPost(). Then the destroy() method is called when it is cleaned up.

Override init() if you have some initialization code (like a database connection).

It's very unlikely that you will override the service() method.

YOu will always override the doGet() and doPost() methods.

Each request runs in a separate thread. The container runs multiple threads to
process multiple requests to a single servlet.

## ServletConfig
- One ServletConfig object per servlet.
- Use it to pass deploy-time information to the servlet (database)
- Use it to acces the ServletContext
- Parameters are configres in the Deployment Descriptor.

## ServletContext
- One ServletContext per web app
- Use it to access web app parameters (in the DD)
- Use it as a kind of application bulletin-board, where you can put up messages
  that other parts of the application can access
- Use it to get server info

ServletConfig and ServletContext only exit to support your servlet's job of
handling client requests.

If the HTTP metod is a GET, the service() method calls doGet(). If the HTTP
request Method is a POST, the service() method calls doPost().

## Request object
You can get:
- browser info
```java
String client = request.getHeader("User-Agent");
```
- cookies
```java
Cookie[] cookies = request.getCookies();
```
- session
```java
HttpSession session = request.getSession();
```
- HTTP Method of the request
```java
String theMethod = request.getMethod();
```
- InputStream
```java
InputStream input = request.getInputStream();
```

