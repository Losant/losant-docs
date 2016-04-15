# AWS Lambda

The AWS Lambda node allows a workflow to run an [AWS Lambda](https://aws.amazon.com/lambda/) function and optionally store the returned value from the function in the payload.

![AWS Lambda Node](/images/workflows/data/aws-lambda-node.png "AWS Lambda Node")

## Configuration

There are two main configuration sections for the AWS Lambda node - first configuring the AWS authentication and region, and second configuring the lambda function in particular to run.

![AWS Lambda Node Credentials](/images/workflows/data/aws-lambda-node-credentials.png "AWS Lambda Node Credentials")

There are three parts to configuring credentials - the `AWS Access Key Id`, the `AWS Secret Access Key` and the particular AWS region.  Losant recommends that you create a AWS Key/Secret pair specifically for use for our workflow nodes - one that only has access to your AWS Lambda functions.  All three fields are templatable, and so can pull values from the current payload.  In the example above, the node is configured to pull the AWS Access Key from `globals.awsKey`, the AWS Secret from `globals.awsSecret`, and sets the region to `us-west-2`.

![AWS Lambda Node Config](/images/workflows/data/aws-lambda-node-config.png "AWS Lambda Node Config")

Next to configure are what particular lambda function to call, and what to hand it as the data.  The function to call is templatable, so the value can be pulled off the payload - but in the example above, the function is hardcoded to `userNumberLookup`.  The second field, the "Argument Source Path", can either be left blank or it can take a JSON path.  When blank, the entire current payload is handed to the lambda function.  When there is a JSON path given, that JSON path is evaluated against the payload and the result is what is handed to the lambda function.  In the example above, the entire current payload will be handed to the `userNumberLookup` call.

![AWS Lambda Node Output](/images/workflows/data/aws-lambda-node-output.png "AWS Lambda Node Output")

Finally, if the lambda function that is being called returns a result, it can optionally be stored for later use in the workflow.  In the example above, the result will be stored at the JSON path `data.phoneNumber` on the current payload.  What a lambda function returns, though, is not *just* the result, it is a result object with potentially other useful information.  For example, here is an example payload after the above lambda workflow node has been run - the actual lambda result is placed in the `Payload` field:

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
  "triggerId": "56c8967bb8df0f0100d629120",
  "triggerType": "deviceId",
  "deviceTags": [
    { "key": "floor", "value": "2" },
    { "key": "location", "value": "warehouse1" }
  ],
  "flowId": "56c74add04d0b50100043381"
}
```
