# Debug Node

The debug node allows inspection of the current payload at any point during a workflow.  It is extremely useful when initially constructing a workflow, to make sure that all the various components are acting on the payload as expected.

![Debug Node](/images/workflows/outputs/debug-node.png "Debug Node")

## Configuration

![Debug Node Configuration](/images/workflows/outputs/debug-node-config.png "Debug Node Configuration")

The debug node is extremely simple to configure - its only property is an optional message to include in the debug messages that get displayed.  In the above example, the message is "Before Mutate".

## Live Stream

When a workflow runs through a debug node, the node live streams the current payload to the debug node panel.  As new payloads arrive, they will briefly glow green to indicate their arrival:

![Debug Node Before Mutate Stream](/images/workflows/outputs/debug-node-before-mutate-stream.png "Debug Node Before Mutate Stream")

Multiple debug nodes in a workflow work in concert - clicking on each debug node will show the particular payloads streaming through that node.  For instance, here are the payloads streaming through the second debug node in the above workflow:

![Debug Node After Mutate Stream](/images/workflows/outputs/debug-node-after-mutate-stream.png "Debug Node After Mutate Stream")

The "After Mutate" debug node shows different payloads than the "Before Mutate" debug node, because the mutate node has modified the payload (the mutate node is configured to remove the `tempC` field and rename the `tempF` field to `temperature`).

It is also possible to see the live stream of all debug nodes in the workflow at once - this stream of debug information is available on the main workflow properties panel, under "Debug & Error Stream":

![Debug Node Workflow Stream](/images/workflows/outputs/debug-node-workflow-stream.png "Debug Node Workflow Stream")
