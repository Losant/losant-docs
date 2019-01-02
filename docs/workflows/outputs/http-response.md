---
flowclass:
  - Edge 1.0.0
description: Learn more about the Losant HTTP Response Node.
---

# Edge HTTP Response

The HTTP Response Node allows an edge workflow triggered by an [HTTP Request](/workflows/triggers/request/) trigger to reply back to the triggering request.

![HTTP Response Node](/images/workflows/outputs/http-response-node.png "HTTP Response Node")

## Configuration

All the standard components of an HTTP response are configurable in the HTTP Response Node - the response code, the body and the headers. The node also has some helpers for setting and removing cookies, so that you do not have to configure the cookie header manually.

![HTTP Response Node Config](/images/workflows/outputs/http-response-node-config.png "HTTP Response Node Config")

In the above example, the response code is set to `200`, although that field is templatable and so can be configured from the current payload. It is expected to resolve to a valid response code number, and if it does not, the reply will default to a response code of `200`.

The body of the reply can be set either as a [string template](/workflows/accessing-payload-data/#string-templates), a [payload path](/workflows/accessing-payload-data/#payload-paths), or the entire payload. In the above example, it is a string template that resolves to a string of JSON. If payload path is chosen and the payload path points to an object, that object is stringified as JSON for use as the body. If `Full Payload` is chosen, the payload stringified as JSON and is used as the body. The body is allowed to be empty, if no body is desired on the reply.

### Headers

![HTTP Response Node Header Config](/images/workflows/outputs/http-response-node-header-config.png "HTTP Response Node Header Config")

Arbitrary headers can also be set on the reply. Both the header name and value fields are templatable, so they are configurable based on the payload. In the example above, only one header field is set - `Cache-Control` is set to `cache`.

Losant does automatically add certain other headers to the reply, if they are not set explicitly in the header configuration for the reply:

* [Cache-Control](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control): This header is added by default to the reply with the value `no-cache, no-store, must-revalidate`.
* [Content-Security-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy): This header will is added by default to the reply with the value `default-src 'none'`.
* [Content-Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type): This header is added by default to the reply with the value `application/json`.
* [Pragma](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Pragma): This header is added by default to the reply with the value `no-cache`.
* [Strict-Transport-Security](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security): If the request came in over SSL, this header will be automatically added to the reply with the value `max-age=31536000`.
* [X-Content-Type-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Content-Type-Options): This header is added by default to the reply with the value `nosniff`.
* [X-XSS-Protection](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-XSS-Protection): This header is added by default to the reply with the value `1; mode=block`.

CORS related headers will also be added - the headers [Access-Control-Allow-Origin](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin) and [Access-Control-Expose-Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Expose-Headers) are added by default to all replies. In addition, if the request was an `OPTIONS` request, Losant will add the headers [Access-Control-Allow-Methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Methods), [Access-Control-Allow-Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Headers), and [Access-Control-Max-Age](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Max-Age) to the reply. If any of the above headers is explicitly set in the header configuration of the HTTP Response Node, Losant will use that and not override it.

### Cookies

![HTTP Response Node Cookie Config](/images/workflows/outputs/http-response-node-cookie-config.png "HTTP Response Node Cookie Config")

Cookies can either be removed or set on the reply. In the case of removal, all that is needed is the name of the cookie (which is [templatable](/workflows/accessing-payload-data/#string-templates)). When setting the cookie, both a cookie name and a value for the cookie are required, and optionally you can provide the amount of time until the cookie expires (in milliseconds). If you do not provide an amount of time, the cookie will be treated as a "session cookie", which means it will last until the user's browser is closed. As of Edge Agent version 1.2.0, you can also provide an optional path for the cookie. All four of these fields are [templatable](/workflows/accessing-payload-data/#string-templates), so they can use values off of the current workflow payload.
