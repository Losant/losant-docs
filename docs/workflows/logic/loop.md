---
flowclass:
  - Application
  - Experience
  - Edge 1.0.0
description: Learn more about the Losant Loop Node.
---

# Loop Node

The Loop Node allows for iterating over values on your payload, or for performing a certain operation a set number of times.

![Loop Node Overview](/images/workflows/logic/loop-overview.png "Loop Node Overview")

## Configuration

The Loop Node itself takes two properties, both of which are required:

* **Loop Source Path** is the payload path to the item over which to iterate. Depending on the type of value found at this path, the Loop Node will behave slightly differently ...
    * For [**arrays**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array), the Loop Node will run one iteration for each value in the array.
    * For [**objects**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object), the Loop Node will iterate over the object's top-level keys. (Note: Order of the object keys is not guaranteed while iterating.)
    * For [**numbers**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number), the loop will run the number of times specified by the absolute value of the number rounded up to the nearest integer.
    * For [**strings**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String), the Loop Node will iterate over each character in the value.
    * For all over value types, the Loop Node will not execute any iterations and will simply pass through to the next node(s).
* **Current Item Path** is the path on the payload where info on the current iteration should be stored. This value will be overwritten with each iteration. At this path will be stored an object with these properties ...
    * **value**: The value for this iteration.
    * **index**: The iteration counter (starting at 0).
    * **first**: A boolean indicating if this is the first iteration of the loop.
    * **last**: A boolean indicating if this is the last iteration of the loop.
    * **key**: If iterating over an object, the name of the property associated with the current iteration value.

Any nodes connected to the Loop Node's output will execute after all iterations are complete. Iterations will fire nodes within the Loop Node's sub-contents.

## Viewing Loop Contents

![Enter Loop](/images/workflows/logic/loop-enter-contents.png "Enter Loop")

The Loop Node differs in behavior from other nodes within the workflow engine, in that it represents a group of sub-nodes that are run per iteration. To view or edit nodes within the iteration process, double-click the node on the canvas, or click the "View Group Contents" button in the node's editor panel.

This will change the view of the workflow stage, indicating you are now viewing the contents of the Loop Node's iteration. All of your workflow's top-level nodes and connectors will no longer be visible, and in their place will be a new stage where nodes can be added to the iteration process and connected together. You may add, edit and connect nodes within the loop just like within the root level of your workflow. Think of your loop's contents as just another workflow within your main workflow.

![Loop Contents](/images/workflows/logic/loop-contents.png "Loop Contents")

The entire palette of workflow nodes is available when editing a group (including more Loop Nodes) **except for workflow triggers.** A workflow may only be triggered from the root level of the workflow.

### Sub-Node Errors

If any of your loop's sub-nodes has configuration errors, the Loop Node at the root level will indicate an error exists within the group, and you will not be able to deploy the workflow until the errors are resolved.

### Debug Output

![Loop Debug Hover](/images/workflows/logic/loop-debug-hover.png "Loop Debug Hover")

While viewing a loop's contents, [debug messages](/workflows/outputs/debug/#viewing-debug-output) will continue to stream into the debug panel from the workflow, regardless of if the node that triggered the message is part of the currently viewed group. However, hovering over a debug message, or viewing a live stream of debug content, will only highlight workflow runs whose corresponding [Debug Node](/workflows/outputs/debug/) is currently visible.

### Returning to the Top Level

To back out of the loop and return to the top level, double-click a blank area on the workflow stage, or click the breadcrumb in the top left corner of the stage.

## Loop-Specific Nodes

There are three special nodes that exist only within a loop's contents.

![Loop-Specific Nodes](/images/workflows/logic/loop-special-nodes.png "Loop-Specific Nodes")

### Loop Trigger

The Loop Trigger represents the starting point of each loop iteration. Its appearance mimics that of a workflow trigger. It takes no configuration of its own; however, the properties of the loop itself (the Loop Source Path and Current Item Path) may be edited when it is selected.

The node may be moved around the canvas and connected to other nodes like any other trigger; however, **this node may not be deleted.**

### Return Node

When reached, the Return Node indicates that the current iteration should stop at that point and any changes made to the payload within the iteration should be held over and used as the starting payload for the next iteration.

By default, one Return Node is included and is connected to your Loop Trigger when first creating a loop, but additional Return Nodes can be added to the stage – or, if you do not wish to mutate your original payload within your iterations, you may remove the included Return Node. It is not necessary to include a Return Node at the end of your workflow branches to indicate the end of an iteration.

The node is similar to a [continue](https://www.w3schools.com/js/js_break.asp) statement in a JavaScript loop. Return Nodes take no configuration.

### Break Node

The Break Node stops the iteration process after the current iteration completes. No iterations will occur after the Break Node is reached, and the workflow will continue with any nodes that come after the loop sub-process (if applicable). The payload for any subsequent nodes will match the (potentially mutated) payload at the time the Break Node was reached.

The Break Node's functionality is similar to that of the [break](https://www.w3schools.com/js/js_break.asp) statement in a JavaScript loop. The node takes no configuration.

## Loop Race Conditions

If your loop contains branches to different node paths, and two or more of those branches ends with a return or Break Node, the payload for the rest of the workflow's execution will match the payload at **whichever node was reached first.** For this reason, you should take special care with constructing your loop workflows to avoid [race conditions](https://en.wikipedia.org/wiki/Race_condition).

![Loop Race Conditions](/images/workflows/logic/loop-race-example.png "Loop Race Conditions")

If a Break Node is reached before a Return Node, the iteration process will stop with that iteration; similarly, if a Return Node is reached before a Break Node, the iteration process will continue and the Break Node will be ignored. But the loop's next iteration, or the workflow's nodes following the Loop Node, will not fire until the other branches have completed execution.

Take the screenshot above as an example. For each iteration in the loop, we are making three simultaneous HTTP requests, and the responses are put on the payload at `data.responseA`, `data.responseB` and `data.responseC`, respectively. Those responses are then pushed to an array, and we connect that to a Return Node so we have the value for the next iteration.

However, the workflow **will not wait** for all three responses to be added to the array before executing the Return Node and continuing the loop. Instead, whichever request completes first will have its response added to the array, and the response from the other two requests will be ignored for the continuing execution of the workflow. Furthermore, if Request B completes first and it does not have an OK response, the loop will break without adding any additional response values to the array. (The other two HTTP requests will still complete, though their responses will not be added to the payload.)

![Loop Race Avoidance](/images/workflows/logic/loop-race-avoidance.png "Loop Race Avoidance")

To avoid this particular race condition we could reconstruct this loop so the requests happen in sequence (seen above). The danger here is that if we are iterating over a large number of items, or our HTTP requests take a significant amount of time, our workflow could time out before completing execution.
