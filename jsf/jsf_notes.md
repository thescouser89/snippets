# JSF notes
Ingredients:
- pages that define the login and welcome screens.
- A bean that manages the user data.
- Configuration files web.xml and beans.xml that are needed to keep the
  application server happy

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

The URL has to be  http://localhost:8080/login/faces/index.xhtml. This mapping
rules activate the Faces servlet.

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

[ Equivalent to render in rails? ]

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

```xml
currentScore=Your current score is {0,choice,0#zero points|1#one point|2#{0} points}
```

So if the param is 1, then it will print: "Your current score is one point"

Setting the application locale: pg 43

# Bean Scope
- Session scope (@SessionScoped)
- Request scope (@RequestScoped)
- Application scope (@ApplicationScoped)

Request scopes are short-lived. It starts when an HTTP request is submitted and
ends after the response is sent back to the client. A new instance is created
with each request.

Application scopes  persist for the entire duration of the web application. Use
it if a single bean should be shared among all instances of a web application.

If an application scoped bean is marked as eager, then it must be constructed
before the first page of the application is displayed. Use
```java
@ManagedBean(eager=true)
```

Conversation scope ranges over a set of related pages. Provides data persistence
until a set of goals is achieved, without having to store the data for the
entire duration. Use it for persistence if a user opens multiple tabs of the
same page. Both the pages get synchronized. pg 55 for more details.

# Injecting CDI beans
```java
clas EditBean {
    @Inject private UserBean currentUser;
}
```

When the EditBean is constructed, the userBean in the current session is located
and injected.

# Bean Life Cycle Annotations
Using the @PostConstruct and @PreDestroy, you can specify bean methods that are
automatically called just after a bean has been constructed and just before a
bean goes out of scope.

# Navigation
How to configure the navigation of your web application.

When a form is submitted, the web app analyzes the user input and must decide
which JSF page to use for rendering the response. The navigation handler is
responsible for selecting the next JSF page.

Simple example:
```xml
<h:commandButton label="login" action="welcome"/>
```

## Dynamic Navigation
Submitting a login page can be successful or fail. So we have to generate the
outcome dynamically.

```xml
<h:commandButton label="login" action="#{loginController.verifyUser}"
```

```java
String verifyUser() {
    if (...)
        return "success";
    else
        return "failure";
}
```
An action method may return null to indicate that the same view should be
redisplayed.

JSF provides a way to map logical outcomes, such as success and failure, to
actual web pages.

In faces-config.xml
```xml
<navigation-rule>
    <from-view-id>/index.xhtml</from-view-id>
    <navigation-case>
        <from-outcome>success</from-outcome>
        <to-view-id>/welcome.xhtml</to-view-id>
    </navigation-case>
</navigation-rule>
```

## Redirection
Redirect a new view. Without redirection, the original URL is unchanged when the
user moves from the /index.xhtml page to /success.xhtml page.
If you don't use navigation rules, add the string ?faces-redirect=true

```xml
<h:commandButton label="Login" action="welcome?faces-redirect=true"/>
```

Or you can add a navigation-rule:
```xml
<navigation-rule>
    <from-view-id>/index.xhtml</from-view-id>
    <navigation-case>
        <from-outcome>success</from-outcome>
        <to-view-id>/success.xhtml</to-view-id>
        <redirect/>
    </navigation-case>
</navigation-rule>
```

### Redirection and the Flash
To minimize session scope bloat, it makes sense to use request scope as much as
possible. Without the redirect element, you can use request scoped beans for
data that are shown in the next view.

Since with a redirect, the request scoped bean will be deleted, JSF 2 provides a
flash object that can be populated in one request and used in the next.

```java
ExternalContext.getFlash().put("message", "Your password is about to expire");
```

In a JSF page, you reference the Flash object with the flash variable.
```xml
#{flash.message}
```

The expression #{flash.keep.message} yields the value of the message key in the
flash and adds it back for another request scope.

### Restful navigation and bookmarkable urls
Links should be bookmarkable. Pages should be cacheable.

e.g GET request:
http://myserver.com/catalog?item=1729

An item id is supplied as a query parameter. When the request is received, the
parameter value must be transferred to an appropriate bean. You can use view
parameters for this purpose.

```xml
<f:metadata>
<f:viewParam name="item" value="#{catalog.currentItem}"/>
</f:metadata>
```

When the request is processed, the value of the item query parameter is passed
to the setCurrentItem method of the catalog item.

## GET request link
You use the h:button and h:link tags to issue GET requests. h:commandButton and
h:commandLink generate POST requests.

```xml
<h:button value="Skip" outcome-"#{quizBean.skipOutcome}"/>
```
There is an essential difference between the action attribute in h:commandButton
and the outcome attribute in h:button. In the latter, the attribute is evaluated
before the page is rendered; the action attribute is only evaluated if the user
actually clicked on the command button.

### Specifying request parameters
```xml
<h:link outcome="index?q=1" value="Skip"/>
```
or
```xml
<h:link outcome="index?q=#{quizBean.currentProblem + 1}" value="Skip"/>
```

Shortcut to include all view parameters in the query string:

```xml
<h:link outcome="index" includeViewParams="true" value="Skip"/>
```

To override view params:
```xml
<h:link outcome="index" includeViewParams="true" value="Skip">
    <f:param name="q" value="#{quizBean.currentProblem + 1}"/>
</h:link>
```

Redirect link:
```xml
<h:commandLink action="index?faces-redirect=true&amp;includeViewParams=true"
               value="Skip"/>
```

If you specify navigation rules in the XML,
```xml
<redirect include-view-params=true>
    <view-param>
        <name>q</name>
        <value>#{quizBean.currentProblem + 1}</value>
    </view-param>
</redirect>
```
Advanced Navigation rules pg 96


