# User Profile

In a [previous step](/experiences/walkthrough/views/user-registration/), we added the ability for experience visitors to register for an account. Now, we'll build on the changes we made there and allow our experience users to manage their profiles.

![User Profile Overview](/images/experiences/walkthrough/views/user-profile/user-profile-overview.png "User Profile Overview")

## Create the Endpoints

We'll be adding four endpoints: two for profile management and two for password changing.

![Add Endpoint](/images/experiences/walkthrough/views/user-registration/add-endpoint.png "Add Endpoint")

<h3 id="get-edit-profile" style="text-transform: none">GET /edit-profile</h3>

This endpoint is responsible for handling requests to view the "Edit Profile" page. From the "New Endpoint" page ...

1. Leave the `Method` set as `GET`.
1. Set the `Route` to `/edit-profile`.
1. Change the `Access Control` to `All public users`.

Save the route, then return to the endpoints list page and click "Add Endpoint" to add the next route.

<h3 id="post-edit-profile" style="text-transform: none">POST /edit-profile</h3>

This endpoint is responsible for handling form submissions from the "Edit Profile" page.

1. Set the `Method` to `POST`.
1. Set the `Route` to `/edit-profile`.
1. Change the `Access Control` to `All public users`.

Same as before, save this route and back out to the endpoints list to make another one.

<h3 id="get-change-password" style="text-transform: none">GET /change-password</h3>

This endpoint is responsible for handling requests to view the "Change Password" page.

1. Leave the `Method` set as `GET`.
1. Set the `Route` to `/change-password`.
1. Change the `Access Control` to `All public users`.

<h3 id="post-change-password" style="text-transform: none">POST /change-password</h3>

This endpoint is responsible for handling form submissions from the "Change Password" page.

1. Set the `Method` to `POST`.
1. Set the `Route` to `/change-password`.
1. Change the `Access Control` to `All public users`.

## Create the Views

Now that all the endpoints have been created, let's move on to creating our new views. We'll be creating two new pages; making one new component; and editing a component we created in a previous step.

![Add Page](/images/experiences/walkthrough/views/user-registration/add-page.png "Add Page")

<h3 id="page-edit-profile" style="text-transform: none"><span style="text-transform: uppercase">Page:</span> Edit Profile</h3>

First we'll create a new page to render when the `/edit-profile` endpoint is requested. From here, users can change their name and email address. Click "Views" in the left column to return to your Experience Views list, then click the "Add" button in the "Pages" list.

1. `Name` the page `Edit Profile`.
1. Add a description if you would like; the field is optional and does not affect the page as it is presented to your experience users.
1. Select your [previously created layout](/experiences/walkthrough/views/page-layout/) for the page's `Layout`.
1. Choose `Custom` for the `Page Type`.
1. Copy **[this snippet](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/user-profile/page-edit-profile.hbs)** and paste it for the page's `Content`.

Once the page is ready, click "Create Page" to save your work.

<h3 id="page-change-password" style="text-transform: none"><span style="text-transform: uppercase">Page:</span> Change Password</h3>

Now, we'll add a page where users can change their password. They will have to enter their current password to set a new one. Click "Views" in the left column again to return to the "Views" list, then once again click "Add" in the "Pages" list.

1. `Name` this new page `Change Password`.
1. Select the [same `Layout`](/experiences/walkthrough/views/page-layout/) as for your other pages.
1. Choose `Custom` for the `Page Type`.
1. Copy **[this code](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/user-profile/page-change-password.hbs)** to serve as the page's `Content`.

<h3 id="component-successalert" style="text-transform: none"><span style="text-transform: uppercase">Component:</span> successAlert</h3>

We're referencing a new component in each of our newly created pages. This component is a simple confirmation box for telling the user that his/her profile changes were successful.

Return to the "Views" page one more time, then click the "Add" button in the "Components" list.

1. `Name` the component `successAlert`.
1. Use **[this snippet](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/user-profile/component-success-alert.hbs)** for the component's `Content`.

This component is almost identical to our `errorAlert` component, except it will display in <span style="font-weight: bold; color:#3c763d">friendly green</span> instead of <span style="font-weight: bold; color:#a94442">scary red</span>.

<h3 id="component-profileform" style="text-transform: none"><span style="text-transform: uppercase">Component Edit:</span> profileForm</h3>

Finally, we'll tweak the `profileForm` component we [created for user registration](/experiences/walkthrough/views/user-registration/#component-profileform) so we can reuse the component in our "Edit Profile" page.

1. Navigate to the `profileForm` component from your list of components.
1. Replace its `Content` with **[this snippet](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/user-profile/component-profile-form.hbs)**.

We're making one significant change to the component, which can be seen just above the closing `</form>` tag: If the component is being called from the `/edit-profile` route, we are excluding the password input from the form and changing the text of the submit button. We do this by checking against the current route in the `{{#eq request.path "/create-account"}}` block helper and condionally rendering one bit of content or the other based on the route.

## Create the Workflows

Let's continue with the model we've followed so far by including the GET and POST methods for each route within the same workflow.

### Edit Profile Workflow

Click the "Workflows" dropdown at the top of the page, and select "New Workflow".

![Edit Profile Workflow](/images/experiences/walkthrough/views/user-profile/edit-profile-workflow.png "Edit Profile Workflow")

1. `Name` the workflow `Endpoint /edit-profile` and click the "Create Workflow" button.
1. Download the **[workflow template](https://cdn.rawgit.com/Losant/experience-views-walkthrough/9bc72bcb/user-profile/endpoint-edit-profile.flow)**, then [import the file](/workflows/overview/#import-export) `endpoint-edit-profile.flow` into your new workflow.
1. Update each of the [endpoint triggers](/workflows/triggers/endpoint/) to point to the `POST /edit-profile` and `GET /edit-profile` endpoints you created [above](#create-the-endpoints).
1. Update the [endpoint reply nodes](/workflows/outputs/endpoint-reply/) to point to your [`Edit Profile` page](#page-edit-profile).

As a general overview, this workflow handles the following:

* If a user visits `/edit-profile`, we [respond to the request](/workflows/outputs/endpoint-reply/#experience-page-response) with our new `Edit Profile` page – unless the user is not logged in, in which case we [redirect](/workflows/outputs/endpoint-reply/#redirect-response) them to the [Log In page](/experiences/walkthrough/views/log-in-page/).
* When that user submits the `Edit Profile` form, we [validate](/workflows/logic/validate-payload/) that they have submitted all fields correctly. Then, we attempt to make the update. (It could fail if, for example, the user attempts to change their email address to one that is already registered to another experience user.) If either of these operations fail, we re-render the `Edit Profile` page with an error message.
* If the [user update](/workflows/experience/update-user/) is successful, we [redirect the user](/workflows/outputs/endpoint-reply/#redirect-response) to the same URL with a `success=true` query parameter. The presence of this on the URL tells us if we should show our [`successAlert` component](#component-successalert).

There is a comment on each workflow node describing its function in more detail.

### Change Password Workflow

Now let's create a workflow allowing our logged-in users to update their passwords.

![Change Password Workflow](/images/experiences/walkthrough/views/user-profile/change-password-workflow.png "Change Password Workflow")

1. `Name` the workflow `Endpoint /change-password` and click the "Create Workflow" button.
1. Download the **[workflow template](https://cdn.rawgit.com/Losant/experience-views-walkthrough/d4abbf2a/user-profile/endpoint-change-password.flow)**, then [import the file](/workflows/overview/#import-export) `endpoint-change-password.flow` into your new workflow.
1. Update each of the [endpoint triggers](/workflows/triggers/endpoint/) to point to the `POST /change-password` and `GET /change-password` endpoints you created [above](#create-the-endpoints).
1. Update the [endpoint reply nodes](/workflows/outputs/endpoint-reply/) to point to your [`Change Password` page](#page-change-password).

As a general overview, this workflow handles the following:

* If a user visits `/change-password`, we [respond to the request](/workflows/outputs/endpoint-reply/#experience-page-response) with our new `Change Password` page – unless the user is not logged in, in which case we [redirect](/workflows/outputs/endpoint-reply/#redirect-response) them to the [Log In page](/experiences/walkthrough/views/log-in-page/).
* When that user submits the `Change Password` form, we [validate](/workflows/logic/validate-payload/) that they have submitted valid old and new passwords. Then, we try [authenticating](/workflows/experience/authenticate/) using the old password provided by the user. If any of those checks fail, we re-render the `Change Password` page with an error message.
* If authentication succeeds, we [change the user's password](/workflows/experience/update-user/) and display a confirmation message.

There is a comment on each workflow node describing its function in more detail.

## Link to the Feature

Finally, let's give our experience users a way to reach the features we just completed.

![Edit Profile Links](/images/experiences/walkthrough/views/user-profile/user-profile-links.png "Edit Profile Links")

<h3 id="component-edit-userindicator" style="text-transform: none"><span style="text-transform: uppercase">Component Edit:</span> userIndicator</h3>

Currently, our [`userIndicator` component](/experiences/walkthrough/views/page-layout/) displays a single-item dropdown menu in our layout's top right corner when the user is logged in. Let's add links to our two new features into that menu.

Navigate to the `userIndicator` component from the "Components" list. In the `Content`, immediately above this line ...

```hbs
<li><a href="/logout">Log Out</a></li>
```

...add the following two links:

```hbs
<li><a href="/edit-profile">Edit Profile</a></li>
<li><a href="/change-password">Change Password</a></li>
```

Alternatively, you can copy **[this content](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/user-profile/component-user-indicator.hbs)** and overwrite the entire `userIndicator` component.

Now, a signed-in user can access the `/edit-profile` and `/change-password` links from their contextual menu.

## Review

This concludes this tutorial, in which we've added the ability for experience users to update their profiles and change their passwords.

There are plenty more tutorials to come, so check back often for more lessons on building out your application experiences.
