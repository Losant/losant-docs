# Forgot Password

In this tutorial, we'll build a flow allowing an experience user to reset his/her forgotten password. We'll follow a standard forgot password flow found on the web:

1. The user requests to reset their password by providing his/her email address.
1. Soon after, the user receives an email with a generated link to reset the password.
1. After clicking the provided link, the user supplies his/her email address again along with a new password.
1. If the email matches the token in the provided link, the user's password is changed to the new one he/she provided.

![Forgot Password Overview](/images/experiences/walkthrough/views/forgot-password/forgot-password-overview.png "Forgot Password Overview")

## Create the Endpoints

We'll be adding four endpoints, all of which will be hit by a user going through the password reset flow. From your experience overview page, click "Endpoints" in the left column, then click "Add Endpoint" in the top right corner.

![Add Endpoint](/images/experiences/walkthrough/views/user-registration/add-endpoint.png "Add Endpoint")

<h3 id="get-forgot-password" style="text-transform: none">GET /forgot-password</h3>

This endpoint is responsible for handling requests to view the "Forgot Password" page. Here we will simply render a form for collecting the user's email address. From the "New Endpoint" page ...

1. Leave the `Method` set as `GET`.
1. Set the `Route` to `/forgot-password`.
1. Change the `Access Control` to `All public users`.

Save the route, then return to the endpoints list page and click "Add Endpoint" to add the next route.

<h3 id="post-forgot-password" style="text-transform: none">POST /forgot-password</h3>

This endpoint is responsible for handling submissions of the "Forgot Password" form. From the "New Endpoint" page ...

1. Set the `Method` to `POST`.
1. Set the `Route` to `/forgot-password`.
1. Change the `Access Control` to `All public users`.

Remember to save the route, and then create the next endpoint.

<h3 id="get-reset-password" style="text-transform: none">GET /reset-password</h3>

This endpoint is responsible for handling requests to view the "Reset Password" page, which is where an experience user lands after clicking the reset link in his/her email. From the "New Endpoint" page ...

1. Leave the `Method` set as `GET`.
1. Set the `Route` to `/reset-password`.
1. Change the `Access Control` to `All public users`.

<h3 id="post-reset-password" style="text-transform: none">POST /reset-password</h3>

Finally, this endpoint is responsible for handling submissions of the form on the "Reset Password" page, which collects the user's email address and a new password. This is the last step before the password is actually reset.

1. Set the `Method` to `POST`.
1. Set the `Route` to `/reset-password`.
1. Change the `Access Control` to `All public users`.

Save the route, then return to the endpoints list page and click "Add Endpoint" to add the next route.

## Create the Views

Now that all the endpoints have been created, let's move on to creating our new views. We'll be creating two new pages: one for requesting a password reset, and one for fulfilling the password reset request. Click "Views" in the left column to return to your Experience Views list.

![Add Page](/images/experiences/walkthrough/views/user-registration/add-page.png "Add Page")

<h3 id="page-forgot-password" style="text-transform: none"><span style="text-transform: uppercase">Page:</span> Forgot Password</h3>

First we'll create a new page to render when the `/forgot-password` endpoint is requested. From here, users can enter their account email address and request a password change. Click "Views" in the left column to return to your Experience Views list, then click the "Add" button in the "Pages" list.

1. `Name` the page `Forgot Password`.
1. Add a description if you would like; the field is optional and does not affect the page as it is presented to your experience users.
1. Select your [previously created layout](/experiences/walkthrough/views/page-layout/) for the page's `Layout`.
1. Choose `Custom` for the `Page Type`.
1. Copy **[this snippet](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/forgot-password/page-forgot-password.hbs)** and paste it for the page's `Content`.

Once the page is ready, click "Create Page" to save your work.

<h3 id="page-reset-password" style="text-transform: none"><span style="text-transform: uppercase">Page:</span> Reset Password</h3>

Next, we'll add a page for where the actual password reset takes place. This is the page users will see after clicking the password reset link in their email. In it, we ask them to confirm their email address and enter a new password.

1. `Name` this new page `Reset Password`.
1. Select the [same `Layout`](/experiences/walkthrough/views/page-layout/) as for your other pages.
1. Choose `Custom` for the `Page Type`.
1. Copy **[this code](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/forgot-password/page-reset-password.hbs)** to serve as the page's `Content`.

## Set a JWT Secret

The backbone of the password reset flow is a [JSON Web Token](https://jwt.io/) that we will send to the user via email. To encode this token on creation, and to decode it when we are ensuring the user is who they say they are as they are resetting their password, we will need to [sign the token with a secret](https://jwt.io/introduction/), which must be shared between our `/forgot-password` and `/reset-password` endpoints.

![JWT Secret](/images/experiences/walkthrough/views/forgot-password/jwt-secret.png "JWT Secret")

We'll set this secret as an [application global](/applications/overview/#application-globals) so that both of the workflows we create in the next step can access it. To create the global, click "Settings" in your application navigation bar, then click "Globals" in the left column.

1. Set the `Key` as `jwtSecret`.
1. Leave the `Type` as `String`.
1. For the value, enter a random alphanumeric string that is at least 8 characters long. We recommend using this [random string generator](https://www.random.org/strings/) ...
    * Change the number of strings to `Generate` to `1`.
    * Change the length to `16` `characters long`.
    * Make sure to check all three character boxes (`Numeric`, `Uppercase` and `Lowercase`).
    * Click the "Get Strings" button at the bottom of the page, and your random string will be displayed on the next page.
    * Copy the string and set it as the value of your new application global.

![Random.org Generator](/images/experiences/walkthrough/views/forgot-password/random.png "Random.org Generator")

Save your new global, and then move on to creating the workflows.

## Create the Workflows

Though a user most frequently completes a forgot password flow while logged out (i.e. because they cannot log in to their account), we will still allow signed-in users to complete the flow as part of our walkthrough. This is because we are requiring [authenticated users who wish to change their password](/experiences/walkthrough/views/user-profile/#page-change-password) to enter their current password, and it is certainly possible for a user to have forgotten it while still in an active session.

Let's continue with the model we've followed so far by including the GET and POST methods for each route within the same workflow. Click the "Workflows" dropdown at the top of the page, and select "New Workflow".

### Forgot Password Workflow

![Forgot Password Workflow](/images/experiences/walkthrough/views/forgot-password/forgot-password-workflow.png "Forgot Password Workflow")

1. Download the **[workflow template](https://cdn.rawgit.com/Losant/experience-views-walkthrough/fa4d224f/forgot-password/endpoint-forgot-password.flow)**, then [import the file](/workflows/overview/#import-export) `endpoint-forgot-password.flow` as a new workflow.
1. Update each of the [endpoint triggers](/workflows/triggers/endpoint/) to point to the `POST /forgot-password` and `GET /forgot-password` endpoints you created [above](#create-the-endpoints).
1. Update the [endpoint reply nodes](/workflows/outputs/endpoint-reply/) to point to your [`Forgot Password` page](#page-forgot-password).

As a general overview, this workflow handles the following:

* If a user visits `/forgot-password`, we [respond to the request](/workflows/outputs/endpoint-reply/#experience-page-response) with our new `Forgot Password` page.
* When that user submits the `Forgot Password` form, we [validate](/workflows/logic/validate-payload/) that they have submitted all fields correctly and try to [find an experience user](/workflows/experience/get-user/) matching that email.
    * **If we find a user**, we [generate a JWT token](/workflows/logic/jwt-create/) (using the [secret we created earlier](#set-a-jwt-secret)) and [send it via email](/workflows/outputs/email/) to that user. The token expires after 24 hours.
    * **If we do not find a user**, we still [send an email](/workflows/outputs/email/) to the address that was entered, stating that an attempt was made to reset a password for that user but we do not have the user on file. This is helpful to somebody who has multiple email addresses and cannot remember which they used to sign up for your experience account.
* **Whether or not we find a user**, we [reply to the request](/workflows/outputs/endpoint-reply/#experience-page-response) with a confirmation message to the form submitter. This is a security feature that prevents people from spamming your experience with loads of email addresses to determine who has an account.

There is a comment on each workflow node describing its function in more detail.

### Reset Password Workflow

Now let's create a workflow allowing users to reset their passwords after clicking the token they were emailed above.

![Reset Password Workflow](/images/experiences/walkthrough/views/forgot-password/reset-password-workflow.png "Reset Password Workflow")

1. Download the **[workflow template](https://cdn.rawgit.com/Losant/experience-views-walkthrough/fa4d224f/forgot-password/endpoint-reset-password.flow)**, then [import the file](/workflows/overview/#import-export) `endpoint-reset-password.flow` as a new workflow.
1. Update each of the [endpoint triggers](/workflows/triggers/endpoint/) to point to the `POST /reset-password` and `GET /reset-password` endpoints you created [above](#create-the-endpoints).
1. Update the [endpoint reply nodes](/workflows/outputs/endpoint-reply/) to point to your [`Reset Password` page](#page-reset-password).

As a general overview, this workflow handles the following:

* First, we make sure ALL of the following are true; if any of these fail, we redirect the user back to `/forgot-password` with an error message ...
    * There is a token on the request as a query parameter, and it is a valid token (e.g. it hasn't expired).
    * The token maps to a valid experience user, and that user's email address has not changed since the password reset was requested.
    * The user's password has not been reset since the token was issued.
* If this is a GET request (i.e. the user clicked the email link), we render the Reset Password page.
* If the user is submitting the form, we make sure of the following ...
    * The user's new password is a valid password.
    * The email address matches the address in the token.
* If the above checks pass, we [set the user's new password](/workflows/experience/update-user/), [generate a new auth token](/workflows/experience/generate-token/) while logging them out of other sessions, and [redirect to the home page](/workflows/outputs/endpoint-reply/#redirect-response).

There is a comment on each workflow node describing its function in more detail.

## Link to the Feature

A "Forgot Password" link is typically found on an application's ["Log In" page](/experiences/walkthrough/views/log-in-page/), directly beneath the password input. We'll put a link in exactly the same spot, and since we're also allowing signed-in users to kick off the forgot password flow, we'll add the same link on the [in-session "Change Password" page](/experiences/walkthrough/views/user-profile/#page-change-password).

![Forgot Password Link](/images/experiences/walkthrough/views/forgot-password/forgot-password-link.png "Forgot Password Link")

Immediately beneath the user's current password `<input>` tag, add the following line:

```hbs
<span class="help-block"><a tabindex="-1" href="/forgot-password">Forgot password?</a></span>
```

Alternatively, you can download the [updated Log In page](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/forgot-password/page-log-in.hbs) and the [updated Change Password page](https://raw.githubusercontent.com/Losant/experience-views-walkthrough/master/forgot-password/page-change-password.hbs).

## Review

Now it is possible for our experience users to reset their forgotten password, which, combined with our [user registration](/experiences/walkthrough/views/user-registration/) and [user profile management](/experiences/walkthrough/views/user-profile/) walkthroughs, completes the self-serve user management experience.
