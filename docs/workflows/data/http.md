---
flowclass:
  - Application
  - Experience
  - Edge 1.0.0
description: Learn more about the Losant HTTP Node.
---

# HTTP Node

The HTTP Node allows a workflow to make an arbitrary HTTP request and optionally place the response on the current payload.

![HTTP Node](/images/workflows/data/http-node.png "HTTP Node")

## Configuration

The HTTP Node can be configured with all the common properties of an HTTP request - request method, request URL, request body, and request headers. In addition, the node can optionally store the response of the request at a spot in the payload.

### Basic Configuration

![HTTP Node Basic Configuration](/images/workflows/data/http-node-basic-configuration.png "HTTP Node Basic Configuration")

The first part of configuring the node is selecting the method of the HTTP request - choosing between "GET", "POST", "PUT", and "DELETE". Next is the URL to actually make the request at - this field supports static URLs or [string templates](/workflows/accessing-payload-data/#string-templates). Optionally, you can set a timeout on the request in seconds - the maximum (and default) timeout is 30 seconds. Finally, you can configure the body of the HTTP request - which is actually not allowed for `GET` and `DELETE` requests. For `PATCH`, `POST`, and `PUT` requests, however, the body is optional and supports standard [JSON templates](/workflows/accessing-payload-data/#json-templates). In the above example, the node is making a `GET` request to the URL `http://example.datasource.com`.

### Header Configuration

![Header Configuration](/images/workflows/data/http-node-header-configuration.png "Header Configuration")

The HTTP Node also has optional support for adding headers to the HTTP request. Each header is a combination of a header name and a header value. Header values can take [string templates](/workflows/accessing-payload-data/#string-templates) to dynamically build headers out of the current payload if needed. The above example has a single header of `User-Agent` whose value is the template `Losant/{{ flowId }}`.

### Authorization

![Authorization Configuration](/images/workflows/data/http-node-authorization-configuration.png "Authorization Configuration")

The HTTP Node can optionally set authorization information for requests. There are two options for authorization: `Basic` and `Client Certificate`. For `Basic` you can  provide a `username` and `password`, and the request will be sent with a proper [Basic Auth](https://en.wikipedia.org/wiki/Basic_access_authentication) header. The screenshot above shows a basic auth configuration, with the username `exampleUser` and the password `examplePass`. **NOTE** for edge workflows, this feature is only available for workflows targeting edge agent [version 1.2.0](/edge-compute/edge-agent-changelog/#120-2018-06-21) or higher.

For `Client Certificate`, you will be asked to provide a `Client Certificate Key` and a `Client Certificate`. When those are provided, the request will be sent with the [Client Certificate](https://en.wikipedia.org/wiki/Client_certificate) for the server to authenticate. **NOTE** for edge workflows, this feature is only available for workflows targeting edge agent [version 1.5.0](/edge-compute/edge-agent-changelog/#150-2019-01-31) or higher.

### SSL Options

![SSL Configuration](/images/workflows/data/http-node-ssl-configuration.png "SSL Configuration")

Next, you can you can decide whether to `Disable SSL Verification?` (useful if you are connecting to a a server with a self-signed SSL certificate). In the given example the SSL certificate will still be verified by the request and if it is invalid will return an error. However, if this box was checked it would **not** ensure that the SSL certificate is valid.

If you are using a self-signed, custom, or uncommon [Certificate Authority](https://en.wikipedia.org/wiki/Certificate_authority), you can also optionally provide the CA certificate. This allows you to keep SSL verification enabled, even when using certificates that normally Losant would not be able to verify. **NOTE** for edge workflows, this feature is only available for workflows targeting edge agent [version 1.5.0](/edge-compute/edge-agent-changelog/#150-2019-01-31) or higher.

### Storing The Response

![Response Configuration](/images/workflows/data/http-node-response-configuration.png "Response Configuration")

The HTTP Node can optionally store the response from the request at an arbitrary [payload path](/workflows/accessing-payload-data/#payload-paths). If a path is defined, the body, headers, status code, and original request information are stored at the given path. The node also attempts to parse the body as JSON - if it is parseable, the parsed object is placed on the payload instead of the raw response body string. In the example above, the response will be stored at the `working.result` field.

So with the above example, given the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {},
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree"
  "triggerId": "f6094780d98111e5883a37908659487f",
  "triggerType": "timer",
  "flowId": "568dcdee86985501006360ba",
  "flowName": "HTTP NODE",
  "globals": { }
}
```

The node will make a GET request to `http://example.datasource.com` with no body, but with the header `User-Agent` set to `Losant/568dcdee86985501006360ba`. When the request responds, the workflow will continue with the response on the payload in `data.pricing`, potentially looking like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "pricing": {
      "body": [
        {
          "millisUTC": "1456158300000",
          "price": "2.5"
        },
        {
          "millisUTC": "1456158000000",
          "price": "2.5"
        },
        ...
      ],
      "headers": {
        "strict-transport-security": "max-age=15768000",
        "content-type": "text/html; charset=UTF-8",
        "connection": "close",
        "transfer-encoding": "chunked"
      },
      "statusCode": 200,
      "request": {
        "headers": {
          "User-Agent": "Losant/5afb015e01206900050e7579"
        },
        "strictSSL": true,
        "uri": "http://rrtp.comed.com/api?type=5minutefeed",
        "method": "GET"
      }
    }
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "f6094780d98111e5883a37908659487f",
  "triggerType": "timer",
  "flowId": "568dcdee86985501006360ba",
  "flowName": "HTTP NODE",
  "globals": { }
}
```

### Dealing With Errors

![Error Configuration](/images/workflows/data/http-node-error-configuration.png "Error Configuration")

Any HTTP request that returns with an actual response (even if it is a 4XX or 5XX status code) will be treated as a response, and so will be stored at the given response path. However, there are many reasons why the HTTP node might error *without* a response, such as timeouts, unreachable servers, DNS resolution failures, and the like. In those cases, there are two possible options - you can either error the workflow (which means the workflow will stop running at this node), or you can store the error at a path on the payload. If you choose to store the error at a path on the payload, an object will be placed at that path with the original request information as well as the particular error that occurred. **NOTE** for edge workflows, this feature is only available for workflows targeting edge agent [version 1.1.1](/edge-compute/edge-agent-changelog/#111-2018-05-21) or higher.