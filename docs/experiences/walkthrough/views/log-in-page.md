---
description: Follow along as we build a log in page for a Losant Experience.
---

# Part 2 - Log In Page

In the [previous part](/experiences/walkthrough/views/page-layout/) of this walkthrough, you learned how to create a layout. This part covers how to create a log in page that will be rendered in that layout. This page will allow your Experience Users to log in and make authenticated requests to other pages within your experience.

![Log In Page Screenshot](/images/experiences/walkthrough/views/log-in-page/screenshot.png "Log In Page Screenshot")

The URLs that a user can request are called [Experience Endpoints](/experiences/endpoints/). Whenever an endpoint is requested, an [Experience Workflow](/workflows/experience-workflows/) is triggered with that request. That workflow can then reply with data (you're building an API) or with a page. [Pages](/experiences/views/#pages) are the main entry point for your custom experiences.

Let's start by defining two endpoints that will allow users to log in to your experience. The first, `GET /login`, will return the form with the email and password fields. The second, `POST /login`, will accept the credentials from the form, authenticate the user, and set a cookie in their browser for future requests.

You can define endpoints on the "Endpoints" page under the "Experience" main menu item.

![Endpoints](/images/experiences/walkthrough/views/log-in-page/endpoints.png "Endpoints")

Click the "Add" button on the top right of the endpoints list to add the new `GET /login` endpoint.

![Log in Endpoint](/images/experiences/walkthrough/views/log-in-page/login-endpoint.png "Log in Endpoint")

1. Set the `Method` to `GET`.
1. Set the `Route` to `/login`.
1. Change `Access Control` to `All public users`.

The method and route are pretty straightforward. Access control defines who is allowed to request this endpoint. Since this is the login route, this needs to be set to `All public users` because no one is logged in yet.

Click the "Create Endpoint" button to create this endpoint.

Repeat the same process again for the `POST /login` route, instead this time set the `Method` to `POST`. At this point you have two endpoints defined.

![Endpoint List](/images/experiences/walkthrough/views/log-in-page/endpoint-list.png "Endpoint list")

By themselves, endpoints don't do anything until a workflow is triggered when they're requested. The workflow that will power these two endpoints will return login page. For that to happen, we must first create the page.

Under the "Views" tab, click the "Add" button on the top right of the Pages list.

![Add Page](/images/experiences/walkthrough/views/log-in-page/add-page.png "Add Page")

![Page Content](/images/experiences/walkthrough/views/log-in-page/page-content.png "Page Content")

Pages work a lot like the layouts and components you've already seen. Each one requires a name and some content. Unlike the others, however, pages also accept a layout. When this page is requested, this is the layout that it will be rendered into.

The content for this example can be <a href="https://github.com/Losant/experience-views-walkthrough/blob/master/log-in-page/login.hbs" target="_blank">found on GitHub</a>. Copy/paste that into your new page's content. Most of the content in this page is basic Twitter Bootstrap markup. There are, however, a few sections that do require further explanation.

The first line on this example page is using a special [fillSection](/experiences/views/#fillsection-tags) Handlebars helper to replace the description tag in the layout's header.

```html
{{#fillSection "metaDescription"}}This is an example login page for your application experience.{{/fillSection}}
```

[Sections](/experiences/views/#section-helpers) allow you to define areas within a layout that your pages can replace. This example uses a section to allow pages to override the description meta tag in the layout's header.

A little farther down in the page's content, you'll see a new `errorAlert` component.

```html
{{#if pageData.loginFailure}}
  {{component "errorAlert" "Incorrect email or password."}}
{{/if}}
```

Here you see the first use of the `pageData` object on the context. This is the custom data that's added to the context by the workflow that was triggered by the endpoint request. If the email and password were invalid, the workflow sets a `loginFailed` property on the context and returns the page back to the user. This section checks to see if that field is set and displays the `errorAlert` component if it is. We'll go through the workflow later in this section.

The `errorAlert` component is very simple. Create this component using the content provided below. You can also get the content <a href="https://github.com/Losant/experience-views-walkthrough/blob/master/log-in-page/errorAlert.hbs" target="_blank">from GitHub</a>.

```html
<div class="alert alert-danger">
  {{.}}
</div>
```

Similar to the `gaTracking` component from the previous section, the context is being overridden with the passed-in message. This means the `errorAlert` can display the message using the `{{.}}` template, since the entire context is set to the error string.

The rest of the page's content is the actual form that allows the user to enter an email and password, then submit them to the `POST /login` endpoint you defined earlier.

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

This is mostly Twitter Bootstrap boilerplate <a href="https://getbootstrap.com/docs/3.3/css/#forms" target="_blank">form markup</a>. The one thing to notice is the `{{ pageData.email }}` template. The `pageData.email` field is set by the workflow if the login attempt fails so that the email field is still filled in for the user.

At this point we have the endpoints and the page. We now need the workflow that will get triggered by the endpoint requests, which will reply with the page we just created.

First, <a href="https://cdn.rawgit.com/Losant/experience-views-walkthrough/2fdf26db/log-in-page/endpoint-login.flow" target="_blank">download the example workflow</a> and [import it](/workflows/overview/#import-export) as a new experience workflow.

![Workflow](/images/experiences/walkthrough/views/log-in-page/workflow.png "Workflow")

You'll notice that the workflow is disabled. Before you can actually use this workflow, you will need to enable it and configure a few settings in various nodes to use your newly created endpoints and login page.

Click the two [endpoint triggers](/workflows/triggers/endpoint/) at the top and set the `Endpoint Method / Route` to the corresponding endpoints you created earlier.

![Edit Triggers](/images/experiences/walkthrough/views/log-in-page/edit-triggers.png "Edit Triggers")

Next, edit the two [Endpoint Reply nodes](/workflows/outputs/endpoint-reply/) and set the `Page Template` field to your newly created Log In page.

![Edit Replies](/images/experiences/walkthrough/views/log-in-page/edit-replies.png "Edit Replies")

This workflow is being triggered for both the `GET /login` and `POST /login` endpoints. Once triggered, this workflow does the following tasks:

* Checks to see if a user is already logged in. If a user is logged in, the `experience.user` payload path will be automatically filled in with the user's details.
* If a user is logged in, the workflow replies with a redirect to `/`, which is the home page that's created in the next part of this walkthrough.
* If the user is not logged in, the workflow then checks to see if we're handling the `GET` or `POST` request.
* If it's the `GET` request, the workflow replies with the Log In page you just created.
* If it's the `POST` request, the workflow uses the [Authenticate node](/workflows/experience/authenticate/) to check if the email and password provided by the user are valid.
* If the authentication fails, the workflow replies with the Log In page again, but this time it sets the `loginFailure` and `email` fields. These are used to display an error to the user and prepopulate the email field so the user doesn't have to retype it.
* If the authentication succeeds, the user is redirected to the home page. The reply node also sets an `authorization` cookie set to the user's authentication token, which was obtained from the previous Authentication node. The browser will automatically send this cookie with each subsequent request, so Losant can keep the user logged in during their session.

After deploying this workflow, you can now test the page by requesting your `/login` endpoint. If you don't already have an [Experience User](/experiences/users/), feel free to [create one](/experiences/users/#adding-an-experience-user) you can log in with.

After you log in, the above workflow will attempt to redirect you to `/`, which hasn't been defined yet. This means you'll get an error message. In the next part of this workflow, you'll create the home page that's only accessible to authenticated users.

**Continue to [Part 3 - Home Page](/experiences/walkthrough/views/home-page/)**
