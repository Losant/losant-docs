# Debug Node

The debug node allows inspection of the current payload at any point during a workflow. It is extremely useful when initially constructing a workflow, to make sure that all the various components are acting on the payload as expected.

![Debug Node](/images/workflows/outputs/debug-node.png "Debug Node")

## Configuration

The debug node takes an optional message (a [string template](/workflows/accessing-payload-data/#string-templates)) to include in the debug messages that get displayed. In the above example, the message is "Before Mutate".

The node also allows for only printing a single property from the payload, as defined by a [payload path](/workflows/accessing-payload-data/#payload-paths). If the property is defined in the configuration, and that property does not exist on the payload, the debug output will print `undefined`.

## Viewing Debug Output

Whenever a workflow runs, and in the process that run passes through one or more debug nodes, the workflow run will be visualized two different ways.

### Debug Panel

Every time a debug node is hit, the timestamp, and payload value will be written as a new message in the Debug tab. New messages appear at the top of the list. If multiple debug nodes are hit as part of a single workflow run, each debug node will get an entry in the panel; this can be helpful in determining how your payload changes over the course of a run.

![Debug Node Output](/images/workflows/outputs/debug-node-workflow-stream.png "Debug Node Output")

To view that payload's path through the workflow run, hover your mouse over the debug message. You will see the nodes that were part of the run highlight, and the debug node that generated the message will be called out.

### Live Stream

Optionally, you may also enable the Live Debug Stream by clicking the button in the top right corner of the workflow stage. When live streaming is enabled, you will see workflow runs highlight in real time as they fire.

![Debug Node Live Stream](/images/workflows/outputs/debug-live-view.png "Debug Node Live Stream")

Note that, should multiple workflow runs occur per second, some of the runs may not be visualized on the stage. Also, if you have unsaved changes in your workflow, live streams will automatically be disabled until the changes are saved.
