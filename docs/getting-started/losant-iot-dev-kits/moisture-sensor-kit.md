# Moisture Sensor Kit Instructions

The <a href="https://store.losant.com/products/losant-moisture-sensor-kit" target="_blank">Losant Moisture Sensor Kit</a> includes everything required to keep your plants watered and happy. These instructions provide a step-by-step overview to build and configure your moisture sensor to alert you via SMS or email when your plant needs attention.

![Moisture Sensor](/images/getting-started/losant-iot-dev-kits/moisture-sensor/moisture-sensor-header.jpg "Moisture Sensor")

As you follow these instructions, if you run into any issues, please refer to the [Losant Documentation](/) and the [Losant Forums](https://forums.losant.com) for help.

Your kit should include the following items:

* 1 NodeMCU development board
* 1 moisture sensor
* 1 LED
* 2 male-to-male jump wires
* 3 male-to-female jump wires
* 1 resistor
* 1 solderless breadboard
* 1 USB cable

## 1. Environment Setup

In order to properly program the kit's microcontroller, please follow the [environment setup instructions](/getting-started/losant-iot-dev-kits/environment-setup/). These steps only need to be completed once, so if you've already done this for a previous kit, you can skip this step.

## 2. Losant Setup

In this section, you’ll register for a Losant account, create your application, and add the device for your moisture sensor kit.

### Create Account

If you don't already have an account, navigate to [https://accounts.losant.com/create-account](https://accounts.losant.com/create-account) to register.

### Create Application

Create an application for the moisture sensor kit. You can name it whatever you want.

![Create Application](/images/getting-started/losant-iot-dev-kits/builder-kit/create-application.png "Create Application")

![Application Name](/images/getting-started/losant-iot-dev-kits/moisture-sensor/application-name.png "Application Name")

### Add Device

The next step is to register the moisture sensor kit device with the platform. Click the `Add Device` button on the top right or select `Add Device` from the Devices dropdown.

![Add Device Menu](/images/getting-started/losant-iot-dev-kits/moisture-sensor/add-device.png "Add Device Menu")

Next, choose the `Create Blank Device` option.

![Create From Scratch](/images/getting-started/losant-iot-dev-kits/moisture-sensor/add-from-scratch.png "Create From Scratch")

![Device Settings](/images/getting-started/losant-iot-dev-kits/moisture-sensor/device-settings.png "Device Settings")

1. Name the device anything you want.
1. "Description" can be left blank, or fill it with whatever you want.
1. For "Device Type", leave "Standalone" selected.
1. Add a device attribute with the type `Number` and the name `moisture`.

The device attributes specify what state information the device reports. The firmware that you’ll flash in the following sections will report the raw moisture level from the sensor every minute. Device attributes are ***case-sensitive***, so make sure to enter these ***exactly as they appear***.

Click the `Create Device` button. The screen will change and show the device’s ID. This ID is required for the following sections. You might want to copy/paste it somewhere convenient.

![Device ID](/images/getting-started/losant-iot-dev-kits/moisture-sensor/device-id.png "Device ID")

### Generate An Access Key

Now we need to generate an [access key](/applications/access-keys/) so your device can authenticate against the Losant Platform. Select `Security` from the application menu bar, and then `Device Access Keys` from the left navigation. Then click `Add Access Key`.

![Access Keys](/images/getting-started/losant-iot-dev-kits/builder-kit/access-keys.png "Access Keys")

Generate an access key that provides access to all devices in your application.

![Token Restrictions](/images/getting-started/losant-iot-dev-kits/builder-kit/token-restrictions.png "Token Restrictions")

This will cause a popup to appear with your access tokens. Losant ***DOES NOT*** store the secret, so you’ll have to copy it somewhere secure. Both of these values will be needed in the following sections, so make sure you copy/paste them somewhere convenient.

![Access Token Popup](/images/getting-started/losant-iot-dev-kits/builder-kit/access-token-popup.png "Access Token Popup")

## 3. Get Moisture Sensor Firmware

Now let's get the firmware you'll be flashing to the device. Download and extract the following zip file to your computer. We'll be editing and opening these files using the Arduino IDE, so put it somewhere convenient.

[https://github.com/Losant/losant-kit-moisture/archive/master.zip](https://github.com/Losant/losant-kit-moisture/archive/master.zip)

If you're familiar with Git, you can also clone the repository from here:

[https://github.com/Losant/losant-kit-moisture](https://github.com/Losant/losant-kit-moisture)

## 4. Wiring

***Disconnect the microcontroller from USB before wiring.***

In this step we're going to to connect the moisture sensor and the LED to the microcontroller. Below is the wiring diagram.

![Wiring Diagram](/images/getting-started/losant-iot-dev-kits/moisture-sensor/wiring-diagram.png "Wiring Diagram")

1. Push the microcontroller into terminals 1-15 on either side of the center line, which are columns `b` and `i`. The USB port should be facing away from the breadboard.
1. Connect the GND pin on the microcontroller `a2` to the negative rail with a jump wire. The color of the jump wire doesn't matter.
1. Insert the LED into terminals `d22` and `d23`. Ensure the positive lead on the LED (the longer one) is in terminal `d22`.
1. Connect the negative rail to the negative lead on the LED `c23` with the resistor.
1. Connect the positive lead on the LED `c22` to pin D1 on the microcontroller `a14`.
1. Use a female-to-male jump wire to connect the `GND` terminal on the moisture sensor to the negative rail on the breadboard.
1. Use a female-to-male jump wire to connect the `VCC` terminal on the moisture sensor to pin D2 on the microcontroller `a13`.
1. Use a female-to-male jump wire to connect the `SIG` terminal on the moisture sensor to the A0 pin on the microcontroller `j15`.

![Wiring Image](/images/getting-started/losant-iot-dev-kits/moisture-sensor/wiring-image.jpg "Wiring Image")

## 5. Flash the Firmware

Connect the microcontroller to your computer with the supplied USB cable. Make sure the device shows up under the Arduino IDE's `Tools -> Port` menu and it's selected. If the device does not show up, please review the [Environment Setup](/getting-started/losant-iot-dev-kits/door-sensor-kit/#environment-setup) guide.

With the Arduino IDE, use the `File -> Open` menu to navigate to where you downloaded and extracted the kit source code and open the file `losant-kit-moisture/losant-kit-moisture.ino`. Edit the following variables at the top of the file.

1. WIFI_SSID = the name of your WiFi network
1. WIFI_PASS = your WiFi password
1. LOSANT_DEVICE_ID = set this to the ID you received after adding the device to the Losant application
1. LOSANT_ACCESS_KEY = set this to the access key you generated after creating the Losant application
1. LOSANT_ACCESS_SECRET = set this to the access secret you generated after creating the Losant application

![Update Variables](/images/getting-started/losant-iot-dev-kits/moisture-sensor/update-variables.png "Update Variables")

Your code will automatically be saved as part of the upload process when it's flashed to the device. After editing the code, open the Arduino IDE's Serial Monitor and change the baud rate to 115200. The serial monitor can be opened using the button on the top right of the Arduino IDE or using the `Tools -> Serial Monitor` menu.

![Open Serial Monitor](/images/getting-started/losant-iot-dev-kits/moisture-sensor/serial-monitor-button.png "Open Serial Monitor")

![Serial Monitor Baud](/images/getting-started/losant-iot-dev-kits/builder-kit/serial-monitor-baud.png "Serial Monitor Baud")

The serial monitor won't print any information until we flash the device with the source code in the next step.

Upload the firmware to the device by clicking the `Upload` button or the `Sketch -> Upload` menu. This will take a few seconds and the microcontroller will rapidly blink a blue light while it’s uploading.

![Upload Button](/images/getting-started/losant-iot-dev-kits/moisture-sensor/upload-button.png "Upload Button")

After the upload is complete, the Serial Monitor should start printing information about it connecting to WiFi and Losant. It may also print some garbage, but that's just part of the board booting up. It will then print the moisture level every minute.

![Serial Output](/images/getting-started/losant-iot-dev-kits/moisture-sensor/serial-output.png "Serial Output")

Every 60 seconds the firmware is publishing the state `{ "moisture": <value> }` to Losant. The moisture value is the raw number between 0-1024 that the microcontroller's ADC is providing. Higher values mean more moisture and lower values mean less moisture.

It’s now time to put your moisture sensor in a plant and start making use of this data.

## 6. Install Moisture Sensor

Insert the moisture sensor roughly halfway to two thirds into your plant's soil. Make sure the soil is not touching any of the components or leads at the top of the sensor. You can then position the microcontroller and breadboard wherever is convenient.

![Moisture Sensor](/images/getting-started/losant-iot-dev-kits/moisture-sensor/moisture-sensor.jpg "Moisture Sensor")

![Moisture Sensors](/images/getting-started/losant-iot-dev-kits/moisture-sensor/moisture-sensors.jpg "Moisture Sensors")

## 7. Set Up Alerts

Now that real moisture data is flowing into Losant, we can set up our alerts to be notified by SMS and email whenever the moisture level reaches a certain value. We're also going to send a command back to the board to turn on the LED, just in case you missed the alert. For this, we're going to use [Losant Workflows](/workflows/overview/).

First, create a new workflow and name it whatever you want.

![Create Workflow](/images/getting-started/losant-iot-dev-kits/moisture-sensor/create-workflow.png "Create Workflow")

![Workflow Settings](/images/getting-started/losant-iot-dev-kits/moisture-sensor/workflow-settings.png "Workflow Settings")

As a way to get up and running as fast as possible, we've provided you a workflow you can import. In the firmware zip file you downloaded earlier, there is a file named `low-moisture-alert.flow`. Import this file into your workflow using the import tools on the workflow properties panel.

![Import Workflow](/images/getting-started/losant-iot-dev-kits/moisture-sensor/import-workflow.png "Import Workflow")

Once imported, your workflow should look like the following.

![Imported Workflow](/images/getting-started/losant-iot-dev-kits/moisture-sensor/imported-workflow.png "Imported Workflow")

Don't worry, this workflow will be completely explained later, but for now we need to properly configure it.

You'll notice that there are three nodes that have small error icons: the device trigger and the two device command outputs. These have errors because they need a device to be configured. Click on each of them and select your device from the dropdown. All three nodes should be configured for the same device.

![Nodes with Errors](/images/getting-started/losant-iot-dev-kits/moisture-sensor/nodes-with-errors.png "Nodes with Errors")

![Node Device Option](/images/getting-started/losant-iot-dev-kits/moisture-sensor/node-device-option.png "Node Device Option")

The last thing you'll have to do is set up this workflow's global configuration. The global configuration holds the alert threshold, your phone number, and your email address. Click on the `Globals` tab on the bottom right.

![Globals Tab](/images/getting-started/losant-iot-dev-kits/moisture-sensor/globals-tab.png "Globals Tab")

The `badLevel` and `goodLevel` values will be dependent on your specific plant and soil type. For our office plants, a `badLevel` of 350 and a `goodLevel` of 450 generally work well. You may need to change these as you begin collecting data.

The `badLevel` indicates the moisture sensor reading where Losant should alert you. The `goodLevel` basically tells Losant the plant has been watered.

Fill in the `smsNumber` and `email` fields with your phone number and email address respectively. These are the alerts that Losant will use.

With all fields entered you can now deploy this workflow and begin seeing data from your moisture sensor.

![Deploy Workflow](/images/getting-started/losant-iot-dev-kits/moisture-sensor/deploy-workflow.png "Deploy Workflow")

The moisture sensor reports moisture level every minute, so roughly a minute after you deploy this workflow you should be able to inspect the payloads it's receiving using the Debug tab.

![Debug Tab](/images/getting-started/losant-iot-dev-kits/moisture-sensor/debug-tab.png "Debug Tab")

As you can see, the moisture sensor in the above example is reporting a value of 324, which indicates the plant needs water and would trigger the SMS and email alerts. You can use this debug output to tweak the global configuration values as needed.

This workflow is just a starting point. Losant can connect this device to many different outputs and other 3rd-party services. As an additional challenge, see if you can figure out how to Tweet a message whenever your plant needs water.

### Workflow Walkthrough

This section explains each part of the workflow so you can get an understanding of what's going on and how alerts are triggered. For a deeper dive into how workflows work, please read the [Workflow Overview](/workflows/overview/).

1. The `Device` trigger. Every workflow starts with some kind of trigger to kick things off. This workflow will execute every time the moisture sensor reports state. The firmware that we flashed to it earlier reports state every 60 seconds, so this workflow will run each time that happens.
1. The `Conditional` logic node. The payload that the device reports is passed into a conditional node to check whether a "turnLedOn" or "turnLedOff" command should be sent to the device. The conditional node is using the `badLevel` global configuration variable that you specified earlier. The actual condition is `{{ data.moisture }} < {{ globals.badLevel }}`. This is simply checking if `data.moisture`, which was reported by the device, is less than the `badLevel`. Using double curly braces allows us to pull values from the current payload. You can always see the payload by looking at the `Debug` tab.
1. The `Device Command` nodes. If the conditional node evaluates to true, this node will send the "turnLedOn" command back to our moisture sensor. The firmware we flashed to it is listening for a command of this name and will turn the LED on if it receives it. If the conditional node evaluates to false, the device will receive a "turnLedOff" command, which simply turns the LED off.
1. The `Latch` node. Latches work very similar to conditional nodes, but only allow the true path to be executed once (latched). The true path can only be executed again if a reset condition is met (unlatched). We use a latch node here because we don't want to get an email or SMS every time the sensor reports a low moisture level - remember that the device is reporting every 60 seconds. We only want to be alerted once when moisture level is low and then only alerted again if the plant was watered and moisture level goes low again. This is where the `goodLevel` global configuration value comes in. We will only unlatch this node if the moisture level goes back high enough to indicate the plant was watered. At that point it's safe to alert us again when it goes low.
1. The `SMS` and `Email` nodes. These are pretty straightforward. Whenever the latch determines the moisture level is low (and it's not already latched), these two nodes will be executed. The SMS node simply sends a message to the number stored in the `smsNumber` global configuration field and the email node sends a message to the addressed stored in the `email` global configuration field.
1. The `Debug` node. You've already seen the output of the debug node using the debug tab. Whenever a payload hits the debug node it is displayed in that tab. This allows you to easily debug workflows as you are building them.

## 8. Build a Dashboard

In this step, we're going to build a dashboard to visualize the real-time and historical moisture levels. First, create a new dashboard from the `Dashboards` menu.

![Create Dashboard Menu](/images/getting-started/losant-iot-dev-kits/moisture-sensor/create-dashboard-menu.png "Create Dashboard Menu")

You can name the dashboard anything you'd like. If you'd like to [let other people](/dashboards/overview/#dashboard-access-control) see your dashboard, you can optionally modify the access control level after creating the dashboard.

![Dashboard Settings](/images/getting-started/losant-iot-dev-kits/moisture-sensor/dashboard-settings.png "Dashboard Settings")

Next, add a gauge block.

![Add Gauge](/images/getting-started/losant-iot-dev-kits/moisture-sensor/add-gauge.png "Add Gauge")

![Gauge Settings](/images/getting-started/losant-iot-dev-kits/moisture-sensor/gauge-settings.png "Gauge Settings")

Name the block anything you want. Make sure your application is selected. Change the `Gauge Type` to `Dial Gauge`. Set the minimum and maximum to whatever makes sense for your plant. You can easily change these later as you collect more data. Set the `Duration` to `Last received data point`, which will show the real-time value. Lastly, make sure your device is selected, set the label to whatever you want, and make sure the moisture attribute is being graphed. As soon as all the fields are filled out, you should see a real-time preview on the top-right of the screen.

Click `Add Block` to add the gauge to your dashboard.

![Dashboard with Gauge](/images/getting-started/losant-iot-dev-kits/moisture-sensor/dashboard-with-gauge.png "Dashboard with Gauge")

Now let's add a time series graph that shows the moisture level over time. Click the `Add Block` button on the top-right of the screen and select the `Time Series Graph` block.

![Add Block Button](/images/getting-started/losant-iot-dev-kits/moisture-sensor/add-block-button.png "Add Block Button")

![Select Time Series](/images/getting-started/losant-iot-dev-kits/moisture-sensor/select-time-series.png "Select Time Series")

![Time Series Settings](/images/getting-started/losant-iot-dev-kits/moisture-sensor/time-series-settings.png "Time Series Settings")

Name the block anything you want. Make sure your application is selected. Since you likely don't have very much data yet, set the time range to 60 minutes. As you collect more data you can increased this to show more historical information. Lastly, make sure you moisture sensor device is selected, set the label to anything you want, and make sure the moisture attribute is being graphed. Just like with the gauge, you should see a live preview as soon as all fields are populated. When done, click the `Add Block` button.

![Dashboard With Time Series](/images/getting-started/losant-iot-dev-kits/moisture-sensor/dashboard-with-time-series.png "Dashboard With Time Series")

And with that, your moisture sensor kit is now ready to go. If you made your dashboard public you can share the URL of your dashboard with others so they can also see how well your plants are doing.

If you've purchased multiple moisture sensors to monitor more than one plant, you can simply add all of them to the same application. Here's the public dashboard of the [Losant office plants](https://app.losant.com/#/dashboards/56f0918f2d198e01002b05d4). You can see how one application and one dashboard can support multiple devices. Some workflow tweaks will be required to support more than one sensor, but I'll leave that as a challenge to you.

<a href="https://twitter.com/share" class="twitter-share-button" data-url="https://store.losant.com/products/losant-moisture-sensor-kit" data-text="Green thumb activated! Just installed my @LosantHQ #IoT moisture sensor kit" data-size="large">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

Don't stop now! Losant has several kits available.

1. Losant Builder Kit ( [Buy Now](https://store.losant.com/products/losant-builder-kit) | [Instructions](/getting-started/losant-iot-dev-kits/builder-kit/) )
1. Moisture Sensor Kit ( [Buy Now](https://store.losant.com/products/losant-moisture-sensor-kit) | [Instructions](/getting-started/losant-iot-dev-kits/moisture-sensor-kit/) )
1. Door Sensor Kit ( [Buy Now](https://store.losant.com/products/losant-door-sensor-kit) | [Instructions](/getting-started/losant-iot-dev-kits/door-sensor-kit/) )
1. LCD Kit ( [Buy Now](https://store.losant.com/products/lcd-kit) | [Instructions](/getting-started/losant-iot-dev-kits/lcd-kit/) )
