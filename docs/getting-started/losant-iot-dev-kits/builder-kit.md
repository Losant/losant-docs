# Losant Builder Kit Instructions

The <a href="https://store.losant.com/products/losant-builder-kit" target="\_blank">Losant Builder Kit</a> is an easy way to get up and running with the Losant IoT developer platform. This kit provides all the hardware and software needed to build a few simple projects that cover a wide variety of the features within the Losant platform.

![Builder Kit](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/kit-complete.jpg "Builder Kit")

As you perform these workshops, if you run into any issues, please refer to the [Losant Documentation](https://docs.losant.com) and the [Losant Forums](https://forums.losant.com) for help.

Your kit should include the following items:

  * 1 [NodeMCU v1.0](http://nodemcu.com/index_en.html) dev kit microcontroller <a href="https://github.com/nodemcu/nodemcu-devkit-v1.0" target="\_blank">(View board schematic)</a>
  * 1 solderless breadboard
  * 8 jump wires
  * 2 resistors
  * 1 LED
  * 1 TMP36 temperature sensor
  * 1 button
  * 1 micro-USB cable

## Overview

These instructions are split into three workshops. Each workshop builds on the previous one and adds new functionality to your kit. It is recommended that you complete the workshops in order.

## Environment Setup

The microcontroller included in this kit is programmed using the Arduino tools. Those must be installed by following the <a href="/getting-started/losant-iot-dev-kits/environment-setup/" target="_blank">environment setup instructions</a>.

## Losant Setup

In this section, you’ll register for a Losant account, create your application, and add the device for your builder kit.

### Create Account

If you don't already have an account, navigate to [https://accounts.losant.com/create-account](https://accounts.losant.com/create-account) to register.

### Create Application

Create an application for the builder kit. You can name it whatever you want.

![Create Application](/images/getting-started/losant-iot-dev-kits/builder-kit/create-application.png "Create Application")

![Application Settings](/images/getting-started/losant-iot-dev-kits/builder-kit/application-settings.png "Application Settings")

### Add Device

The next step is to register the builder kit device with the platform. Click the `Add Device` button on the top right or select `Add Device` from the Devices dropdown.

![Add Device Menu](/images/getting-started/losant-iot-dev-kits/builder-kit/add-device-menu.png "Add Device Menu")

Next, choose the `Create Blank Device` option.

![Create From Scratch](/images/getting-started/losant-iot-dev-kits/builder-kit/add-from-scratch.png "Create From Scratch")

![Add Device Name](/images/getting-started/losant-iot-dev-kits/builder-kit/add-device-name.png "Add Device Name")

![Add Device Attributes](/images/getting-started/losant-iot-dev-kits/builder-kit/add-device-attributes.png "Add Device Attributes")

1. Name the device anything you want.
1. "Description" can be left blank, or fill it with whatever you want.
1. For "Device Type", leave "Standalone" selected.
1. Add a device attribute with the type `Boolean` and the name `button`.
1. Add a device attribute with the type `Number` and the name `tempF`.
1. Add a device attribute with the type `Number` and the name `tempC`.

The device attributes specify what state information the device reports. The firmware that you’ll flash in the following sections will report whenever a button is pressed, the temperature in Celsius (tempC), and the temperature in Fahrenheit (tempF). Device attributes are ***case-sensitive***, so make sure to enter these ***exactly as they appear***.

Click the `Create Device` button. The screen will change and show the device’s ID. This ID is required for the following sections. You might want to copy/paste it somewhere convenient.

![Device ID](/images/getting-started/losant-iot-dev-kits/builder-kit/device-id.png "Device ID")

### Generate Security Tokens

Now we need to generate some security tokens so your device can authenticate against the Losant platform. Select `Access Keys` from the application menu bar.

![Access Keys](/images/getting-started/losant-iot-dev-kits/builder-kit/access-keys.png "Access Keys")

For these workshops, generate an access key that provides access to all devices in your application.

![Token Restrictions](/images/getting-started/losant-iot-dev-kits/builder-kit/token-restrictions.png "Token Restrictions")

This will cause a popup to appear with your access tokens. Losant ***DOES NOT*** store the secret, so you’ll have to copy it somewhere secure. Both of these values will be needed in the following sections, so make sure you copy/paste them somewhere convenient.

![Access Token Popup](/images/getting-started/losant-iot-dev-kits/builder-kit/access-token-popup.png "Access Token Popup")

## Get Workshop Source Code

Now let's get the firmware you'll be flashing to the device. Download and extract the following zip file to your computer. We'll be editing and opening these files using the Arduino IDE, so put it somewhere convenient.

[https://github.com/Losant/losant-kit-builder-nodemcu/archive/master.zip](https://github.com/Losant/losant-kit-builder-nodemcu/archive/master.zip)

If you're familiar with git, you can also clone the repository from here:

[https://github.com/Losant/losant-kit-builder-nodemcu](https://github.com/Losant/losant-kit-builder-nodemcu)

## Workshop 1 – Internet Button

The first workshop creates an Internet button that triggers a Losant Workflow to send yourself an email.

### Wiring

***Disconnect the NodeMCU dev kit from USB.***

For this workshop, you’ll need to attach the NodeMCU and button to the breadboard. Below is the wiring diagram. For more information on what breadboards are and how they work, check out our blog post on <a href="https://www.losant.com/blog/how-to-use-a-breadboard" target="\_blank">How to Use a Breadboard</a>.

![Workshop 1 Wiring Diagram](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/workshop-1-wiring-diagram.png "Workshop 1 Wiring Diagram")

1. Push the NodeMCU into terminals 1-15 on either side of the center line, which are rows “b” and “i.” The USB port should be facing away from the breadboard.
1. Connect the 3V3 pin from the NodeMCU (a1) to the positive rail with a jump wire.
1. Connect the GND pin from the NodeMCU (a2) to the negative rail with a jump wire.
1. Connect the button to the other end of the breadboard so its leads straddle the center line and connect it to terminals e28, e30, f28, and f30.
1. Connect the positive rail to the button using terminal a28 using a jump wire.
1. Connect the negative rail to the button using terminal c30 using a resistor. It doesn’t matter which way resistors are oriented.
1. Connect the pin labeled "D1" on the NodeMCU (a14) to the button (j30) with a jump wire. In our code, "D1" is the equivalent of GPIO pin 5.

![Workshop 1 Wiring Image](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/workshop-1-wiring-image.jpg "Workshop 1 Wiring Image")

### Flash the Firmware

Plug the NodeMCU back into USB. Make sure the device shows up under the Arduino IDE's `Tools -> Port` menu and it's selected. Refer to the [environment setup](/getting-started/losant-iot-dev-kits/environment-setup#configure-device-usb-port) for instructions on properly configuring the device port.

With the Arduino IDE, use the `File -> Open` menu to navigate to where you downloaded and extracted the builder kit source code and open the file `workshop-1-internet-button/workshop-1-internet-button.ino`. Edit the following variables at the top of the file.

1. WIFI_SSID: The name of your WiFi network.
1. WIFI_PASS: Your WiFi password.
1. LOSANT_DEVICE_ID: After creating your device, the device ID is printed on the page in a gray box. You can also find it next to the name of your device on your application's "View All Devices" page.
1. LOSANT_ACCESS_KEY: Set this to the access key you generated after creating the Losant application.
1. LOSANT_ACCESS_SECRET: Set this to the access secret you generated after creating the Losant application.

![Update Variables](/images/getting-started/losant-iot-dev-kits/builder-kit/update-variables.png "Update Variables")

Your changes will automatically be saved as part of the upload process in the following steps. After editing the code, open the Arduino IDE's Serial Monitor and change the baud rate to 115200. The serial monitor can be opened using the button on the top right of the Arduino IDE or using the `Tools -> Serial Monitor` menu.

![Open Serial Monitor](/images/getting-started/losant-iot-dev-kits/builder-kit/open-serial-button.png "Open Serial Monitor")

![Serial Monitor Baud](/images/getting-started/losant-iot-dev-kits/builder-kit/serial-monitor-baud.png "Serial Monitor Baud")

The serial monitor won't print any information until we flash the device with the source code in the next step.

Upload the firmware to the device by clicking the `Upload` button or the `Sketch -> Upload` menu. This will take a few seconds and the NodeMCU will rapidly blink a blue light while it’s uploading.

![Upload Button](/images/getting-started/losant-iot-dev-kits/builder-kit/upload-button.png "Upload Button")

If you see an error in the Arduino IDE's output window, refer to the ones below for common solutions.

```
#include <ESP8266WiFi.h>
                         ^
compilation terminated.
exit status 1
```

This means the board is not installed or properly setup. Refer to the [Arduino Setup](/getting-started/losant-iot-dev-kits/environment-setup/#configure-arduino-ide) step of the environment setup instructions to install the board and configure the Arduino IDE to use it.

```
error: espcomm_open failed
error: espcomm_upload_mem failed
```

This means the port is not properly selected. Refer to the [Configure Device USB Port](/getting-started/losant-iot-dev-kits/environment-setup/#configure-device-usb-port) step of the environment setup instructions.

After the upload is complete, the Serial Monitor should start printing information about it connecting to WiFi and Losant. Push the button you wired up in the breadboard, and the Serial Monitor will print “Button Pressed!”

![Serial Output](/images/getting-started/losant-iot-dev-kits/builder-kit/serial-output.png "Serial Output")

If you don’t see the “Button Pressed!” message, check your wiring. The jump wires are not always the best connectors and sometimes just need wiggled around a little.

Every time the button is pressed, the firmware is publishing the state `{ "button": true }` to Losant. Currently, this firmware only reports when the button goes to true, it does not report the button going back to false. So if you hold the button down for a long time, it will only report when the button is initially pressed.

It’s now time to go into Losant and make use of this data.

### Create Workflow

[Workflows](https://docs.losant.com/workflows/overview/) in Losant allow you to easily perform actions based on various triggers. In this workshop, our trigger will be a device state. Whenever the button is pressed, the device publishes a state message to Losant that we can use to trigger an action – for example, sending an email.

Create a new workflow and name it “Internet Button.”

![Create Workflow](/images/getting-started/losant-iot-dev-kits/builder-kit/create-workflow.png "Create Workflow")

![Save Workflow](/images/getting-started/losant-iot-dev-kits/builder-kit/save-workflow.png "Save Workflow")

Start by dragging a Device workflow trigger node to the canvas. Then, on the Device trigger's configuration panel, select your builder kit device. Since this is likely the application's only device, it will be selected by default. If, however, you have more than one device, simply start typing the name of the device and select it from the dropdown.

![Device Workflow Node](/images/getting-started/losant-iot-dev-kits/builder-kit/device-workflow-node.png "Device Workflow Node")

Next, add a [Debug node](https://docs.losant.com/workflows/outputs/debug/) so you can test that the workflow is triggered when the button is pressed. This is also an opportunity to see what a workflow payload looks like. Understanding the payload will help make the following steps make sense.

![Debug Workflow Node](/images/getting-started/losant-iot-dev-kits/builder-kit/debug-workflow-node.png "Debug Workflow Node")

Workflow nodes are connected by clicking on the small diamond-shaped connector on the source node and dragging it to anywhere on the destination node.

This workflow is now ready to test. Deploy it using the `Deploy Workflow` button on the top right.

![Deploy Workflow Button](/images/getting-started/losant-iot-dev-kits/builder-kit/deploy-workflow-button.png "Deploy Workflow Button")

After the workflow has been deployed, you can press the device button to see the debug output. The debug output can be reached by clicking the `Debug` tab on the bottom right of the screen.

![Debug Output](/images/getting-started/losant-iot-dev-kits/builder-kit/debug-output.png "Debug Output")

What the Debug node outputs is what Losant calls a “workflow payload.” This is the data that flows through the workflow. Workflow nodes can change the payload, validate values, and perform many other operations. In this example, the payload includes the state that was published.

```text
{ "data" : { "button" : true }}
```

If you have an empty data field that does not include the button value, the typical cause is the button attribute defined on the device does not exactly match "button" (all lowercase). Go back to your device page and double-check that it matches exactly. If it does not, simply change the attribute's name and save the device. The button field should then automatically start showing up.

You may remember that when you originally set up the device, we added an attribute named “button” whose data type was boolean. This is the attribute that the firmware we flashed is sending to Losant. There’s nothing special about the name “button”; we could have named it anything.

Since the Device node can be triggered on any state request and we only want this workflow to run when the button attribute is sent, let’s add a [Conditional node](https://docs.losant.com/workflows/logic/conditional/) to check that the value of button is true. This will be important for the later workshops when the device starts sending other state information. We don’t want an email every time the device sends something.

![Conditional Workflow Node](/images/getting-started/losant-iot-dev-kits/builder-kit/conditional-workflow-node.png "Conditional Workflow Node")

You can delete the existing Debug node or click on the connecting line and delete it. Either way, insert a Conditional node between the Device node and the Debug node.

Many workflow nodes, including the Conditional node, support what Losant calls [expressions](/workflows/accessing-payload-data/#expressions), which allow for testing the truthiness of a condition against a payload property. Set the conditional expression to the following:

```text
{{ data.button }} == true
```

This expression pulls the value of data.button from the payload, which you saw earlier using the debug node. If data.button doesn’t exist, this will evaluate to false.

The Conditional node branches the workflow depending on whether the expression is true or false. If the value is true, the workflow takes the right branch. If the expression is false, the workflow takes the left branch. Since we have nothing attached to the false branch, the workflow simply ends and nothing happens.

The last step is to add the Email node to send yourself an email every time the button is pressed.

![Email Workflow Node](/images/getting-started/losant-iot-dev-kits/builder-kit/email-workflow-node.png "Email Workflow Node")

Losant has two email output nodes. The [Email](https://docs.losant.com/workflows/outputs/email/) node sends emails using Losant’s servers, but has a limit of one email per minute. If you need to send more than that, you can use the [SendGrid](https://docs.losant.com/workflows/outputs/sendgrid/) email node.

Enter your email address as a recipient. You can then specify any subject and body you’d like. All of these fields support templates, which means they could pull their values from the payload, but this doesn’t apply for our example. For now, simply type any text you'd like.

Click the “Deploy Workflow” button and press the hardware button. You should now receive an email with the subject and body you specified.

This completes the first workshop. You’ve successfully created an Internet button that can be used for any number of useful actions. For an extra challenge, try browsing the other output nodes and come up with other actions you can control with your Internet button, such as sending yourself a text message.

## Bonus Workshop - Virtual Light Wall

If you visit [http://lights.mod.bz](http://lights.mod.bz) you'll see a 3x3 grid of squares - that's the "Virtual Light Wall". In this workshop, we're going to make one of those squares light up with a random color and display a message of your choosing whenever you hit your internet button.

Start by adding an HTTP node to your workflow and connecting it to the Conditional node. You may also want to disconnect the Email node so you don't get emails every time you press the button during this workshop.

![HTTP Workflow Node](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/workflow-http-node.png "HTTP Workflow Node")

On the HTTP node configuration properties, change the `Request Method` to `POST` and set the `URL Template` to "http://lights.mod.bz".

Set the body template to the following:

```json
{ "name" : "your name here", "message" : "your message here" }
```

The name and message can be anything you want. Try to keep it family friendly because it will be displayed in front of everyone.

Lastly, add a request header by setting the `Name` to "content-type" and the `Value Template` to "application/json".

Click the `Deploy Workflow` button to deploy this workflow. Now whenever you press the internet button, this workflow is making a request to the Light Wall website that includes your name and message. The Light Wall then lights up a random square and displays the information. Everyone else who is also viewing the Virtual Light Wall will see your message in real-time.

This workshop shows a lot of the power behind workflows. We've completely changed the behavior of our internet button without having to write any code or update the firmware running on the device itself.

## Workshop 2 – Remote Control LED

In the previous workshop, we showed you how to make a physical button do something in the virtual world. In this example, we’re going show how a virtual button can do something in the physical world.

Losant supports two major communication mechanisms – [states](https://docs.losant.com/devices/state/) and [commands](https://docs.losant.com/devices/commands/). You already saw how state works in the previous example. Commands allow you to send actions to the device. In this workshop, we’re going to send a “toggle” command that will turn on and off an LED.

### Wiring

***Disconnect the NodeMCU from USB.***

Each workshop builds on the previous one, so if you completed the first workshop, it is not necessary to disconnect any components from your breadboard. We will simply add an LED and connect it to the NodeMCU.

![Workshop 2 Wiring Diagram](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/workshop-2-wiring-diagram.png "Workshop 2 Wiring Diagram")


1. Add the LED so the positive lead (the longer one) is in terminal c19 and the negative lead is in c20.
1. Connect the positive lead of the LED to D2 on the NodeMCU (terminal a13) with a jump wire.
1. Connect the negative lead of the LED from terminal c20 to the negative rail with a resistor.

![Workshop 2 Wiring Image](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/workshop-2-wiring-image.jpg "Workshop 2 Wiring Image")

### Flash the Firmware

Plug the NodeMCU back into USB.

Open the file `workshop-2-led.ino` with the Arduino IDE. Just like in the first workshop, you’ll have to edit the WiFi and credentials fields. You can use the same values from the previous workshop.

Just like before, make sure the Serial Monitor is open and upload the sketch to the NodeMCU. On some Windows machines, we've noticed you have to re-select the board and port whenever you open a new file. Make sure these are properly set under the `Tools -> Board menu and Tools -> Port` menu.

![Upload Workshop 2](/images/getting-started/losant-iot-dev-kits/builder-kit/upload-workshop-2.png "Upload Workshop 2")

The firmware we just flashed is listening for a specific “toggle” command. Let’s use Losant to easily send it this command.

### Create the Virtual Button

Create a new workflow and name it “Virtual Button.”

![Create Workflow Virtual Button](/images/getting-started/losant-iot-dev-kits/builder-kit/create-workflow-virtual-button.png "Create Workflow Virtual Button")

![Workflow Virtual Button Settings](/images/getting-started/losant-iot-dev-kits/builder-kit/workflow-virtual-button-settings.png "Create Workflow Virtual Button")

Once created, drag the Virtual Button workflow node to the canvas.

![Virtual Button Workflow Node](/images/getting-started/losant-iot-dev-kits/builder-kit/virtual-button-workflow-node.png "Virtual Button Workflow Node")

The Virtual Button node allows you to completely define the payload that will flow through the workflow. Since we won’t be using the payload, it can be kept as an empty object or left blank. The Virtual Button is often useful to debug complex workflows because you can trigger the workflow with any test data you’d like, but in our case, we're going to use it to send the toggle command to our device.

Next, drag a Device Command node onto the canvas and connect it to the Virtual Button.

![Device Command Workflow Node](/images/getting-started/losant-iot-dev-kits/builder-kit/device-command-workflow-node.png "Device Command Workflow Node")

The Device Command node requires the device and the command details. Since you likely only have one device, it should be automatically selected. If not, choose it from the dropdown. The command name that the kit supports is “toggle.” Command names can be anything, and what commands a device supports are entirely up to the firmware. In our example, the firmware we flashed is looking for a command named “toggle” and knows to flip the LED when it’s received. Commands also support optional payloads that could be arguments to the command. For example, if the command is “start recording,” the payload could be `{ "resolution" : 1080 }`. Our toggle command, however, doesn't need a payload, so leave it blank.

Click the “Deploy Workflow” button at the top-right of the screen.

![Deploy Virtual Button](/images/getting-started/losant-iot-dev-kits/builder-kit/deploy-virtual-button.png "Deploy Virtual Button")

Once deployed, you can now click the virtual button and see the LED on the board turn on and off.

![Virtual Button Click](/images/getting-started/losant-iot-dev-kits/builder-kit/virtual-button-click.png "Virtual Button Click")

The Serial Monitor will also print a message whenever a command is received.

![Command Serial Output](/images/getting-started/losant-iot-dev-kits/builder-kit/command-serial-output.png "Command Serial Output")

We’ve now seen the two primary ways devices can communicate with Losant – state and commands. If you link these together, a whole world of possibilities opens up. Imagine having two builder kits where the button on one invokes the toggle command on another via a workflow. This allows us to easily perform machine-to-machine (m2m) communication without the devices even knowing about each other.

## Workshop 3 – Temperature Sensor

In this workshop, we’re going to add a temperature sensor to your builder kit. We’ll then use Losant’s dashboarding tools to visualize the real-time and historical temperature data.

### Wiring

***Disconnect the NodeMCU from USB.***

Just like the previous workshop, keep everything you've already wired and add these new components.

![Workshop 3 Wiring Diagram](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/workshop-3-wiring-diagram.png "Workshop 3 Wiring Diagram")


1. Add the tmp36 temperature sensor to terminals e22, e23, and e24. It’s ***VERY IMPORTANT*** that the sensor is oriented the right way with the flat side facing the bottom of the board – towards column a.
1. Connect the rightmost lead (a24) of the temperature sensor to the negative rail using a jump wire.
1. Connect the leftmost lead (a22) of the temperature sensor to the positive rail using a jump wire.
1. Connect the center lead (a23) to the A0 pin on the NodeMCU (terminal j15) with a jump wire.

![Workshop 3 Wiring Image](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/workshop-3-wiring-image.jpg "Workshop 3 Wiring Image")

### Flash the Firmware

Plug the NodeMCU back into USB. Open the file workshop-3-temp.ino. Just as in the previous two workshops, edit the top of the file to set the WiFi and Losant credentials. You can use the same values as the previous two workshops.

![Deploy Workshop 3](/images/getting-started/losant-iot-dev-kits/builder-kit/deploy-workshop-3.png "Deploy Workshop 3")

After the upload completes, the Serial Monitor will print the temperature every 15 seconds.

![Temp Serial Output](/images/getting-started/losant-iot-dev-kits/builder-kit/temp-serial-output.png "Temp Serial Output")

This firmware is publishing state every 15 seconds to the Losant platform. The state includes the tempF and tempC attributes that we defined back when the device was added. This is also why we had to add the Conditional Workflow node to the Internet button (Workshop 1). Without the Conditional, you’d get an email every time the device published temperature, which is likely not what you want.

### Build a Dashboard

Now, let’s visualize some of this temperature data that we’re sending. Create a new dashboard in Losant and add a gauge block.

![Create Dashboard](/images/getting-started/losant-iot-dev-kits/builder-kit/create-dashboard.png "Create Dashboard")

![Create Dashboard Form](/images/getting-started/losant-iot-dev-kits/builder-kit/create-dashboard-form.png "Create Dashboard Form")

![Add Gauge](/images/getting-started/losant-iot-dev-kits/builder-kit/add-gauge.png "Add Gauge")

The gauge block allows you to display a single real-time value or a value that is an aggregate over time (like sum, mean, etc).

![Gauge Details](/images/getting-started/losant-iot-dev-kits/builder-kit/gauge-details.png "Gauge Details")

Set the gauge block header to any value you’d like. Select your builder kit application from the Application dropdown. Change the Block Type to `Dial Gauge` and set the minimum to 0 and the maximum to 100. We want to show the real-time temperature, so select `Last received data point` from the Duration dropdown. Lastly, enter units (Deg F) in the label field, select your device, and set the attribute to either "tempF" or "tempC," whichever you’re more familiar with.

As soon as you enter all values, you should see the preview on the right immediately update.

Once you click `Add Block`, the gauge will appear on your dashboard.

![Dashboard with Gauge](/images/getting-started/losant-iot-dev-kits/builder-kit/dashboard-with-gauge.png "Dashboard with Gauge")

Next, let’s add a graph to the dashboard that shows the temperature value over time. Click the `Add Block` link on the top-right and select the `Time Series Graph` block.

![Select Linear Graph](/images/getting-started/losant-iot-dev-kits/builder-kit/select-linear-graph.png "Select Linear Graph")

![Time Series Settings](/images/getting-started/losant-iot-dev-kits/builder-kit/time-series-settings.png "Time Series Settings")

Set the name of the block to any value you’d like. Select your builder kit application from the Application drop down. Next, select to view the last 15 minutes of data at a 10 second resolution. This will cause the graph to show 15 minutes of data with a data point every 10 seconds.

In the block data section, name the graph series Deg F or Deg C, select your device, select the tempF or tempC attribute, and set the aggregation to `MEAN`.

The aggregation is the operator applied to the data in order to provide a data point for every 10 seconds. Since we chose MEAN, all data points in a 10 second window will be averaged together for each data point on the graph.

Click the `Add Block` button and the graph will appear on your dashboard.

![Dashboard with Graph](/images/getting-started/losant-iot-dev-kits/builder-kit/dashboard-with-graph.png "Dashboard with Graph")

As an extra challenge, see if you can use a new workflow to send yourself an email whenever the temperature exceeds 80 degrees Fahrenheit. To test, you can lightly pinch the temperature sensor between your fingers to raise its value.

These workshops are just the beginning. You now have a kit that can be used for any number of interesting solutions.

<a href="https://twitter.com/share" class="twitter-share-button" data-url="https://www.losant.com/kit" data-text="I just completed all three @LosantHQ #IoT Builder Kit workshops!" data-size="large">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

Don't stop now! Losant has several kits available.

1. Losant Builder Kit ( [Buy Now](https://store.losant.com/products/losant-builder-kit) | [Instructions](/getting-started/losant-iot-dev-kits/builder-kit/) )
1. Moisture Sensor Kit ( [Buy Now](https://store.losant.com/products/losant-moisture-sensor-kit) | [Instructions](/getting-started/losant-iot-dev-kits/moisture-sensor-kit/) )
1. Door Sensor Kit ( [Buy Now](https://store.losant.com/products/losant-door-sensor-kit) | [Instructions](/getting-started/losant-iot-dev-kits/door-sensor-kit/) )
1. LCD Kit ( [Buy Now](https://store.losant.com/products/lcd-kit) | [Instructions](/getting-started/losant-iot-dev-kits/lcd-kit/) )
