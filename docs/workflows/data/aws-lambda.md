flowclass: Cloud
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant AWS Lambda Node.

# AWS Lambda

The AWS Lambda Node allows a workflow to run an [AWS Lambda](https://aws.amazon.com/lambda/) function and optionally store the returned value from the function in the payload.

![AWS Lambda Node](/images/workflows/data/aws-lambda-node.png "AWS Lambda Node")

## Configuration

There are two main configuration sections for the AWS Lambda node - first configuring the AWS authentication and region, and second configuring the Lambda function in particular to run.

![AWS Lambda Node Credentials](/images/workflows/data/aws-lambda-node-credentials.png "AWS Lambda Node Credentials")

There are three parts to configuring credentials - the `AWS Access Key ID`, the `AWS Secret Access Key` and the particular AWS region. Losant recommends that you create an AWS Key/Secret pair specifically for use for our workflow nodes - one that only has access to your AWS Lambda functions. All three fields can take [string templates](/workflows/accessing-payload-data/#string-templates), and so can pull values from the current payload. Most users store these values in their [workflow globals](/workflows/overview/#workflow-globals).

In the example above, the node is configured to pull the AWS Access Key from `globals.awsKey`, the AWS Secret from `globals.awsSecret`, and sets the region to `us-west-2`.

![AWS Lambda Node Config](/images/workflows/data/aws-lambda-node-config.png "AWS Lambda Node Config")

Next to configure are what particular Lambda function to call, and what to hand it as the data. The function to call can take a [string template](/workflows/accessing-payload-data/#string-templates), so the value can be pulled off the payload - but in the example above, the function is hard-coded to `userNumberLookup`. For configuring the data to send to the function, there are three possible options:

* **Workflow Payload**: with this option, the entire current workflow payload is sent as the data to the lambda call.
* **Payload Path**: with this option, you must provide a [payload path](/workflows/accessing-payload-data/#payload-paths), and the value at that path on the current payload is sent as the data to the lambda call.
* **JSON Template**: with this option, you must provide a [JSON template](/workflows/accessing-payload-data/#json-templates), and the result of that template is sent as the data to the lambda call.

In the example above, `Workflow Payload` is selected, so the entire current payload will be handed to the `userNumberLookup` call.

![AWS Lambda Node Output](/images/workflows/data/aws-lambda-node-output.png "AWS Lambda Node Output")

Finally, if the Lambda function that is being called returns a result, it can optionally be stored for later use in the workflow. In the example above, the result will be stored at the [payload path](/workflows/accessing-payload-data/#payload-paths) `data.phoneNumber` on the current payload. What a Lambda function returns, though, is not *just* the result; it is a result object with potentially other useful information. For example, here is an example payload after the above AWS Lambda Node has been run - the actual Lambda result is placed in the `Payload` field:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "current": 10,
    "on": true,
    "phoneNumber": {
      "LogResult": "AWS_LOGGING_INFO_WOULD_BE_HERE",
      "Payload": { "phoneNumber": "212 867-5309" },
      "StatusCode": 200,
    }
  },
  "globals": {
    "awsKey": "AWS_KEY_WOULD_BE_HERE",
    "awsSecret": "AWS_SECRET_WOULD_BE_HERE"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "56c8967bb8df0f0100d629120",
  "triggerType": "deviceId",
  "deviceTags": {
    "floor": ["2"],
    "location": ["warehouse1"]
  },
  "deviceName": "My Factory Device",
  "flowId": "56c74add04d0b50100043381",
  "flowName": "Power Usage Alert"
}
```
