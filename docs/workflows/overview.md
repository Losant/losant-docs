description: Learn more about Losant workflows: how they work and how to configure them.

# Workflows

Workflows are the primary way for your devices to communicate with each other and other services. Workflows allow you to (for example) [trigger email notifications](/workflows/outputs/email/), [create events](/workflows/outputs/record-event/), [send device commands](/workflows/outputs/device-command/) and more. Workflows are, in essence, the brains of your connected solution.

A list of your application's workflows, broken down by [type](#types-of-workflows), can be accessed through your application's subnavigation.

![Workflows List](/images/workflows/workflows-list.png "Workflows List")

## Types of Workflows

There are three types of workflows, each of which features unique functionality and is best suited for specific use cases:

* [**Application workflows**](/workflows/application-workflows/) execute within Losant's cloud platform. While they are generally more robust, they do depend on your devices having a strong, stable internet connection for near-immediate execution.
* [**Experience workflows**](/workflows/experience-workflows/) are best suited for handling requests and issuing responses within your [application experience](/experiences/overview/). They are versioned along with your experience's [endpoints](/experiences/endpoints/) and [views](/experiences/views/).
* [**Edge workflows**](/workflows/edge-workflows/) are configured in the cloud platform, but are then deployed to your [edge compute devices](/devices/edge-compute/) where their execution happens. The primary benefit of these workflows is that they do not need an internet connection to run, and they can interact with their host devices in real time and report up to the internet at a later time.

## Creating a Workflow

Workflows can be created by clicking the "Add Workflow" link in the "Workflows" dropdown within your application's subnavigation. They may also be created by clicking the "Add" button within your workflow lists both on the "Workflows" page and on the application overview.

When creating a new workflow, you must choose one of the workflow types outlined above. The type cannot be changed after workflow creation.

After choosing a type, you must then give your workflow a name and optionally a description. If you are creating an edge workflow, you must also choose the minimum [Edge Agent](/edge-compute/edge-agent-changelog/) to target with your workflow. This can be upgraded (but not downgraded) at a later time.

![Create Workflow Settings](/images/workflows/workflow-create-settings.png "Create Workflow Settings")

## Overview

All workflows start with a trigger, and that trigger includes a payload. The purpose of the workflow is to make decisions based on this payload, modify the data if needed, and eventually result in some kind of output.

As the payload flows through the workflow, fields can be added, removed or changed. Each node in a workflow accepts a payload as an input, optionally modifies it, and outputs the payload to be the input for the next node. Some nodes (e.g. the [Conditional Node](/workflows/logic/conditional/)) don't modify the payload at all and simply pass it through as-is, but they do provide a way to branch the workflow down multiple paths.

## Example Workflow

Below is an example of how a payload flows through a workflow. This example uses an [application workflow](/workflows/application-workflows/).

![Workflow Overview](/images/workflows/overview.png "Workflow Overview")

Let's break down this workflow and explain the individual nodes and how they work with the payload. For this example, our use case is ...

1. A device is reporting temperature readings and we are using those state reports to [kick off a workflow](#temp-sensor-trigger-node).
2. The user would like to take an action [if that temperature exceeds a certain threshold](#temp-high-conditional-node).
3. This device reports temperature in degrees Fahrenheit; however, our user would prefer to receive reports [in degrees Celsius](#convert-f-to-c-math-node).
4. When the temperature does exceed the threshold, the user should receive an [SMS alert](#sms-node).

### Temp Sensor - Trigger Node

All workflows start with a trigger. There are many different triggers and each one starts the workflow with a different payload. All triggers, however, put their specific payload on the `data` field of the payload.

![Workflow Overview Trigger](/images/workflows/overview-trigger.png "Workflow Overview Trigger")

In this example we're using a [Device: State Trigger](/workflows/triggers/device/), which will run the payload whenever a device reports its [state](/devices/state/). The state that was reported is available on the payload's `data` field. When the workflow starts, the payload will look like this:

```json
{
  "data" : { "tempF" : 77 }
}
```

The workflow will then continue with this payload and pass it to the next node.

### Temp High - Conditional Node

[Conditional Nodes](/workflows/logic/conditional/) allow you to branch the workflow based on an [expression](/workflows/accessing-payload-data/#expressions) that evaluates to `true` or `false`. If the expression is `true`, the workflow branches right. If the expression is `false`, the workflow branches left.

![Workflow Overview Conditional](/images/workflows/overview-conditional.png "Workflow Overview Conditional")

This node doesn't modify the payload, but it is using a value in the payload to make a decision. In short, the [expression](/workflows/accessing-payload-data/#expressions) in the Conditional Node allows for testing the truthiness of a condition against a payload property. In this example, the expression is:

```handlebars
{{ data.tempF }} > 75
```

Whenever this node is executed it will grab the `data.tempF` value in the payload and check to see whether it's greater than 75. Since we saw that the `tempF` value in our payload is currently 77, this workflow will branch to the right. The Conditional Node doesn't modify the payload, so the same payload that was passed to it will flow as-is to the next node in the workflow.

### Convert ˚F to ˚C - Math Node

A [Math Node](/workflows/logic/math/) allows you to write mathematical expressions and store the result on the payload.

![Workflow Overview Math](/images/workflows/overview-math.png "Workflow Overview Math")

Each Math Node supports multiple statements, but this example is only using one. Each statement includes the actual expression and a [payload path](/workflows/accessing-payload-data/#payload-paths) for where to store the result. For this example, the expression is:

```handlebars
( {{ data.tempF }} - 32 ) / 1.8
```

Just like with the Conditional Node, you can reference values from the payload in these expressions. This is simply converting degrees Fahrenheit to degrees Celsius.

The second part of each math expression is a [payload path](/workflows/accessing-payload-data/#payload-paths) for where to store the result. In this example the payload path is `degreesCelsius`; therefore, the result of the math expression will be placed on the root of the payload at the `degreesCelsius` property. The new payload now looks like:

```json
{
  "data" : { "tempF" : 77 },
  "degreesCelsius" : 25
}
```

### SMS Node

The [SMS Node](/workflows/outputs/sms/) allows you to send an SMS message to one or more phone numbers. This example demonstrates how to use the newly modified payload in a useful way.

![Workflow Overview SMS](/images/workflows/overview-sms.png "Workflow Overview SMS")

The SMS Node supports [string templates](/workflows/accessing-payload-data/#string-templates) for its configuration values. But unlike evaluating to a boolean as it does for the Conditional Node, or a number for the Math Node, the SMS Node uses that value to create a custom message containing a value from the payload.

```handlebars
Temperature warning. Temperature now at {{ degreesCelsius }} deg C!
```

### Next Steps

To improve this user's experience, there are a number of additions and improvements we could make to this workflow. For example:

* The user's phone number could be stored as a [global variable](#workflow-globals) so that the workflow could be [exported](#import-export) without exposing the user's number to others.
* To avoid repeat SMS messages when the temperature is above the threshold for a long time, we could insert a [Latch Node](/workflows/logic/latch/) to only send one alert each time the temperature crosses the threshold.
* We could move the conversion to Celsius above our Conditional Node and then use a [Device State Node](/workflows/output/device-state/) to set that converted value as a separate [attribute](/devices/state/#state-attributes) on the device. This would allow us to also visualize the Celsius values in a [dashboard](/dashboards/overview/), such as in a [Time Series Block](/dashboards/time-series-graph/) or a [Gauge Block](/dashboards/gauge/).

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

## Import / Export

Workflows and their [versions](/workflows/versioning/) can be exported by clicking the dropdown alongside the `Deploy Workflow` button, or by clicking the dropdown in the version row.

![Export Workflow](/images/workflows/workflow-export.png "Export Workflow")

Clicking the `Export` option will open a modal, which will allow you to either export the version to a file, or (if you have [edit permissions](/organizations/members/#member-roles) within the application) clone it as a new workflow. When exporting the workflow to a file, that file can then be imported as a new workflow of the same type.

![Export Modal](/images/workflows/workflow-export-modal.png "Export Modal")

When exporting, you must decide if the values for the global config should be included in the export. The keys for the global config will always be included, but you have the option of not exporting the values in case sensitive information (such as access keys) are in the global config section.

You can import a workflow from the "View All Workflows" list, by either dragging the exported file onto the appropriate list, or clicking the `Import` button (which will allow you to browse for an exported workflow file). Imported workflows will by default be set as disabled, to give you the chance to make any needed modifications before the workflow starts running.

![Import Workflow](/images/workflows/workflow-import.png "Import Workflow")

When importing a workflow, configuration values that were specific to the application the workflow was originally exported from are only kept when importing into that same application. So for instance, when importing a workflow across applications, things like a selected device ID on a Device: State Trigger will be cleared, since that ID will not exist in the application being imported into.

## Workflow Globals

Workflows can have a set of global config keys, which are essentially keys/value pairs added to the payload under the `globals` key whenever the workflow runs. This is a great place to store configuration values or API keys, especially if they are needed for use in multiple different nodes. Globals can be accessed through the "Globals" tab in the right dock.

![Workflow Globals](/images/workflows/workflow-globals.png "Workflow Globals")

In addition, any [Application Globals](/applications/overview/#application-globals) configured in the application will be accessible here as well. Any application globals can also be overridden at the workflow version level by creating a workflow global with the same key name.

In the above example, there are three global keys set &mdash; `minLevel` (with a numeric value of `300`), `resetLevel` (with a numeric value of `500`), and `phone` (with a string value of `513-555-1212`). Complex objects can be configured by choosing `JSON` as the data type of the value and adding JSON as the value. Whenever the workflow runs, the payload will always include these global values. For the above example, a payload might end up looking like the following:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "moisture": 576
  },
  "globals":{
    "minLevel": 300,
    "resetLevel": 500,
    "phone": "513-555-1212"
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

Workflow globals are **version-specific**. Changing global values in one version (including your `develop` version) will not affect globals in your other versions. However, changing an application global's value will affect any versions referencing that global, provided the value was not overridden for that version.

## Workflow Storage

The workflow storage interface lets you view and manipulate the persistent workflow storage. This is the storage space used by the [Get Value](/workflows/data/get-value/) and [Store Value](/workflows/data/store-value/) nodes. The storage interface is located under the "Storage" tab in the right dock.

![Workflow Storage](/images/workflows/workflow-storage.png "Workflow Storage")

In the top half of the interface, you can add new storage entries or modify existing ones. Specify the identifier to add (or change), specify the value and the Data Type, and click `Set Value`. The data type can be `String` (the value is treated as a string), `Number` (the value is treated as a number), or `JSON` (the value is parsed as JSON). The JSON data type can be used to set complex objects or arrays, or even just `true`/`false`/`null`.

**NOTE:** The act of clicking `Set Value` has an immediate effect **across all workflow versions**. This will change or add the value immediately; this is separate from saving/deploying the workflow.

In the bottom half of the interface, you can view the values of existing storage identifiers. In this case, there is one identifier, `storedColor`, and its value is the number `35000`. This identifier was previous set by the Store Value node in a previous run of the above workflow. This table of values will automatically refresh every 60 seconds, but you can always click the refresh link on the upper right if you want to see the latest values now.

### Deleting Storage Values

You can also delete values individually by using the delete button on the right of each row, or wholesale by clicking the "Clear All Entries" button at the bottom of the table.

**NOTE:** Deleting, just like setting or modifying a value, takes effect immediately and is not tied to saving/deploying the workflow.
