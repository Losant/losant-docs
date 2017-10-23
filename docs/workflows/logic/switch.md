# Switch Node

The switch node allows a workflow to branch across many different paths based on matching the switch value against various case values.

![Switch Node](/images/workflows/logic/switch-node.png "Switch Node")

## Configuration

To configure a switch node, first you fill in the 'Switch Template' - a [string template](/workflows/accessing-payload-data/#string-templates) that the workflow will evaluate to determine the base value to compare the various possible branches against.

![Switch Node Switch Template](/images/workflows/logic/switch-node-switch-template.png "Switch Node Switch Template")

Next, you fill in various `Case Templates`, which are also [string template](/workflows/accessing-payload-data/#string-templates) - one for each possible branch for the switch node. You may optionally provide a label for each case, which only affects how the branch is displayed on the workflow canvas. A case's label has no effect on its evaluation.

When the workflow runs, the first evaluated case template that matches the evaluated switch template will be the branch that is followed by the workflow. If no cases match, then the `Default` branch is used instead.

![Switch Node Case Templates](/images/workflows/logic/switch-node-case-templates.png "Switch Node Case Templates")

In the above example, the workflow will match the first case (the leftmost) whenever the value of the payload field `data.path` is equal to the string "query". It match the second case (the middle) whenever the value of the payload field `data.path` is equal to the string "record". If the value of `data.path` does not match either of those cases, it will match the `Default` case on the right.

For example, the following workflow payload would match the "record" case, and take that middle branch:

```json
{
  "data": {
    ...
    "path": "record",
    ...
  },
  ...
}
```
