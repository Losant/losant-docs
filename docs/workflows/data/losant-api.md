# Losant API Node

The Losant API node allows a workflow to make requests (allowing both querying and modification) against the Losant API easily for any resource under the current application.  

![Losant API Node](/images/workflows/data/losant-api-node.png "Losant API Node")

## Configuration

There are three configuration sections for the Losant API node - selecting the request to make, configuring the parameters for that request, and determining where to store the result.

![Losant API Node Resource Selection](/images/workflows/data/losant-api-node-resource-selection.png "Losant API Node Resource Selection")

First step is selecting the request to make - specifically the resource and action.  Any resource under the current application is available - the dropdown has the list of all resources and their possible actions, as well as short descriptions for each one.  In the above case, `Device: Get` is selected, which means the `Get` action on the `Device` resource - i.e., this returns the information about a specific device.

![Losant API Node Parameter Configuration](/images/workflows/data/losant-api-node-parameter-configuration.png "Losant API Node Parameter Configuration")

Next up is configuring the parameters for the selected resource and action.  There are a few requests that have no parameters, and some others that have no required parameters, but most have at least one required parameter.  In the above example, the request has one required parameter - the ID of the device that the request should get.  There are two types of parameter fields: [string templates](/workflows/accessing-payload-data/#string-templates) like the device ID example above, and more complex parameters that are JSON objects.  For parameters that are JSON objects, you can either create a [JSON template](/workflows/accessing-payload-data/#json-templates) or specify a [payload path](/workflows/accessing-payload-data/#payload-paths) to pull the desired object off the current payload.

![Losant API Node Result](/images/workflows/data/losant-api-node-result.png "Losant API Node Result")

Finally, we can configure a place to put the result of the API request.  This is optional, but most of the time you will probably want the result.  In the above example, the result will be stored at the [payload path](/workflows/accessing-payload-data/#payload-paths) `data.apiResult`.  There are two kinds of results that could be returned - a successful response (with a root key of `result`), or an error response (with a root key of `error`) if there was something wrong with the request.

After a successful response for the above request, the payload might look like the following:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    ...
    "apiResult": {
      "result": {
        "name": "Widget Alpha",
        "description": "Device For Bob",
        "tags": [ ],
        "attributes": [
          { "name": "button", "dataType": "boolean" },
          { "name": "tempF", "dataType": "number" },
        ],
        "deviceClass": "standalone",
        "applicationId": "569ff47597b69c01001e230f",
        "creationDate": "2016-03-09T17:04:02.451Z",
        "lastUpdated": "2016-03-10T21:51:06.223Z",
        "_etag": "\"271-VfsBPHq+u0qbucuK+bRNgw\"",
        "deviceId": "56e05782b3867f0100814dad",
        "connectionInfo": {
          "connected": 0,
          "time": "2016-08-26T17:41:06.686Z"
        },
        "id": "56e05782b3867f0100814dad",
        "_type": "device"
      }
    }
  },
  ...
}
```

After an error response for the above request, the payload might look like this instead:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    ...
    "apiResult": {
      "error": {
        "type": "NotFound",
        "statusCode": 404,
        "message": "Device not found"
      }
    }
  },
  ...
}
```
