# HTTP Node

The HTTP node allows a workflow to make an arbitrary HTTP request and optionally place the response on the current payload.

![HTTP Node](/images/workflows/data/http-node.png "HTTP Node")

## Configuration

The HTTP node can be configured with all the common properties of an HTTP request - request method, request url, request body, and request headers.  In addition, the node can optionally store the response of the request at a spot in the payload.

### Basic Configuration

![HTTP Node Basic Configuration](/images/workflows/data/http-node-basic-configuration.png "HTTP Node Basic Configuration")

The first part of configuring the node is selecting the method of the http request - choosing between "GET", "POST", "PUT", and "DELETE".  Next is the url to actually make the request at - this field is supports payload templating, dynamic urls based on the current payload can be created.  The third basic part of setting up an HTTP node is configuring the body - which is actually not allowed for "GET" and "DELETE" requests.  For "POST" and "PUT" requests, however, the body is optional and supports standard templating.  In the above example, the node is making a "GET" request to the url `https://rrtp.comed.com/api?type=5minutefeed`.

### Header Configuration

![Header Configuration](/images/workflows/data/http-node-header-configuration.png "Header Configuration")

The HTTP node also has optional support for adding headers to the http request.  Each header is a pair of a header name and a header value.  Header values can use payload templating to dynamically build headers out of the current payload if needed.  The above example has a single header of `User-Agent` whose value is the template `Struct/{{ flowId }}`.

### Storing The Response

![Response Configuration](/images/workflows/data/http-node-response-configuration.png "Response Configuration")

The HTTP node can optionally store the response from the request at an arbitrary JSON path.  If a path is defined, the body, headers, and status code are stored at the given path.  The node also attempts to parse the body as JSON - if it is parseable, the parsed object is placed on the payload instead of the raw response body string.  In the example above, the response will be stored at the `data.pricing` field.

So with the above example, given the following payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {},
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree"
  "triggerId": "f6094780d98111e5883a37908659487f",
  "triggerType": "timer",
  "flowId": "568dcdee86985501006360ba",
  "flowName": "Electricity Pricing Data",
  "globals": { }
}
```

The node will make a GET request to `https://rrtp.comed.com/api?type=5minutefeed` with no body, but with the header `User-Agent` set to `Struct/568dcdee86985501006360ba`.  When the request responds, the workflow will continue with the response on the payload in `data.pricing`, potentially looking like:

```JSON
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
      "statusCode": 200
    }
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree"
  "triggerId": "f6094780d98111e5883a37908659487f",
  "triggerType": "timer",
  "flowId": "568dcdee86985501006360ba",
  "flowName": "Electricity Pricing Data",
  "globals": { }
}
```
