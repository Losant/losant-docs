# Losant REST API

Losant is powered by a full REST API that provides access to nearly every feature. The Losant front-end web application itself is built on top of this API, and so almost all the data and functionality in the front end is available through the API itself.  In fact, the front-end uses the open-source <a href="https://github.com/Losant/losant-rest-js" target="_blank">losant-rest-js</a> JavaScript client to communicate with the Losant API. If JavaScript is not your language of choice, no need to worry! We have easy to use libraries for a number of different languages:

*   JavaScript with <a href="https://github.com/Losant/losant-rest-js" target="_blank">losant-rest-js</a>  
Available in Node Package Manager: `npm install losant-rest`  
<br/>
*   Python with <a href="https://github.com/Losant/losant-rest-python" target="_blank">losant-rest-python</a>  
Available in the Python Package Index: `pip install losant-rest`  
<br/>
*   Ruby with <a href="https://github.com/Losant/losant-rest-ruby" target="_blank">losant-rest-ruby</a>  
Available in RubyGems: `gem install losant_rest`

Of course, if you are working in a language not listed above, the API is reasonably easy to use directly - if your language has a good HTTP request library and a good JSON library, you should be able to make any API request you need to using the documentation here.

All of the documentation and examples here are aimed at making direct HTTP requests against the Losant API, using curl examples whenever possible.  If you plan on using one of the wrapping libraries listed above, the documentation in those repositories will be a much more useful place to learn how to use the particular library.

## API Overview
<small><br/></small>
### Content & Encoding

The Losant API is uses JSON for almost all requests and responses - all request bodies should be JSON encoded, and all responses will be encoded JSON, even in the case of errors.  So every request should have both the `Content-Type` and `Accept` headers set to `application/json`.

### Authenticating a Request

Most endpoints on the Losant API require authenticating as either a user or device.  This is done by passing a Bearer Authorization token in the `Authorization` header field for the request (e.g. `"Authorization": "Bearer your-api-token-goes-here"`).

### Obtaining an Authorization Token

You can obtain an Authorization Token to use to make authenticated requests by calling one of the [Auth](/rest-api/auth/) endpoints.  There are two main endpoints, one for [authenticating as a user](/rest-api/auth/#post-user), and one for [authenticating as a device](/rest-api/auth/#post-device).  The JSON response for either endpoint has a `token` field, which is the authorization token you should use in the Authorization header in subsequent requests that you want to perform as that user or device.

### User-Based Authentication

When authenticated as a user, any API calls have full access to the Losant system. Any applications or dashboards owned by that user can be accessed or modified, and any applications or dashboards that are owned by an organization that the user user is a part of can be accessed (and potentially modified depending on the user's permissions within that organization). Essentially, when authenticated as a user through the API, anything that the user is allowed to do in the normal Losant web interface can be done through the API.

The following shows a sequence of cURL commands for authenticating as a user and using the resulting token to get a list of devices for an application:

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{ "email": "example@losant.com", "password": "your_password" }' \
    https://api.losant.com/auth/user

# Example user authentication result
# {
#   "token": "a user auth token string",
#   "userId": "theUserId"
# }

curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer a user auth token string' \
    -X GET \
    https://api.losant.com/applications/anAppId/devices

# Example device listing result
# {
#   "count": 1,
#   "items": [ {
#     "deviceClass": "standalone",
#     "connectionInfo": { "connected": 0, "time": "2016-06-01T17:16:02.324Z" },
#     "name": "Ruby Client Testing",
#     "creationDate": "2016-01-31T17:58:57.541Z",
#     "lastUpdated": "2016-05-31T14:47:32.288Z",
#     "id": "myDevId",
#     "attributes": [
#       { "name": "string", "dataType": "string" },
#       { "name": "number", "dataType": "number" },
#       { "name": "boolean", "dataType": "boolean" }
#     ],
#     "description": "",
#     "_etag": "\"174-u7/3je4oFyaKGePPbcHLqw\"",
#     "deviceId": "myDevId",
#     "tags": [],
#     "applicationId": "myAppId",
#     "_type": "device",
#     "_links": {
#       "application": { "href": "/applications/myAppId" },
#       "devices": { "href": "/applications/myAppId/devices" },
#       "self": { "href": "/applications/myAppId/devices/myDevId" }
#      }
#   } ],
#   "applicationId": "myAppId",
#   "perPage": 100,
#   "page": 0,
#   "sortField": "name",
#   "sortDirection": "asc",
#   "totalCount": 1,
#   "_type": "devices",
#   "_links": {
#     "application": { "href": "/applications/myAppId" },
#     "self": { "href": "/applications/myAppId/devices" }
#   }
# }
```
<small><br/></small>
### Device-Based Authentication

Unlike authenticating as a user, a device authenticated against the API receives a very limited set of permissions.  Any authenticated device can read information about itself ([Device Get](/rest-api/device/#get), [Devices Get](/rest-api/devices/#get)),
send state information about itself to Losant ([Device Post State](/rest-api/device/#post-state)), query historical state information for itself ([Device Get State](/rest-api/device/#get-state), [Data](/rest-api/data/)), and query historical commands that were sent to it ([Device Get Commands](/rest-api/device/#get-command)).  If the device is a gateway device, it will also be allowed to send state to Losant on behalf of any of its peripheral devices.

If the application access key used to authenticate the device is scoped to more than just the one device, though, the scope of the API permissions also expands.  The device will have permission to query data about the other devices scoped to that key (general info, historical state, and historical commands).  It will also have permission to send commands to those other devices ([Device Post Command](/rest-api/device/#post-command), [Devices Post Command](/rest-api/devices/#post-command)).  If the access key used is unscoped (i.e., the access restriction is set to "All Devices"), a device authenticated with that key will have these read and command permissions for all devices in the application.  A device *never* has access to anything outside of the application it is a member of.

The following shows a sequence of cURL commands for authenticating as a device and using the resulting token to publish state as that device:

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{ "deviceId": "myDeviceId", "key": "my_app_access_key", "secret": "my_app_access_secret"}' \
    https://api.losant.com/auth/device

# Example device authentication result
# {
#   "applicationId": "myAppId",
#   "token": "a device auth token string",
#   "restricted": false,
#   "deviceId": "myDeviceId",
#   "deviceClass": "standalone"
# }

curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer a device auth token string' \
    -X POST \
    -d '{ "data": { "temperature": 68.2 } }' \
    https://api.losant.com/applications/myAppId/devices/myDeviceId/state

# Example device state push result
# { "success": true }
```
<small><br/></small>
### Resources

Each of the following is a resource on the Losant API, wrapping up functionality
for a particular item or collection. See each resource documentation page for the
particular actions that can be performed on that resource.

*   [Application Key](/rest-api/application-key)  
Contains all the actions that can be performed against a single
[Application Key](/applications/access-keys/) -
for instance, getting info on a single key or revoking a key.

*   [Application Keys](/rest-api/application-keys)  
Contains all of the actions that can be performed against the collection of
[Application Keys](/applications/access-keys/) belonging
to an Application - such as listing all keys or creating a new key.

*   [Application](/rest-api/application)  
Contains all of the actions that can be performed against a single
[Application](/applications/overview/),
which include things like getting info on an application or
modifying an application.

*   [Applications](/rest-api/applications)  
Contains all of the actions that can be performed against the set of
[Applications](/applications/overview/) that the
currently authenticated user has access to - such as
listing the applications or creating a new application.

*   [Auth](/rest-api/auth)  
Contains the actions used for authenticating against the api, either as a
user or as a device.  The result of authentication calls contain the auth_token
needed for authenticated calls - see the examples for more details.

*   [Dashboard](/rest-api/dashboard)  
Contains all of the actions that can be performed against a single
[Dashboard](/dashboards/overview/),
which include things like getting info on a dashboard or
modifying a dashboard.

*   [Dashboards](/rest-api/dashboards)  
Contains all of the actions that can be performed against the set of
[Dashboards](/dashboards/overview/) that the
currently authenticated user has access to - such as
listing the dashboards or creating a new dashboard.

*   [Data](/rest-api/data)  
Contains the actions for querying against historical Device
data across an Application.

*   [Device](/rest-api/device)  
Contains all the actions that can be performed against a single
[Device](/devices/overview/) -
for instance, getting info on a single device or reporting the current
state of a device.

*   [Devices](/rest-api/devices)  
Contains all of the actions that can be performed against the collection of
[Devices](/devices/overview/) belonging
to an Application - such as listing all devices or sending a command to a set
of devices.

*   [Device Recipe](/rest-api/device-recipe)  
Contains all the actions that can be performed against a single
[Device Recipe](/devices/device-recipes/), which
include things like removing a device recipe or creating a device
from a device recipe.

*   [Device Recipes](/rest-api/device-recipes)  
Contains all the actions that can be performed against the collection of
[Device Recipes](/devices/device-recipes/) belonging
to an Application - such as listing recipes or creating a new recipe.

*   [Event](/rest-api/event)  
Contains all the actions that can be performed against a single
[Event](/events/overview/), such as commenting on
or changing the state of an event.

*   [Events](/rest-api/events)  
Contains all the actions that can be performed against the collection of
[Events](/events/overview/) belonging
to an Application - such as listing open events or creating a new event.

*   [Workflow](/rest-api/flow)  
Contains all the actions that can be performed against a single
[Workflow](/workflows/overview/), such as enabling or
disabling a workflow, or triggering a virtual button in the workflow.

*   [Workflows](/rest-api/flows)  
Contains all the actions that can be performed against the collection of
[Workflows](/workflows/overview/) belonging
to an Application - such as listing the workflows or creating a new workflow.

*   [Me](/rest-api/me)  
Contains the actions for operating against the currently authenticated
[User](/user-accounts/overview/) such as changing
the password or linking against external services.

*   [Organization](/rest-api/org)  
Contains all the actions that can be performed against a single
[Organization](/organizations/overview/), things like
inviting a user to the organization, or modifying the organization.

*   [Organizations](/rest-api/orgs)  
Contains all of the actions that can be performed against the set of
[Organizations](/organizations/overview/) that the
currently authenticated user has access to - such as
listing the organizations or creating a new organization.

*   [Webhook](/rest-api/webhook)  
Contains all the actions that can be performed against a single
[Webhook](/applications/webhooks/), for instance
modifying the verification settings or removing the webhook.

*   [Webhooks](/rest-api/webhooks)  
Contains all the actions that can be performed against the collection of
[Webhooks](/applications/webhooks/) belonging
to an Application - such as listing the webhooks or creating a new webhook.
