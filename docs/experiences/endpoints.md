# Experience Endpoints

An Experience Endpoint is a combination of an HTTP method and a route that, when invoked by an HTTP request, can fire a [workflow](/workflows/experience-workflows/) or directly respond with an [Experience Page](/experiences/views/). Fired workflows can also generate and issue a response to the request.

## Viewing Experience Endpoints

![Experience Endpoints](/images/experiences/endpoints-list.png "Experience Endpoints")

Endpoints are listed within the "Endpoints" tab of your application's "Experience" subsection.

Click an endpoint's route in the list to view its configuration, make edits or view experience workflows associated with the endpoint.

## Adding an Experience Endpoint

From the Endpoints list page, click "Add" in the upper right of the endpoint list. This will take you to a page where the new endpoint can be configured.

![Add Endpoint](/images/experiences/add-endpoint.png "Add Endpoint")

## Endpoint Configuration

Configuring an endpoint takes a few required fields, each of which has its own unique properties.

### Method

This is the [HTTP method](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods) the request should match. It is possible to have one route handle multiple HTTP methods, but each method must be configured as a separate endpoint. Currently, we support these methods:

* **GET** requests are typically used for retrieving existing resources. A GET request should be repeatable without changing the state of your application and should return the same response body across requests, assuming the underlying data does not change between requests.
* **POST** requests allow for a payload to be sent with the request body. Though POST requests are typically used for creating new resources, they can also be used for complex data queries that require more configuration than can be conveyed in route parameters.
* **PUT** requests also allow for a payload body; these requests are typically used to overwrite an existing resource.
* **PATCH** requests also allow for a payload body; these requests are typically used to merge changes into an existing resource.
* **DELETE** requests should only be used to delete resources from your application.
* **OPTIONS** requests are typically sent by web browsers prior to making a [cross-origin request](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS). If you have the "Enable Default CORS Settings" box checked in your [Experience Settings](/experiences/overview/#editing-experience-settings), it should not be necessary to set up any OPTIONS endpoints. However, you may still create your own OPTIONS routes, and any requests matching those routes will override the default settings handled by Losant.

![Endpoint Method and Route](/images/experiences/endpoint-method-route.png "Endpoint Method and Route")

### Route

The route is the [URL path](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_URL), or the part after your Experience's domain. If your Experience's domain is `https://my-custom-slug.onlosant.com`, the route is the part that comes after the `.com`. It always starts with a slash `/` and may contain a series of static and parameter segments separated by more slashes.

There are a number of rules to consider when building your routes:

* **A single route may only be used once per method.** However, a route of `/my-route` can be set up with a GET method for one endpoint and a POST method for another endpoint, and both are valid.
* **Routes are matched by order of specificity.** The more specific a route, the earlier in the process it is checked when a request comes in. The first route that matches the path in the HTTP request will be invoked. Losant takes care of ordering the routes by specificity for you, based on the rules outlined here.
* **Routes can contain string literals, path parameters and wildcards.** For example, given the route `/devices/{deviceId}/{attribute?}` ...
    * `devices` is a **string literal**, which is a static route parameter. String literals always take priority over the other parts of a route, meaning `/users/danny` will match before `/users/{name}` if "danny" is included in the `name` spot.
    * `{deviceId}` is a **required path parameter**. If a request is made to `/devices/` without a `{deviceId}` after the trailing slash, the request will fail (unless you have also specified a `/devices` route matching that method).
    * `{attribute?}` is an **optional path parameter**; a request to `/devices/123` and `/devices/123/temp` will both succeed and will both invoke the same endpoint, but the latter will include `{"attribute": "temp"}` as part of the payload passed to your workflow.
* **Routes must not conflict with each other.** The most common example of routes conflicting is with the use of path parameters at the same priority level; for example, a route of `/{deviceId}` and `/{userId}` will conflict because, behind the scenes, the router does not know if the value in that part of the path is a device ID or a user ID. For this reason, it is a good idea to start your routes with a descriptive string literal, such as `/devices/{deviceId}` and `/users/{userId}`. If you attempt to create a route that conflicts with another route, you will be alerted of the error.
* **Routes can contain wildcards.** Wildcards must be used with care, as they will match any request. A typical use case for a wildcard is if you want to create your own OPTIONS endpoint, or a custom `404 Not Found` HTTP response; in that case, you would configure a route of `/{var*}`, where `var` is available on the payload with the value of whatever the user entered after the first slash in their custom Experience domain.

### Access Control

Endpoint access – the ability of a specific user to invoke an endpoint with an HTTP request – can be configured a few different ways ...

![Endpoint Access Control](/images/experiences/endpoint-access-control.png "Endpoint Access Control")

* **All public users** means that anybody, regardless of if they have an Experience User account within your application, no matter if they are currently signed in to their account, can access the endpoint. Public endpoints can be used to allow the retrieval of nonsensitive data; they are also essential to allowing users to sign in to your Experience, as the authentication endpoint must be available to non-signed-in users.
* **Any authenticated user** endpoints can be invoked by any of your Experience Users when they are signed in. Their authentication token must be [included in the request](#passing-authorization-tokens).
* **Only users who are in the following groups...** limits access to signed-in users who are a member of any one of the specified [Experience Groups](/experiences/groups/). This is useful for building routes that have special privileges (such as resource editing permissions or Experience administration) that you do not want to provide to your normal population of users. To add a group to the endpoint, select the radio button next to the label and begin typing one or more group names into the input. You may also create new groups directly from this interface. Simply type the name of a group that does not yet exist.

### Reply Types

![Endpoint Reply Type](/images/experiences/endpoint-reply-type.png "Endpoint Reply Type")

Reply Types are static pages or redirects that will be rendered and used to respond to the endpoint. Different reply types can be configured for authenticated and unauthenticated experience users, provided your endpoint's access control is not set to "All public users".

Either Reply Type has the following three options:

* **No Static Reply (use experience workflow to reply)** - the endpoint will be responded to at the end of a workflow that was triggered when this endpoint was requested.
* **Experience Page** - the selected static experience page will be rendered and used as the response. The default status code is dependent on whether this is a response to an authorized user or unauthorized user. For authorized users, the default status code is [200](https://httpstatuses.com/200), and for unauthorized users the default is [401](https://httpstatuses.com/401). However, you can set this to be any valid status code.
* **Redirect** - the endpoint will redirect the user to the another URL. The default status code is dependent on whether this is a response to an authorized user or unauthorized user. For authorized users the default status code is [301](https://httpstatuses.com/301), and for unauthorized users the default is [302](https://httpstatuses.com/302). Redirect Paths are **templatable**.

Workflows with Endpoint Triggers pointing to this endpoint will still run anytime a request hits the endpoint, If any of those workflows respond with an [Endpoint Reply Node](/workflows/outputs/endpoint-reply/), **the static reply will take priority over the workflow response**.

The following is an example of the context data that you can access in your redirect template or experience page. It is slightly different than the payload passed when rendering in a workflow.

```javascript
{
  time, // the time of the request
  application, // object containing the application name and ID
  experience: {
    user, // object containing info on the user who made the request (if available)
    endpoint, // object containing info on the endpoint config
    page, // object containing info on the page config
    layout, // object containing info on the layout config,
    version // the experience version for this request
  },
  globals, // key/value mapping of any global variables from the application
  request: {
    path, // the actual request path
    method, // request method (e.g. get, post, patch, delete)
    headers, // object with header names as keys and their values mapped to them
    cookies // object with cookie names as keys and their values mapped to them
  }
}
```

### Other Properties

There are a couple additional properties to set on each endpoint:

![Other Endpoint Props](/images/experiences/endpoint-other-props.png "Other Endpoint Props")

* **Enabled**: Whether this endpoint should accept HTTP requests and issue responses. If the endpoint is not enabled, Losant will automatically issue a response of `404 Not Found - {"error": "No endpoint found for route"}`.
* **Description**: A simple description of the endpoint. This is for internal use only; it will never be visible to Experience Users.

## Endpoints and Workflows

Every endpoint can be powered by a [Losant Experience Workflow](/workflows/experience-workflows/) built by you. The workflow is initiated by an [Endpoint Trigger node](/workflows/triggers/endpoint/) configured to match your endpoint's method and route. From there, you can use any nodes within the workflow editor to parse your user's request, issue a response using an [Endpoint Reply node](/workflows/outputs/endpoint-reply/), and take auxiliary actions (such as [sending data](/workflows/data/http/) to a third party or issuing alerts via [email](/workflows/outputs/email/) or [SMS](/workflows/outputs/sms/)).

![Endpoint Workflow List](/images/experiences/endpoint-workflow-list.png "Endpoint Workflow List")

At the bottom of an endpoint's edit page is a list of all experience workflows that contain an Endpoint Trigger Node that matches that endpoint's method and route. If no such workflows exist, you have the option of creating a starter experience workflow, which will contain an [Endpoint Trigger node](/workflows/triggers/endpoint/), an [Endpoint Reply node](/workflows/outputs/endpoint-reply/) and a [Debug node](/workflows/outputs/debug/). This serves as a getting started template for configuring your new endpoint; you simply have to fill in the logic between the trigger and the reply.

### Experience User Nodes

There are a number of nodes built specifically for working with your [Experience Users](/experiences/users/). Using these nodes, you can ...

* [Create](/workflows/experience/create-user/), [get](/workflows/experience/get-user/), [update](/workflows/experience/update-user/) or [delete](/workflows/experience/delete-user/) a user
* [Check the authentication credentials](/workflows/experience/authenticate/) of a user
* [Generate a token](/workflows/experience/generate-token/) for a user of your choosing (if, for example, you are building your own system of authentication)
* [Verify a user is a member of an experience group](/workflows/experience/verify-group/)

## Using Endpoints

<div class="clearfix">
  <div style="float: right; width: 200px; margin: 0 0 24px 10px;">
    <img style="border-width: 5px;" src="/images/experiences/endpoint-workflow.png" alt="Endpoint Workflow" />
  </div>
  <p>Using your endpoints is as simple as issuing HTTP requests. When a request is sent to your custom domain, the HTTP method and path are compared against your existing endpoints, and the first one that returns a match fires any workflows with an <a href="/workflows/triggers/endpoint/">Endpoint Trigger node</a> for that endpoint. If your workflow includes an <a href="/workflows/outputs/endpoint-reply/">Endpoint Reply node</a> (and it most definitely should), that request will then receive a response as generated by your workflow.</p>
</div>

### Passing Authorization Tokens

Once you retrieve an authorization token for an Experience User, that token can be appended to any subsequent HTTP requests that [require authorization](#access-control) one of three different ways:

* A **query parameter** added to the URL (e.g. `https://my-custom-slug.onlosant.com/my-user?authorization=[my-token]`)
* An **Authorization HTTP header** with the value `Bearer [my-token]`
* A **Cookie HTTP header** in the format of `authorization=[my-token]` (you can [set a cookie](/workflows/outputs/endpoint-reply/#cookies) in the user's browser when they authenticate)

### Testing Endpoints

One of the more popular tools for issuing HTTP requests is [curl](https://curl.haxx.se/). If you are familiar with curl, chances are you already know how to build requests and test your endpoints.

![Postman](/images/experiences/endpoints-postman.png "Postman")

If a command line interface isn't your thing, one of the better (and free) HTTP request builders is Google Chrome's [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en). The application includes a GUI for building requests for any HTTP method, sending payload bodies, setting route parameters, defining headers, and everything else you need to test your endpoints.

## Handling CORS Requests

Beneath the list of experience endpoints is a toggler for enabling default Cross-Origin Resource Sharing settings. If enabled, [OPTIONS requests](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/OPTIONS) emitted by web browsers sending [asynchronous requests](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/Synchronous_and_Asynchronous_Requests) directly to your endpoints will automatically receive an appropriate response. Disabling this checkbox will cause asynchronous requests to your endpoints to fail; enabling it is less dangerous, but it would allow [cross-origin requests](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS) to any endpoint for which you have not set up an OPTIONS route. By default, the checkbox is selected.

![Default CORS Setting](/images/experiences/default-cors-setting.png "Default CORS Setting")

The setting is version-specific and, like other experience version resources, cannot be changed in any version other than "develop".

## Deleting Endpoints

An endpoint can be deleted by clicking the "Delete" icon next to any endpoint on the list page, or by clicking the "Delete" button in the footer of an endpoint's edit page.

![Delete Endpoint](/images/experiences/delete-endpoint.png "Delete Endpoint")

When deleting an endpoint, you also have the option of deleting any [experience workflows](/workflows/experience-workflows/) triggered by that endpoint. Note that this action deletes **any experience workflow with an [Endpoint Trigger node](/workflows/triggers/endpoint/) matching this endpoint**. If you wish to save your workflows and change out their triggers, or if the workflows are triggered by multiple conditions and you wish to retain them, you should leave this option unchecked.
