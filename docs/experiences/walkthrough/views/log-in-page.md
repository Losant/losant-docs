# Part 1 - Log In Page

In the [previous section](/experiences/walkthrough/views/page-layout/) of this walkthrough, you learned how to create a layout. This section will cover how to create a log in page that will be rendered in that layout. This page will allow your Experience Users to log in and make authenticated requests to other pages within your experience.

![Log In Page Screenshot](/images/experiences/walkthrough/views/log-in-page/screenshot.png "Log In Page Screenshot")

[Pages](/experiences/views/#pages) are the main entry point for your custom experiences. When a user requests a URL from a browser, it's a page, rendered inside a layout, that's returned to them.

The URLs that a user can request are called [Experience Endpoints](/experiences/endpoints/). Whenever an endpoint is requested, a [Workflow](/workflows/overview/) is triggered with that request. That workflow can then reply with data, if you're building an API, or in this case reply with a page.

Let's start by defining two endpoints that will allow users to log in to your experience. The first, `GET /login` will return the form with the email and password fields. The second `POST /login` will accept the credentials from the form, validate them, and authenticate the user.

You can define endpoints on the "Endpoints" tab under the "Experience" main menu item.

![Endpoints](/images/experiences/walkthrough/views/log-in-page/endpoints.png "Endpoints")

Click the "Add Endpoints" button on the top right to add the new `GET /login` endpoint.

![Log in Endpoint](/images/experiences/walkthrough/views/log-in-page/login-endpoint.png "Log in Endpoint")

* Set the `Method` to `GET`.
* Set the `Route` to `/login`.
* Change `Access Control` to `All public users`.

The method and route are pretty straightforward. Access control defines who is allowed to request this endpoint. Since this is the log in route, this needs to be set to `All public users` because no one is logged in yet.

Click the "Create Endpoint" button to create this endpoint.

Repeat the same process again for the `POST /login` route, instead this time set the `method` to `POST`. At this point you have two endpoints defined.

![Endpoint List](/images/experiences/walkthrough/views/log-in-page/endpoint-list.png "Endpoint list")

By themselves, endpoints don't do anything until a workflow is triggered when they're requested. The workflow that will power these two endpoints will be returning our log in page. For that to happen, we must first create the page.

Under the "Views" tab, click the "Add" button on the top right of the Pages list.

![Add Page](/images/experiences/walkthrough/views/log-in-page/add-page.png "Add Page")

![Page Content](/images/experiences/walkthrough/views/log-in-page/page-content.png "Page Content")

Pages work a lot like the layouts and components you've already seen. Each one requires a name and some content. Unlike the others, however, pages also accept a layout. When this page is requested, this is the layout that it will be rendered into.

The content for this example can be <a href="https://github.com/Losant/experience-views-walkthrough/blob/master/log-in-page/login.hbs" target="_blank">found on GitHub</a>. Feel free to copy/paste that into your new page's content. Most of the content in this page is basic Twitter Bootstrap markup. There are, however, a few sections that do require further explanation.

The first line on this example page is using a special [fillSection](/experiences/views/#fillsection-tags) Handlebars helper to replace the description tag in the layout's header.

```html
{{#fillSection "metaDescription"}}This is an example login page for your application experience.{{/fillSection}}
```

Sections allow you to define areas within a layout that your pages can replace. This example uses a section to allow pages to override the description meta tag in the layout's header.

A little farther down in the page's content you'll see the use of a new `errorAlert` component.

```html
{{#if pageData.loginFailure}}
  {{component "errorAlert" "Incorrect email or password."}}
{{/if}}
```

Here you see the first use of the `pageData` object on the context. This is the custom data that's added to the context by the workflow that was triggered by the endpoint request. If the email and password were invalid, the workflow adds `loginFailed = true` to the context and returns the page back to the user. This section checks to see if that field is set and displays the `errorAlert` component if it is. We'll go through the workflow later in this section.

The `errorAlert` component is very simple. Go ahead and create this component now. You can get the content <a href="https://github.com/Losant/experience-views-walkthrough/blob/master/log-in-page/errorAlert.hbs" target="_blank">from GitHub</a> or below.

```html
<div class="alert alert-danger">
  {{.}}
</div>
```

Similar to the `gaTracking` component from the previous section, the context is being overridden with the passed in message. This means the `errorAlert` can display the message using the `{{.}}` template, since the entire context is set to the error string.

The rest of the page's content is the actual form that allows the user to enter an email and password then POST those to the `POST /login` endpoint you defined earlier.

```html
<form method="post">
  <div class="form-group">
    <label for="email">Email address</label>
    <input autofocus required value="{{ pageData.email }}"
      type="email" class="form-control" name="email"
      id="email" placeholder="e.g. test.user@example.com">
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input required minlength="8" maxlength="255"
      type="password" class="form-control" id="password" name="password">
  </div>
  <button type="submit" class="btn btn-success">Sign In</button>
</form>
```

This is mostly Twitter Bootstrap boilerplate <a href="https://getbootstrap.com/docs/3.3/css/#forms" target="_blank">form markup</a>. The one thing to notice is the `{{ pageData.email }}` template. The `pageData.email` field is set by the workflow if the log in fails so that the email field is filled in so the user doesn't have to retype it.

At this point we have the endpoints and the page. We now need the workflow that will get triggered by the endpoint request and reply with the page we just created.

Start by creating an empty workflow using the main "Workflows" application menu.

![Workflow Menu](/images/experiences/walkthrough/views/log-in-page/workflow-menu.png "Workflow Menu")

First, <a href="https://cdn.rawgit.com/Losant/experience-views-walkthrough/2fdf26db/log-in-page/endpoint-login.flow" target="_blank">download the example workflow</a> and [import it](https://docs.losant.com/workflows/overview/#import-export) into your newly created workflow.

![Workflow](/images/experiences/walkthrough/views/log-in-page/workflow.png "Workflow")

You'll notice that some of the imported nodes have error icons. This is because you'll need to configure these for your newly created endpoints and login page.

Click the two triggers at the top and set the `Endpoint Method / Route` to the corresponding endpoints you created earlier.

![Edit Triggers](/images/experiences/walkthrough/views/log-in-page/edit-triggers.png "Edit Triggers")

Next, edit the two Endpoint Reply nodes and set the `Page Template` field to your newly created log in page.

![Edit Replies](/images/experiences/walkthrough/views/log-in-page/edit-replies.png "Edit Replies")

This workflow is being triggered for both the `GET /login` and `POST /login` endpoints. Once triggered, this workflow does the following tasks:

* Checks to see if a user is already logged in. If a user is logged in, the `experience.user` payload path will be automatically filled in with the user's details.
* If a user is logged in, the workflow replies with a redirect to `/`, which is the home page that's created in the next part of this walkthrough.
* If the user is not logged in, the workflow then checks to see if we're handling the `GET` or `POST` request.
* If it's the `GET` request, the workflow replies with the log in page you just created.
* If it's the `POST` request, the workflow uses the [Authenticate node](/workflows/experience/authenticate/) to check to see if the email and password provided by the user are valid.
* If the authentication fails, the workflow replies with the log in page again, but this time sets the `loginFailure` and `email` fields. These are used to display an error to the user and prepopulate the email field so the user doesn't have to retype it.
* If the authentication succeeds, the user is redirected to the home page. The reply node also sets an `authorization` cookie set to the user's authentication token, which was obtained from the previous Authentication node. The browser will automatically send this cookie with each subsequent request, so Losant can keep the user logged in during their session.

After deploying this workflow, you can now test your newly created log in page by requesting your `/login` endpoint. If you don't already have an [Experience User](/experiences/users/), feel free to create one you can log in with.

After you log in, the above workflow will attempt to redirect you to `/`, which hasn't been defined yet. This means you'll get an error message. In the next part of this workflow, you'll create the home page that's only accessibly by authenticated users.

[Continue to Part 3 - Home Page](/experiences/walkthrough/views/home-page/)