# SendGrid Node

The SendGrid node allows a workflow to send emails using the configured [SendGrid](https://sendgrid.com/) account.

![SendGrid Node](/images/workflows/outputs/sendgrid-node.png "SendGrid Node")

## Configuration

The SendGrid node has a large number of configuration properties - everything needed to configure use of a SendGrid account and the sending of an email.

### SendGrid API Key

![SendGrid Node API Key](/images/workflows/outputs/sendgrid-node-api-key.png "SendGrid Node API Key")

The most important part of the configuration is an API key for the SendGrid account that should be used to send the emails. The field supports [string templates](/workflows/accessing-payload-data/#string-templates), and in most cases, users store this value in their [workflow globals](/workflows/overview/#workflow-globals).

An API key can be generated in the SendGrid [account settings](https://app.sendgrid.com/settings/api_keys). In the example above, the node is configured to use the the API key `YOUR_SENDGRID_API_KEY_HERE`.

### Message Contents

![SendGrid Node Message Contents](/images/workflows/outputs/sendgrid-node-message-contents.png "SendGrid Node Message Contents")

Next, the contents of the email can be configured. There are four items to configure here - the "From" address, the "Reply-To" address, the subject of the email, and the body of the email. All four of these fields support [string templates](/workflows/accessing-payload-data/#string-templates), so they can be dynamic based on the current workflow payload. The "From" address, the subject, and the body are all required. In the example above, the "From" address is set to `alerts@embree.net`, there is no "Reply To" address set, the subject is set to `Power Consumption Warning!`, and finally the body is set to `Power level exceeded error threshold at {{ data.power }} !`.

### Recipient Addresses

![SendGrid Node Recipient Addresses](/images/workflows/outputs/sendgrid-node-recipient-addresses.png "SendGrid Node Recipient Addresses")

The "To", "CC", and "BCC" addresses for the email can all be independently configured. These fields also support [string templates](/workflows/accessing-payload-data/#string-templates). The above node is set to send the email to `bob@embree.net` and `john@embree.net`, and CC `jane@embree.net` (and has no BCC addresses set).

### Storing SendGrid's Response

![SendGrid Node Response](/images/workflows/outputs/sendgrid-node-response.png "SendGrid Node Response")

The SendGrid node can optionally place the response from SendGrid on the current payload for use later in the workflow. The above example node is set to place the response at the [payload path](/workflows/accessing-payload-data/#payload-paths) `sendgridResult`. Below is an example payload after the successful execution of the SendGrid node:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "power": 17
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "56c74add04d0b50100043381-EkjUNjEol",
  "triggerType": "virtualButton",
  "flowId": "56c74add04d0b50100043381",
  "flowName": "Power Consumption Warning",
  "sendgridResult": {
    "message": "success"
  },
  "globals": {}
}
```
