# Mutate Node

The mutate node allows a workflow to perform arbitrary changes to the structure of the payload object.

![Mutate Node](/images/workflows/logic/mutate-node.png "Mutate Node")

## Configuration

Mutate nodes are configured by creating "rules", of which there are 4 types - "Set", "Remove", "Copy", and "Move".  A mutate node can have as many rules as is needed, and the rules are executed in order from the first to last, which means subsequent rules can assume that the changes from previous rules have taken place.

![Mutate Node Add A Rule](/images/workflows/logic/mutate-node-add-a-rule.png "Mutate Node Add A Rule")

To add a rule to a mutate node, select the type of rule desired, and press the "+" button.

### The Set Rule

The set rule allows the setting of a value at a path in the payload. There are two configuration properties, the value template and the destination path. The value template, as its name suggests, supports templating, and so can reference other payload values if needed.  The destination path field is a JSON path which defines where the new value should be placed on the payload.

![Mutate Node Set Rule](/images/workflows/logic/mutate-node-set-rule.png "Mutate Node Set Rule")

In the above example, the set rule will be creating a new value combined from the existing `data.firstName` and `data.lastName` fields in the payload, and setting the new value at the `data.fullName` field in the payload.  So, for example, given the following payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56c794a06895b00100cbe84c"
}
```

The payload after execution of the mutate node would look like:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John",
    "fullName": "John Smith"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56c794a06895b00100cbe84c"
}
```

### The Remove Rule

The remove rule allows the removal of an existing value at a path in the payload.  There is a single configuration property, the source path.  The source path is a JSON path which defines what field should be removed from the payload.

![Mutate Node Remove Rule](/images/workflows/logic/mutate-node-remove-rule.png "Mutate Node Remove Rule")

In the above example, the remove rule will be remove the existing `data.firstName` field in the payload. So, for example, given the following payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56c794a06895b00100cbe84c"
}
```

The payload after execution of the mutate node would look like:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56c794a06895b00100cbe84c"
}
```

### The Copy Rule

The copy rule allows the duplication of an existing value at a path in the payload.  There are two configuration properties, the source path and the destination path.  The source path is a JSON path which defines what field should be the source of the value to copy.  The destination path is a JSON path that defines where to place the copied value.

![Mutate Node Copy Rule](/images/workflows/logic/mutate-node-copy-rule.png "Mutate Node Copy Rule")

In the above example, the copy rule will copy the value at the existing `data.firstName` field to the new field `data.friendlyName`. So, for example, given the following payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56c794a06895b00100cbe84c"
}
```

The payload after execution of the mutate node would look like:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John",
    "friendlyName": "John"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56c794a06895b00100cbe84c"
}
```

### The Move Rule

The move rule allows the moving of an existing value at a path in the payload to a new path in the payload. There are two configuration properties, the source path and the destination path.  The source path is a JSON path which defines what field should be the source of the value to move.  The destination path is a JSON path that defines where to place the moved value.

![Mutate Node Move Rule](/images/workflows/logic/mutate-node-move-rule.png "Mutate Node Move Rule")

In the above example, the move rule will move the value at the existing `data.firstName` field to the new field `data.friendlyName`. So, for example, given the following payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "firstName": "John"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56c794a06895b00100cbe84c"
}
```

The payload after execution of the mutate node would look like:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "lastName": "Smith",
    "friendlyName": "John"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56c794a06895b00100cbe84c"
}
```
