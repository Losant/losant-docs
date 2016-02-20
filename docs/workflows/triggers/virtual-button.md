# Virtual Button Trigger

The virtual button trigger will trigger a workflow when the "virtual button" is pressed.  The common use case of the virtual button is to debug and test workflows, without having to wait for an external trigger of some kind.

![Virtual Button Trigger](/images/workflows/triggers/virtual-button-trigger.png "Virtual Button Trigger")

## Triggering The Workflow

A workflow can be triggered by the virtual button in one of two ways.  Either press the "Trigger Flow!" button in the properties panel for the virtual button node, or press the button on the node itself.

![Virtual Button Triggering A Flow](/images/workflows/triggers/virtual-button-trigger-buttons.png "Virtual Button Triggering A Flow")

## Configuration

The virtual button can be configured to have a specific payload sent when the button triggers the workflow.  This payload must be a valid JSON object, and will be placed on the standard `data` field of the payload when the workflow runs.  The payload field can be left empty, in which case an empty object is used as the payload.

![Virtual Button Trigger Config](/images/workflows/triggers/virtual-button-trigger-config.png "Virtual Button Trigger Config")

In the above example, the workflow will run with the `data` payload of `{"power": "toggle"}`.

## Payload

As just discussed, the configuration of the virtual button directly determines what will be included on the payload.  In the general case, a virtual button workflow payload will look like the following:

```json
{
  "time": <time of the button press>,
  "data": <the object defined in the virtual button configuration>,
  "applicationId": <id of the current application>,
  "triggerId": <id of the virtual button trigger>,
  "triggerType": "virtualButton",
  "flowId": <id of the current workflow>
}
```

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "power": "toggle"
  },
  "applicationId": "56311a8e51645b2054eb258b",
  "triggerId": "56c8967bb8df0f0100d629120-VJ7sVsZje",
  "triggerType": "virtualButton",
  "flowId": "56c8967bb8df0f0100d62912"
}
```
