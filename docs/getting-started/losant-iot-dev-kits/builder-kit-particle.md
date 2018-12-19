---
description: Follow along to connect your Particle Builder Kit to Losant.
---

# Losant Particle Builder Kit Instructions

*We’ve officially closed the Losant store and have deprecated our Losant kits. The good news is that you can still find components to create your own kits through other suppliers; we’d recommend [Adafruit](https://www.adafruit.com/).*

*You can still find instructions on how to use existing kits in the documentation section of our website. And though we will no longer provide support for individual kit questions, since we based our kits on off-the-shelf components, there are plenty of other places to find help.*

*IoT is evolving rapidly. Our developer kits offered a limited introduction to solving problems with IoT. We believe the best way to start building an IoT solution for your business is with a [proof of concept](https://www.losant.com/proof-of-concept).*

The Losant Particle Builder Kit provides an easy way to get up and running with the <a href="https://www.losant.com" target="\_blank">Losant Enterprise IoT Platform</a>. This kit provides all the hardware and software needed to build a few simple projects that cover a wide variety of the features within Losant.

![Builder Kit](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/builder-kit.jpg "Builder Kit")

As you perform these workshops, if you run into any issues, please refer to the [Losant Documentation](/) and the [Losant Forums](https://forums.losant.com) for help.

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

The widget we're building in this workshop includes a button, a light sensor (photoresistor), and an LED. We'll use the button to trigger actions in the virtual world, graph the value of the light sensor over time, and remotely control the LED from the web. This workshop is self-guided and provides detailed instructions, but feel free to explore other ways to use your device. You have full access to the Losant Platform to build anything you'd like.

## Build the Widget

Remove all the components from the Particle development kit box, remove the Photon from the breadboard, and build the widget as described below. If you're not familiar with how breadboards works, check out our [simple guide](https://www.losant.com/blog/how-to-use-a-breadboard), which will help explain how the wiring works.

![Wiring Diagram](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/wiring-diagram.png "Wiring Diagram")

1. Push the Photon into terminals 1-12 on either side of the center line, which are rows `c` and `h`. The USB port should be facing away from the breadboard.
1. Connect the LED to terminals `i12` (D0 on the Photon) and `i15`. Make sure the long wire is connected to `i12`.
1. Connect a resistor to terminals `j4` (GND on the Photon) and `j15`. The orientation of the resistor doesn't matter.
1. Connect the photoresistor to terminals `b8` (A4 on the Photon) and `b12` (A0 on the Photon). The orientation doesn't matter.
1. Connect a resistor to terminals `b2` (GND on the Photon) and `a12` (A0 on the Photon). The orientation doesn't matter.
1. Connect the push button to terminals `e19`, `e21`, `f19`, and `f21`. It should straddle the center line of the breadboard.
1. Connect a jump wire between terminals `j1` (3V3 on the Photon) and `j19`.
1. Connect a jump wire between terminals `j11` (D1 on the Photon) and `j21`.

The finished widget should look like the below image.

![Wiring Image](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/wiring-image.jpg "Wiring Image")

## Set Up the Photon

Follow [these instructions](https://docs.particle.io/guide/getting-started/start/photon/#step-1-power-on-your-device) to create a Particle account and properly connect the Photon to the WiFi network. If more than one Photon shows up in the list, you can get the ID of yours by looking at the back of the development kit box.

![Kit Box](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/development-kit-box.jpg "Kit Box")

## Flash the Firmware

Once the Photon is properly configured, we can use Particle's cloud IDE to flash the workshop's firmware to the device. Navigate to [https://build.particle.io](https://build.particle.io) and create a new app. You can name it anything you want. Once created you'll see an empty file with setup and loop functions. It should look like the following image.

![Empty Sketch](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/empty-sketch.png "Empty Sketch")

The sketch we need to upload to the Photon is available in GitHub. Navigate to the file below and copy-paste the contents into the cloud IDE, replacing all existing content.

[https://github.com/Losant/losant-kit-builder-particle/blob/master/workshop.ino](https://github.com/Losant/losant-kit-builder-particle/blob/master/workshop.ino)

Once pasted, flash the firmware to your device using the Flash button at the top-left corner of the screen.

![Flash Firmware](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/flash-firmware.png "Flash Firmware")

The firmware we just flashed is publishing the value of the photoresistor to the Particle cloud every five seconds. It will also publish an event whenever the button is pressed. We can monitor these events using the Particle console. Navigate to [https://console.particle.io/logs](https://console.particle.io/logs) to see these events being published in real-time.

![Console Logs](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/console-logs.png "Console Logs")

Now that we have data being published, it's time to integrate Losant so we can create dashboards and invoke external services when the button is pressed.

## Losant Setup

If you haven't already, [sign up for Losant](https://accounts.losant.com/create-account). After signing up you'll be prompted to create your first application. You can also go to create an application from the main Applications menu at the top of every screen.

![Welcome Page](/images/getting-started/walkthrough/welcome-page.png "Welcome Page")

You can name your application whatever you would like - in this case we have called it
"Losant Particle Workshop".

![Create Application](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/create-application.png "Create Application")

Next, add a device to the application to represent our Photon-powered widget.

![Add Device](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/add-device.png "Add Device")

![Add Blank Device](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/add-blank.png "Add Blank Device")

![Device Setup](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/device-setup.png "Device Setup")

1. Set the device name to anything you want.
1. "Description" can be left blank, or fill it with whatever you want.
1. For "Device Type", leave "Standalone" selected.
1. Add a device attribute with the type `Number` and the name `light-level`.
1. Add a device attribute with the type `Number` and the name `button-pressed`.

Once everything is configured, click the `Create Device` button at the top-right on the screen.

Next, create a webhook that the Particle cloud can use to send published events to the Losant Platform.

![Webhook Menu](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/webhook-menu.png "Webhook Menu")

![Add Webhook](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/add-webhook.png "Add Webhook")

![Webhook Settings](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/webhook-settings.png "Webhook Settings")

1. Set the name of the webhook to anything you'd like.
1. Make sure `No Verification` is selected. Some services require webhooks to be verified in order for them to be invoked. Losant has built-in support for several of these, however Particle does not require verification.

Click `Save Webhook` to create the webhook. The screen will now display the URL. Copy-paste this somewhere convenient because you'll need it in the next step.

![Webhook URL](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/webhook-url.png "Webhook URL")

## Particle Integration Setup

Now that we have a webhook, we can give it to Particle so it can send Losant the events that are being published. Navigate to [https://console.particle.io/integrations](https://console.particle.io/integrations) and select `New Integration`.

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

Particle is pushing event data to Losant using a webhook. We need to catch those webhooks and send that data into the Losant device we created earlier. Fortunately this is very easy to do using a [Losant Workflow](/workflows/overview/).

First, create a new workflow and name it anything you'd like.

![Create Workflow](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/create-workflow.png "Create Workflow")

![Workflow Settings](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/workflow-settings.png "Workflow Settings")

![Empty Workflow](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/empty-workflow.png "Empty Workflow")

The first thing we need to do is trigger this workflow with the webhook that's being invoked by Particle. Start by dragging a [Webhook trigger](/workflows/triggers/webhook/) onto the workflow canvas.

![Workflow Webhook](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/workflow-webhook.png "Workflow Webhook")

Next, let's connect a [Debug node](/workflows/outputs/debug/) so you can see what a workflow payload looks like. Every workflow is invoked by a trigger which includes a payload. In our example, the trigger is the webhook and the payload is whatever Particle sent us. As workflows execute, the payload flows through the nodes. Nodes can modify and make decisions based on the payload as needed. The Debug node simply logs the payload to the debug tab.

Drag a Debug node to the canvas and connect it to the Webhook node.

![Workflow Debug](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/workflow-debug.png "Workflow Debug")

We're now ready to deploy this workflow. Click the `Deploy Workflow` button on the top-right.

![Deploy Workflow](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/deploy-workflow.png "Deploy Workflow")

Once it's deployed, select the Debug tab on the right. The Photon is publishing the "light-level" event every five seconds, so we should see a debug message each time Particle sends that event to Losant. You'll also see a debug message whenever you push the hardware button.

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

Now that we have data coming from Particle and into Losant, it's time to send it to the device we created earlier. The first thing we need to do it branch the workflow using a [Conditional](/workflows/logic/conditional/) node based on the event that Particle sends: "light-level" or "button-pressed".

Drag two Conditional nodes onto the canvas and connect them to the Debug node.

![Conditional Nodes](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/conditional-nodes.png "Conditional Nodes")

Set the expression of the left conditional node to check for the "light-level" event:

```handlebars
{{ data.body.event }} === "light-level"
```

Set the expression of the right Conditional node to check for the "button-pressed" event:

```handlebars
{{ data.body.event }} === "button-pressed"
```

Many places within a Losant workflow allow you to reference values on the current payload by surrounding the path with double curly braces. In this example, each conditional is checking that the value at `data.body` is equal to a string. With this conditional, we can do something different when the button is pressed compared to when the light level is received.

Let's now save all of this data on the Losant device we created earlier. Drag two [Device State](/workflows/outputs/device-state/) nodes onto the canvas and connect them to each conditional block.

![Device State Node](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/device-state-node.png "Device State Node")

Each Device State node will save state onto our Losant device. Under the light level condition, set the "light-level" device attribute to "{{ data.body.data }}". Under the button pressed condition, simply set the "button-pressed" attribute to the number 1. In the next section, when we create a dashboard, we will show a sum of all button presses, which is why we just need to report a 1 each time it is pressed.

Deploy the workflow using the `Deploy Workflow` button.

## Build a Dashboard

Losant is now saving all light level and button press event data on our device. We can now build a dashboard to visualize this data. First, create a dashboard and name it anything you want.

![Create Dashboard Menu](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/create-dashboard-menu.png "Create Dashboard Menu")

![Dashboard Name](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/dashboard-name.png "Dashboard Name")

To start, we'll use a Time Series graph to display the last 30 minutes worth of light level data.

![Time Series Graph](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/time-series-graph.png "Time Series Graph")

![Time Series Settings](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/time-series-settings.png "Time Series Settings")

1. Set the name of the block to anything you want.
1. Make sure your workshop application is selected. If you only have one application, it will be selected by default.
1. Set the Time Range to 30 minutes and the Resolution to 30 seconds. This will cause the graph to show the last 30 minutes of data with a data point every 30 seconds.
1. Make sure your device is selected. If you only have one device, it will be selected by default.
1. Set the Series Label to anything you want.
1. Choose the "light-level" attribute.

The preview on the right side of the screen should update immediately with the data. Click `Add Block` to add the block to your dashboard. Your dashboard should now look something like the following image. You may not have much data right now, but the dashboard updates in real-time and will display more data as your Photon continues to publish the light level.

![Dashboard with Graph](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/dashboard-with-graph.png "Dashboard with Graph")

Next, let's display the number of times the button has been pressed. Add a new Gauge block to the dashboard.

![Add Block Button](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/add-block-button.png "Add Block Button")

![Add Gauge](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/add-gauge.png "Add Gauge")

![Gauge Settings](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/gauge-settings.png "Gauge Settings")

1. Name the block anything you want.
1. Make sure your application is selected.
1. Leave the Gauge Type and Precision Type set to their defaults.
1. Set the duration to 24 hours.
1. Make sure your device is selected.
1. Set the label to anything you want.
1. Select "button-pressed" as the attribute.
1. Change aggregation to SUM.

This block will now display the sum of all button presses over the last 24 hours. Click `Add Block` to add it to your dashboard.

![Dashboard with Gauge](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/dashboard-with-gauge.png "Dashboard with Gauge")

Feel free to resize and rearrange these blocks however you want. As an added challenge, see if you can display a Dial Gauge that shows the current light level as a value between 0-1024. You would do this by adding another Gauge block and setting the Gauge Type to Dial. I'll leave the rest up to you.

As you continue the workshop, feel free to leave the dashboard open and let it continue to update with new data.

## Use the Button

Since we have a workflow that gets triggered whenever the button is pressed, let's send ourselves an SMS message whenever it occurs. Go back to the workflow and drag an [SMS node](/workflows/outputs/sms/) onto the canvas and connect it to the Device State node under the button-pressed conditional.

![SMS Node](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/sms-node.png "SMS Node")

1. Set the phone number to your own number.
1. Set the message to anything you want.

Deploy the workflow using the `Deploy Workflow` button. Now whenever you hit the button you'll get an SMS message. The default limit on the Losant SMS node is one message per minute. If you need more, you can use the [Twilio node](/workflows/outputs/twilio/) to send as many as you want.

Next, let's invoke a third-party web service when you hit the button. If you navigate to [http://lights.mod.bz](http://lights.mod.bz) you'll see a grid of squares. You can post a message to this website and it will light up a random square and display a name and message of your choosing. Everyone else that's viewing the page will also see your message.

Add an HTTP node and connect it to the same node that the SMS node is connected to. You may also want to remove the line connecting the SMS node if you want to stop getting messages to your phone.

![HTTP Node](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/http-node.png "HTTP Node")

1. Set the Request Method to POST.
1. Set the URL Template to "http://lights.mod.bz".
1. Set the Body Template to a JSON object with a name and message of your choosing: `{ "name" : "my-name", "message" : "my-message"}`.
1. Add a header with the name "content-type" and the value "application/json".

Deploy the workflow using the `Deploy Workflow` button. Now when you hit the button, your name and message will appear on the website.

As an additional challenge, see if you can send yourself an email or put a message in one of your Slack channels whenever the button is pressed.

## Remote-Controlled LED

The last workshop we're going to do is to remotely control the LED whenever a virtual button is pressed in the workflow. Start by adding a [Virtual Button](/workflows/triggers/virtual-button/) trigger and an HTTP node to the canvas.

![Virtual Button](/images/getting-started/losant-iot-dev-kits/builder-kit-particle/virtual-button.png "Virtual Button")

The virtual button doesn't require any configuration for this example. It's simply a button you can push to trigger the workflow. For the HTTP node, use the following details:

1. Set the Request Method to POST.
1. Set the URL Template to "https://api.particle.io/v1/devices/events".
1. Set the Body Template to `{ "name" : "led-toggle" }`.
1. Add a header with the name "Authorization" and the value "Bearer &lt;Particle Access token&gt;". You can get your Particle Access here: [https://build.particle.io/build#settings](https://build.particle.io/build#settings).
1. Add a header with the name "content-type" and the value "application/json".

Along with publishing the "light-level" and "button-pressed" events, the Photon firmware we flashed earlier is also subscribed to the "led-toggle" event. This means whenever "led-toggle" is published, it will invoke a function on the Photon to switch the state of the LED. The HTTP node we just added is using the Particle API to publish this event whenever the virtual button is pressed.

Deploy the workflow using the `Deploy Workflow` button. You should now see the LED toggle whenever you press the virtual button.

The Photon is also subscribed to "led-on" and "led-off" for additional control over the LED. As a final challenge, see if you can turn the LED on when the light level goes below a specific number, and turns off when the light level goes back up.

Feel free to continue exploring Particle and Losant and come up with clever ways to use these platforms and the workshop hardware!
