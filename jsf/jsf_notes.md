# JSF notes
login/web/index.xhtml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="" >
<h:head>
    <title>Welcome</title>
</h:head>
<h:body>
    <h:form>
        <h3>Please enter your name and password</h3>
        Name:
        <h:inputText value="#{user.name}"/>

        Pasword:
        <h:inputSecret value="#{user.password}"/>
        <h:commandButton value="Login" action="welcome"/>
```
When the user clicks the "Login" button, the welcome.xhtml file is displayed, as
specified in the action attribute of the h:commandButton tag.

login/web/welcome.xhml
```xml
<h:body>
<h3>Welcome to JSF, #{user.name}!</h3>
</h:body>
```

Ingredients:
- pages that define the login and welcome screens.
- A bean that manages the user data.
- Configuration files web.xml and beans.xml that are needed to keep the
  application server happy

```java
@Named("user")
@SessionScoped
public class UserBean implements Serializable {
    private String name;
    private String password;

    public String getName() {return name;}
    public void setName(String newValue) {name = newValue;}

    public String getPassword() { return password; }
    public void setPassword(String newValue) { password = newValue; }
}
```
Web applications have 2 parts: the presentation layer and the business logic.
The business logic determines the behaviour of the application.

A Java bean is a class that exposes properties and events to a framework, such
as a JSF.

We define a property using the familiar get/set convention.

A managed bean is a Java bean that can be accessed from a JSF page. A managed
bean must have a name and a scope. Session scope means that the bean object is
available for one user across multiple pages.

When the bean name occurs in a JSF page, the JSF implementation locates the
object with that name, or constructs it if it does not yet exist in the
appropriate scope.

Namespace declaration:
```xml
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html">
```
The second line declares the h: prefix for the JSF html tags.

```xml
xmlns:f="http://java.sun.com/jsf/core"
```

## Servlet configuration
in WEB-INF/web.xml
```xml
<servlet>
    <servlet-name>Faces Servlet</servlet-name>
    <servlet-class>javax.faces.webapp.FacesServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>Faces Servlet</servlet-name>
    <url-pattern>/faces/*</url-pattern>
</servlet-mapping>
<welcome-file-list>
    <welcome-file>faces/index.xhtml</welcome-file>
</welcome-file-list>
<context-param>
    <param-name>javax.faces.PROJECT_STAGE</param-name>
    <param-value>Development</param-value>
</context-param>
```

All JSF pages are passed to the Faces servlet that is a part of the JSF
implementation code.

The project stage are Development, UnitTest, SystemTest, and Production.

## Ajax
Restructure our login application so that the Login button makes an AJAX request
instead of submitting the form. Each component that is accessed by the client
code needs an ID, which we declare with the id attribute, like this:
```xml
<h:outputText id="out" value="#{user.greeting}">
```
We also give IDs to the name and password input fields.

```java
public String getGreeting() {
    if (name.length() == 0) return "";
    else return "Welcome to JSF2 + AJAX, " + name + "!";
}
```

```xml
<h:commandButton value="Login">
    <f:ajax execute="name password" render="out" />
</h:commandButton>
```

When the login button is clicked, the form is not submitted. Instead, an Ajax
request is sent to the server.

The execute components are processed exactly as if the form had been submitted.
In particular, their values are sent to the server and the corresponding bean
properties are updated. The render components are processed as if the page had
been displayed. The getGreeting method of the user is called, and its result is
sent to the client and displayed.

```xml
<h:commandButton value="Login" action="#{user.check}"/>
```
When the user clicks the button and the form is submitted to the server, the JSF
implementation invokes the check method of the user bean. That method can ake
arbitrary actions to update the model, and it returns the ID of the next page to
be displayed.

## How it works?
Each tag has an associated tag handler class. When the page is read, the tag
handlers are executed. The JSF tag handlers collaborate with each other to
build a component tree. Each component has a renderer that produces HTML output.


## Managed Beans
JSF uses beans to separate presentation and business logic. JSF pages refer to
bean properties, and the program logic is contained in the bean implementation
code.

In the context of JSF, beans store the state of web pages. Bean creation and
manipulation is under the control of the JSF implementation.

The JSF implementation constructs an object of the class UserBean. The object
stays alive for the duration of the session - that is, for all request that
originate from the same client, lasting until the session is either terminater
explicitely or it times out.

## Backing beans
Sometimes it is convenient to design a bean that contains some or all component
objects of a web form. Such a bean is called a backing bean for the web form.

```java
@ManagedBean(name="quizForm")
@SessionScoped
public class QuizFormBean {
    private UIInput answerComponent;
    private UIOutput scoreComponent;

    public UIInput getAnswerComponent() { return answerComponent; }
    public void setAnswerComponent(UIInput newValue) { answerComponent = newValue; }

    public UIOutput getScoreComponent() { retun scoreComponent; }
    public void setScoreComponent(UIOutput newValue) { scoreComponent = newValue; }
}
```

When you use a backing bean, you need to wire up the components on the form to
those on the bean. You use the binding attribute for this purpose:
```xml
<h:inputText binding="#{quizForm.answerComponent}" />

When the component tree for the form is built, the getAnswerComponent method of
the backing bean is called, but it returns null. As a result, an ouput component
is constructed and installed into the backing bean with a call to setAnswerComponent.
```
## CDI Beans
These beans are bound by conext. CDI uses @Named. Note that session-scoped CDI
beans must implement the Serializable interface.

## Message Bundles
Bundle all message strings in a central location.
Save in in messages.properties file.

You can declare the message bundle in 2 ways. Simplest is to use a file
faces-config.xml:
```xml
...
<resource-bundle>
    <base-name>com.corejsf.messages</base-name>
    <var>msgs</var>
</resource-bundle>
...
```
Second way in page 42.

When you localize a bundle file -> messages_de.properties.

### Messages with variable parts
currentScore=Your current score is {0}

```xml
<h:outputFormat value="#{msgs.currentScore}"
    <f:param value="#{quizBean.score}" />
</h:outputFormat>
```
43
