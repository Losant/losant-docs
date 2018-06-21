flowclass: Edge 1.0.0
description: Learn more about the Losant HTTP Request Trigger.

# Edge HTTP Request Trigger

The HTTP Request Trigger will fire a workflow whenever the [edge compute device](/devices/edge-compute/) receives request on the local web server run by the Losant Edge Agent.

![HTTP Request Trigger](/images/workflows/triggers/http-request-trigger.png "HTTP Request Trigger")

## Configuration

The HTTP Request Trigger has no configuration. When a workflow with this trigger is deployed to an [Edge Compute](/devices/edge-compute/) device, if a request is made against the local web server run by the Losant Edge Agent, the workflow will fire. If you need to respond to a request, you can use the [HTTP Response](/workflows/outputs/http-response/) node within your workflow.

## Payload

The payload for a workflow triggered by the HTTP Request Trigger will include all of the information about the triggering request in the `data` field. This includes the request path, the request method, any request headers, any request query parameters, any parsed path parameters (based off the route definition for the endpoint), any cookies, and the request body. If there is no body present, the value for the body field will be `null`. Otherwise, if the content type is `multipart/form-data`, `application/x-www-form-urlencoded`, or `application/json` and the request body is valid for that content type, it will automatically be parsed into an object. For other content types, such as `text/plain`, the body will be left as a string.

In the general case, an HTTP Request Trigger workflow payload will look like the following:

```json
{
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
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
  "deviceId": <id of the edge device>,
  "deviceName": <the edge device name>,
  "deviceTags": {<any tags for the edge device>},
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "flowVersion": <name of the current workflow version>,
  "globals": <object of workflow globals>,
  "isConnectedToLosant": <if the agent is connected to Losant>,
  "agentEnvironment": <object of environment variables>,
  "time": <time of the request>,
  "triggerId": "request",
  "triggerType": "request"
}
```
