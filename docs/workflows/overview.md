# Workflows

Workflows are the primary way for your devices to communicate with each other and other services. Workflows allow you to trigger notifications, create events, send commands, and many more. Workflows are basically the brains of your connected solution.

## Overview

All workflows start with a trigger that includes a payload. The purpose of the workflow is to make decisions based on this payload, modify the data if needed, and eventually result in some kind of output.

As the payload flows through the workflow, fields can be added, removed, or changed. Each node in a workflow accepts a payload as an input, optionally modifies it, and outputs the payload to be the input for the next node. Some nodes, like conditionals, don't modify the payload at all and simply pass it directly though as-is, but they do provide a way to branch the workflow down multiple paths.

Below is an example of how a payload flows through a workflow.

![Workflow Overview](/images/workflows/overview.png "Workflow Overview")

Let's break the above workflow down and explain the individual nodes and how they work with the payload.

### Temp Sensor - Trigger Node

All workflows start with a trigger. There are many different triggers and each one starts the workflow with a different payload. All triggers, however, put their specific payload on the `data` field of the payload.

![Workflow Overview Trigger](/images/workflows/overview-trigger.png "Workflow Overview Trigger")

In this example the trigger is a device node, which will run the payload whenever a device reports its [state](/devices/state). The device trigger places the state that was reported on the payload's data field. When the workflow starts, the payload will look like this:

```json
{
  "data" : { "tempF" : 77 }
}
```

The workflow will then continue with this payload and pass it to the next node, which is the conditional node.

### Temp High - Conditional Node

Conditional nodes allow you to branch the workflow based on some expression that evaluates to true or false. If the expression is true, the workflow branches right. If the expression is false, the workflow branches left.

![Workflow Overview Conditional](/images/workflows/overview-conditional.png "Workflow Overview Conditional")

This node doesn't modify the payload, but it is using a value in the payload to make a decision. Conditional nodes support templates, which are expressions you can write and include values from the payload. Refer to the [Templates Fields and Payload Paths](#template-fields-and-payload-paths) section of this document for detailed information. In this example, the expression is:

```
{{ data.tempF }} > 75
```

Whenever this node is executed it will grab the `data.tempF` value in the payload and check to see whether or not it's greater than 75. Since we saw that the tempF value in our payload is currently 77, this conditional will branch to the right. The conditional node doesn't modify the payload, so the same payload that was passed to it will flow as-is to the next node in the workflow.

### Convert ˚F to ˚C - Math Node

Math nodes allow you to write mathematical expressions and store the result anywhere on the payload.

![Workflow Overview Math](/images/workflows/overview-math.png "Workflow Overview Math")

Each math node supports multiple statements, but this example is only using one. Each statement includes the actual expression and a payload path of where to store the result. For this example, the expression is:

```
( {{ data.tempF }} - 32 ) / 1.8
```

Just like with the conditional node, you can reference values from the payload in these expressions. This is simply converting degrees Fahrenheit to degrees celsius.

The second part of each math expression is a payload path to store the result. In this example the payload path is:

```
degreesCelsius
```

This payload path will place the result of the math expression on the root of the payload. The new payload now looks like:

```json
{
  "data" : { "tempF" : 77 },
  "degreesCelsius" : 25
}
```

### SMS Node

The SMS node allows you to send an SMS message one or more phone numbers. This example demonstrates how to use the newly modified payload in a useful way.

![Workflow Overview SMS](/images/workflows/overview-sms.png "Workflow Overview SMS")

Just like the previous two nodes, the SMS node also supports template fields. But unlike evaluating to a boolean for the conditional node, or a number for the math node, the SMS node uses the template field to create a custom message that contains a value from the payload.

```
Temperature warning. Temperature now at {{ degreesCelsius }} deg C!
```

For this example, the user wanted to send an SMS alert with the temperature in celsius, but our temperature sensor reported the value in Fahrenheit. This is why we used the math node to convert the temperature before being sent.

## Template Fields and Payload Paths

## Saving and Deploying

## Common Payload Fields
