# Latch Node

The latch node allows a workflow to easily do "one-time" branching, with a reset.

![Latch Node](/images/workflows/logic/latch-node.png "Latch Node")

## Configuration

The latch node has two main configuration properties: the `Latch Expression` and the `Reset Expression`. These two [expressions](/workflows/accessing-payload-data/#expressions) work in concert to give the behavior of a "latch". When the latch expression evaluates to true AND the node is not in the latched state, the `true` route on the right out of the node is taken, and the node is placed into the latched state. When the reset expression evaluates to true, if the node is in the latched state, the node is placed into the unlatched state.

![Latch Node Config](/images/workflows/logic/latch-node-config.png "Latch Node Config")

In the above example, if moisture is reported as below 300 (the latch expression), the alert will be sent. Once the alert is sent once, however, no more alerts will while moisture remains below 500 (the reset expression). Once moisture goes back up above 500, the latch node resets, and the next time moisture goes below 300, another alert will be sent.

## Outputs

There are a number of outputs that can optionally be configured on the latch node, which add various information about the state of the latch node to the payload.

![Latch Node Outputs](/images/workflows/logic/latch-node-outputs.png "Latch Node Outputs")

* **Path for result of Latch Expression** takes a [payload path](/workflows/accessing-payload-data/#payload-paths) and will place the result of evaluating the latch expression at that path on the payload.
* **Path for result of Reset Expression** takes a [payload path](/workflows/accessing-payload-data/#payload-paths) and will place the result of evaluating the reset expression at that path on the payload.
* **Path for prior latch state** takes a [payload path](/workflows/accessing-payload-data/#payload-paths) and will place `true` or `false` at that path on the payload depending on if the latch node was latched when entering the latch node.
* **Path for current latch state** takes a [payload path](/workflows/accessing-payload-data/#payload-paths) and will place `true` or `false` at that path on the payload depending on if the latch node is now latched upon exiting the node.
* **Path for branch taken** takes a [payload path](/workflows/accessing-payload-data/#payload-paths) and will place `true` or `false` at that path on the payload depending on which branch out of the latch node was taken.

## Advanced Options

The Latch node also has an optional field at the bottom named `Latch Identifier`. This field is a [string template](/workflows/accessing-payload-data/#string-templates) and can be used to make a single latch node function as the equivalent of multiple latches. For example, if multiple devices can trigger a workflow and pass through this latch node, you can have the latch identifier be the triggering device ID. That way the latch node will latch/unlatch on a per-device basis, instead of on a global workflow basis.
