flowclass: Cloud
flowclass: Edge 1.0.0
description: Learn more about the Losant Workflow Trigger Node.

# Workflow Trigger Node

The Workflow Trigger Node allows a workflow to trigger a different workflow to run.

![Workflow Trigger Node](/images/workflows/outputs/workflow-trigger-node.png "Workflow Trigger Node")

## Configuration

There are two parts to configuring a Workflow Trigger Node - selecting the workflow and virtual button to trigger, and optionally creating a payload to be used for the trigger.

![Workflow Trigger Node Selection](/images/workflows/outputs/workflow-trigger-node-selection.png "Workflow Trigger Node Selection")

First step is selecting the workflow and virtual button to trigger. The dropdown will list all virtual buttons in all of the workflows in the current application. In the example above, the node is configured to trigger the button "Trigger Light" in workflow "Internet Button".

![Workflow Trigger Node Payload](/images/workflows/outputs/workflow-trigger-node-payload.png "Workflow Trigger Node Payload")

The next step is configuring the payload. The payload is optional - if there is no payload specified, the default payload for the given workflow and virtual button will be used. There are a couple different ways to specify a payload - by [payload path](/workflows/accessing-payload-data/#payload-paths), [string template](/workflows/accessing-payload-data/#string-templates) or [JSON template](/workflows/accessing-payload-data/#json-templates). In the above example, the node is using the value at the payload path `data.subPayload` as the payload for the triggered workflow.'

## Throttling And Limits

The Workflow Trigger Node has the same throttling rules as using the [API](/rest-api/overview/#throttles-and-limits) to trigger a virtual button - it is limited to 100 calls in a 10-second window (per virtual button) - on average, 10 calls per second.
