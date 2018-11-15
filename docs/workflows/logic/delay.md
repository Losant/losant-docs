flowclass: Cloud
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant Delay Node.

# Delay Node

The Delay Node allows a workflow to pause for a short time before continuing.

![Delay Node](/images/workflows/logic/delay-node.png "Delay Node")

## Configuration

The Delay Node has a single configuration value, which is the number of seconds that the node should pause the currently executing workflow for. The number of seconds can be anywhere between 0 seconds (no pause) and 60 seconds. Pauses longer than 60 seconds are not allowed, because the maximum execution time of a workflow is limited to 60 seconds.

![Delay Node Config](/images/workflows/logic/delay-node-config.png "Delay Node Config")

In the above example, the workflow will delay for 30 seconds between the "Device Turn On" Device Command Node and the "Device Turn Off" node.
