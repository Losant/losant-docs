description: Learn more about creating and configuring Losant Custom Nodes.

# Custom Nodes

Custom nodes are wrapped-up groups of nodes that can be used in your application's workflows. They can take [input](#user-input) from their outer workflows and [return values](#output-mode) to be used later in workflow runs.

![Custom Nodes Overview](/images/workflows/custom-nodes-overview.png "Custom Nodes Overview")

Custom nodes allow for reusing common methods (such as converting temperatures from [Fahrenheit to Celsius](https://www.almanac.com/content/temperature-conversion)), for packaging up existing Losant nodes to extend your application's functionality (such as integrating with a third-party API like [DarkSky](https://darksky.net/dev)), or for building a common user redirect framework in your [application experiences](/experiences/overview/).

Custom nodes can only be used within [cloud workflows](/workflows/cloud-workflows/) or within other custom nodes.

## Creating and Viewing Custom Nodes

Your application's list of custom nodes can be found under the "Workflows" dropdown menu. From there, you may add a new custom node by clicking the "Add" button in the top right corner.

![Create Custom Node](/images/workflows/custom-nodes-create.png "Create Custom Node")

If you have an exported custom node file, you can also import that custom node into your application by clicking the "Import" button and selecting the file. Losant has a [library of useful custom nodes](https://github.com/Losant/workflow-node-catalog) available on GitHub.

## Configuration

Creating a custom node is very similar to building a [cloud workflow](/workflows/cloud-workflows/); however, there are a number of additional properties that go into configuring a custom node. 

All of these properties are [version-specific](#versioning) unless otherwise noted.

### Display Properties

Custom nodes take three properties related to its display in your application's user interface. They are **not** [version-specific](#versioning).

![Custom Node Display Properties](/images/workflows/custom-nodes-display-properties.png "Custom Node Display Properties")

These properties are set on creation of the custom node, though they can be edited later in the custom node editor's "Properties" panel:

* **Name**: This serves as the custom node's label in the node palette, as well as the default label on the node immediately after it is dropped onto the stage. The name must be unique within your application; no two custom nodes can share the same name.
* **Description**: This optional property should briefly describe the purpose of the custom node. This value displays in a tooltip when the node is hovered in the palette, as well as at the top of the custom node's editor panel.
* **Icon**: The custom node must have an icon, though one will be chosen for you by default based on the custom node's name. There are also an array of icons available for quick selection. You may also upload an icon to your application's [files](/applications/files/) and use it, provided the icon is in JPG, SVG or PNG format and is no larger than 128px in width or height. We recommend a single-color white icon on a transparent background, built at a 1:1 aspect ratio. (**Note:** Changing the image that is at the file's URL will **not** change the icon on the custom node; to update the icon, you will have to first remove from your custom node configuration and then re-select the file at that URL.)

### Output Type

Your custom node can either have a single output, or it can have a branching output based on [conditions you build](#building-custom-nodes) into the node (like a [Conditional Node](/workflows/logic/conditional/)).

![Custom Node Output Type](/images/workflows/custom-nodes-output-type.png "Custom Node Output Type")

For example, you might consider building a branching custom node if:

* There will be multiple logic checks within your custom node
* Your custom node makes a third-party HTTP request that has a significant chance of failing
* Your custom node could be throttled (i.e. if it uses the [Email Node](/workflows/outputs/email/))

![Custom Node Branching Example](/images/workflows/custom-nodes-branching-example.png "Custom Node Branching Example")

You can change the output type after creation in the custom node editor's "Output" tab, but it will be much easier to craft your custom node if you decide whether you're building a single output or a branching node before getting started.

### Output Result

Custom nodes **cannot** manipulate the payload of the workflow calling the custom node, but they can return a result to a payload path of the user's choosing. The outer workflow can then use as that result as it continues its run.

![Custom Node Output Result](/images/workflows/custom-nodes-output-result.png "Custom Node Output Result")

The custom node's output result may be set to **Optional**, **Required** or **None**. You may also provide a **Description** of the expected result for your end users. This output result may also be changed later under the "Output" tab.

If choosing "Optional" or "Required", your custom node users will be provided with a text box at the bottom of the custom node's configuration panel where they enter a payload path for where the custom node's result should be added to their workflow's payload. If choosing "Required", the custom node user **must** enter a payload path.

### User Inputs

After creating your custom node, the next step is to determine the information you require from your end users to execute it. Losant provides a simple form builder with a number of input types to solicit this information from your custom node users.

Each of these inputs requires a custom, unique ID, and the values provided by your users are available in the nodes that make up your custom node at the payload path of `data.THE_UNIQUE_ID`. Each field also requires a label and supports an optional description, which allows you to provide additional information on the data requested. The fields can also be sorted via drag and drop, and some allow for input validation - which is checked in the workflow editor prior to saving.

![Custom Node Inputs](/images/workflows/custom-nodes-inputs.png "Custom Node Inputs")

To add an input, click the "Add Input" button at the bottom of the "Inputs" panel and select the type of input you would like to add. Depending on the input type, each may also take some additional configuration properties:

* **Checkbox:** Users are presented with a checkbox; when checked, the input returns a value of `true`, and an unchecked box returns a value of `false`. You may also decide if the box should be checked by default.
* **Select:** Users are presented with an HTML select box, and they must choose a value. To configure the input, enter an array of options and select which one should be chosen by default. Each option must include a "Value", which is the string that is returned for the input when the node is invoked. You may optionally also provide a "Label" for a value; failing to provide a label will result in the value itself being used as the option's label.
* **String Template:** Users are presented with a simple text box where they may enter an arbitrary string or a [string template](/workflows/accessing-payload-data/#string-templates), which should resolve to a string value from the outer workflow's payload. Optionally, you may set a default value for the input; mark it as required (which wipes away the default value); or provide a [regular expression](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions) for input validation (which is only checked if the user enters an arbitrary string).
* **Number Template:** Users are presented with a simple text box where they may enter a number or a [string template](/workflows/accessing-payload-data/#string-templates), which should resolve to a number value from the outer workflow's payload. Optionally, you may set a default value for the input; mark it as required (which wipes away the default value); or provide minimum and/or maximum values for the input (which are only checked if the user enters a number).
* **JSON Template:** Users are presented with a code editor where they may enter a [JSON template](/workflows/accessing-payload-data/#json-templates). Optionally, you may set a default value for the input or mark it as required (which wipes away the default value).
* **Payload Path:** Users are presented with a simple text box where they may enter a payload path, the contents of which is made available to the custom node. Optionally, you may mark the input as required.
* **Section Header:** These are a special case as they require no input from your users, nor do they require a unique custom ID. Section headers are strictly for display purposes, allowing you to break your form fields into easily digestible sections for your custom node users.

## Building Custom Nodes

Building a custom node is very similar to [building a workflow](/workflows/overview/#overview); it is a combination of Losant nodes (and other custom nodes!) chained together to mutate data, make HTTP requests and branch based on payload conditions.

![Custom Node Conversion Example](/images/workflows/custom-nodes-conversion-example.png "Custom Node Conversion Example")

Despite the similarities, there are a few key differences between building custom nodes and traditional workflows:

### Triggers

Other than the [Virtual Button](/workflows/triggers/virtual-button/) (which is useful for [testing your custom node](#testing-custom-nodes)), custom nodes do not support workflow triggers. Instead, the custom node has just one "trigger", which represents the starting point of the custom node execution.

![Custom Node Start Trigger](/images/workflows/custom-nodes-start-trigger.png "Custom Node Start Trigger")

This trigger, like any workflow trigger, should be connected to additional nodes to run the custom node. It cannot be deleted, nor can more than one starting point exist on the custom node's canvas.

### Return Nodes

All branches of your custom node should terminate in a **Return Node**, which signifies the end of your custom node's run. There is just one type of Return node for a single-ouput custom node; branching custom nodes have both **Return False** and **Return True** nodes, which tell the outer workflow which branch of your custom node to follow after execution completes. When one of these Return Nodes is hit, the outer workflow continues on with your custom node's result on its payload (if applicable).

![Custom Node Return Nodes](/images/workflows/custom-nodes-return-nodes.png "Custom Node Return Nodes")

When you create a custom node, one will be placed on the editor canvas for you along with the start trigger; if you are creating a [branching node](#output-type), both a **Return False** and a **Return True** node will be placed on the canvas. Additional Return Nodes can be pulled off the node palette and placed at other spots on the canvas as well.

If your custom node [returns a result](#output-result), you will have to enter a payload path in the Return Node's editor pointing to the value that should be returned to the outer workflow.

**Note:** Return Nodes can not be used in the contents of a [Loop Node](/workflows/logic/loop/). They must exist at the root level of your custom node.

## Versioning

When [using a custom node](#using-custom-nodes), you must choose a version of your custom node to run. Since a custom node's stage, user inputs, output type and output result are all version-specific, your custom node's functionality can differ wildly across versions. As a best practice, we recommend only making minor, incremental changes (such as bug fixes) across versions. If the custom node's core functionality is changing, we recommend creating a new custom node.

![Custom Node Versions](/images/workflows/custom-nodes-versions.png "Custom Node Versions")

Creating and working with versions of custom nodes is similar to versioning as it works with cloud workflows, except ...

- Custom nodes do not have the concept of a "default version". The "develop" version is selected by default when dropping a custom node on the canvas, but we [recommend](#running-the-develop-version) pointing your custom node instance to another version.
- Custom node versions cannot be directly overwritten. If you wish to make changes to an existing version, you will have to copy that version's contents to your "develop" version, make the necessary changes, delete the existing version, and create a new version of the same name.

### Running the "Develop" Version

While it is possible to run the "develop" version of any custom node, we **strongly** recommend creating versions of your custom node and referencing the versions in your workflows. This is because changes to your custom node's "develop" version will have an immediate impact on any instances of the custom node deployed to your workflows - including within uneditable versions of those workflows. Since custom node versions cannot be overridden, choosing a version for your custom node instance protects your workflows from these changes.

## Using Custom Nodes

Once a custom node has been saved and deployed, it becomes available for use within your cloud workflows and other custom nodes. Your workflow palette contains a section with all of your application's custom nodes. These nodes can be dragged onto the stage, moved around, connected to other nodes, configured and deleted just like any other node.

![Custom Nodes Overview](/images/workflows/custom-nodes-overview.png "Custom Nodes Overview")

**Note:** A custom node cannot be used within itself (otherwise known as [recursion](https://en.wikipedia.org/wiki/Recursion_(computer_science)). This is to protect your custom node from [infinite loops](https://en.wikipedia.org/wiki/Infinite_loop) and workflow timeouts. Therefore, when editing your custom node, all other custom nodes within your application *except* that custom node itself will be available in the node palette.

### Configuring Custom Node Instances

After dropping a custom node on the canvas, the first thing you should do is choose which [version](#versioning) of the custom node to run as the selected version can change the custom node's configuration options - including whether the custom node branches.

![Custom Node Configure Instance](/images/workflows/custom-nodes-configure-instance.png "Custom Node Configure Instance")

Beneath the version selector will be all of the [form fields](#user-inputs) defined for the custom node. Users of the node can input static values or reference values on their payload for each of these inputs (depending on the input type). Any validation rules configured for each input will also be enforced at this time, and just like with other nodes, the outer workflow cannot be saved or run until all of the custom node's input validation is satisfied.

## Testing Custom Nodes

The [Virtual Button](/workflows/triggers/virtual-button/) is provided as a trigger within the editor for the purpose of testing your custom nodes. This trigger, in conjunction with [Debug Nodes](/workflows/outputs/debug/), allows you to visualize payloads as they move through your custom node and to view outputs corresponding to potential user inputs.

![Custom Node Testing](/images/workflows/custom-nodes-testing.png "Custom Node Testing")

Just like with cloud workflows, [debug output](/workflows/outputs/debug/#viewing-debug-output) is available within the "Debug" panel in the workflow editor. Note that **only** debug messages generated by clicking Virtual Buttons will be visible here; payloads moving through your custom node as outer workflows call your node cannot be examined.

## Deleting Custom Nodes

In order to delete a custom node, or a version of the custom node, that node / version must not be [in use](#using-custom-nodes) in any of your application's workflows. Deleting such a custom node would cause your workflow to error and cease to function.

You must first delete any instances of that custom node you wish to delete - or, if you are attempting to delete a custom node version, you must switch all instances of that custom node to a version other than the one you wish to delete.

Once none of your workflows are using the resource you are trying to delete, the custom node / version can be deleted in the same ways a [workflow](/workflows/cloud-workflows/#deleting-cloud-workflows) or [workflow version](/workflows/versioning/#working-with-versions) can be deleted.
