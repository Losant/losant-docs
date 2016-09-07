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

Just like with the conditional node, you can reference values from the payload in these expressions. This is simply converting degrees Fahrenheit to degrees Celsius.

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

For this example, the user wanted to send an SMS alert with the temperature in Celsius, but our temperature sensor reported the value in Fahrenheit. This is why we used the math node to convert the temperature before being sent.

## Common Payload Fields

The payloads described above only include what was added by the trigger. All payloads include a common set of other, potentially useful, fields:

```json
{
  "time": <time of the event>,
  "data": { ... },
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the workflow trigger>,
  "triggerType": <name of the trigger>,
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "globals": <object of workflow globals>
}
```

For example, a timer trigger will start a workflow with the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {},
  "applicationId": "56311a8e51645b2054eb258b",
  "applicationName": "My Timer App",
  "triggerId": "78fbb050d7f811e5b995b3a5b31df7d8",
  "triggerType": "timer",
  "flowId": "56c8967bb8df0f0100d62912",
  "flowName": "My Timer Flow",
  "globals": {}
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
// Bruce Campbell is alive.
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

-   Payload paths **do not** require the double curly braces `{{ }}` around the dot-separated object paths
-   Payload paths are used to **retrieve, store or modify payload data**, whereas template fields are used to evaluate the payload and output its contents

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

<br/>

## Import / Export

Workflows can be exported to a file, and can later be imported from that file into a workflow in a different (or the same) application.  Exporting a workflow can be done from the main workflow properties panel.

![Export Workflow](/images/workflows/workflow-export.png "Export Workflow")

There is one option for exporting a workflow, and that is if the values for the global config should be included in the export.  The keys for the global config will always be included, but you have the option of not exporting the values in case sensitive information (such as access keys) are in the global config section.

The most common case when importing a workflow will be importing into a blank workflow - however, Losant also supports importing into a workflow with existing nodes.  In that case, the nodes for the imported workflow are just added alongside the existing nodes.  Importing a workflow can be done right below the export option on the main workflow properties panel.

![Import Workflow](/images/workflows/workflow-import.png "Import Workflow")

When importing a workflow, configuration values that were specific to the application the workflow was originally exported from are only kept when importing into that same application.  So for instance, when importing a workflow across applications, things like a selected device id on a device trigger will be cleared, since that id will not exist in the application being imported to.

## Workflow Globals

Workflows can have a set of global config keys - which are essentially keys/value pairs added to the payload under the `globals` key whenever the workflow runs.  This is a great place to store configuration values or API keys, especially if they are needed for use in multiple different nodes.  Globals can be accessed through the "Globals" tab of the properties panel.

![Workflow Globals](/images/workflows/workflow-globals.png "Workflow Globals")

In the above example, there are 3 global keys set &mdash; `minLevel` (with a numeric value of `300`), `resetLevel` (with a numeric value of `500`), and `phone` (with a string value of `632-538-0975`).  Complex objects can be configured by choosing `JSON` as the data type of the value and adding JSON as the value.  Whenever the workflow runs, the payload will always include these global values.  For the above example, a payload might end up looking like the following:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "moisture": 576
  },
  "globals":{
    "minLevel": 300,
    "resetLevel": 500,
    "phone": "632-538-0975"
  }
  "applicationId": "56919b1a9d206d0100c54152",
  "applicationName": "Light Wall",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "deviceTags": {},
  "deviceName": "Moisture Sensor",
  "flowId": "56956cd25a6f2f0100dc70d4",
  "flowName": "Moisture Alert",
  "globals": {}
}
```

And these values will be accessible in any node configuration that expects payload paths (such as `globals.minLevel`) or templates (such as `{{globals.phone}}`).

## Workflow Storage

The workflow storage interface lets you view and manipulate the persistent workflow storage.  This is the storage space used by the [Get Value](/workflows/data/get-value/) and [Store Value](/workflows/data/store-value/) nodes.  The storage interface is located under the "Storage" tab in the workflow properties editor.

![Workflow Storage](/images/workflows/workflow-storage.png "Workflow Storage")

In the top half of the interface, you can add new storage entries or modify existing ones.  Specify the identifier to add (or change), specify the value and the Data Type, and click `Set Value`.  The data type can be `String` (the value is treated as a string), `Number` (the value is treated as a number), or `JSON` (the value is parsed as JSON).  the JSON data type can be used to set complex objects or arrays, or even just `true`/`false`/`null`.

**NOTE:**  The act of clicking `Set Value` has an immediate affect.  This will change or add the value **immediately**, this is separate from saving/deploying the workflow.

In the bottom half of the interface, you can view the values of existing storage identifiers.  In this case, there is one identifier, `storedColor`, and its value is the number `35000` - this identifier was previous set by the Store Value node in a previous run of the above workflow.  This table of values will automatically refresh every 60 seconds, but you can always click the refresh link on the upper right if you want to see the latest values now.  You can also delete values here using the delete button on the right of each row.  **NOTE:** deleting, just like setting or modifying a value, takes effect immediately and is not tied to saving/deploying the workflow.
