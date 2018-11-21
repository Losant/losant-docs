flowclass: Application
description: Learn more about the Losant Webhook Reply Node.

# Webhook Reply Node

The Webhook Reply Node allows a workflow to send a reply back to a webhook trigger (as long as the webhook is configured to [wait for a reply](/applications/webhooks/#custom-replies)).

![Webhook Reply Node](/images/workflows/outputs/webhook-reply-node.png "Webhook Reply Node")

## Configuration

All the standard components of an HTTP response are configurable in the Webhook Reply Node - the response code, the body, and the headers.

![Webhook Reply Node Config](/images/workflows/outputs/webhook-reply-node-config.png "Webhook Reply Node Config")

In the above example, the response code is set to `200`, although that field is templatable and so can be configured from the current payload. It is expected to resolve to a valid response code number, and if it does not, the reply will default to a response code of `200`.

The body of the reply can be set either as a [string template](/workflows/accessing-payload-data/#string-templates) or as a [payload path](/workflows/accessing-payload-data/#payload-paths). In the above example, it is a string template that resolves to a string of JSON. If payload path is chosen and the payload path points to an object, that object is stringified as JSON for use as the body. The body is allowed to be empty, if no body is desired on the reply.

![Webhook Reply Node Header Config](/images/workflows/outputs/webhook-reply-node-header-config.png "Webhook Reply Node Header Config")

Arbitrary headers can also be set on the reply. Both the header name and value fields are templatable, so they are configurable based on the payload. In the example above, only one header field is set - `Content-Type` is set to `application\json`. This is set because the body of the reply is JSON. This will probably be the most common header to set - Losant does not try an automatically determine the content type of the body of the reply.

### Notes About Security

* Webhook replies allow a limited set of values for the `Content-Type` header: `application/json`, `application/xml`, `text/plain`, `text/xml` and `text/csv`. If no `Content-Type` is set, or an invalid `Content-Type` is set, the `Content-Type` of the response will be set to `application/json`.
* Losant automatically sets protective values for the following headers, none of which can be overridden in a webhook reply: `X-Content-Type-Options`, `Content-Security-Policy` and `X-XSS-Protection`.

## Advanced Options

The Webhook Reply Node has one optional advanced option - setting the payload path to the `replyId`.

![Webhook Reply Node ReplyId](/images/workflows/outputs/webhook-reply-node-replyid.png "Webhook Reply Node ReplyId")

The reply ID path by default is `data.replyId` - which is where a webhook (that expects a reply) places the reply ID for the current webhook trigger request. But if for some reason you have moved the replyId to a different part of the payload, or you are using multiple workflows and passing the replyId between them under a different field name, you can set the path to that field here. If there is no reply ID at the path given, the Webhook Reply Node does nothing.
