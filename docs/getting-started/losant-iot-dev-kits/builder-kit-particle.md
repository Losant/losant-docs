# Losant Particle Builder Kit Instructions

The Losant Particle Builder Kit is a Particle-based version of the <a href="https://store.losant.com/products/losant-builder-kit" target="_blank">Losant Builder Kit</a> and an easy way to get up and running with the Losant IoT developer platform. This kit provides all the hardware and software needed to build a few simple projects that cover a wide variety of the features within the Losant platform.

![Builder Kit](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/builder-kit.jpg "Builder Kit")

// TODO: redo this image.

As you perform these workshops, if you run into any issues, please refer to the [Losant Documentation](https://docs.losant.com) and the [Losant Forums](https://forums.losant.com) for help.

Your kit should include the following items:

* 1 Photon WiFi Development Kit that includes:
    * 1 Particle Photon
    * 2 resistors
    * 1 photoresistor
    * 1 LED
    * 1 solderless breadboard
    * 1 micro-USB cable
* 1 button
* 2 jump wires

## What We're Building

The widget we're building in this workshop includes a button, a light sensor (photoresistor), and an LED. We'll use the button to trigger actions in the virtual world, graph the value of the light sensor over time, and remotely control the LED from the web. This workshop is self-guided and provides detailed instructions, but feel free to explore other ways to use your device. You have full access to the Losant platform to build anything you'd like.

## Build the Widget

Remove all the components from the Particle development kit box, remove the Photon from the breadboard, and build the widget as described below. If you're not familiar with how breadboards works, check out our [simple guide](https://www.losant.com/blog/how-to-use-a-breadboard). It might help make some of the wiring make sense.

![Wiring Diagram](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/wiring-diagram.png "Wiring Diagram")

1. Push the Photon into terminals 1-12 on either side of the center line, which are rows `c` and `h`. The USB port should be facing away from the breadboard.
1. Connect the LED to terminals `i12` (D0 on the Photon) and `i15`. Make sure the long wire is connected to `i12`.
1. Connect a resistor to terminals `i4` (GND on the Photon) and `i15`. The orientation of the resistor doesn't matter.
1. Connect the photoresistor to terminals `b8` (A4 on the Photon) and `b12` (A0 on the Photon). The orientation doesn't matter.
1. Connect a resistor to terminals `a2` (GND on the Photon) and `a12` (A0 on the Photon). The orientation doesn't matter.
1. Connect the push button to terminals `e19`, `e21`, `f19`, and `f21`. It should straddle the center line of the breadboard.
1. Connect a jump wire between terminals `j1` (3V3 on the Photon) and `j19`.
1. Connect a jump wire between terminals `j11` (D1 on the Photon) and `j21`.

The finished widget should look like the below image.

// TODO take picture.

## Setup the Photon

Follows [these instructions](https://docs.particle.io/guide/getting-started/start/photon/#step-1-power-on-your-device) to create a Particle account and properly connect the Photon to the WiFi network. It's likely that several Photons will show up in the list on your mobile device. In order to choose the correct one, you can find its ID on the back of your development kit box.

![Kit Box](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/development-kit-box.jpg "Kit Box")

## Flash the Firmware

Once the Photon is properly configured, we can use Particle's cloud IDE to flash the workshop's firmware to the device. Navigate to [https://build.particle.io](https://build.particle.io) and create a new app. You can name it anything you want. Once created you'll see an empty file with setup and loop functions. It should look like the following image.

![Empty Sketch](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/empty-sketch.png "Empty Sketch")

The sketch we need to upload to the Photon is available in GitHub. Navigate to the file below and copy-paste the contents into the cloud IDE, replacing all existing content.

[https://github.com/Losant/losant-kit-builder-particle/blob/master/workshop.ino](https://github.com/Losant/losant-kit-builder-particle/blob/master/workshop.ino)

// TODO: make this public

Once pasted, flash the firmware to your device using the Flash button at the top-left corner of the screen.

![Flash Firmware](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/flash-firmware.png "Flash Firmware")

The firmware we just flashed is publishing the value of the photoresistor to the Particle cloud every five seconds. It will also publish an event whenever the button is pressed. We can monitor these events using the Particle console. Navigate to [https://console.particle.io/logs](https://console.particle.io/logs) to these events being published in real-time.

![Console Logs](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/console-logs.png "Console Logs")

Now that we have data being published, it's time to integrate Losant so we can create dashboards and invoke external services when the button is pressed.

## Losant Setup

If you haven't already, [sign up for Losant](https://accounts.losant.com/create-account). After signing up, create a new application for this workshop. You can name it anything you want.

![New Application](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/new-application.png "New Application")

Next, add a device to the application to represent our Photon-powered widget.

![Add Device](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/add-device.png "Add Device")

![Add Blank Device](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/add-blank.png "Add Blank Device")

![Device Setup](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/device-setup.png "Device Setup")

1. Set the device name to anything you want.
1. Set the device type to `Virtual`. This is required since the Photon won't be directly connecting to the Losant platform. The device's state information (light level and button presses) will be obtained by receiving webhooks from the Particle cloud, which we'll set up in a later step.
1. Set two attributes on the device: "light-level" and "button-pressed". Set both of their data types to `Number`.

Once everything is configured, click the `Create Device` button at the top-right on the screen.

Next, create a webhook that the Particle cloud can use to send published events to the Losant platform.

![Webhook Menu](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/webhook-menu.png "Webhook Menu")

![Add Webhook](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/add-webhook.png "Add Webhook")

![Webhook Settings](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/webhook-settings.png "Webhook Settings")

1. Set the name of the webhook to anything you'd like.
1. Make sure `No Verification` is selected. Some services require webhooks to be verified in order for them to be invoked. Losant has built-in support for several of these, however Particle does not require verification.

Click `Save Webhook` to create the webhook. The screen will now display the URL. Copy-paste this somewhere convenient because you'll need it in the next step.

![Webhook URL](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/webhook-url.png "Webhook URL")

## Particle Integration Setup

Now that we have a webhook, we can give it to Particle so it can send Losant all of those events that are being published. Navigate to [https://console.particle.io/integrations](https://console.particle.io/integrations) and select `New Integration`.

![New Integration](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/new-integration.png "New Integration")

Next, choose the Webhook integration.

![Webhook Integration](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/webhook-integration.png "Webhook Integration")

The first webhook we'll create will be for the "light-level" event that is being published every five seconds by the Photon.

![Light Level Webhook](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/light-level-webhook.png "Light Level Webhook")

1. Set the `Event Name` to "light-level".
1. Set the `URL` to the Webhook URL that was created in Losant.

Once complete, click the `Create Webhook` button. Now whenever the "light-level" event is published by the Photon, Particle will invoke that webhook and send the data to Losant where it can be stored, displayed on a dashboard, and used to trigger actions and notifications.

Repeat the same process again and create a webhook integration for the "button-pressed" event. Use the same webhook URL.

![Button Webhook](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/button-webhook.png "Button Webhook")

Your integrations page should now look something like the below image.

![Integrations](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/integrations.png "Integrations")

At this point, all event data is now being published to Particle and then sent to Losant. Now let's populate our Losant device and start building a dashboard with data.

## Save Device Data

Particle is pushing event data to Losant using a webhook. We need to catch those webhooks and send that data into the Losant device we created earlier. Fortunately this is very easy to do using a [Losant Workflow](https://docs.losant.com/workflows/overview/).

First, create a new workflow and name it anything you'd like.

![Create Workflow](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/create-workflow.png "Create Workflow")

![Workflow Settings](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/workflow-settings.png "Workflow Settings")

![Empty Workflow](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/empty-workflow.png "Empty Workflow")

The first thing we need to do is trigger this workflow with the webhook that's being invoked by Particle. Start by dragging a [Webhook trigger](https://docs.losant.com/workflows/triggers/webhook/) onto the workflow canvas.

![Workflow Webhook](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/workflow-webhook.png "Workflow Webhook")

Next, let's connect a [Debug node](https://docs.losant.com/workflows/outputs/debug/) so you can see what a workflow payload looks like. Every workflow is invoked by a trigger which includes a payload. In our example, the trigger is the webhook and the payload is whatever Particle sent us. As workflows execute, the payload flows through the nodes. Nodes can modify and make decisions based on the payload as needed. The debug node simply logs the payload to the debug tab.

Drag a debug node to the canvas and connect it to the webhook node.

![Workflow Debug](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/workflow-debug.png "Workflow Debug")

We're now ready to deploy this workflow. Click the `Deploy Workflow` button on the top-right.

![Deploy Workflow](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/deploy-workflow.png "Deploy Workflow")

Once it's deployed, select the Debug tab on the bottom-right. The Photon is publishing the "light-level" event every five seconds, so we should see a debug message each time Particle sends that event to Losant. You'll also see a debug message whenever you push the hardware button.

![Debug Output](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/debug-output.png "Debug Output")

All triggers place their information on the `data` field of the payload. The webhook trigger places a bunch of useful information about the underlying request, but the important information is available on `data.body`, which contains the "light-level" event name and value. If you were to push the button, you'd see a debug message that contained the event name "button-pressed". Below is an example payload that shows the `body` field.

```json
{
  "data": {
    ...
    "body": {
      "event": "light-level",
      "data": "129",
      "published_at": "2016-08-03T21:56:39.633Z",
      "coreid": "410027000247353138383138"
    }
  }
}
```

Now that we have data coming from Particle and into Losant, it's time to send it to the device we created earlier. The first thing we need to do it branch the workflow using a [Conditional](https://docs.losant.com/workflows/logic/conditional/) node based on the event that Particle sends: "light-level" or "button-pressed".

![Conditional Nodes](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/conditional-nodes.png "Conditional Nodes")

Drag two conditional nodes onto the canvas and connect them to the debug node. Next, set the expression to check for the "light-level" event and the "button-pressed" event:

```
{{ data.body.event }} === "light-level"
```

```
{{ data.body.event }} === "button-pressed"
```

Many places within a Losant workflow allow you to reference values on the current payload by surrounding the path with double curly braces. In this example, each conditional is checking that the value at `data.body` is equal to a string. With this conditional, we can do something different when the button is pressed compared to when the light level is received.

Let's now save all of this data on the Losant device we created earlier. Drag two [Virtual Device](/workflows/outputs/virtual-device/) nodes onto the canvas and connect them to each conditional block.

![Virtual Device Nodes](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/virtual-device-node.png "Virtual Device Nodes")

Each virtual device node will save state onto our Losant device. Under the light level condition, set the "light-level" device attribute to "{{ data.body.data }}". Under the button pressed condition, simply set the "button-pressed" attribute to the number 1. In the next section, when we create a dashboard, we will show a sum of all button presses, which is why we just need to report a 1 each time it is pressed.

Deploy the workflow using the `Deploy Workflow` button.

## Build a Dashboard

Losant is now saving all light level and button press event data on our device. We can now build a dashboard to visualize this data. First, create a dashboard and name it anything you want.

![Create Dashboard Menu](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/create-dashboard-menu.png "Create Dashboard Menu")

![Dashboard Name](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/dashboard-name.png "Dashboard Name")
