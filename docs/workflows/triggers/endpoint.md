flowclass: Cloud
flowclass: Experience
description: Learn more about the Losant Endpoint Trigger.

# Experience Endpoint Trigger

The Endpoint Trigger will trigger a workflow when the selected endpoint receives a request. It can be used in both cloud and experience workflows, although the configuration differs slightly between the two.

![Endpoint Trigger](/images/workflows/triggers/endpoint-trigger.png "Endpoint Trigger")

## Configuration

The configuration for the Endpoint Trigger for an experience workflow is relatively simple - just choose an endpoint that has been set up for the application as described in the [endpoint documentation](/experiences/endpoints/).

![Endpoint Trigger Config Experience Workflow](/images/workflows/triggers/endpoint-trigger-config.png "Endpoint Trigger Config Experience Workflow")

In the above example, the workflow will be triggered whenever the "GET /logout" endpoint receives a request.

The configuration for the Endpoint Trigger for a cloud workflow is slightly more complicated. Because cloud workflows are not versioned with your experience, you will need to select the version of your experience you want to use. By default this is the `develop` version:

![Endpoint Trigger Config Application Workflow](/images/workflows/triggers/endpoint-trigger-config-app-flow.png "Endpoint Trigger Config Application Workflow")

## Payload

The payload for a workflow triggered by an endpoint will include all of the information about the triggering request in the `data` field. This includes the request path, the request method, any request headers, any request query parameters, any parsed path parameters (based off the route definition for the endpoint), any cookies, and the request body. If there is no body present, the value for the body field will be `null`. Otherwise, if the content type is `multipart/form-data`, `application/x-www-form-urlencoded`, or `application/json` and the request body is valid for that content type, it will automatically be parsed into an object. For other content types, such as `text/plain`, the body will be left as a string.

The payload will also contain an `experience` field, which will contain three properties - `endpoint`, `user`, and `version`. The `endpoint` property will always be the Experience Endpoint that received the request. The `user` property can either be the Experience User making the request, or `null` if it was a public unauthenticated request. The `version` property will contain the name of the experience version for the request.

In the general case, an endpoint workflow payload will look like the following:

```json
{
  "time": <time of the trigger>,
  "data": {
    "path": <the path of the request>,
    "params": <any parsed path params for the route>,
    "method": <the request method - delete|get|options|patch|post|put >,
    "headers": <any request headers>,
    "query": <any request query params>,
    "body": <the request body>,
    "cookies": <the cookies on the request>,
    "replyId": <the reply id>
  },
  "experience": {
    "endpoint": <the experience endpoint that received the request>,
    "user": <the experience user (if an authenticated request)>,
    "version": <the experience version for the request>
  },
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the experience endpoint>,
  "triggerType": "endpoint",
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "globals": <object of workflow globals>
}
```

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Wed Mar 29 2017 20:19:33 GMT-0400,
  "data": {
    "path": "/me",
    "params": {},
    "method": "get",
    "headers": {
      "content-type": "application/json",
      "authorization": "*****REDACTED*****",
    },
    "query": {},
    "body": null,
    "cookies": {},
    "replyId": "58dc4ecf9e8df60001fbea08.rk5ruFY2g.SJAGyAY2xE"
  },
  "applicationId": "56311a8e51645b2054eb258b",
  "triggerId": "58dc4ecf9e8df60001fbea08",
  "triggerType": "endpoint",
  "experience": {
    "version": "develop",
    "endpoint": {
      "method": "get",
      "route": "/me",
      "description": "",
      "access": "authenticated",
      "enabled": true,
      "applicationId": "56311a8e51645b2054eb258b",
      "creationDate": "2017-03-30T00:18:23.588Z",
      "lastUpdated": "2017-03-30T00:18:23.596Z",
      "experienceEndpointId": "58dc4ecf9e8df60001fbea08",
      "id": "58dc4ecf9e8df60001fbea08",
      "experienceGroups": []
    },
    "user": {
      "email": "test.user@example.com",
      "firstName": "Test",
      "lastName": "User",
      "applicationId": "56311a8e51645b2054eb258b",
      "creationDate": "2017-03-30T00:18:23.902Z",
      "lastUpdated": "2017-03-30T00:18:59.019Z",
      "userTags": {},
      "passwordLastUpdated": "2017-03-30T00:18:23.903Z",
      "lastLogin": "2017-03-30T00:18:59.015Z",
      "experienceUserId": "58dc4ecf9e8df60001fbea0a",
      "id": "58dc4ecf9e8df60001fbea0a",
      "experienceGroups": [
        {
          "id": "58dc4ece9e8df60001fbea02",
          "name": "My Example Group"
        }
      ]
    }
  },
  "relayId": "58dc4ecf9e8df60001fbea0a",
  "relayType": "experienceUser",
  "flowId": "58dc4ecf9e8df60001fbea09",
  "flowName": "Endpoint Trigger Example",
  "applicationName": "Documentation Example",
  "globals": {}
}
```
