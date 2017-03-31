# Experience Endpoint Reply Node

The experience endpoint reply node allows a workflow to create and send a HTTP response to an [endpoint](/experiences/endpoints/) HTTP request.

![Endpoint Reply Node](/images/workflows/outputs/endpoint-reply-node.png "Endpoint Reply Node")

## Configuration

The endpoint reply node lets you configure all of the standard components of an HTTP reply - the response code, the body, and the headers. It also has some helpers for setting and removing cookies, so that you do not have to configure the cookie header manually.

### Response Code and Body

![Endpoint Reply Node Config](/images/workflows/outputs/endpoint-reply-node-config.png "Endpoint Reply Node Config")

In the above example, the response code is set to `200`, although that field is [templatable](/workflows/accessing-payload-data/#string-templates) and so can be configured from the current payload. It is expected to resolve to a valid response code number, and if it does not, the reply will default to a response code of `200`.

The body of the reply can be set either as a [string template](/workflows/accessing-payload-data/#string-templates) or as a [payload path](/workflows/accessing-payload-data/#payload-paths). In the above example, it is a string template that resolves to a string of JSON. If payload path is chosen and the payload path points to an object, that object is stringified JSON string for use as the body. The body is allowed to be empty, if no body is desired on the reply.

### Cookies

![Endpoint Reply Node Cookie Config](/images/workflows/outputs/endpoint-reply-node-cookie-config.png "Endpoint Reply Node Cookie Config")

Cookies can either be removed or set on the reply. In the case of removal, all that is needed is the name of the cookie (which is [templatable](/workflows/accessing-payload-data/#string-templates)). When setting the cookie, both a cookie name and a value for the cookie are required, and optionally you can provide the amount of time until the cookie expires (in milliseconds). If you do not provide an amount of time, the cookie will be treated as a "session cookie", which means it will last until the user's browser is closed. All three of these fields are [templatable](/workflows/accessing-payload-data/#string-templates), so they can use values off of the current workflow payload.

### Headers

![Endpoint Reply Node Header Config](/images/workflows/outputs/endpoint-reply-node-header-config.png "Endpoint Reply Node Header Config")

Arbitrary headers can also be set on the reply. Both the header name and value fields are templatable, so they are configurable based on the payload. In the example above, only one header field is set - `Content-Type` is set to `application/json`. This is set because the body of the reply is JSON. This will probably be the most common header to set - Losant does not try an automatically determine the content type of the body of the reply.

Losant does automatically add certain other headers to the reply, depending on if [Default CORS](/experiences/endpoints/) is enabled. If that is enabled, Losant will automatically add the headers `Access-Control-Allow-Origin` and `Access-Control-Expose-Headers` to the reply. In addition, if the request was an `OPTIONS` request and "Default CORS" is enabled, Losant will add the headers `Access-Control-Allow-Methods`, `Access-Control-Allow-Headers`, and `Access-Control-Max-Age` to the reply. If any of the above headers is explicitly set in the header configuration of the endpoint reply node, Losant will use that and not override it.

## Advanced Options

The endpoint reply node has one optional advanced option - setting the payload path to the `replyId`.

![Endpoint Reply Node ReplyId](/images/workflows/outputs/endpoint-reply-node-replyid.png "Endpoint Reply Node ReplyId")

The reply ID path by default is `data.replyId` - which is where an endpoint places the reply ID for the request made against the endpoint. But if for some reason you have moved the replyId to a different part of the payload, or you are using multiple workflows and passing the replyId between them under a different field name, you can set the path to that field here. If there is no reply ID at the path given, the endpoint reply node does nothing.
