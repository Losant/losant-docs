---
description: It's a Custom Node walkthrough!
---

# Custom Nodes Walkthrough

[Custom Nodes](/workflows/custom-nodes/overview/) allow you to extend the functionality of Losant's workflow engine. This guide is a complete walkthrough for building a custom node that provides access to [Dark Sky's API](https://darksky.net/dev) to retrieve weather forecast information. The node being built in this guide is also available in the [Losant Node Catalog](https://github.com/Losant/workflow-node-catalog), so you can download and import the completed node at any time.

![Dark Sky Node](/images/workflows/custom-nodes/walkthrough/dark-sky-node-used.png "Dark Sky Node")

## Create the New Node

To create a new Custom Node, first navigate to your application's custom nodes by selecting the `Custom Nodes` link in the application navigation. From this page, you can start building a new node by clicking the `Add` button at the top of the page.

![Add Custom Node Button](/images/workflows/custom-nodes/walkthrough/add-custom-node-button.png "Add Custom Node Button")

The next page you see is where we can configure most of the high-level details of this node. This includes the name, description, custom icon, and the output details. Here's a screenshot of the Dark Sky node. The details of each section are explained beneath the image.

![Node Details](/images/workflows/custom-nodes/walkthrough/node-details.png "Node Details")

Custom Nodes are added to workflows just like any other node. The information you provide here will be made available to the users of your node so they can easily understand its purpose and how to use it.

The icon and name will be displayed on the node when it's added to the workflow canvas. The icon can be any PNG, JPG, or SVG you like. We recommend making icons 128x128 in size, completely white in color, and transparent backgrounds. The description will be displayed at the top of the node's settings tab after a user has added it to the canvas.

If you'd like to use the Dark Sky logo referenced above, you can download it [here](/images/workflows/custom-nodes/walkthrough/dark-sky-logo.png).

The `Output Type` determines whether this node has one output or two. Most nodes only have a single output, but some (like the [Conditional Node](/workflows/logic/conditional/)) have two. Since this node is only returning weather information, it only needs a single output.

The `Output Result` determines whether the user is required to provide a payload path for the result of this node. Since this node is returning weather information, we will require the user to provide a path.

If you choose "optional" or "required" here, the workflow editor will automatically display a text field for the user to provide a payload path. The result description you provide here will be displayed above that text field to help the user understand the format of this node's output data.

Once you click "Create Custom Node" you'll be presented with a blank canvas where we can begin developing our new node.

![Blank Custom Node Canvas](/images/workflows/custom-nodes/walkthrough/blank-canvas.png "Blank Custom Node Canvas")

## Configure Node Inputs

Custom Nodes do not have direct access to the outer workflow's payload, so all the data your node needs in order to perform its function must be passed in by the node's user. This is where the node's input configuration comes in.

The input configuration allows you to add input controls that will be presented to your node's users in order for them to provide the required information. In the case of our Dark Sky node, the inputs we need are the user's Dark Sky API key and the GPS coordinates to receive weather for.

Click the `Input` tab to begin adding input controls for your node.

![Node Input Tab](/images/workflows/custom-nodes/walkthrough/node-input-tab.png "Node Input Tab")

First, add an input for the user's Dark Sky API key. Click the `Add Input` button and select the `String Template` option. This will add a control that will allow the user to provide a string value to your node, which in this case will be their API key.

![Add String Template Input](/images/workflows/custom-nodes/walkthrough/add-string-template-input.png "Add String Template Input")

You'll next be presented with the options for the new input control.

![API Key Input Options](/images/workflows/custom-nodes/walkthrough/api-key-input-options.png "API Key Input Options")

* Set the `ID` to "apiKey". This identifier is how your node will reference the actual value provided by the user. We'll see how to do this later in this guide.
* Set the `Label` to "Dark Sky API Key". This label will be displayed to your node users above the text input.
* Set the `Description` to "Your Dark Sky API Key." The description will be displayed beneath the text input as a way to give your node users additional information about the expected data and format.
* Check the `Required` checkbox. Since there's no way for this node to make a request to Dark Sky without an API token, we want to mark this as required. This will cause the workflow editor to require the user to enter a value before they'll be allowed to save and deploy the outer workflow.
* Leave the `Validation` field blank. This field gives you the ability to validate that the incoming data is in a specific format. Although we could validate the API key is in a specific format, it's not required for this example.

Next, add another string template input for the user's GPS coordinates.

![GPS Input Options](/images/workflows/custom-nodes/walkthrough/gps-input-options.png "GPS Key Input Options")

* Set the `ID` to "gpsCoords".
* Set the `Label` to "GPS Coordinates".
* Set the `Description` to "The GPS Coordinates to retrieve weather for in decimal degrees format (e.g. 39.108,-84.509)." In this example, you can see a good usage of the description to help communicate the expected data format.
* Check the `Required` checkbox.
* Leave the `Validation` field blank. If you want an extra challenge, this would be a good place to use the validation field to make sure the data is in GPS decimal degrees format.

When this node is executed by a workflow, the starting payload that you have access to will be populated with the input values provided by the user. Each value will be placed on the payload at `data.INPUT_ID`, so this node's starting payload will look like the following:

```json
{
  "data": {
    "apiKey": "users-dark-sky-api-key",
    "gpsCoords": "users-gps-coords"
  }
  ...
}
```

Now that we have the user's information, we can build our node to make a request to Dark Sky's API and return the weather forecast information.

## Build the Node's Logic

Custom nodes are developed a lot like workflows. They are made by combining other built-in and custom nodes together into a reusable bundle. The biggest difference between a custom node and a workflow is how it's triggered and how it outputs result data. Custom Nodes only have access to two triggers. One is the "Start" trigger, which is invoked by the outer workflow whenever this node is executed. The other is the [Virtual Button Trigger](/workflows/triggers/virtual-button/), which is used for testing and will be explained in the next section. The node can then use any other nodes needed to perform its intended function. It then ends with an "Output" node, which provides a way to pass a result back to the outer workflow's payload where execution will continue with your node's result data.

Your node starts with a "Start" and an "Output" node already on the canvas. We now need to fill in the middle to make the Dark Sky API request and return the result.

First, add an [HTTP Node](/workflows/data/http/) to make the actual API request to Dark Sky.

![HTTP Node](/images/workflows/custom-nodes/walkthrough/http-node.png "HTTP Node")

* Set the `URL Template` to "https://api.darksky.net/forecast/{{data.apiKey}}/{{data.gpsCoords}}". As you can see, we are using templates to reference the API key and GPS coordinates that were provided by the user and made available on our node's starting payload. You can refer to [Dark Sky's forecast API documentation](https://darksky.net/dev/docs#forecast-request) for more details.
* Set the `Payload Path to Store Response` to "working.result". This will store the result of this API request back on our payload at the "working.result" payload path. Using the "working" object inside workflows and custom nodes is a recommended best practice, but you can use whatever path you'd like. We recommend using the "working" object because it keeps the original trigger object on the "data" object unaltered and "working" will not conflict with anything Losant provides by default.
* Click the `Store HTTP Error At Payload Path` radio button. API requests can fail for a variety of reasons. This option will cause the node to put those errors on the payload instead of causing the entire custom node to throw an error.
* Set the `Payload Path to Store Error Response` to "working.result". You may notice this is the same payload path as the successful response, but since we're just passing through either the response or the error, this works well for us.

The HTTP Node will place an `error` object on the payload path if the API request fails. This is right in line with our recommended best practice for how nodes should output data. If the node produces an error for any reason, the result data should be an object with an "error" property that contains further details. This provides a standard way for users to handle errors across all nodes.

Now that our result is on our payload, we need to tell the Output Node to return it to the user. Click the Output Node and change the `Result Path` field to "working.result", which will return whatever object is on your payload at "working.result" back to the outer workflow.

![Output Node Options](/images/workflows/custom-nodes/walkthrough/output-node-options.png "Output Node Options")

At this point, the node could be considered done. Click the `Save and Deploy` button at the top of the page to make this custom node available.

## Test and Debug the Node

Before delivering this node to your users, it should probably be tested. Testing a custom node is done directly in the custom node editor using a combination of [Virtual Button Triggers](/workflows/triggers/virtual-button/) and [Debug Nodes](/workflows/outputs/debug/).

For our Dark Sky node, start by adding a Debug Node right before the Output Node. This will allow us to inspect the payload and make sure what we're returning to the user is correct.

![Debug Node](/images/workflows/custom-nodes/walkthrough/debug-node.png "Debug Node")

The Debug Node does not require any other configuration. By default, it simply prints the current payload to the debug tab whenever it is executed.

Next, add a Virtual Button and connect it to the HTTP Node. This will allow us to directly execute this node without having to add it to a workflow first.

![Virtual Button](/images/workflows/custom-nodes/walkthrough/virtual-button.png "Virtual Button")

The Virtual Button lets us trigger our custom node with any payload we want. The data we provide in the Virtual Button will automatically be placed on the "data" field in the starting payload, so in order to replicate the production behavior, we need to add fields for each of our node's inputs.

```json
{
  "apiKey" : "your-test-api-key",
  "gpsCoords" : "39.108,-84.509"
}
```

You can now save, deploy, and click the Virtual Button to test this node. The result of the Dark Sky API request will be displayed in the Debug tab.

![Debug Output](/images/workflows/custom-nodes/walkthrough/debug-output.png "Debug Output")

Using the debug output, we can verify that the object on the "working.result" payload path is correct. Any Virtual Buttons and Debug Nodes you add to your custom node will be ignored when your node is executed as part of an actual workflow. Just remember to remove your test access keys from the Virtual Button before sharing this node with anyone else.

## Version the Node

Just like workflows, custom nodes support versioning, which is an important final step when delivering this node to your users. You can create multiple versions of the node as you add new functionality or fix bugs. When a user adds your node to a workflow, they will have the option to choose the version to use.

The only version of a Custom Node that can be edited is the `develop` version. This version can also be used in workflows, but can cause unintended side effects since any changes you make to `develop` will immediately be applied to any workflows using this node. This is why it's important to create versions and use specific versions in your workflows. This will allow you to continue developing this node without impacting any workflows using a previous version.

Our recommended best practice for versioning nodes is to follow [Semantic Versioning](https://semver.org/). This helps communicate to your users how much impact each version will have and provides a standard across all nodes.

Let's version our Dark Sky node as "v1.0.0". Start by clicking the `Version` tab and then clicking the `Create New Version` button.

![Create Version Button](/images/workflows/custom-nodes/walkthrough/create-version-button.png "Create Version Button")

You'll now be presented with a popup to enter the details of your version.

![Version Popup](/images/workflows/custom-nodes/walkthrough/version-popup.png "Version Popup")

* Set the `Version Name` to "v1.0.0".
* Set the `Notes` to something that describes this version. This field becomes more important as you create additional versions to help communicate what has changed or what was fixed.

After you click the `Create Version` button, you'll see the newly created version in the table of versions for this node.

![Version List](/images/workflows/custom-nodes/walkthrough/version-list.png "Version List")

## Using Your Custom Node

Now that your node is successfully developed and versioned, you can begin using it within your application and experience workflows. The node will immediately show up on the workflow node palette under the `Custom Nodes` section.

![Using Dark Sky Node](/images/workflows/custom-nodes/walkthrough/using-dark-sky-node.png "Using Dark Sky Node")

As you can see, the input fields you configured are automatically presented to the user so they can provide the required data for your node. If your node outputs a result, the workflow editor also automatically provides a `Result Path` field where the user can specify the payload path to store your node's result.

You may notice that your node is currently outputting a `request` object as part of its result. This is because the HTTP Node adds that as part of its result, and we're currently passing it straight through to the user. In most cases, you probably don't want to pass that along. As an added challenge, add a [Mutate Node](/workflows/logic/mutate/) to your custom node to remove the request object before passing the result back to the user. If you get stuck, check out the Dark Sky Node in the [Losant Node Catalog](https://github.com/Losant/workflow-node-catalog) for the implementation.

This concludes the Custom Node Walkthrough. In this guide you learned how to build a complete custom node to access the Dark Sky API to retrieve weather forecast data. As you continue developing new nodes, if you build something that you'd like to share with the community, please consider contributing the node to the [Losant Node Catalog](https://github.com/Losant/workflow-node-catalog) so other developers can benefit from your implementation.