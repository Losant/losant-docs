# Debug Node

The debug node allows inspection of the current payload at any point during a workflow.  It is extremely useful when initially constructing a workflow, to make sure that all the various components are acting on the payload as expected.

![Debug Node](/images/workflows/outputs/debug-node.png "Debug Node")

## Configuration

![Debug Node Configuration](/images/workflows/outputs/debug-node-config.png "Debug Node Configuration")

The debug node takes an optional message (a [string template](/workflows/accessing-payload-data/#string-templates)) to include in the debug messages that get displayed.  In the above example, the message is "Before Mutate".

The node also allows for only printing a single property from the payload, as defined by a [payload path](/workflows/accessing-payload-data/#payload-paths). If the property is defined in the configuration, and that property does not exist on the payload, the debug output will print `undefined`.

## Live Stream

When a workflow runs through a debug node, the node live streams the current payload to the debug tab of the properties panel.  As new payloads arrive, they will appear expanded at the top of the list. Multiple debug nodes in a workflow work in concert, so you can see the payload at various stages in the workflow.  For instance, here are the payloads from both debug nodes in the above workflow:

![Debug Node Workflow Stream](/images/workflows/outputs/debug-node-workflow-stream.png "Debug Node Workflow Stream")

Hovering your mouse over an entry in the debug log will highlight the node that generated the message on the stage.
