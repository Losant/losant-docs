flowclass: Application
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant Debug Node.

# Debug Node

The Debug Node allows inspection of the current payload at any point during a workflow. It is extremely useful when initially constructing a workflow, to make sure that all the various components are acting on the payload as expected.

![Debug Node](/images/workflows/outputs/debug-node.png "Debug Node")

## Configuration

The Debug Node takes an optional message (a [string template](/workflows/accessing-payload-data/#string-templates)) to include in the debug messages that get displayed. In the above example, the message is "Before Mutate".

The node also allows for only printing a single property from the payload, as defined by a [payload path](/workflows/accessing-payload-data/#payload-paths). If the property is defined in the configuration, and that property does not exist on the payload, the debug output will print `undefined`.

## Viewing Debug Output

Whenever a workflow runs, and in the process that run passes through one or more Debug Nodes, the workflow run will be visualized two different ways.

### Debug Panel

Every time a Debug Node is hit, the timestamp, and payload value will be written as a new message in the Debug tab. New messages appear at the top of the list. If multiple Debug Nodes are hit as part of a single workflow run, each Debug Node will get an entry in the panel; this can be helpful in determining how your payload changes over the course of a run.

![Debug Node Output](/images/workflows/outputs/debug-node-workflow-stream.png "Debug Node Output")

To view that payload's path through the workflow run, hover your mouse over the debug message. You will see the nodes that were part of the run highlight, and the Debug Node that generated the message will be called out.

### Live Stream

Optionally, you may also enable the Live Debug Stream by clicking the button in the top right corner of the workflow stage. When live streaming is enabled, you will see workflow runs highlight in real time as they fire.

![Debug Node Live Stream](/images/workflows/outputs/debug-live-view.png "Debug Node Live Stream")

Note that, should multiple workflow runs occur per second, some of the runs may not be visualized on the stage. Also, if you have unsaved changes in your workflow, live streams will automatically be disabled until the changes are saved.

## Behavior by Flow Type

If the workflow is an [application workflow](/workflows/application-workflows/) or [experience workflow](/workflows/experience-workflows/), debug node output is generated for any runs of the workflow whenever you are looking at the workflow. For [edge workflows](/workflows/edge-workflows/#debugging), however, by default no debug output is generated. When you want debug output for an edge workflow, you must first select an [Edge Compute device](/devices/edge-compute/) that the workflow is deployed and running on. At that point, Losant will tell the Edge Agent on that device to start debugging that workflow, and the Edge Agent will start reporting debugging information.

![Debug Node Choose Device](/images/workflows/outputs/debug-choose-device.png "Debug Node Choose Device")

Of course, for an edge device to report workflow debug information, it must be connected to the internet and Losant. If an edge device is not online or connected, no debug information will appear even if the device is selected. In addition, debug messages from an edge device are also batched and throttled - a batch of debug messages will be sent up to Losant no more than once per second, with no more than five debug messages. So if a workflow is running quite frequently on an edge device, you might not see all the debug messages in the debug log.
