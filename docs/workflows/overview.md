# Workflows

Workflows are the primary way for your devices to communicate with each other and other services. Workflows allow you to trigger notifications, create events, send commands, and more. Workflows are basically the brains of your connected solution.

## Overview

All workflows start with a trigger that includes a payload. The purpose of the workflow is to make decisions based on this payload, modify the data if needed, and eventually result in some kind of output.

As the payload flows through the workflow, fields can be added, removed, or changed. Each node in a workflow accepts a payload as an input, optionally modifies it, and outputs the payload to be the input for the next node. Some nodes, like conditionals, don't modify the payload at all and simply pass it through as-is, but they do provide a way to branch the workflow down multiple paths.

Below is an example of how a payload flows through a workflow.

![Workflow Overview](/images/workflows/overview.png "Workflow Overview")

Let's break down this workflow and explain the individual nodes and how they work with the payload.

### Temp Sensor - Trigger Node

All workflows start with a trigger. There are many different triggers and each one starts the workflow with a different payload. All triggers, however, put their specific payload on the `data` field of the payload.

![Workflow Overview Trigger](/images/workflows/overview-trigger.png "Workflow Overview Trigger")

In this example the trigger is a [Device node](/workflows/triggers/device/), which will run the payload whenever a device reports its [state](/devices/state/). The device trigger places the state that was reported on the payload's data field. When the workflow starts, the payload will look like this:

```json
{
  "data" : { "tempF" : 77 }
}
```

The workflow will then continue with this payload and pass it to the next node.

### Temp High - Conditional Node

[Conditional nodes](/workflows/logic/conditional/) allow you to branch the workflow based on an [expression](/workflows/accessing-payload-data/#expressions) that evaluates to true or false. If the expression is true, the workflow branches right. If the expression is false, the workflow branches left.

![Workflow Overview Conditional](/images/workflows/overview-conditional.png "Workflow Overview Conditional")

This node doesn't modify the payload, but it is using a value in the payload to make a decision. In short, the [expression](/workflows/accessing-payload-data/#expressions) in the Conditional node allows for testing the truthiness of a condition against a payload property. In this example, the expression is:

```
{{ data.tempF }} > 75
```

Whenever this node is executed it will grab the `data.tempF` value in the payload and check to see whether it's greater than 75. Since we saw that the tempF value in our payload is currently 77, this conditional will branch to the right. The conditional node doesn't modify the payload, so the same payload that was passed to it will flow as-is to the next node in the workflow.

### Convert ˚F to ˚C - Math Node

[Math nodes](/workflows/logic/math/) allow you to write mathematical expressions and store the result anywhere on the payload.

![Workflow Overview Math](/images/workflows/overview-math.png "Workflow Overview Math")

Each math node supports multiple statements, but this example is only using one. Each statement includes the actual expression and a [payload path](/workflows/accessing-payload-data/#payload-paths) of where to store the result. For this example, the expression is:

```
( {{ data.tempF }} - 32 ) / 1.8
```

Just like with the Conditional node, you can reference values from the payload in these expressions. This is simply converting degrees Fahrenheit to degrees Celsius.

The second part of each math expression is a [payload path](/workflows/accessing-payload-data/#payload-paths) to store the result. In this example the payload path is:

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

The [SMS node](/workflows/outputs/sms/) allows you to send an SMS message one or more phone numbers. This example demonstrates how to use the newly modified payload in a useful way.

![Workflow Overview SMS](/images/workflows/overview-sms.png "Workflow Overview SMS")

The SMS node supports [string templates](/workflows/accessing-payload-data/#string-templates). But unlike evaluating to a boolean for the Conditional node, or a number for the Math node, the SMS node uses the that value to create a custom message that contains a value from the payload.

```
Temperature warning. Temperature now at {{ degreesCelsius }} deg C!
```

For this example, the user wanted to send an SMS alert with the temperature in Celsius, but our temperature sensor reported the value in Fahrenheit. This is why we used the Math node to convert the temperature before being sent.

## Common Payload Fields

The payloads described above only include what was added by the trigger. All payloads include a common set of other, potentially useful fields:

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

The button will be green whenever there are changes that can be deployed. It will be gray when there are no changes. If you are viewing a [workflow version](/workflows/versioning/), the button will not allow the deployment of any changes; instead, it will allow you to return to the Develop version.

Workflows can be enabled and disabled by clicking the `Enabled` checkbox on the workflow settings panel, and then clicking the "Update" button. The workflow settings panel can be displayed by clicking the gear icon in the right dock.

![Enable Workflow](/images/workflows/overview-enable.png "Enable Workflow")

Once a workflow has been deployed, its changes will take effect immediately.

## Import / Export

Workflows and their [versions](/workflows/versioning/) can be exported by clicking the dropdown alongside the `Deploy Workflow` button, or by clicking the dropdown in the version row.

![Export Workflow](/images/workflows/workflow-export.png "Export Workflow")

Clicking the `Export` option will open a modal, which will allow you to either export the version to a to a file, or (if you have [edit permissions](/organizations/members/#member-roles) within the application) to a new workflow. When exporting the workflow to a file, that file can then be imported into another workflow.

![Export Modal](/images/workflows/workflow-export-modal.png "Export Modal")

When exporting, you must decide if the values for the global config should be included in the export. The keys for the global config will always be included, but you have the option of not exporting the values in case sensitive information (such as access keys) are in the global config section.

The most common case when importing a workflow will be importing into a blank workflow; however, Losant also supports importing into a workflow with existing nodes. In that case, the nodes for the imported workflow are just added alongside the existing nodes. Importing a workflow can be done in the properties panel when viewing its "Develop" version.

![Import Workflow](/images/workflows/workflow-import.png "Import Workflow")

When importing a workflow, configuration values that were specific to the application the workflow was originally exported from are only kept when importing into that same application. So for instance, when importing a workflow across applications, things like a selected device ID on a device trigger will be cleared, since that ID will not exist in the application being imported to.

## Workflow Globals

Workflow versions can have a set of global config keys - which are essentially keys/value pairs added to the payload under the `globals` key whenever the workflow runs. This is a great place to store configuration values or API keys, especially if they are needed for use in multiple different nodes. Globals can be accessed through the "Globals" tab in the right dock.

![Workflow Globals](/images/workflows/workflow-globals.png "Workflow Globals")

In the above example, there are three global keys set &mdash; `minLevel` (with a numeric value of `300`), `resetLevel` (with a numeric value of `500`), and `phone` (with a string value of `632-538-0975`). Complex objects can be configured by choosing `JSON` as the data type of the value and adding JSON as the value. Whenever the workflow runs, the payload will always include these global values. For the above example, a payload might end up looking like the following:

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
  },
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

These values will be accessible in any node configuration that expects payload paths (such as `globals.minLevel`) or templates (such as `{{globals.phone}}`).

## Workflow Storage

The workflow storage interface lets you view and manipulate the persistent workflow storage. This is the storage space used by the [Get Value](/workflows/data/get-value/) and [Store Value](/workflows/data/store-value/) nodes. The storage interface is located under the "Storage" tab in the right dock.

![Workflow Storage](/images/workflows/workflow-storage.png "Workflow Storage")

In the top half of the interface, you can add new storage entries or modify existing ones. Specify the identifier to add (or change), specify the value and the Data Type, and click `Set Value`. The data type can be `String` (the value is treated as a string), `Number` (the value is treated as a number), or `JSON` (the value is parsed as JSON). The JSON data type can be used to set complex objects or arrays, or even just `true`/`false`/`null`.

**NOTE:**  The act of clicking `Set Value` has an immediate effect **across all workflow versions**. This will change or add the value immediately; this is separate from saving/deploying the workflow.

In the bottom half of the interface, you can view the values of existing storage identifiers. In this case, there is one identifier, `storedColor`, and its value is the number `35000`. This identifier was previous set by the Store Value node in a previous run of the above workflow. This table of values will automatically refresh every 60 seconds, but you can always click the refresh link on the upper right if you want to see the latest values now. You can also delete values here using the delete button on the right of each row. **NOTE:** Deleting, just like setting or modifying a value, takes effect immediately and is not tied to saving/deploying the workflow.
