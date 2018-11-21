flowclass: Application
description: Learn more about the Losant Webhook Trigger.

# Webhook Trigger

The Webhook Trigger will fire a workflow when the selected webhook receives a request.

![Webhook Trigger](/images/workflows/triggers/webhook-trigger.png "Webhook Trigger")

## Configuration

The configuration for the Webhook Trigger is relatively simple - just choose a webhook that has been set up for the application as described in the [webhook documentation](/applications/webhooks/).

![Webhook Trigger Config](/images/workflows/triggers/webhook-trigger-config.png "Webhook Trigger Config")

In the above example, the workflow will be triggered whenever the "External Command Hook" webhook receives a request.

## Payload

The payload for a workflow triggered by a webhook will include all of the information about the triggering request in the `data` field. This includes the request path, the request method, any request headers, any request query parameters, and the request body. The `path` field will not include the entire path, but only any path after the root path of the webhook.If there is no body present, the value for the body field will be `null`. Otherwise, if the content type is `multipart/form-data`, `application/x-www-form-urlencoded`, or `application/json` and the request body is valid for that content type, it will automatically be parsed into an object. For other content types, such as `text/plain`, the body will be left as a string. In the general case, a webhook workflow payload will look like the following:

```json
{
  "time": <time of the trigger>,
  "data": {
    "path": <the path of the request>,
    "method": <the request method - delete|get|patch|post|put >,
    "headers": <any request headers>,
    "query": <any request query params>,
    "body": <the request body>,
    "replyId": <the reply id, if the webhook expects a reply>
  },
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the webhook>,
  "triggerType": "webhook",
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "globals": <object of workflow globals>
}
```

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "path": "/transition/up",
    "method": "post",
    "headers": {
      "user-agent": "curl/7.43.0",
      "accept": "*/*",
      "content-type": "application/json",
      "content-length": "14"
    },
    "query": {
      "location": "52"
    },
    "body": {
      "value": "30"
    }
  },
  "applicationId": "56311a8e51645b2054eb258b",
  "applicationName": "Embree",
  "triggerId": "56c8bc1db8df0f0100d62914",
  "triggerType": "webhook",
  "flowId": "56c8967bb8df0f0100d62912",
  "flowName": "External Command",
  "globals": {}
}
```

The curl command that triggered the flow with the above example payload looked like the following:

```bash
curl -H 'Content-Type: application/json' -X POST -d '{"value":"30"}' https://triggers.losant.com/webhooks/jk1NopMpgQHyqQQn1Ax6tpPjEkb/transition/up?location=52
```

### Notes About Security

To prevent cross-site scripting attacks, the `Cookie` header is stripped out of incoming webhook requests. This is because the `triggers.losant.com` domain is shared across all webhooks, and so cookies could unintentionally leak sensitive information. If you need to use cookies, [Experience Endpoints](/experiences/endpoints/) will allow you to do so in a more secure manner, since domains for Experience Endpoints are application specific.
