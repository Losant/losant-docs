# Losant Salesforce Builder Kit Instructions

The Losant Salesforce Builder Kit</a> is an easy way to get up and running with the Losant IoT developer platform and <a href="https://www.salesforce.com/products/service-cloud/overview/" target="_blank">Salesforce Service Cloud</a>. This kit provides all the hardware and software needed to build a few simple projects that cover a wide variety of the features within the Losant platform.

![Builder Kit](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/kit-complete.jpg "Builder Kit")

## Overview

In a factory, there are tons of hardware that work together to make a product. Unfortunately, things break and unexpected problems occur. Ideally, there would be a system in place that will automatically detect a failure and open up a maintenance/support ticket to resolve a problem. Salesforce Service Cloud is a smart, fast support platform with a powerful API. Losant can collect hardware data and trigger actions based on definable rules. In this workshop, we are going to use Salesforce Service Cloud and Losant together to solve this problem.

The device we're building in this workshop contains a button and an LED. When the button is pressed, a <a href="https://help.salesforce.com/apex/HTViewHelpDoc?id=cases_home.htm&language=en_US" target="_blank">Salesforce Case</a> will be created. The LED will be controlled by the number of open cases. If there are any open cases, the LED will be lit. If there are no open cases, the LED will be off. This device provides a quick way to create new cases and an easy way to visualize whether or not there are open cases that need to be addressed.

As you perform this workshop, if you run into any issues, please refer to the [Losant Documentation](https://docs.losant.com) and the [Losant Forums](https://forums.losant.com) for help.

## 1. Build the Device

For this workshop, you’ll need to attach the NodeMCU, button, and LED to the breadboard. Below is the wiring diagram. For more information on what breadboards are and how they work, check out our blog post on <a href="https://www.losant.com/blog/how-to-use-a-breadboard" target="\_blank">How to Use a Breadboard</a>.

Your kit should include the following items:

  * 1 [NodeMCU v1.0](http://nodemcu.com/index_en.html) dev kit microcontroller <a href="https://github.com/nodemcu/nodemcu-devkit-v1.0" target="\_blank">(View board schematic)</a>
  * 1 solderless breadboard
  * 8 jump wires
  * 2 resistors
  * 1 LED
  * 1 TMP36 temperature sensor
  * 1 button
  * 1 micro-USB cable

### Wiring

***Disconnect the NodeMCU dev kit from USB.***

![Salesforce Workshop Wiring Diagram](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/workshop-2-wiring-diagram.png "Salesforce Workshop Wiring Diagram")

1. Push the NodeMCU into terminals 1-15 on either side of the center line, which are rows “b” and “i.” The USB port should be facing away from the breadboard.
1. Connect the 3V3 pin from the NodeMCU (a1) to the positive rail with a jump wire.
1. Connect the GND pin from the NodeMCU (a2) to the negative rail with a jump wire.
1. Connect the button to the other end of the breadboard so its leads straddle the center line and connect it to terminals e28, e30, f28, and f30.
1. Connect the positive rail to the button using terminal a28 using a jump wire.
1. Connect the negative rail to the button using terminal c30 using a resistor. It doesn’t matter which way resistors are oriented.
1. Connect the pin labeled "D1" on the NodeMCU (a14) to the button (j30) with a jump wire. In our code, "D1" is the equivalent of GPIO pin 5.
1. Add the LED so the positive lead (the longer one) is in terminal c19 and the negative lead is in c20.
1. Connect the positive lead of the LED to D2 on the NodeMCU (terminal a13) with a jump wire.
1. Connect the negative lead of the LED from terminal c20 to the negative rail with a resistor.


Your device should look very similar to this:

![Salesforce Workshop Wiring Image](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/workshop-2-wiring-image.jpg "Salesforce Workshop Wiring Image")


## 2. Salesforce Setup

If you haven't already, sign up for a <a href="https://developer.salesforce.com" target="_blank">Salesforce developer account</a>.

The screenshots in this workshop are using Salesforce's new Lightning Experience. You can enabled the Lightning Experience by first clicking the Lightning Experience menu item on the left.

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
1. Add the following under "Device Attributes":
    1. button: boolean

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

Plug the NodeMCU back into USB. Make sure the device shows up under the Arduino IDE's `Tools -> Port` menu and it's selected. Refer to the <a href="/getting-started/losant-iot-dev-kits/environment-setup#configure-device-usb-port" target="_blank">environment setup</a> for instructions on properly configuring the device port.

With the Arduino IDE, use the `File -> Open` menu to navigate to where you downloaded and extracted the builder kit source code and open the file `workshop/workshop.ino`. Edit the following variables at the top of the file.

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

If you don’t see the “Button Pressed!” message, check your wiring. The jump wires are not always the best connectors and sometimes just need wiggled around a little.

Every time the button is pressed, the firmware is publishing the state `{ "button": true }` to Losant. Currently, this firmware only reports when the button goes to true, it does not report the button going back to false. So if you hold the button down for a long time, it will only report when the button is initially pressed.

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

Since the Device node can be triggered on any state request and we only want this workflow to run when the button attribute is sent, let’s add a [Conditional node](https://docs.losant.com/workflows/logic/conditional/) to check that the value of button is true. This will be important for the later workshops when the device starts sending other state information. We don’t want an email every time the device sends something.

![Conditional Workflow Node](/images/getting-started/losant-iot-dev-kits/builder-kit/conditional-workflow-node.png "Conditional Workflow Node")

You can delete the existing Debug node or click on the connecting line and delete it. Either way, insert a Conditional node between the Device node and the Debug node.

Many workflow nodes, including the Conditional node, support what Losant calls a [template field](https://docs.losant.com/workflows/overview/#template-fields-and-payload-paths). Template fields allow you to write full expressions or blocks of text while referencing values in the payload. Set the conditional expression to the following:

```text
{{ data.button }} == true
```

This expression pulls the value of data.button from the payload, which you saw earlier using the debug node. If data.button doesn’t exist, this will evaluate to false.

The Conditional node branches the workflow depending on whether the expression is true or false. If the value is true, the workflow takes the right branch. If the expression is false, the workflow takes the left branch. Since we have nothing attached to the false branch, the workflow simply ends and nothing happens.

The last step is to add the Email node to send yourself an email every time the button is pressed.

![Email Workflow Node](/images/getting-started/losant-iot-dev-kits/builder-kit/email-workflow-node.png "Email Workflow Node")

Losant has two email output nodes. The [Email](https://docs.losant.com/workflows/outputs/email/) node sends emails using Losant’s servers, but has a limit of one email per minute. If you need to send more than that, you can use the [Sendgrid](https://docs.losant.com/workflows/outputs/sendgrid/) email node.

Enter your email address as a recipient. You can then specify any subject and body you’d like. All of these fields support templates, which means they could pull their values from the payload, but this doesn’t apply for our example. For now, simply type any text you'd like.

Click the “Deploy Workflow” button and press the hardware button. You should now receive an email with the subject and body you specified.

This completes the first workshop. You’ve successfully created an Internet button that can be used for any number of useful actions. For an extra challenge, try browsing the other output nodes and come up with other actions you can control with your Internet button, such as sending yourself a text message.
