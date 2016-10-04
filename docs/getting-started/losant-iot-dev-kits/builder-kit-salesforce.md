# Losant Salesforce Builder Kit Instructions

The Losant Salesforce Builder Kit</a> is an easy way to get up and running with the Losant IoT developer platform and <a href="https://www.salesforce.com/products/service-cloud/overview/" target="_blank">Salesforce Service Cloud</a>. This kit provides all the hardware and software needed to build a few simple projects that cover a wide variety of the features within the Losant platform.

![Builder Kit](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/kit-complete.jpg "Builder Kit")

## Overview

In a factory, there are tons of hardware that work together to make a product. Unfortunately, things break, and unexpected problems occur. Ideally, there would be a system in place that will automatically detect a failure and open up a maintenance/support ticket to resolve a problem. Salesforce Service Cloud is a smart, fast support platform with a powerful API. Losant can collect hardware data and trigger actions based on definable rules. In this workshop, we are going to use Salesforce Service Cloud and Losant together to solve this problem.

The device we're building in this workshop contains a button and a LED. When the button is pressed, a <a href="https://help.salesforce.com/apex/HTViewHelpDoc?id=cases_home.htm&language=en_US" target="_blank">Salesforce Case</a> will be created. The LED will be controlled by the number of open cases. If there are any open cases, the LED will be lit. If there are no open cases, the LED will be off. This device provides a quick way to create new cases and an easy way to visualize whether or not there are open cases that need to be addressed.

## 1. Build the Device

For this workshop, you’ll need to attach the NodeMCU, button, and LED to the breadboard. Below is the wiring diagram. For more information on what breadboards are and how they work, check out our blog post on <a href="https://www.losant.com/blog/how-to-use-a-breadboard" target="\_blank">How to Use a Breadboard</a>.

Your kit should include the following items:

  * 1 <a href="https://github.com/nodemcu/nodemcu-devkit-v1.0" target="_blank">NodeMCU v1.0</a> dev kit microcontroller
  * 1 solderless breadboard
  * 8 jump wires
  * 2 resistors
  * 1 LED
  * 1 TMP36 temperature sensor
  * 1 button
  * 1 micro-USB cable

### Wiring

***If connected, disconnect the NodeMCU dev kit from USB.***

![Salesforce Workshop Wiring Diagram](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/workshop-2-wiring-diagram.png "Salesforce Workshop Wiring Diagram")

1. Push the NodeMCU into terminals 1-15 on either side of the center line, which are rows “b” and “i.” The USB port should be facing away from the breadboard.
1. Connect the 3V3 pin from the NodeMCU (a1) to the positive rail with a jump wire.
1. Connect the GND pin from the NodeMCU (a2) to the negative rail with a jump wire.
1. Connect the button to the other end of the breadboard so its leads straddle the center line and connect it to terminals e28, e30, f28, and f30.
1. Connect the positive rail to the button (a28) with a jump wire.
1. Connect the negative rail to the button (c30) using a resistor. It doesn’t matter which way resistors are oriented.
1. Connect the pin labeled "D1" on the NodeMCU (a14) to the button (j30) with a jump wire.
1. Add the LED so the positive lead (the longer one) is in terminal e19 and the negative lead is in e20.
1. Connect the positive lead of the LED (c19) to D2 on the NodeMCU (a13) with a jump wire.
1. Connect the negative lead of the LED (c20) to the negative rail with a resistor.

Your device should look very similar to this:

![Salesforce Workshop Wiring Image](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/workshop-2-wiring-image.jpg "Salesforce Workshop Wiring Image")


## 2. Salesforce Setup

If you haven't already, sign up for a <a href="https://developer.salesforce.com" target="_blank">Salesforce developer account</a>.

The screenshots in this workshop are using Salesforce's new Lightning Experience. You can enable the Lightning Experience by first clicking the Lightning Experience menu item on the left.

![Lightning Menu](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/lightning-menu.jpg "Lightning Menu")

Next, scroll to the bottom and enable Lightning Experience.

![Enable Lightning](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/enable-lightning.jpg "Enable Lightning")

The last step is to click your name in the top-right corner and select "Switch to Lightning Experience".

![Switch to Lightning](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/switch-to-lightning.jpg "Switch to Lightning")

## 3. How to get Salesforce Security Token

In order to integrate with Salesforce, we're going to need a security token. You can get this through your account settings. First, click your account icon in the top-right corner and select "Settings".

![Account Settings](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/account-settings.jpg "Account Settings")

Next, in the Quick Search field on the left, type "Reset" to find the option to reset your token.

![Find Reset Token](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/find-reset-token.jpg "Find Reset Token")

Lastly, click the "Reset Security Token" button.

![Reset Token](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/reset-token.jpg "Reset Token")

Once complete, Salesforce will send you the security token via email. This token will be used in later steps to invoke the Salesforce API to create cases when the button is pressed.

Salesforce is now successfully setup and ready to use.

## 4. Create Losant Account

If you don't already have an account, navigate to [https://accounts.losant.com/create-account](https://accounts.losant.com/create-account) to register.

## 5. Create Application

Create an <a href="https://docs.losant.com/applications/overview/" target="_blank">application</a> for the builder kit. You can name it whatever you want. In the example below, we used "Builder Kit".

![Create Application](/images/getting-started/losant-iot-dev-kits/builder-kit/create-application.png "Create Application")

![Application Settings](/images/getting-started/losant-iot-dev-kits/builder-kit/application-settings.png "Application Settings")

## 6. Add Device

The next step is to register the builder kit <a href="https://docs.losant.com/devices/overview" target="_blank">device</a> with the platform. Click the `Add Device` button on the top right or select `Add Device` from the Devices dropdown.

![Add Device Menu](/images/getting-started/losant-iot-dev-kits/builder-kit/add-device-menu.png "Add Device Menu")

Next, choose the `Create Blank Device` option.

![Create From Scratch](/images/getting-started/losant-iot-dev-kits/moisture-sensor/add-from-scratch.png "Create From Scratch")

![Add Device Name](/images/getting-started/losant-iot-dev-kits/builder-kit/add-device-name.png "Add Device Name")

![Add Device Attributes](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/add-device-attributes.png "Add Device Attributes")

1. Name the device anything you want.
1. "Description" can be left blank, or fill it with whatever you want.
1. For "Device Type", leave "Standalone" selected.
1. No device tags are required.
1. Add one device attribute with the name "button" and the data type "Boolean".

The <a href="https://docs.losant.com/devices/overview/#device-attributes" target="_blank">device attributes</a> specify what state information the device reports. The firmware that you’ll flash in the following sections will report whenever a button is pressed. Device attributes are ***case-sensitive***, so make sure to enter these ***exactly as they appear***.

Click the `Create Device` button. The screen will change and show the device’s ID. This ID is required for the following sections. You might want to copy/paste it somewhere convenient.

![Device ID](/images/getting-started/losant-iot-dev-kits/builder-kit/device-id.png "Device ID")

## 8. Generate Security Tokens

Now we need to generate some <a href="https://docs.losant.com/applications/access-keys/" target="_blank">security tokens</a> so your device can authenticate against the Losant platform. Select `Access Keys` from the application menu.

![Access Keys](/images/getting-started/losant-iot-dev-kits/builder-kit/access-keys.png "Access Keys")

For these workshops, generate an access key that provides access to all devices in your application.

![Token Restrictions](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/token-restrictions.png "Token Restrictions")

This will cause a popup to appear with your access tokens. Losant ***DOES NOT*** store the secret, so you’ll have to copy it somewhere secure. Both of these values will be needed in the following sections, so make sure you copy/paste them somewhere convenient.

![Access Token Popup](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/access-token-popup.png "Access Token Popup")

## 9. Get Workshop Source Code

Now let's get the firmware you'll be flashing to the device.

**If you are doing this workshop at the <a href="https://www.salesforce.com/dreamforce/DF16/">Dreamforce Conference</a>, the workshop code is located on your desktop. You can skip to [step 10](#10-flash-the-firmware).**

Download and extract the following zip file to your computer. We'll be editing and opening these files using the Arduino IDE, so put it somewhere convenient.

[https://github.com/Losant/losant-kit-builder-salesforce/archive/master.zip](https://github.com/Losant/losant-kit-builder-salesforce/archive/master.zip)

If you're familiar with git, you can also clone the repository from here:

[https://github.com/Losant/losant-kit-builder-salesforce](https://github.com/Losant/losant-kit-builder-salesforce)

## 10. Flash the Firmware

**If you are doing this workshop at home, you will need to make sure your <a href="/getting-started/losant-iot-dev-kits/environment-setup#configure-device-usb-port" target="_blank">environment is set up correctly</a>. If you're at the Dreamforce workshop, your workstation is already properly setup. **

Let's open the Arduino IDE by clicking the shortcut on the Desktop.

![Open Arduino IDE](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/open-arduino.gif "Open Arduino IDE")

Plug the NodeMCU back into USB. Make sure the device shows up under the Arduino IDE's `Tools -> Port` menu and it's selected. Refer to the <a href="/getting-started/losant-iot-dev-kits/environment-setup#configure-device-usb-port" target="_blank">environment setup</a> for instructions on properly configuring the device port.

With the Arduino IDE, use the `File -> Open` menu to navigate to the builder kit source code and open the file `workshop/workshop.ino`. Edit the following variables at the top of the file.

1. WIFI_SSID: The name of your WiFi network.
1. WIFI_PASS: Your WiFi password.
1. LOSANT_DEVICE_ID: After creating your device, the device ID is printed on the page in a gray box. You can also find it next to the name of your device on your application's "View All Devices" page.
1. LOSANT_ACCESS_KEY: Set this to the access key you generated after creating the Losant application.
1. LOSANT_ACCESS_SECRET: Set this to the access secret you generated after creating the Losant application.

![Update Variables](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/update-variables.png "Update Variables")

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

![Serial Output](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/serial-output.png "Serial Output")

If you don’t see the “Button Pressed!” message, check your wiring. The jump wires are not always the best connectors and sometimes just need to be wiggled around a little.

Every time the button is pressed, the firmware is publishing the state `{ "button": true }` to Losant. Currently, this firmware only reports when the button goes to true; it does not report the button going back to false. So if you hold the button down for a long time, it will only report when the button is initially pressed.

It’s now time to go into Losant and make use of this data.

## 11. Create Workflow

[Workflows](https://docs.losant.com/workflows/overview/) in Losant allow you to easily perform actions based on various triggers. In this workshop, our trigger will be a device state. Whenever the button is pressed, the device publishes a state message to Losant that we can use to trigger an action – for example, opening a ticket in Salesforce Service Cloud.

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

The next step is to create a Salesforce Case whenever the button is pressed. Add a <a href="/workflows/data/salesforce-cases/" target="_blank">Salesforce Cases node</a> to the workflow and connect it to the Device node.

![Salesforce Workflow Node](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/salesforce-workflow-node.png "Salesforce Workflow Node")

You may notice that all the fields have "template" in their labels. Many workflow nodes, including the Salesforce Cases node, support what Losant calls a <a href="/workflows/overview/#template-fields-and-payload-paths" target="_blank">template field</a>. Template fields allow you to reference variables in the payload by surrounding them in double curly braces. For example `My devices name is {{ deviceName }}` would pull the `deviceName` variable from the payload and put it in that string. This step doesn't require the use of templates, but they are important to understand because nearly all complex solutions make use of them. For example, if your device was reporting the temperature of a piece of manufacturing equipment, you could use a template to put the actual temperature value in the subject or description of a newly created Salesforce case.

To configure this node, provide your Salesforce username, password, and security token in the first three fields. These are required so the Losant platform can properly authenticate to the Salesforce API in order to perform actions.

Next, set the `Salesforce Case Action` to `Create`. Enter "New" as the status, "Web" as the origin, and enter any subject you'd like.

You can now deploy the workflow again and anytime the button is pressed, a Salesforce case will be created. You can see created cases by returning to the Salesforce portal and clicking the "Cases" icon on the bottom-left. It can sometimes take a few second for newly created cases to show up in the portal.

![Cases Menu Item](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/cases-menu-item.png "Cases Menu Item")

On new accounts, Salesforce pre-populates your cases with some examples. This would be a good time to delete those using the small triangle on the right of each case.

If you'd like an additional challenge before moving to the next step, see what else you can do when the button is pressed. For example, send yourself an email and SMS message.

## 12. Open Cases Indicator

The builder kit you've assembled includes an LED light. In this step, we're going to extend our workflow to control that light based on whether or not there are open cases.

We're going to accomplish this by periodically requesting the count of open cases from Salesforce and then sending a command to the kit device to either turn on or off the LED based on that count. The first step is to drag a <a href="/workflows/triggers/timer/" target="_blank">Timer node</a> onto your workflow canvas and set its interval to 10 seconds.

![Timer Node](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/timer-node.png "Timer Node")

Next, drag another Salesforce Cases node onto the canvas and connect it to the Timer.

![Salesforce Count Node](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/salesforce-count-node.png "Salesforce Count Node")

Just like before, provide your username, password, and security token in the first three fields. This time set the `Case Action` to `Count`, set the `Status` to "New" and `Case Origin` to "Web". Lastly we need to put the result somewhere on the payload. Set the `Payload Path to Store Result` field to "data.result".

Next, add a debug node and attach it to the Salesforce node and deploy this workflow. This will allow us to see what the response looks like that comes back from the Salesforce API.

![Salesforce Count Result](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/count-result.png "Salesforce Count Result")

As you can see, the result is now available on the payload at `data.result.count`. Next add a <a href="/workflows/logic/conditional/" target="_blank">Conditional node</a> and connect it to the Salesforce node so we can make a decision based on this value.

![Conditional Node](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/conditional-node.png "Conditional Node")

Set the `Expression` field to:

```text
{{ data.result.count }} > 0
```

For this field, we've used a template, which allows us to pull a value from the current payload. Every time this condition node runs, it will pull whatever was returned by Salesforce and check whether or not it is greater than zero. If the condition is true, it will take the right (green) path. If the condition is false, it will take the left (red) path.

The firmware we flashed to the device earlier understands two <a href="/devices/commands/" target="_blank">Device Commands</a>: "ledOn" and "ledOff". If the condition is true, we want to send the device the "ledOn" command. If the condition is false, we want to send the device the "ledOff" command.

Start by dragging a Device Command node onto the canvas and attaching it to the right (green) connector on the conditional node.

![LED On Command](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/ledOn-command.png "LED On Command")

Make sure your builder kit device is selected and set the command name to "ledOn". Commands also support optional payloads so you can send additional information to the device. For this workshop, all we need is the name, so leave the payload field blank.

Now add a second Device Command node and attach it to the left (red) connector on the conditional node. Again, make sure your device is selected and this time send the "ledOff" command.

![LED Off Command](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/ledOff-command.png "LED Off Command")

You can now deploy this workflow. After the 10-second timer elapses, if you still have a case open, you should see the LED turn on. You can then go into Salesforce, delete every case, and see the LED turn off. If you press the button, which creates a case, the LED will turn back on.

You've now successfully completed the Losant & Salesforce Builder Kit Workshop! As an additional challenge, try building a <a href="/dashboards/overview/" target="_blank">dashboard</a> that shows the number of times you've pressed the button.

If you'd like to keep experimenting, checkout the full <a href="/getting-started/losant-iot-dev-kits/builder-kit/" target="_blank">builder kit instructions</a>, which contains several other uses for your kit hardware.

<a href="https://twitter.com/share" class="twitter-share-button" data-url="https://www.losant.com/kit" data-text="I just completed the @LosantHQ #IoT Salesforce Builder Kit Workshop at @Dreamforce 2016!" data-size="large">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
