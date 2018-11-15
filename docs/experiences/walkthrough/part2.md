# Part 2 - User Authentication

In [Part 1](/experiences/walkthrough/part1/) of this guide, we learned how to create users for the lōm mobile application. In this part, we'll learn how those users can log in to the app and authenticate against the lōm API.

<img style="width: 225px; margin: 0 auto; display: block;" src="/images/experiences/walkthrough/part-2/main-screen.jpg" alt="Main Screen" />

All authentication against Experience Endpoints is done using a token. Each token is specific to a user and grants access to any endpoint that you've specified in the [endpoint configuration](/experiences/endpoints/) or the [user group configuration](/experiences/groups/).

The process of logging in is to simply check a user's email and password and return a token if they're valid. That token can then be used to request API endpoints on behalf of that user. Losant automatically authorizes a token against endpoints and will return a [401 (Unauthorized)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/401) error back to the client if the token doesn't allow access to an endpoint.

We will need to create an endpoint and a workflow that does this authentication. First, create a `/auth` endpoint:

![Auth Endpoint](/images/experiences/walkthrough/part-2/create-auth-endpoint.png "Auth Endpoint")

1. Set the `Method` to `POST`.
1. Set the `Route` to `/auth`.
1. Set the description to anything you'd like.
1. Set the `Access Control` to `All public users`.

Next, create an experience workflow that will handle the login requests for that endpoint.

![Auth Workflow Trigger](/images/experiences/walkthrough/part-2/auth-workflow-trigger.png "Auth Workflow Trigger")

Use an [Endpoint](/workflows/triggers/endpoint/) trigger and select the `/auth` endpoint that you created.

![Auth Workflow Authenticate](/images/experiences/walkthrough/part-2/auth-workflow-auth.png "Auth Workflow Authenticate")

Add an [Authenticate](/workflows/experience/authenticate/) node, and configure it as the following:

1. Set the `Email Template` to `{{ data.body.email }}`
1. Set the `Password Template` to `{{ data.body.password }}`
1. Set the `User Result Path` to `data.responseUser`
1. Set the `Token Result Path` to `data.responseToken`

![Auth Workflow 401 Response](/images/experiences/walkthrough/part-2/auth-workflow-401.png "Auth Workflow 401 Response")

Add an [Endpoint Reply](/workflows/outputs/endpoint-reply/) node to the `false` output of the authenticate node, and configure it with the following:

1. Set the `Response Code Template` to `401`.
1. Set the `Response Body Template` to `{ "error": "Unauthorized" }
1. Add a `Content-Type` header with the value `application/json`.`.

![Auth Workflow 200 Response](/images/experiences/walkthrough/part-2/auth-workflow-200.png "Auth Workflow 200 Response")

Add an [Endpoint Reply](/workflows/outputs/endpoint-reply/) node to the `true` output of the authenticate node, and configure it with the following:

1. Set the `Response Code Template` to `200`.
1. Add a `Content-Type` header with the value `application/json`.
1. Set the `Response Body Template` to:

```json
{
  "token": {{jsonEncode data.responseToken}},
  "user": {{jsonEncode data.responseUser}}
}
```

The `/auth` requires the user's email and password to be sent as POST data. It then uses the [Authenticate node](/workflows/experience/authenticate/) to check if an Experience User has an identical email and password. If the authentication fails, a [401 (Unauthorized)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/401) is returned to the client. If the email and password are valid, the token and the user object, both of which are added to the payload by the Authenticate node, are returned to the client.

You can test this by requesting `/auth` using one of the Experience Users you created in Part 1.

```text
curl -H "Content-Type: application/json" -X POST \
  -d '{"email":"test@example.com","password":"my-password"}' \
  https://example.onlosant.com/auth
```

```json
{
  "token": "THE_USER_TOKEN",
  "user": { ... }
}
```

Now whenever a lōm user enters their email and password on the main screen, the client will POST them to `/auth` and obtain a token in order to make authenticated requests against the API.

Using the `/auth` route is the most common way users will authenticate against your API. For convenience, let's also modify the workflow we created in Part 1 to return a token whenever a user is registered. This removes the need to register the user and then make an additional API request to get the user's token.

![Token Workflow](/images/experiences/walkthrough/part-2/token-workflow.png "Token Workflow")

1. Add a [Generate Token node](/workflows/experience/generate-token/) and insert it after the Create User node.
1. Set the `ID or Email Template` to `{{ data.body.email }}`. The Generate Token node works by accepting the ID or email of an existing Experience User and then creates a token for that user.
1. Set the `Result Path` to `data.newUser.token`.

As we saw above, the Authenticate node automatically creates a token, however you can use the Generate Token node to create a token whenever you want. This provides a way to implement custom authentication mechanisms if needed. With this, in addition to the `POST /users` endpoint, whenever a new user is registered, the client will be returned the new user object and its token as the result.

```json
{
  "email": "test@example.com",
  "firstName": "Jane",
  "lastName": "Smith",
  ...
  "token": "THE_USER_TOKEN"
}
```

Requesting authenticated routes is done by providing the token in one of three ways. More details can be found on the [endpoint documentation](/experiences/endpoints/#passing-authorization-tokens).

At this point, the lōm mobile app has everything it needs to successfully register users and allow those users to log in to the app. This concludes Part 2 of the application Experience walkthrough. The next part will describe how devices can be registered and associated with an Experience User.

**[Continue to Part 3](/experiences/walkthrough/part3/)**: Device Registration
