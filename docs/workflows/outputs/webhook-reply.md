# Webhook Reply Node

The webhook reply node allows a workflow to send a reply back to a webhook trigger (as long as the webhhok is configured to [wait for a reply](/applications/webhooks/#custom-replies)).

![Webhook Reply Node](/images/workflows/outputs/webhook-reply-node.png "Webhook Reply Node")

## Configuration

All the standard components of an http response are configurable in the Webhook Reply node - the response code, the body, and the headers.

![Webhook Reply Node Config](/images/workflows/outputs/webhook-reply-node-config.png "Webhook Reply Node Config")

In the above example, the response code is set to `200`, although that field is templatable and so can be configured from the current payload. It is expected to resolve to a valid response code number, and if it does not, the reply will default to a response code of `200`.

The body of the reply can be set either as a string template or as a payload path.  In the above example, it is a string template that resolves to a string of json. If payload path is choosen and the payload path points to an object, that object is cast to a json string for use as the body. The body is allowed to be empty, if no body is desired on the reply.

![Webhook Reply Node Header Config](/images/workflows/outputs/webhook-reply-node-header-config.png "Webhook Reply Node Header Config")

Arbitrary headers can also be set on the reply. Both the header name and value fields are templatable, so they are configurable based on the payload. In the example above, only one header field is set - `Content-Type` is set to `application\json`. This is set because the body of the reply is JSON.  This will probably be the most common header to set - Losant does not try an automatically determine the content type of the body of the reply.

## Advanced Options

The webhook reply node has one optional advanced option - setting the payload path to the `replyId`.

![Webhook Reply Node ReplyId](/images/workflows/outputs/webhook-reply-node-replyid.png "Webhook Reply Node ReplyId")

The reply id path by default is `data.replyId` - which is where a webhook (that expects a reply) places the reply id for the current webhook trigger request.  But if for
some reason you have moved the replyId to a different part of the payload, or you are
using multiple workflows and passing the replyId between them under a different field
name, you can set the path to that field here.  If there is no reply id at the path given, the webhook reply node does nothing.
