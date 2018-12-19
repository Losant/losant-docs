---
flowclass:
  - Application
  - Experience
  - Edge 1.0.0
description: Learn more about the Losant Mutate Node.
---

# Mutate Node

The Mutate Node allows a workflow to perform arbitrary changes to the structure of the payload object.

![Mutate Node](/images/workflows/logic/mutate-node.png "Mutate Node")

## Configuration

Mutate Nodes are configured by creating "rules", of which there are four types - "Set", "Remove", "Copy", and "Move". A Mutate Node can have as many rules as is needed, and the rules are executed in order from the first to last, which means subsequent rules can assume that the changes from previous rules have taken place.

![Mutate Node Add A Rule](/images/workflows/logic/mutate-node-add-a-rule.png "Mutate Node Add A Rule")

To add a rule to a Mutate Node, select the type of rule desired, and press the "+" button.

### The Set Rule

The set rule allows the setting of a value at a defined [payload path](/workflows/accessing-payload-data/#payload-paths). There are two configuration properties: the value template and the destination path. The value template by default takes a [string template](/workflows/accessing-payload-data/#string-templates), and so can reference other payload values if needed. The destination path field is a [payload path](/workflows/accessing-payload-data/#payload-paths), which defines where the new value should be placed on the payload. The value template field can also take a [JSON template](/workflows/accessing-payload-data/#json-templates) if the `Treat value as JSON` checkbox is checked - in which case the value is expected to render to valid json, which will then be parsed and placed on the workflow payload. This is an easy way to get numbers or booleans onto the workflow payload.

![Mutate Node Set Rule](/images/workflows/logic/mutate-node-set-rule.png "Mutate Node Set Rule")

In the above example, the set rule will be creating a new value combined from the existing `data.firstName` and `data.lastName` fields in the payload, and setting the new value at the `data.fullName` field in the payload. So, for example, given the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John"
  },
  ...
}
```

The payload after execution of the Mutate Node would look like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John",
    "fullName": "John Smith"
  },
  ...
}
```

### The Remove Rule

The remove rule allows the removal of an existing value at a path in the payload. There is a single configuration property: the source path, which is a [payload path](/workflows/accessing-payload-data/#payload-paths) to which field should be removed from the payload.

![Mutate Node Remove Rule](/images/workflows/logic/mutate-node-remove-rule.png "Mutate Node Remove Rule")

In the above example, the remove rule will be remove the existing `data.firstName` field in the payload. So, for example, given the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John"
  },
  ...
}
```

The payload after execution of the Mutate Node would look like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith"
  },
  ...
}
```

### The Copy Rule

The copy rule allows the duplication of an existing value at a path in the payload. There are two configuration properties, the source path and the destination path. The source path is a [payload path](/workflows/accessing-payload-data/#payload-paths) defining the field whose value should be copied. The destination path is also a [payload path](/workflows/accessing-payload-data/#payload-paths) which defines where to place the copied value.

![Mutate Node Copy Rule](/images/workflows/logic/mutate-node-copy-rule.png "Mutate Node Copy Rule")

In the above example, the copy rule will copy the value at the existing `data.firstName` field to the new field `data.friendlyName`. So, for example, given the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John"
  },
  ...
}
```

The payload after execution of the Mutate Node would look like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John",
    "friendlyName": "John"
  },
  ...
}
```

### The Move Rule

The move rule allows the moving of an existing value at a path in the payload to a new path in the payload. There are two configuration properties, the source path and the destination path. The source path is a [payload path](/workflows/accessing-payload-data/#payload-paths) defining what field should be the source of the value to move. The destination path is also a [payload path](/workflows/accessing-payload-data/#payload-paths), which defines where to place the moved value.

![Mutate Node Move Rule](/images/workflows/logic/mutate-node-move-rule.png "Mutate Node Move Rule")

In the above example, the move rule will move the value at the existing `data.firstName` field to the new field `data.friendlyName`. So, for example, given the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John"
  },
  ...
}
```

The payload after execution of the Mutate Node would look like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "friendlyName": "John"
  },
  ...
}
```
