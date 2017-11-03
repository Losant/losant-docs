# Part 1 - User Registration

Like most mobile applications, lōm starts by asking the user to create an account. This part of the walkthrough covers how Experience Users and Endpoints can be used to accomplish user registration.

<img style="width: 450px; margin: 0 auto; display: block;" src="/images/experiences/walkthrough/part-1/create-account.jpg" alt="Create Account" />

In the lōm mobile app, pressing the "Create Account" button on the lōm main screen takes the user to the "Create Account" screen. This screen asks the user for an email and a password. The client-side code confirms the email is in a proper format and the passwords match. It then performs an Experience API Endpoint request to create the user.

The API for lōm follows a typical REST format. This means we'll use a POST request against the `users` collection to create a new user resource.

To accomplish this ourselves, let's create an Experience Endpoint with this route:

```text
POST /users
```

This new endpoint will accept `email` and `password` as POST data, like so:

```json
{ "email": "user@example.com", "password": "the-provided-password" }
```

To create this endpoint in Losant, the first thing we have to do is create an endpoint within our application Experience.

![Add Route](/images/experiences/walkthrough/part-1/add-route.png "Add Route")

Click the `Experience` tab on the application menu to manage your application's Experience. First-time users will be presented with a guide that will automatically create a basic API. This guide will use some of the auto-generated endpoints, specifically `/auth`, so it's recommended to keep them for now.

On the Experience overview page, you'll see an `Add` button in the top right corner of the endpoints list. Click `Add` to create the new endpoint for user registration.

![POST users endpoint](/images/experiences/walkthrough/part-1/endpoint-post-users.png "POST users endpoint")

1. Set the `Method` to `POST`.
1. Set the `Route` to `/users`.
1. Set the description to anything you'd like.
1. Set the `Access Control` to `All public users`.

Experience endpoints have three authentication options: all public users, any authenticated user, and users that belong to a specific group. Since it's used to originally create the user, this registration route must be publicly available. All routes within lōm, other than account creation and user login, will require authentication.

When done, click the `Create Endpoint` button at the bottom to create this endpoint. You'll now be returned to a list of your endpoints.

![Endpoint list](/images/experiences/walkthrough/part-1/endpoint-list.png "Endpoint list")

At this point,  we have the `/users` endpoint defined, but there's no logic to run when it's requested. If you were to request it now, Losant will automatically return a 404. In order to give this endpoint some intelligence, we have to create a [workflow](/workflows/overview/). All experience endpoints are backed by workflows that contain the [Endpoint trigger node](/workflows/triggers/endpoint/) and [Endpoint Reply node](/workflows/outputs/endpoint-reply/).

Create a new workflow for this endpoint using the main `Workflows` application menu.

![Create Workflow](/images/experiences/walkthrough/part-1/create-workflow.png "Create Workflow")

![Register Users Workflow Details](/images/experiences/walkthrough/part-1/users-workflow-details.png "Register Users Workflow Details")

![Register Users Workflow Blank](/images/experiences/walkthrough/part-1/users-workflow-blank.png "Register Users Workflow Blank")

Now we have an empty workflow that we can use to power our `/users` endpoint. The first step is to add an endpoint trigger to the workflow canvas.

![Register Users Endpoint Trigger](/images/experiences/walkthrough/part-1/users-endpoint-trigger.png "Register Users Endpoint Trigger")

In the trigger's configuration, select the endpoint we just created (i.e. POST /users). This workflow will now run whenever that API endpoint is requested.

For now, let's make a simple workflow that simply returns 200 (OK) whenever anything is requested. We'll also use a [Debug node](/workflows/outputs/debug/) so you can see the format of the data as it comes into the workflow.

Add a [Debug node](/workflow/outputs/debug/) and an [Endpoint Reply node](/workflows/outputs/endpoint-reply/) to the canvas.

![Endpoint Debug](/images/experiences/walkthrough/part-1/endpoint-debug.png "Endpoint Debug")

1. Add a Debug node and connect it to the Endpoint Trigger node.
1. Add an Endpoint Reply node and connect it to the Endpoint Trigger node.
1. In the Endpoint Reply config, set the `Response Code Template` to `200`.
1. In the Endpoint Reply config, set the `Reply Body` to `OK`

Click the `Deploy Workflow` button to deploy this workflow. You can now request this API endpoint using your favorite API tester, like [Postman](https://www.getpostman.com/) or CURL.

```text
curl -H "Content-Type: application/json" -X POST \
  -d '{"email":"test@example.com","password":"my-password"}' \
  https://example.onlosant.com/users
```

Once you make this request, you'll see an entry in the Debug tab with the payload that includes the email and password.

![Endpoint Debug Output](/images/experiences/walkthrough/part-1/endpoint-debug-output.png "Endpoint Debug Output")

From here you can see that the email and password are available on the payload at `data.body.email` and `data.body.password`. Losant automatically hides the values of fields that could be considered sensitive, which is why it doesn't show a value for the password field.

Now that we're receiving an email and password, the first thing we have to do is check to see if the email already exists. If a user exists, this workflow should return a [409 (Conflict)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/409) back to the client.

First, add a [Get User node](/workflows/experience/get-user/) to the workflow and connect it to the endpoint trigger.

![Get User](/images/experiences/walkthrough/part-1/get-user.png "Get User")

1. Set the `ID or Email Template` to `{{ data.body.email }}`. As we saw earlier, this is the location on the payload where the incoming email is available.
1. Set the `Result Path` to `data.existingUser`. This will put the user, if found, back on the payload so we can access it in later steps. If no user is found, this field will be set to `null`.

If the user exists, `data.existingUser` will be something other than `null`. Next, add a [Conditional node](/workflows/logic/conditional/) to check for whether or not an existing user already exists. Connect it to the get user node.

![User Exists Conditional](/images/experiences/walkthrough/part-1/user-exists-conditional.png "User Exists Conditional")

1. Set the `Expression` to `{{ data.existingUser }} === null`. If the expression returns true (the user does not exist), the workflow will take the right path. If the expression is false, the workflow will take the left path.

At this point, we're ready to return the `409 (Conflict)` back to the client if the user already exists. Add an [Endpoint Reply node](/workflows/outputs/endpoint-reply/) and connect it to the left (false) output of the conditional node.

![User Exists Reply](/images/experiences/walkthrough/part-1/user-exists-reply.png "User Exists Reply")

1. Set the `Response Code Template` to `409`.
1. Set the `Reply Body` to `{ "error": "Email already exists." }`.
1. Add a `Content-Type` header with the value `application/json`.

This API will properly check that a user exists and will return an error if it does. You can test this by trying to register "test.user@example.com", which is the auto-generated user that was created as part of your application Experience's first-time setup.

Click the `Deploy Workflow` button to deploy this workflow.

```text
curl -H "Content-Type: application/json" -X POST \
  -d '{"email":"test.user@example.com","password":"my-password"}' \
  https://example.onlosant.com/users
```

If you make this `curl` request, you should receive this response:

```json
{ "error": "Email already exists." }
```

The last thing to do is actually create the user. Add a [Create User node](/workflows/experience/create-user/) and attach it to the right (true) output of the conditional node.

![Create User](/images/experiences/walkthrough/part-1/create-user.png "Create User")

<img style="width: 450px; margin: 0 auto; display: block;" src="/images/experiences/walkthrough/part-1/create-user-result-path.png" alt="Create User Result Path" />

1. Set the `Email Address Template` to `{{ data.body.email }}`.
1. Set the `Password Template` to `{{ data.body.password }}`.
1. Set the `Result Path` to `data.newUser`.

This node will create a new user inside your application Experience. lōm only collects email and password, however, experience users also have built-in fields for first and last names. [User tags](/experiences/users/#user-tags) can be used to store any other information specific to your application's users.

The new user will be put back on the payload at `data.newUser`, so we can return it to the client as the result of this API request. Next, add an [Endpoint Reply node](/workflows/outputs/endpoint-reply/) and connect it to the Create User node.

![Create User Reply](/images/experiences/walkthrough/part-1/create-user-reply.png "Create User Reply")

1. Set the `Response Code Template` to `201`, which is the HTTP status code for "created".
1. Change the `Reply Body` radio to `Payload Path`.
1. Set the `Reply Body` to `data.newUser`.
1. Add a `Content-Type` header with the value `application/json`.

This node will now return the contents of the new user, in JSON format, back to the client as the body of the response.

When done, deploy this workflow using the `Deploy Workflow` button. You can now test this route by attempting to create a new user.

```text
curl -H "Content-Type: application/json" -X POST \
  -d '{"email":"my.awesome.user@example.com","password":"my-password"}' \
  https://example.onlosant.com/users
```

```json
{
  "email": "my.awesome.user@example.com",
  "userTags": { },
  "applicationId": "58e0152c1c3ce300017cc5bf",
  "creationDate": "2017-04-01T22:41:48.442Z",
  "lastUpdated": "2017-04-01T22:41:48.454Z",
  "passwordLastUpdated": "2017-04-01T22:41:48.443Z",
  "experienceUserId": "58e02cac0d1a3b00011f0d81",
  "id": "58e02cac0d1a3b00011f0d81",
  "experienceGroups": [ ]
}
```

Once this route is requested successfully, you'll see the new user in the experience user list.

![User List New User](/images/experiences/walkthrough/part-1/user-list-new-user.png "User List New User")

The next thing we want to do is send our new user a welcome email once they've registered. Add an [Email node](/workflows/outputs/email/) and connect it to the [Endpoint Reply node](/workflows/outputs/endpoint-reply/).

![Welcome Email](/images/experiences/walkthrough/part-1/welcome-email.png "Welcome Email")

1. Set the `To Address Template` to `{{ data.body.email }}`.
1. Set the `From Address Template` to whatever email address you'd like.
1. Set the `Email Subject Template` to whatever you'd like.
1. Set the `Email Body Template` to whatever HTML contents you'd like.

Now whenever a user registers, they'll receive your friendly welcome email. The built-in email node does have a limit of one message per minute. If you plan on registering a bunch of users, you may want to switch to the [SendGrid node](/workflows/outputs/sendgrid/), which will use your own SendGrid account to send as many emails as you'd like.

The very last step is to add some basic input validation on the incoming data. We want to make sure the client did send us an email and password before doing any other work. If a field is missing, this API will return a [400 (Bad Request)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) back to the client. Add a conditional node directly after the endpoint trigger.

![Validate Input](/images/experiences/walkthrough/part-1/validate-input.png "Validate Input")

1. Set the `Expression` to `{{ data.body.email }} && {{ data.body.password }}`. This expression checks that both email and password exist.

You can now connect the right (true) output of the new Condition node to the existing Get User node, which will now only attempt to run the rest of this workflow if the client actually provided an email and password. To reply with an error, add an Endpoint Reply to the left (false) output of the Conditional node.

![Bad Request Reply](/images/experiences/walkthrough/part-1/bad-request-reply.png "Bad Request Reply")

1. Set the `Response Code Template` to `400`.
1. Set the `Reply Body` to `{ "error": "Email and password fields required." }`.

You can now test this endpoint by attempting to register a user with a missing field. Click the `Deploy Workflow` button to deploy this workflow.

```text
curl -H "Content-Type: application/json" -X POST \
  -d '{"password":"my-password"}' \
  https://example.onlosant.com/users
```

```json
{ "error": "Email and password fields required." }
```

This concludes Part 1 of the application experience walkthrough. As of now, lōm has a fully functional user registration endpoint. The next part covers how users will log in once they've registered.

**[Continue to Part 2](/experiences/walkthrough/part2/)**: User Authentication
