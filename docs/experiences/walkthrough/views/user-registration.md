# User Registration

In this step, we'll add the ability for non-registered users to sign up for an account within our application experience.

![Create Account Overview](/images/experiences/walkthrough/views/user-registration/create-account-overview.png "Create Account Overview")

## Create the Endpoints

First, we'll need two new [endpoints](/experiences/endpoints/) to respond to our "Create Account" page requests. From your experience overview page, click "Endpoints" in the left column, then click "Add Endpoint" in the top right corner.

![Add Endpoint](/images/experiences/walkthrough/views/user-registration/add-endpoint.png "Add Endpoint")

<h3 id="get-create-account" style="text-transform: none">GET /create-account</h3>

This endpoint is responsible for handling requests to view the "Create Account" page. From the "New Endpoint" page ...

1. Leave the `Method` set as `GET`.
1. Set the `Route` to `/create-account`.
1. Change the `Access Control` to `All public users`.

Save the route, then return to the endpoints list page and click "Add Endpoint" to add the other route.

<h3 id="post-create-account" style="text-transform: none">POST /create-account</h3>

This endpoint is responsible for handling form submissions from the "Create Account" page.

1. Set the `Method` to `POST`.
1. Set the `Route` to `/create-account`.
1. Change the `Access Control` to `All public users`.

Remember to save the route.

## Create the Views

Now that the routes are configured, it's time to create the views that will power this new functionality. Click "Views" in the left column to return to your Experience Views list.

![Add Page](/images/experiences/walkthrough/views/user-registration/add-page.png "Add Page")

<h3 id="page-create-account" style="text-transform: none"><span style="text-transform: uppercase">Page:</span> Create Account</h3>

First we'll create a new page to render when this endpoint is requested. Click the "Add" button in the "Pages" list.

1. `Name` the page `Create Account`.
1. Add a description if you would like; the field is optional and does not affect the page as it is presented to your experience users.
1. Select your [previously created layout](/experiences/walkthrough/views/page-layout/) for the page's `Layout`.
1. Choose `Custom` for the `Page Type`.
1. Copy **[this snippet](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/user-registration/page-create-account.hbs)** and paste it in for the page's `Content`.

Once the page is ready, click "Create Page" to save your work.

<h3 id="component-profileform" style="text-transform: none"><span style="text-transform: uppercase">Component:</span> profileForm</h3>

We included a new component in our new Create Account page, which will serve as the form for collecting new user data. Create the component by returning to the Experience Views list and clicking the "Add" button in the "Components" list.

1. `Name` the component `profileForm`.
1. Copy **[this snippet](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/user-registration/component-profile-form.hbs)** and paste it for the component's `Content`.

There are a few things to note about our new component:

* We're setting a number of [HTML5 form validation attributes](https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms/Form_validation) on our inputs, including marking all fields as required and setting minimum and maximum lengths. This will block malformed account creation requests before the form ever submits. Not all browsers support this functionality, so we must also check these values within our workflow.
* There is an instance of our "errorAlert" component at the top of this component, which we will use to render an error should account creation fail.
* In the event that account creation does fail, we will repopulate as many fields as we have data for, except the user's new password.

## Create the Workflow

Now, similar to how we did for our [login page](/experiences/walkthrough/views/log-in-page/), let's create a single workflow for handling both GET and POST requests to our `/create-account` route. Click the "Workflows" dropdown at the top of the page, and select "New Workflow".

![Add Workflow](/images/experiences/walkthrough/views/user-registration/add-workflow.png "Add Workflow")

1. `Name` the workflow `Endpoint /create-account` and click the "Create Workflow" button.
1. [Download the workflow template](https://cdn.rawgit.com/Losant/experience-views-walkthrough/d35d69fa/user-registration/endpoint-create-account.flow), then [import the file](/workflows/overview/#import-export) `endpoint-create-account.flow` into your new workflow.
1. Update each of the [endpoint triggers](/workflows/triggers/endpoint/) to point to the `POST /create-account` and `GET /create-account` you created [above](#create-the-endpoints).
1. Update the [endpoint reply nodes](/workflows/outputs/endpoint-reply/) to point to your [`Create Account` page](#page-create-account).

![Create Account Workflow](/images/experiences/walkthrough/views/user-registration/create-account-workflow.png "Create Account Workflow")

As a general overview, this workflow handles the following:

* If a user visits `/create-account`, we [respond to the request](/workflows/outputs/endpoint-reply/#experience-page-response) with our new `Create Account` page – unless the user is already logged in, in which case they are [redirected](/workflows/outputs/endpoint-reply/#redirect-response) to our experience [Home page](/experiences/walkthrough/views/home-page/).
* When that user submits the `Create Account` form, we [validate](/workflows/logic/validate-payload/) that they have submitted all fields correctly. Then, we check to make sure we do not already have an experience user with the same email address already tied to the application. If either of these checks fail, we re-render the `Create Account` page with an error message.
* If [account creation](/workflows/experience/create-user/) is successful, we [generate an auth token](/workflows/experience/generate-token/), set it as a [cookie](/workflows/outputs/endpoint-reply/#cookies) and [redirect the user](/workflows/outputs/endpoint-reply/#redirect-response) to our experience [home page](/experiences/walkthrough/views/home-page/).

There is a comment on each workflow node describing its function in more detail.

## Link to the Feature

Finally, let's give our experience visitors a way to reach our new "Create Account" page by updating our navigation.

![Create Account Links](/images/experiences/walkthrough/views/user-registration/create-account-links.png "Create Account Links")

<h3 id="page-edits-log-in" style="text-transform: none"><span style="text-transform: uppercase">Page Edits:</span> Log In</h3>

First, let's edit our ["Log In" page](/experiences/walkthrough/views/log-in-page/) to add a section that will serve as a lead-in to account creation. Copy **[this snippet](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/user-registration/page-log-in.hbs)** and use it to overwrite our current "Log In" page content.

We've added these few lines just above the closing `</form>` tag. This renders the call to action below our submit button.

```hbs
<hr>
<p style="text-align:center">Don't have an account?</p>
<p style="text-align:center"><a href="/create-account" class="btn btn-lg btn-link">Sign Up Now</a></p>
```

<h3 id="component-edits-userindicator" style="text-transform: none"><span style="text-transform: uppercase">Component Edits:</span> userIndicator</h3>

Let's also update our site navigation to include a link to the account creation page, but only when the user is not signed in. To do that, we'll add a line to our ["userIndicator" component](/experiences/walkthrough/views/page-layout/). Add the following line immediately after our "Log In" link:

```hbs
<li><a href="/create-account">Create Account</a></li>
```

Alternatively, you can copy **[the full component](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/user-registration/component-user-indicator.hbs)** and paste it as the new content of `userIndicator`.

## Review

This concludes this tutorial, in which we've added the ability for experience visitors to register for an account and start accessing parts of the experience that were previously open only to logged-in visitors. Next, we'll build on top of what we've done here to [allow users to edit their profiles](/experiences/walkthrough/views/user-profile/).
