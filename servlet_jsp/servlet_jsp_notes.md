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
state.pg 88
