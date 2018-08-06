description: Learn more about creating and configuring Losant Custom Nodes.

# Custom Nodes

Custom Nodes are wrapped-up groups of [nodes](/workflows/overview/) that can be used in your application's [workflows](/workflows/overview/). They can take [input](#user-input) from the workflows calling the node and [return values](#output-mode) to be used later in those workflow runs.

![Custom Nodes Overview](/images/workflows/custom-nodes-overview.png "Custom Nodes Overview")

Custom Nodes allow for reusing common methods (such as converting temperatures from [Fahrenheit to Celsius](https://www.almanac.com/content/temperature-conversion)), for packaging up existing Losant nodes to extend your application's functionality (such as integrating with a third-party API like [DarkSky](https://darksky.net/dev)), or for building a common user redirect framework in your [application experiences](/experiences/overview/).

Custom Nodes can only be used within [cloud workflows](/workflows/cloud-workflows/) or within other Custom Nodes.

## Creating and Viewing Custom Nodes

Your application's list of Custom Nodes can be found under the "Workflows" dropdown menu. From the list, you may add a new Custom Node by clicking the "Add" button in the top right corner.

![Create Custom Node](/images/workflows/custom-nodes-create.png "Create Custom Node")

If you have an exported Custom Node file, you can also import that Custom Node into your application by clicking the "Import" button and selecting the file. Losant has a [catalog of useful Custom Nodes](https://github.com/Losant/workflow-node-catalog) available on GitHub.

## Configuration

Creating a Custom Node is very similar to building a [cloud workflow](/workflows/cloud-workflows/); however, there are a number of additional properties that go into configuring a Custom Node.

All of these properties are [version-specific](#versioning) unless otherwise noted.

### Display Properties

Custom Nodes take three properties related to its display in your application's user interface. They are **not** [version-specific](#versioning); meaning, if you change these properties, they will change across all versions and deployed instances of your Custom Node.

![Custom Node Display Properties](/images/workflows/custom-nodes-display-properties.png "Custom Node Display Properties")

These properties are set on creation of the Custom Node, though they can be edited later in the Custom Node editor's "Properties" panel:

* **Name**: This serves as the Custom Node's label in the node palette, as well as the default label on the node immediately after it is dropped onto the canvas. The name must be unique within your application; no two Custom Nodes can share the same name.
* **Description**: This optional property should briefly describe the purpose of the Custom Node. This value displays at the top of the Custom Node's editor panel.
* **Icon**: The Custom Node must have an icon, though one will be chosen for you by default based on the Custom Node's name. There are also an array of icons available for quick selection. Alternatively, you may upload an icon to your application's [files](/applications/files/), provided the icon is in JPG, SVG or PNG format and is no larger than 128px in width or height. We recommend a single-color white icon on a transparent background, built at a 1:1 aspect ratio. (**Note:** Changing the image that is at the file's URL will **not** change the icon on the Custom Node; to update the icon, you will have to first remove it from your Custom Node configuration and then re-select the file at that URL.)

### Output Type

Your Custom Node can either have a single output, or it can have a branching output (like a [Conditional Node](/workflows/logic/conditional/)) based on [conditions you define](#building-custom-nodes).

![Custom Node Output Type](/images/workflows/custom-nodes-output-type.png "Custom Node Output Type")

For example, you might consider building a branching Custom Node if:

* There will be multiple logic checks within your Custom Node
* Your Custom Node makes a third-party HTTP request that has a significant chance of failing
* Your Custom Node could be throttled (i.e. if it uses the [Email Node](/workflows/outputs/email/))

![Custom Node Branching Example](/images/workflows/custom-nodes-branching-example.png "Custom Node Branching Example")

You can change the output type after creation in the Custom Node editor's "Output" tab, but it will be much easier to craft your Custom Node if you decide whether you're building a single output or a branching node before getting started.

### Output Result

Custom Nodes **cannot** manipulate the payload of the workflow calling the Custom Node (also known as the "outer workflow"), but they can return a result to a payload path of the user's choosing. The outer workflow can then use that result as it continues its run.

![Custom Node Output Result](/images/workflows/custom-nodes-output-result.png "Custom Node Output Result")

The Custom Node's output result may be set to **Optional**, **Required** or **None**. You may also provide a **Description** of the expected result for your node users. This output result may also be changed later under the "Output" tab.

If choosing "Optional" or "Required", your Custom Node users will see a [payload path](/workflows/accessing-payload-data/#payload-paths) input at the bottom of the configuration panel for defining where the Custom Node's result should be added to their workflow's payload. If choosing "Required", the Custom Node user **must** enter a payload path.

### User Inputs

After creating your Custom Node, the next step is to determine the information you require from your node users to execute it. Losant provides a simple form builder with a number of input types to solicit this information from your Custom Node users.

![Custom Node Inputs](/images/workflows/custom-nodes-inputs.png "Custom Node Inputs")

Each of these inputs requires a custom, unique ID, and the values provided by your users are available in the nodes that make up your Custom Node at the payload path of `data.THE_UNIQUE_ID`. Each field also requires a label and supports an optional description, which allows you to provide additional information about the data requested. The fields can also be sorted via drag and drop, and some allow for input validation - which is checked in the workflow editor prior to saving.

![Custom Node Add Input](/images/workflows/custom-nodes-add-input.png "Custom Node Add Input")

To add an input, click the "Add Input" button at the bottom of the "Inputs" panel and select the type of input you would like to add. Depending on the input type, each may also take some additional configuration properties:

* **Checkbox:** Users are presented with a checkbox; when checked, the input returns a value of `true`, and an unchecked box returns a value of `false`. You may also decide if the box should be checked by default.
* **Select:** Users are presented with an HTML select box, and they must choose a value. To configure the input, enter an array of options and select which one should be chosen by default. Each option must include a "Value", which is the string that is returned for the input when the node is invoked. You may optionally also provide a "Label" for a value; not providing one will result in the value itself being used as the option's label.
* **String Template:** Users are presented with a simple text box where they may enter an arbitrary string or a [string template](/workflows/accessing-payload-data/#string-templates), which should resolve to a string value from the outer workflow's payload. Optionally, you may set a default value for the input; mark it as required (which wipes away the default value); or provide a [regular expression](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions) for input validation (which is only checked if the user enters an arbitrary string).
* **Number Template:** Users are presented with a simple text box where they may enter a number or a [string template](/workflows/accessing-payload-data/#string-templates), which should resolve to a number value from the outer workflow's payload. Optionally, you may set a default value for the input; mark it as required (which wipes away the default value); or provide minimum and/or maximum values for the input (which are only checked if the user enters a number).
* **JSON Template:** Users are presented with a code editor where they may enter a [JSON template](/workflows/accessing-payload-data/#json-templates). Optionally, you may set a default value for the input or mark it as required (which wipes away the default value).
* **Payload Path:** Users are presented with a simple text box where they may enter a payload path, the contents of which is made available to the Custom Node. Optionally, you may mark the input as required.
* **Section Header:** These are a special case as they require no input from your users, nor do they require a unique custom ID. Section headers are strictly for display purposes, allowing you to break your form fields into easily digestible sections for your Custom Node users.

## Building Custom Nodes

Building a Custom Node is very similar to [building a workflow](/workflows/overview/#overview); it is a combination of Losant nodes (and other Custom Nodes!) chained together to mutate data, make HTTP requests, branch your workflow based on payload conditions, and much more.

![Custom Node Conversion Example](/images/workflows/custom-nodes-conversion-example.png "Custom Node Conversion Example")

Despite the similarities, there are a few key differences between building Custom Nodes and traditional workflows:

### Triggers

Other than the [Virtual Button](/workflows/triggers/virtual-button/) (which is useful for [testing your Custom Node](#testing-custom-nodes)), Custom Nodes do not support workflow triggers. Instead, the Custom Node has just one "trigger", which represents the starting point of the Custom Node execution.

![Custom Node Start Trigger](/images/workflows/custom-nodes-start-trigger.png "Custom Node Start Trigger")

This trigger, like any workflow trigger, should be connected to additional nodes to run the Custom Node. It cannot be deleted, nor can more than one starting point exist on the Custom Node's canvas.

### Return Nodes

All branches of your Custom Node should terminate in a **Return Node**, which signifies the end of your Custom Node's run. There is just one type of Return node for a single-ouput Custom Node; branching Custom Nodes have both **Return False** and **Return True** nodes, which tell the outer workflow which branch of your Custom Node to follow after execution completes. When one of these Return Nodes is hit, the outer workflow continues on with your Custom Node's result on its payload (if applicable).

![Custom Node Return Nodes](/images/workflows/custom-nodes-return-nodes.png "Custom Node Return Nodes")

When you create a Custom Node, one will be placed on the editor canvas for you along with the start trigger; if you are creating a [branching node](#output-type), both a **Return False** and a **Return True** node will be placed on the canvas. Additional Return Nodes can be pulled off the node palette and placed at other spots on the canvas as well.

If your Custom Node [returns a result](#output-result), you will have to enter a payload path in the Return Node's editor pointing to the value that should be returned to the outer workflow.

**Note:** Return Nodes can not be used in the contents of a [Loop Node](/workflows/logic/loop/). They must exist at the root level of your Custom Node.

## Versioning

When [using a Custom Node](#using-custom-nodes), you must choose a version of the Custom Node to run. Since a Custom Node's canvas, user inputs, output type and output result are all version-specific, your Custom Node's functionality can differ wildly across versions. As a best practice, we recommend only making minor, incremental changes (such as bug fixes) across versions. If the Custom Node's core functionality is changing, we recommend creating a new Custom Node.

![Custom Node Versions](/images/workflows/custom-nodes-versions.png "Custom Node Versions")

Creating and working with versions of Custom Nodes is similar to versioning as it works with cloud workflows, except ...

* Custom Nodes do not have the concept of a "default version". The "develop" version is selected by default when dropping a Custom Node on the canvas, but we [recommend](#running-the-develop-version) pointing your Custom Node instance to another version.
* Custom Node versions cannot be directly overwritten. If you wish to make changes to an existing version, you will have to copy that version's contents to your "develop" version, make the necessary changes, delete the existing version, and create a new version with the same name.

### Running the "Develop" Version

While it is possible to run the "develop" version of any Custom Node, we **strongly** recommend creating versions of your Custom Node and referencing the versions in your workflows. This is because changes to your Custom Node's "develop" version will have an immediate impact on any instances of the Custom Node deployed to your workflows - including within uneditable versions of those workflows. Since Custom Node versions cannot be overridden, choosing a version for your Custom Node instance protects your workflows from these changes.

## Using Custom Nodes

Once a Custom Node has been saved and deployed, it becomes available for use within your cloud workflows and other Custom Nodes. Your workflow palette contains a section with all of your application's Custom Nodes. These nodes can be dragged onto the canvas, moved around, connected to other nodes, configured and deleted just like any other node.

![Custom Nodes Overview](/images/workflows/custom-nodes-overview.png "Custom Nodes Overview")

**Note:** A Custom Node cannot be used within itself (otherwise known as [recursion](https://en.wikipedia.org/wiki/Recursion_(computer_science))). This is to protect your Custom Node from [infinite loops](https://en.wikipedia.org/wiki/Infinite_loop) and workflow timeouts. Therefore, when editing your Custom Node, all other Custom Nodes within your application *except* that Custom Node itself will be available in the node palette.

### Configuring Custom Node Instances

After dropping a Custom Node on the canvas, the first thing you should do is choose which [version](#versioning) of the Custom Node to run,  as the selected version can change the Custom Node's configuration options - including whether the Custom Node branches.

![Custom Node Configure Instance](/images/workflows/custom-nodes-configure-instance.png "Custom Node Configure Instance")

Beneath the version selector will be all of the [user input fields](#user-inputs) defined for the Custom Node. Users of the node can input static values or reference values on their payload for each of these inputs (depending on the input type). Any validation rules configured for each input will also be enforced at this time, and just like with other nodes, the outer workflow cannot be saved or run until all of the Custom Node's input validation is satisfied.

## Testing Custom Nodes

The [Virtual Button](/workflows/triggers/virtual-button/) is provided as a trigger within the editor for the purpose of testing your Custom Nodes. This trigger, in conjunction with [Debug Nodes](/workflows/outputs/debug/), allows you to visualize payloads as they move through your Custom Node and to view outputs corresponding to potential user inputs.

![Custom Node Testing](/images/workflows/custom-nodes-testing.png "Custom Node Testing")

Just like with cloud workflows, [debug output](/workflows/outputs/debug/#viewing-debug-output) is available within the "Debug" panel in the workflow editor. Note that **only** debug messages generated by clicking Virtual Buttons will be visible here; payloads moving through your Custom Node as outer workflows call your node cannot be examined.

## Deleting Custom Nodes

In order to delete a Custom Node, or a version of the Custom Node, that node / version must not be [in use](#using-custom-nodes) in any of your application's workflows. Deleting such a Custom Node would cause your workflow to error and cease to function.

You must first delete any instances of that Custom Node you wish to delete - or, if you are attempting to delete a Custom Node version, you must switch all instances of that Custom Node to a version other than the one you wish to delete.

Once none of your workflows are using the resource you are trying to delete, the Custom Node / version can be deleted in the same ways a [workflow](/workflows/cloud-workflows/#deleting-cloud-workflows) or [workflow version](/workflows/versioning/#working-with-versions) can be deleted.

## Exporting Custom Nodes

In order to export a Custom Node, first save and deploy a version of it. Then click the down arrow next to "Save & Deploy" to open the dropdown menu and select "Export".

![Export a specific custom node version](/images/workflows/custom-nodes-export-version.png "Export a specific custom node version")

You can also export specific versions of a custom node by clicking the "Versions" tab in the right sidebar, clicking the down arrow next to the version you wish to export, and clicking "Export".