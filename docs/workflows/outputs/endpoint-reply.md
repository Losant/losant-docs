flowclass: Cloud
description: Learn more about the Losant Experience Endpoint Reply Node.

# Experience Endpoint Reply Node

The Experience Endpoint Reply Node allows a workflow to create and send an HTTP response to an [endpoint](/experiences/endpoints/) HTTP request.

![Endpoint Reply Node](/images/workflows/outputs/endpoint-reply-node.png "Endpoint Reply Node")

## Configuration

There are three ways that you can use the Experience Endpoint Reply Node - send a custom response, send a page render, or send a redirect. In all three cases, you also have control over response headers. The node also has some helpers for setting and removing cookies, so that you do not have to configure the cookie header manually.

### Custom Response

If you choose `Custom`, you have full control over the response code and body of the response.

![Endpoint Reply Node Custom Config](/images/workflows/outputs/endpoint-reply-node-custom-config.png "Endpoint Reply Node Custom Config")

In the above example, the response code is set to `200`, although that field is [templatable](/workflows/accessing-payload-data/#string-templates) and so can be configured from the current payload. It is expected to resolve to a [valid response code number](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes), and if it does not, the reply will default to a response code of `200`.

The body of the reply can be set either as a [string template](/workflows/accessing-payload-data/#string-templates) or as a [payload path](/workflows/accessing-payload-data/#payload-paths). In the above example, it is a string template that resolves to a string of JSON. If payload path is chosen and the payload path points to an object, that object is stringified JSON string for use as the body. The body is allowed to be empty, if no body is desired on the reply.

### Experience Page Response

The Experience Page reply type enables you to use [Experience Views](/experience/views/) for replying to endpoint requests. In the case of an experience page reply, you still have control over the response code (just like `custom`), but the body of the response comes from rendering an experience page.

![Endpoint Reply Node Page Config](/images/workflows/outputs/endpoint-reply-node-page-config.png "Endpoint Reply Node Page Config")

To do this, you choose what page to render (this field does accept templates), and you can optionally override the default layout for the selected page if you need to. Once you have chosen the page to render, you can then choose what data to pass along to the page as the data that will be available during the render. There are four choices here:

* **None**: No custom data will be made available during the render. This means the `pageData` variable in the page render context will not exist.
* **Payload Path**: The value at the given [payload path](/workflows/accessing-payload-data/#payload-paths) will be placed at `pageData` in the page render context.
* **JSON Template**: The value is expected to be a [JSON template](/workflows/accessing-payload-data/#json-templates) which will be the object placed placed at `pageData` in the page render context.
* **Full Payload**: The entire current payload will be placed at `pageData` in the page render context.

In all cases, there is a significant amount of data available in a page render [by default](/experiences/views/#data-that-is-always-provided). The above only changes the `pageData` variable on that basic context object.

### Redirect Response

![Endpoint Reply Node Redirect Config](/images/workflows/outputs/endpoint-reply-node-redirect-config.png "Endpoint Reply Node Redirect Config")

If you need to redirect the request to some other URL, the redirect response type makes that easy. In the case of a redirect response, there are only two choices for response code - 301 (permanent redirect), or 302 (temporary redirect). In addition, instead of providing a response body, you provide a URL to redirect to. The URL can be set either as a [string template](/workflows/accessing-payload-data/#string-templates) or as a [payload path](/workflows/accessing-payload-data/#payload-paths), and can either be an absolute URL or a relative one.

### Headers

![Endpoint Reply Node Header Config](/images/workflows/outputs/endpoint-reply-node-header-config.png "Endpoint Reply Node Header Config")

Arbitrary headers can also be set on the reply. Both the header name and value fields are templatable, so they are configurable based on the payload. In the example above, only one header field is set - `Cache-Control` is set to `cache`.

In the case of a `custom` reply, remember to set the `Content-Type` header - Losant does not try and automatically determine the content type of the body of the reply.

Losant does automatically add certain other headers to the reply, if they are not set explicitly in the header configuration for the reply:

* [Strict-Transport-Security](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security): If the request came in over SSL, this header will be automatically added to the reply with the value `max-age=31536000`.
* [Cache-Control](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control): This header is added by default to the reply with the value `no-cache, no-store, must-revalidate`.
* [Pragma](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Pragma): This header will be added by default with the value `no-cache`.
* [X-Content-Type-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Content-Type-Options): This header will be added by default with the value `nosniff`.
* [X-XSS-Protection](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-XSS-Protection): This header will be added by default with the value `1; mode=block`.

CORS related headers will also be added, depending on if [Default CORS](/experiences/endpoints/) is enabled. If that is enabled, Losant will automatically add the headers [Access-Control-Allow-Origin](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin) and [Access-Control-Expose-Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Expose-Headers) to the reply. In addition, if the request was an `OPTIONS` request and "Default CORS" is enabled, Losant will add the headers [Access-Control-Allow-Methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Methods), [Access-Control-Allow-Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Headers), and [Access-Control-Max-Age](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Max-Age) to the reply. If any of the above headers is explicitly set in the header configuration of the Experience Endpoint Reply Node, Losant will use that and not override it.

### Cookies

![Endpoint Reply Node Cookie Config](/images/workflows/outputs/endpoint-reply-node-cookie-config.png "Endpoint Reply Node Cookie Config")

Cookies can either be removed or set on the reply. In the case of removal, all that is needed is the name of the cookie (which is [templatable](/workflows/accessing-payload-data/#string-templates)). When setting the cookie, both a cookie name and a value for the cookie are required, and optionally you can provide path for the cookie as well as the amount of time until the cookie expires (in milliseconds). If you do not provide an amount of time, the cookie will be treated as a "session cookie", which means it will last until the user's browser is closed. All four of these fields are [templatable](/workflows/accessing-payload-data/#string-templates), so they can use values off of the current workflow payload.

## Advanced Options

The Experience Endpoint Reply Node has one optional advanced option - setting the payload path to the `replyId`.

![Endpoint Reply Node ReplyId](/images/workflows/outputs/endpoint-reply-node-replyid.png "Endpoint Reply Node ReplyId")

The reply ID path by default is `data.replyId` - which is where an endpoint places the reply ID for the request made against the endpoint. But if for some reason you have moved the replyId to a different part of the payload, or you are using multiple workflows and passing the replyId between them under a different field name, you can set the path to that field here. If there is no reply ID at the path given, the Experience Endpoint Reply Node does nothing.
