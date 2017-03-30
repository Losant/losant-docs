# Experience Endpoints

An Experience Endpoint is a combination of an HTTP method and a route that, when invoked by an HTTP request, can fire a [workflow](/workflows/overview/). That workflow should then generate and issue a response to the request.

## Viewing Experience Endpoints

![Experience Endpoints](/images/experiences/endpoints-list.png "Experience Endpoints")

Endpoints are listed within the "Endpoints" tab of your application's "Experience" subsection. There is also a list of Endpoints on the Experience overview page, sorted by most times invoked in the last 24 hours.

Click an endpoint's route in the list to view its configuration, make

## Adding an Experience Endpoint

From the Endpoints list page, click "Add Endpoint" in the top right corner. This will take you to a page where the new endpoint can be configured.

![Add Endpoint](/images/experiences/add-endpoint.png "Add Endpoint")

## Endpoint Configuration

Configuring an endpoint takes a few required fields, each of which has its own unique properties.

### Method

This is the [HTTP method](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods) the request should match. It is certainly possible to have one path handle multiple HTTP methods, but each method must be configured as a separate endpoint. Currently, we support five different methods:

*   **GET** requests are typically used for retrieving existing resources. A GET request should be repeatable without changing the state of your application and should return the same response body across requests, assuming the underlying data does not change between requests.
*   **POST** requests allow for a payload to be sent with the request body. Though POST requests are typically used for creating new resources, they can also be used for complex data queries that require more configuration than can be conveyed in route parameters.
*   **PATCH** requests also allow for a payload body; these requests are typically used to merge changes into an existing resource.
*   **DELETE** requests delete resources from your application.
*   **OPTIONS** requests are typically sent by web browsers prior to making a [cross-origin request](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS). If you have the "Enable Default CORS Settings" box checked in your Experience Settings, it should not be necessary to set up any OPTIONS requests. However, you may still create your own OPTIONS routes, and any requests matching those routes will override the default settings handled by Losant.

![Endpoint Method and Route](/images/experiences/endpoint-method-route.png "Endpoint Method and Route")

### Route

The route is the [URL path](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_URL), or the part after your Experience's domain. If your Experience's domain is `https://my-custom-slug.onlosant.com`, the route is the part that comes after the `.com`. It always starts with a slash `/` and may contain a series of static and parameter segments separated by more slashes.

There are a number of rules to consider when building your routes:

*   **A single route may only be used once per method.** However. a route of `/my-route` can be set up with a GET method for one endpoint and a POST method for another endpoint, and both are valid.
*   **Routes are matched by order of specificity.** The more specific a route, the earlier in the process it is checked when a request comes in. The first route that matches the path in the HTTP request will be invoked. Losant takes care of ordering the routes by specificity for you, based on the rules outlined here.
*   **Routes can contain string literals, path parameters and wildcards.** For example, given the route `/devices/{deviceId}/{attribute?}` ...
    * `devices` is a **string literal**, which is a static route parameter. String literals always take priority over the other parts of a route, meaning `/users/danny` will match before `/users/{name}` if "danny" is included in the `name` spot.
    * `{deviceId}` is a **required path parameter**. If a request is made to `/devices/` without a `{deviceId}` after the trailing slash, the request will fail (unless you have also specified a `/devices` route matching that method).
    * `{attribute?}` is an **optional path parameter**; a request to `/devices/123` and `/devices/123/temp` will both succeed and will both invoke the same endpoint, but the latter will include `{"attribute": "temp"}` as part of the payload passed to your workflow.
*   **Routes must not conflict with each other.** The most common example of routes conflicting is with the use of path parameters at the same priority level; for example, a route of `/{deviceId}` and `/{userId}` will conflict because, behind the scenes, the router does not know if the value in that part of the path is a device ID or a user ID. For this reason, it is a good idea to start your routes with a descriptive string, such as `/devices/{deviceId}` and `/users/{userId}`. If you attempt to create a route that conflicts with another route, you will be alerted of the error.
*   **Routes can contain wildcards.** Wildcards must be used with care, as they will match any request. A typical use case for a wildcard is if you want to create your own `404 Not Found` HTTP response; in that case, you would configure a route of `/{var*}`, where `var` is whatever the user entered after the first slash in their custom Experience domain.

![Endpoint Access Control](/images/experiences/endpoint-access-control.png "Endpoint Access Control")

### Access Control

Endpoint access – the ability of a user to invoke an endpoint with an HTTP request – can be limited a couple different ways ...

*   **All public users** means that anybody, regardless of if they have an Experience User account within your application, no matter if they are currently signed in to their account, can access the endpoint. Public endpoints can be used to allow the retrieval of nonsensitive data; they are also essential to allowing users to sign in to your Experience, as the authentication endpoint must be available to non-signed-in users.
*   **Any authenticated user** endpoints can be invoked by any of your Experience Users when they are signed in. Their authentication token can be included in the request one of three different ways ...
    * A **query parameter** added to the URL (e.g. `https://my-custom-slug.onlosant.com/my-user?authorization=[my-token]`)
    * An **Authorization HTTP header** with the value `Bearer [my-token]`
    * A **Cookie HTTP header**, if you set a cookie in the user's browser when they originally authenticated
*  **Only users who are in the following groups...** limits access to signed-in users who are a member of any one of the specified [Experience Groups](/experiences/groups). This is useful for building routes that have special privileges (such as resource editing permissions or Experience administration) that you do not want to provide to your normal population of users. To add a group to the endpoint, select the radio button next to the label and begin typing one or more group names into the input. You may also create new groups directly from this interface.

### Other Properties

There are a couple additional properties to set on each endpoint:

![Other Endpoint Props](/images/experiences/endpoint-other-props.png "Other Endpoint Props")

*   **Enabled**: Whether this endpoint should accept HTTP requests and issue responses. If the endpoint is not enabled, Losant will automatically issue a response of `404 Not Found - {"error": "No endpoint found for route"}`.
*   **Description**: A simple description of the endpoint. This is for internal use only; it will never be visible to Experience Users.

## Testing Endpoints

One of the more popular request builders is [curl](https://curl.haxx.se/), a CLI for sending HTTP requests. If you are familiar with curl, chances are you already know how to build requests and test your endpoints.

![Postman](/images/experiences/endpoints-postman.png "Postman")

If a command line interface isn't your thing, one of the better (and free) HTTP request builders is Google Chrome's [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en). The application includes a GUI for building requests for any HTTP method, including payload bodies in JSON format, setting route parameters, defining headers, and everything else you need to test your endpoints.

## Deleting Endpoints

An endpoint can be deleted by clicking the "Delete" icon next to any endpoint on the list page, or by clicking the "Delete" button in the footer of an endpoint's edit page.
