flowclass: Cloud
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant Conditional Node.

# Conditional Node

The Conditional Node allows a workflow to branch based upon a [conditional expression](/workflows/accessing-payload-data/#expressions).

![Conditional Node](/images/workflows/logic/conditional-node.png "Conditional Node")

## Configuration

Configuring a Conditional Node involves writing an [expression](/workflows/accessing-payload-data/#expressions), which will evaluate to a true or false value. When the expression evaluates to `false` for a given workflow payload, the route on the left out of the Conditional Node is taken. When the expression evaluates to `true`, the route on the right out of the node is taken.

![Conditional Node Config](/images/workflows/logic/conditional-node-config.png "Conditional Node Config")

In the above example, the workflow will take the right (or `true`) path whenever the value of the payload field `data.path` is equal to the string "/transition/up", and will take the left (or `false`) path otherwise.

For example, the following workflow payload would take the `true` path:

```json
{
  "data": {
    ...
    "path": "/transition/up",
    ...
  },
  ...
}
```
