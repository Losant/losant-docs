# Door Sensor Kit Instructions

The <a href="https://store.losant.com/collections/losant-kits/products/losant-door-sensor-kit" target="_blank">Losant Door Sensor Kit</a> includes everything required to be notified when a door is opened or left open for a certain amount of time. These instructions provide a step-by-step overview to build and configure your door sensor to alert you via SMS or email when your door or window is opened.

![Door Sensor](/images/getting-started/losant-iot-dev-kits/door-sensor/door-sensor.jpg "Door Sensor")

As you follow these instructions, if you run into any issues, please refer to the [Losant Documentation](/) and the [Losant Forums](https://forums.losant.com) for help.

Your kit should include the following items:

* 1 NodeMCU development board
* 1 door sensor
* 3 jump wires
* 1 resistor
* 1 screw terminal block
* 1 solderless breadboard
* 1 USB cable

## 1. Environment Setup

In order to properly program the kit's microcontroller, please follow the [environment setup instructions](/getting-started/losant-iot-dev-kits/environment-setup/). These steps only need to be completed once, so if you've already done this for a previous kit, you can skip this step.

## 2. Losant Setup

In this section, you’ll register for a Losant account, create your application, and add the device for your door sensor kit.

### Create Account

If you don't already have an account, navigate to [https://accounts.losant.com/create-account](https://accounts.losant.com/create-account) to register.

### Create Application

Create an application for the door sensor kit. You can name it whatever you want.

![Create Application](/images/getting-started/losant-iot-dev-kits/builder-kit/create-application.png "Create Application")

![Application Settings](/images/getting-started/losant-iot-dev-kits/door-sensor/application-name.png "Application Settings")

### Add Device

The next step is to register the door sensor kit device with the platform. Click the `Add Device` button on the top right or select `Add Device` from the Devices dropdown.

![Add Device Menu](/images/getting-started/losant-iot-dev-kits/door-sensor/add-device-menu.png "Add Device Menu")

Next, choose the `Create Blank Device` option.

![Create From Scratch](/images/getting-started/losant-iot-dev-kits/door-sensor/add-from-scratch.png "Create From Scratch")

![Device Settings](/images/getting-started/losant-iot-dev-kits/door-sensor/device-settings.png "Device Settings")

1. Name the device anything you want.
1. "Description" can be left blank, or fill it with whatever you want.
1. For "Device Type", leave "Standalone" selected.
1. Add a device attribute with the type `Number` and the name `open`.

The device attributes specify what state information the device reports. The firmware that you’ll flash in the following sections will report `{ "open" : 1 }` when the door opens and `{ "open" : 0 }` when the door closes. Device attributes are ***case-sensitive***, so make sure to enter these ***exactly as they appear***.

Click the `Create Device` button. The screen will change and show the device’s ID. This ID is required for the following sections. You might want to copy/paste it somewhere convenient.

![Device ID](/images/getting-started/losant-iot-dev-kits/door-sensor/device-id.png "Device ID")

### Generate An Access Key

Now we need to generate an [access key](/applications/access-keys/) so your device can authenticate against the Losant platform. Select `Security` from the application menu bar, and then `Device Access Keys` from the left navigation. Then click `Add Access Key`.

![Access Keys](/images/getting-started/losant-iot-dev-kits/builder-kit/access-keys.png "Access Keys")

Generate an access key that provides access to all devices in your application.

![Token Restrictions](/images/getting-started/losant-iot-dev-kits/builder-kit/token-restrictions.png "Token Restrictions")

This will cause a popup to appear with your access tokens. Losant ***DOES NOT*** store the secret, so you’ll have to copy it somewhere secure. Both of these values will be needed in the following sections, so make sure you copy/paste them somewhere convenient.

![Access Token Popup](/images/getting-started/losant-iot-dev-kits/builder-kit/access-token-popup.png "Access Token Popup")

## 3. Get Door Sensor Firmware

Now let's get the firmware you'll be flashing to the device. Download and extract the following zip file to your computer. We'll be editing and opening these files using the Arduino IDE, so put it somewhere convenient.

[https://github.com/Losant/losant-kit-door-sensor/archive/master.zip](https://github.com/Losant/losant-kit-door-sensor/archive/master.zip)

If you're familiar with git, you can also clone the repository from here:

[https://github.com/Losant/losant-kit-door-sensor](https://github.com/Losant/losant-kit-door-sensor)

## 4. Wiring

***Disconnect the microcontroller from USB before wiring.***

In this step we're going to to connect the door sensor to the microcontroller. Below is the wiring diagram.

![Wiring Diagram](/images/getting-started/losant-iot-dev-kits/door-sensor/wiring-diagram.png "Wiring Diagram")

1. Push the microcontroller into terminals 1-15 on either side of the center line, which are rows `b` and `i`. The USB port should be facing away from the breadboard.
1. Connect the GND pin on the microcontroller `a2` to the negative rail with a jump wire. The color of the jump wire doesn't matter.
1. Using a small screwdriver, attach the two leads of the door sensor to the screw terminal block. Which lead attaches to which terminal doesn't matter.
1. Insert the screw terminal block into the breadboard using terminals `e26` and `e28`.
1. Connect terminal `a26` to the negative rail using the resistor.
1. Connect pin D1 on the microcontroller `a14` to terminal `b26`.
1. Connect the 3V3 pin on the microcontroller `a10` to terminal `b28`.

![Wiring Image](/images/getting-started/losant-iot-dev-kits/door-sensor/wiring-image.jpg "Wiring Image")

## 5. Flash the Firmware

Connect the microcontroller to your computer with the supplied USB cable. Make sure the device shows up under the Arduino IDE's `Tools -> Port` menu and it's selected. If the device does not show up, please review the [Environment Setup](/getting-started/losant-iot-dev-kits/door-sensor-kit/#environment-setup) guide.

With the Arduino IDE, use the `File -> Open` menu to navigate to where you downloaded and extracted the kit source code and open the file `losant-kit-door-sensor/losant-kit-door-sensor.ino`. Edit the following variables at the top of the file.

1. WIFI_SSID = the name of your WiFi network
1. WIFI_PASS = your WiFi password
1. LOSANT_DEVICE_ID = set this to the ID you received after adding the device to the Losant application
1. LOSANT_ACCESS_KEY = set this to the access key you generated after creating the Losant application
1. LOSANT_ACCESS_SECRET = set this to the access secret you generated after creating the Losant application

![Update Variables](/images/getting-started/losant-iot-dev-kits/door-sensor/update-variables.png "Update Variables")

Your code will automatically be saved as part of the upload process when it's flashed to the device. After editing the code, open the Arduino IDE's Serial Monitor and change the baud rate to 115200. The serial monitor can be opened using the button on the top right of the Arduino IDE or using the `Tools -> Serial Monitor` menu.

![Open Serial Monitor](/images/getting-started/losant-iot-dev-kits/door-sensor/serial-monitor-button.png "Open Serial Monitor")

![Serial Monitor Baud](/images/getting-started/losant-iot-dev-kits/builder-kit/serial-monitor-baud.png "Serial Monitor Baud")

The serial monitor won't print any information until we flash the device with the source code in the next step.

Upload the firmware to the device by clicking the `Upload` button or the `Sketch -> Upload` menu. This will take a few seconds and the microcontroller will rapidly blink a blue light while it’s uploading.

![Upload Button](/images/getting-started/losant-iot-dev-kits/door-sensor/upload-button.png "Upload Button")

After the upload is complete, the Serial Monitor should start printing information about it connecting to WiFi and Losant. It may also print some garbage, but that's just part of the board booting up. It will then print a "Door opened" and "Door closed" message whenever the door sensor parts get close together or far apart. Go ahead and give it a try. Make sure the two parts of the sensor are oriented the same way (the screw holes are facing the same direction) and then touch them together and move them apart. You should see corresponding messages on the Serial Monitor output.

![Open Close Video](/images/getting-started/losant-iot-dev-kits/door-sensor/open-close-video.gif "Open Close Video")

![Serial Output](/images/getting-started/losant-iot-dev-kits/door-sensor/serial-output.png "Serial Output")

Every time the door sensor parts come together, this firmware publishes `{ "open": 0 }` to Losant. Every time the sensor parts move away, this firmware publishes `{ "open" : 1 }`.

It’s now time to go into Losant and make use of this data.

## 6. Setup Alerts

Now that real door sensor data is flowing into Losant, we can set up our alerts to be notified by SMS and email whenever a door opens or is left open for a certain amount of time. For this, we're going to use [Losant Workflows](/workflows/overview/).

First, create a new workflow and name it whatever you want.

![Create Workflow](/images/getting-started/losant-iot-dev-kits/door-sensor/create-workflow.png "Create Workflow")

![Workflow Settings](/images/getting-started/losant-iot-dev-kits/door-sensor/workflow-settings.png "Workflow Settings")

As a way to get up and running as fast as possible, we've provided you a workflow you can import. In the firmware zip file you downloaded earlier, there is a file named `door-alert.flow`. Import this file into your workflow using the import tools on the workflow properties panel.

![Import Workflow](/images/getting-started/losant-iot-dev-kits/moisture-sensor/import-workflow.png "Import Workflow")

Once imported, your workflow should look like the following.

![Imported Workflow](/images/getting-started/losant-iot-dev-kits/door-sensor/imported-workflow.png "Imported Workflow")

Don't worry, this workflow will be completely explained later, but for now we need to properly configure it.

You'll notice that there is one node that has a small error icon. This has an error because it needs a device to be configured. Click on the node and select your door sensor device from the dropdown.

![Nodes with Errors](/images/getting-started/losant-iot-dev-kits/door-sensor/nodes-with-errors.png "Nodes with Errors")

![Node Device Option](/images/getting-started/losant-iot-dev-kits/door-sensor/node-device-option.png "Node Device Option")

The last thing you'll have to do is set up this workflow's global configuration. The global configuration holds the amount of time the door must be left open to alert, your phone number, and your email address. Click on the `Globals` tab on the bottom right.

![Globals Tab](/images/getting-started/losant-iot-dev-kits/door-sensor/globals-tab.png "Globals Tab")

The `leftOpenTime` is the number of milliseconds the door must be left open before you are notified. For now, fill in 60000 (one minute) for testing. You can come back and change this at any time.

Fill in the `smsNumber` and `email` fields with your phone number and email address respectively. These are the alerts that Losant will use.

With all fields entered you can now deploy this workflow and begin seeing data from your door sensor.

![Deploy Workflow](/images/getting-started/losant-iot-dev-kits/door-sensor/deploy-workflow.png "Deploy Workflow")

After deploying, you can now inspect the payload in real-time as the sensor reports state by using the Debug tab.

![Debug Tab](/images/getting-started/losant-iot-dev-kits/door-sensor/debug-tab.png "Debug Tab")

As you can see in the above example, the sensor reported `{ "open" : 1 }` which indicates the door is opened. If the door doesn't close in 60 seconds, this workflow will also alert using SMS and email.

You may have also noticed there's no line connecting a set of SMS and email nodes.

![No Connector](/images/getting-started/losant-iot-dev-kits/door-sensor/no-connector.png "No Connector")

If you decide to connect those lines, you will receive an alert every time the door is opened. This is left off by default, because it likely generates an annoying amount of alerts. I leave it as a challenge to you to figure out how to limit those alerts to specific hours, like overnight.

This workflow is just a starting point. Losant can connect this device to many different outputs and other 3rd-party services. You can modify this workflow to configure any rules required for your specific door or window monitoring solution. Feel free to explore!

### Workflow Walkthrough

This section explains each part of the workflow so you can get an understanding of what's going on and how alerts are triggered. For a deeper dive into how workflows work, please read the [Workflow Overview](/workflows/overview/).

This workflow is split into two sections. The left section contains the Device Trigger, which will execute whenever the door sensor reports state (opened or closed). The Conditional node checks to see whether the value of `open` is `1`. If it is, the Store Value simply records the current time with the key `startTime`. This value is later checked to see if 60 seconds has elapsed (the value in the the Global configuration). If the door is closed, the other Store Value node simply clears the value so the alert won't happen.

The section on the right is triggered by a Timer every 5 seconds. The purpose of this section is to simply check to see if 60 seconds has elapsed. The Get Value node grabs the `startTime` recorded previously and then the Condition node checks to see if 60 seconds has elapsed since the start time. If it has, the SMS and email alerts are sent out and the `startTime` is cleared.

## 7. Build a Dashboard

In this step, we're going to build a dashboard to visualize the real-time and historical door activity. First, create a new dashboard from the `Dashboards` menu.

![Create Dashboard Menu](/images/getting-started/losant-iot-dev-kits/door-sensor/create-dashboard-menu.png "Create Dashboard Menu")

You can name the dashboard anything you'd like. If you'd like to [let other people](/dashboards/overview/#dashboard-access-control) see your dashboard, you can optionally modify the access control level after creating the dashboard.

![Dashboard Settings](/images/getting-started/losant-iot-dev-kits/door-sensor/dashboard-settings.png "Dashboard Settings")

Next, add a gauge block. This block will display the total number of times the door has been opened over the last 24 hours.

![Add Gauge](/images/getting-started/losant-iot-dev-kits/door-sensor/add-gauge.png "Add Gauge")

![Gauge Settings](/images/getting-started/losant-iot-dev-kits/door-sensor/gauge-settings.png "Gauge Settings")

Name the block anything you want. Make sure your application is selected. Set the `Duration` to `24 hours`. Make sure your device is selected, set the label to whatever you want, make sure the `open` attribute is selected, and change the `Aggregation` to `SUM`. As soon as all the fields are filled out, you should see a real-time preview on the top-right of the screen. Since our device reports the number 1 whenever the door is opened, we can simply sum up all of those 1's to see how many times the door was opened.

Click `Add Block` to add the gauge to your dashboard.

![Dashboard with Gauge](/images/getting-started/losant-iot-dev-kits/door-sensor/dashboard-with-gauge.png "Dashboard with Gauge")

Now let's add another gauge block to display the current opened state of the door. Click the `Add Block` button on the top-right of the screen and select another gauge block.

![Add Block Button](/images/getting-started/losant-iot-dev-kits/door-sensor/add-block-button.png "Add Block Button")

![Door Open Gauge Settings](/images/getting-started/losant-iot-dev-kits/door-sensor/door-open-gauge-settings.png "Door Open Gauge Settings")

Name the block anything you want. Make sure your application is selected. Set the `Duration` to `Last received data point`. Make sure your device is selected. Set the label to anything you want and make sure the `open` attribute is selected.

This block will display `1` when the door is currently opened and `0` when it's not.

Click `Add Block` to add the gauge to your dashboard.

![Dashboard with Door Open Gauge](/images/getting-started/losant-iot-dev-kits/door-sensor/dashboard-with-door-open-gauge.png "Dashboard with Door Open Gauge")

The last block we're going to add is a graph of door activity over time. Click the `Add Block` button on the top left and then choose `Time Series Graph`.

![Add Time Series](/images/getting-started/losant-iot-dev-kits/door-sensor/add-time-series.png "Add Time Series")

![Time Series Settings](/images/getting-started/losant-iot-dev-kits/door-sensor/time-series-settings.png "Time Series Settings")

Set the `Time Range` to `24 hours` and the `One point every` to `5 minutes`. Make sure your device is selected. Set the label to anything you want. Make sure the `Attribute` is set to `open` and set the `Aggregation` to `SUM`.

This will graph the total number of door opens every 5 minutes over the last 24 hours.

Click `Add Block` to add the gauge to your dashboard.

![Dashboard with Time Series](/images/getting-started/losant-iot-dev-kits/door-sensor/dashboard-with-time-series.png "Dashboard with Time Series")

Just like with the workflow, this dashboard is just a starting point. Feel free to experiment with the data and build visualizations that work best for you.

<a href="https://twitter.com/share" class="twitter-share-button" data-url="https://store.losant.com/products/losant-door-sensor-kit" data-text="My doors have never been smarter. Just completed the @LosantHQ #IoT door sensor kit" data-size="large">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

Don't stop now! Losant has several kits available.

1. Losant Builder Kit ( [Buy Now](https://store.losant.com/products/losant-builder-kit) | [Instructions](/getting-started/losant-iot-dev-kits/builder-kit/) )
1. Moisture Sensor Kit ( [Buy Now](https://store.losant.com/products/losant-moisture-sensor-kit) | [Instructions](/getting-started/losant-iot-dev-kits/moisture-sensor-kit/) )
1. Door Sensor Kit ( [Buy Now](https://store.losant.com/products/losant-door-sensor-kit) | [Instructions](/getting-started/losant-iot-dev-kits/door-sensor-kit/) )
1. LCD Kit ( [Buy Now](https://store.losant.com/products/lcd-kit) | [Instructions](/getting-started/losant-iot-dev-kits/lcd-kit/) )
