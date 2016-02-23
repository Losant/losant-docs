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

## Common Payload Fields

The payloads described above only include what was added by the trigger. All payloads include a common set of other, potentially useful, fields:

```json
{
  "time": <time of the event>,
  "data": { ... },
  "applicationId": <id of the current application>,
  "triggerId": <id of the workflow trigger>,
  "triggerType": <name of the trigger>,
  "flowId": <id of the current workflow>
}
```

For example, a timer trigger will start a payload with the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {},
  "applicationId": "56311a8e51645b2054eb258b",
  "triggerId": "78fbb050d7f811e5b995b3a5b31df7d8",
  "triggerType": "timer",
  "flowId": "56c8967bb8df0f0100d62912"
}
```

## Saving and Deploying

Workflows are saved and deployed using the `Deploy Workflow` button.

![Deploy Workflow](/images/workflows/overview-deploy.png "Deploy Workflow")

The button will be green whenever there are changes that can be deployed. It will be gray when there are no changes.

Workflows can be enabled and disabled by clicking the `Enabled` checkbox on the workflow settings panel. The workflow settings panel can be displayed by clicking anywhere in the workflow canvas area.

![Enable Workflow](/images/workflows/overview-enable.png "Enable Workflow")

Once a workflow has been deployed, it will take effect immediately.

## Template Fields and Payload Paths

The keys to accessing data from your workflow payloads is **Template Fields**, and the way to add data or modify existing values in your payloads is through **Payload Paths**.

### Template Fields

Template fields are based on the <a href="https://mustache.github.io/" target="\_blank">Mustache templating language</a>. Simply put, a template field is a dot-separated JSON path inside of double curly braces.

For example, say you have the following payload ...

```json
{
  "data" : {
    "name" : "Bruce Campbell",
    "age" : 57,
    "movies" : [
      {
        "title" : "Army of Darkness",
        "year" : "1992"
      },
      {
        "title" : "Evil Dead II",
        "year" : "1987"
      },
      {
        "title" : "The Evil Dead",
        "year" : "1981"
      }
    ]
  }
}
```

We can access the data within this payload for our workflows using template fields.

```
My favorite actor is {{data.name}}!
// My favorite actor is Bruce Campbell!
```
_String interpolation_


```
{{data.age > 50}} // returns true
{{data.age === 45}} // returns false
```
_Simple evaluation_


```
{{data.name}} is {{#data.deceased}}not {{/data.deceased}} alive.
// My favorite actor is Bruce Campbell!
```
_Conditionals based on property existence_


```
  My favorite movies are:
  {{#data.movies}}
    {{#title}} from {{#year}}
  {{/data.movies}}
  // My favorite movies are:
  // Army of Darkness from 1992
  // Evil Dead II from 1987
  // The Evil Dead from 1981
```
_Array iteration_


```
I haven't seen {{data.movies.1.title}} YET ...
// I haven't seen Evil Dead II YET ...
```
_Deep object traversing and array item lookup by index_

### Payload Paths

Like template fields, payload paths are also based on a dot-separated JSON syntax. The differences between template fields and payload paths are:

- Payload paths **do not** require the double curly braces `{{ }}` around the dot-separated object paths
- Payload paths are used to **retrieve, store or modify payload data**, whereas template fields are used to evaluate the payload and output its contents

Following our previous example from above, we could us a payload path to copy the first movie in the array ...
`data.movies.0`

... and set it in a new object representing our favorite film ...
`favoriteMovie`

... and our new payload would look like this ...
```json
{
  "data" : {
    "name" : "Bruce Campbell",
    "age" : 57,
    "movies" : [
      {
        "title" : "Army of Darkness",
        "year" : "1992"
      },
      {
        "title" : "Evil Dead II",
        "year" : "1987"
      },
      {
        "title" : "The Evil Dead",
        "year" : "1981"
      }
    ]
  },
  "favoriteMovie" : {
    "title" : "Army of Darkness",
    "year" : "1992"    
  }
}
```
