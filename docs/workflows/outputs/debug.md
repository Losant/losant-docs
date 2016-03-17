# Debug Node

The debug node allows inspection of the current payload at any point during a workflow.  It is extremely useful when initially constructing a workflow, to make sure that all the various components are acting on the payload as expected.

![Debug Node](/images/workflows/outputs/debug-node.png "Debug Node")

## Configuration

![Debug Node Configuration](/images/workflows/outputs/debug-node-config.png "Debug Node Configuration")

The debug node is extremely simple to configure - its only property is an optional message to include in the debug messages that get displayed.  In the above example, the message is "Before Mutate".

## Live Stream

When a workflow runs through a debug node, the node live streams the current payload to the debug tab of the properties panel.  As new payloads arrive, they will appear expanded at the top of the list. Multiple debug nodes in a workflow work in concert, so you can see the payload at various stages in the workflow.  For instance, here are the payloads from both debug nodes in the above workflow:

![Debug Node Workflow Stream](/images/workflows/outputs/debug-node-workflow-stream.png "Debug Node Workflow Stream")
