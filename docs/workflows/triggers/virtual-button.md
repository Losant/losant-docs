---
flowclass:
  - Application
  - Experience
  - Edge 1.5.0
description: Learn more about the Losant Virtual Button Trigger.
---

# Virtual Button Trigger

The Virtual Button Trigger Node will fire a workflow when the "virtual button" is pressed. The most common use case of the virtual button is to debug and test workflows, without having to wait for an external trigger of some kind.

![Virtual Button Trigger](/images/workflows/triggers/virtual-button-trigger.png "Virtual Button Trigger")

## Triggering The Workflow

A workflow can be triggered by the virtual button in one of two ways. Either press the "Trigger Workflow" button in the node settings panel, or press the button on the node itself.

![Virtual Button Triggering A Flow](/images/workflows/triggers/virtual-button-trigger-buttons.png "Virtual Button Triggering A Flow")

## Configuration

The Virtual Button Trigger Node can be configured to have a specific payload sent when the button triggers the workflow. This payload must be a valid JSON object, and will be placed on the standard `data` field of the payload when the workflow runs. The payload field can be left empty, in which case an empty object is used as the payload.

![Virtual Button Trigger Config](/images/workflows/triggers/virtual-button-trigger-config.png "Virtual Button Trigger Config")

In the above example, the workflow will run with the `data` payload of `{"power": "toggle"}`.

## Edge Workflow

When using the Virtual Button Trigger Node in an Edge Workflow there are a couple extra configurations required. Edge Workflows can be deployed to many different devices at the same time (potentially different versions of this workflow). The extra configuration is to ensure that you are triggering the correct Edge Workflow, workflow version, and device.

![Virtual Button Edge Flow](/images/workflows/triggers/virtual-button-trigger-edge.png "Virtual Button Edge Flow")

Here are the steps:

1. Select a [workflow version](/workflows/versioning/) which is currently deployed on at least one device.
1. Select a single device.
1. Press the "Trigger Workflow" button, or the button on the node itself.

## Payload

The node configuration directly determines what will be included on the payload. In the general case, the payload of a workflow triggered by a Virtual Button Trigger Node will look like the following:

```json
{
  "time": <time of the button press>,
  "data": <the object defined in the virtual button configuration>,
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the Virtual Button Trigger>,
  "triggerType": "virtualButton",
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "flowVersion": <version of the current workflow>
  "globals": <object of workflow globals>
}
```

For the example workflow above, the payload created by the Virtual Button Trigger Node will look similar to this:

```json
{
  "time": Fri Feb 19 2018 17:26:00 GMT-0500 (EST),
  "data": {
    "power": "toggle"
  },
  "applicationId": "56311a8e51645b2054eb258b",
  "applicationName": "Embree",
  "triggerId": "56c8967bb8df0f0100d629120-VJ7sVsZje",
  "triggerType": "virtualButton",
  "flowId": "56c8967bb8df0f0100d62912",
  "flowVersion":"develop"
  "flowName": "Manual Power Switch",
  "globals": {}
}
```
