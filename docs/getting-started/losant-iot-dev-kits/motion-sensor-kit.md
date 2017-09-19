# Motion Sensor Kit Instructions

The Losant Motion Sensor Kit includes everything required to build the perfect virtual security guard. These instructions provide a step-by-step overview to assemble and configure your motion sensor to alert you via SMS or email when motion is detected.

![Motion Sensor](/images/getting-started/losant-iot-dev-kits/motion-sensor/motion-sensor-header.jpg "Motion Sensor")

As you follow these instructions, if you run into any issues, please refer to the [Losant Documentation](/) and the [Losant Forums](https://forums.losant.com) for help.

Your kit should include the following items:

* 1 NodeMCU development board
* 1 PIR sensor
* 3 male-to-female jump wires
* 1 solderless breadboard
* 1 USB cable

## 1. Environment Setup

The NodeMCU included in this kit is programmed using the <a href="https://mongoose-os.com" target="\_blank">Mongoose OS</a> toolchain.

### Install USB Drivers

The NodeMCU requires the USB to UART driver to be installed to program it. Download and install the driver for your platform by following the instructions at:

<a href="https://www.silabs.com/products/mcu/Pages/USBtoUARTBridgeVCPDrivers.aspx" target="_blank">https://www.silabs.com/products/mcu/Pages/USBtoUARTBridgeVCPDrivers.aspx</a>

![Windows Driver Download](/images/getting-started/losant-iot-dev-kits/environment-setup/uart-driver-windows.png "Windows Download")

![Mac Driver Download](/images/getting-started/losant-iot-dev-kits/environment-setup/uart-driver-mac.png "Mac Driver Download")

On a Mac, the above link downloads a disk image. Double-click the file to mount it, open the disk image, then double-click the .pkg file to install the driver.

![Mac Driver Disk Image](/images/getting-started/losant-iot-dev-kits/environment-setup/mac-driver-disk-image.png "Mac Driver Disk Image")

### Install Mos Tool

Mongoose OS comes with a [CLI tool](https://mongoose-os.com/docs/quickstart/setup.html) called `mos`. The `mos` CLI tool provides a terminal interface to program and flash the NodeMCU.

To install the `mos` tool, follow the [instructions in the Mongoose OS documentation](https://mongoose-os.com/software.html).

Once you download the `mos` tool, make sure you have the latest version:

```sh
$ mos update latest
```

## 2. Losant Setup

In this section, you’ll register for a Losant account, create your application, and add the device for your motion sensor kit.

### Create Account

If you don't already have an account, navigate to [https://accounts.losant.com/create-account](https://accounts.losant.com/create-account) to register.

### Create Application

Create an application. You can name it whatever you want.

![Create Application](/images/getting-started/losant-iot-dev-kits/builder-kit/create-application.png "Create Application")

![Application Name](/images/getting-started/losant-iot-dev-kits/motion-sensor/application-name.png "Application Name")

### Add Device

The next step is to register the device with the platform. Click the `Add Device` button on the top right or select `Add Device` from the Devices dropdown.

![Add Device Menu](/images/getting-started/losant-iot-dev-kits/motion-sensor/add-device.png "Add Device Menu")

Next, choose the `Create Blank Device` option.

![Create From Scratch](/images/getting-started/losant-iot-dev-kits/motion-sensor/add-from-scratch.png "Create From Scratch")

![Device Settings](/images/getting-started/losant-iot-dev-kits/motion-sensor/device-settings.png "Device Settings")

1. Name the device anything you want.
1. "Description" can be left blank, or fill it with whatever you want.
1. For "Device Type", leave "Standalone" selected.
1. Add a [device attribute](/devices/overview/#device-attributes) with the type `Boolean` and the name `movement`.

![Device Attribute](/images/getting-started/losant-iot-dev-kits/motion-sensor/device-attribute.png "Device Attribute")

The device attributes specify what state information the device reports. The firmware that you’ll flash in the following sections will report if there is moment every two seconds. Device attributes are ***case-sensitive***, so make sure to enter these ***exactly as they appear***.

Click the `Create Device` button. The screen will change and show the device’s ID. This ID is required for the following sections. You might want to copy/paste it somewhere convenient.

![Device ID](/images/getting-started/losant-iot-dev-kits/motion-sensor/device-id.png "Device ID")

### Generate An Access Key

Now, we need to generate an [access key](/applications/access-keys/) so your device can authenticate against the Losant platform. Select `Security` from the application menu bar, and then select `Device Access Keys` from the left navigation. Then click `Add Access Key`.

![Access Keys](/images/getting-started/losant-iot-dev-kits/motion-sensor/access-keys.png "Access Keys")

Generate an access key that provides access to all devices in your application.

![Token Restrictions](/images/getting-started/losant-iot-dev-kits/builder-kit/token-restrictions.png "Token Restrictions")

This will cause a popup to appear with your access tokens. Losant ***DOES NOT*** store the secret, so you’ll have to copy it somewhere secure. Both of these values will be needed in the following sections, so make sure you copy/paste them somewhere convenient.

![Access Token Popup](/images/getting-started/losant-iot-dev-kits/builder-kit/access-token-popup.png "Access Token Popup")

## 3. Wiring

***Disconnect the NodeMCU from USB before wiring.***

In this step, we're going to connect the PIR sensor to the NodeMCU. Below is the PIR sensor diagram and wiring diagram.

![PIR Diagram](/images/getting-started/losant-iot-dev-kits/motion-sensor/pir-diagram.png "PIR Diagram")

![Wiring Diagram](/images/getting-started/losant-iot-dev-kits/motion-sensor/wiring-diagram.png "Wiring Diagram")

If you are not familiar with a breadboard, [here is a primer](https://www.losant.com/blog/how-to-use-a-breadboard).

1. Push the NodeMCU into terminals 1-15 on either side of the center line, which are columns `b` and `i`. The USB port should be facing away from the breadboard.
1. Use a female-to-male jump wire to connect the Ground terminal on the PIR sensor to the GND pin on the NodeMCU `a9`.
1. Use a female-to-male jump wire to connect the Power terminal on the PIR sensor to the 3v3 pin on the NodeMCU `a10`.
1. Use a female-to-male jump wire to connect the Digital OUT terminal on the PIR sensor to the D1 pin on the NodeMCU `a14`.

![Wiring Image](/images/getting-started/losant-iot-dev-kits/motion-sensor/wiring-image.jpg "Wiring Image")

## 5. Flash the Firmware

In this step, we are going to program the NodeMCU.

### Get Motion Sensor Firmware

Now let's get the firmware you'll be flashing to the device. Download and extract the following zip file to your computer.

[https://github.com/Losant/losant-mongoose-motion-sensor/archive/master.zip](https://github.com/Losant/losant-mongoose-motion-sensor/archive/master.zip)

If you're familiar with Git, you can also clone the repository from here:

[https://github.com/Losant/losant-mongoose-motion-sensor](https://github.com/Losant/losant-mongoose-motion-sensor)

The main file of the application is located in `fs/init.js`:

<script src="https://gist.github.com/LosantGists/a6f2f0c5139ddaa5e79a23f90c031976.js"></script>

Every 2 seconds the firmware is publishing the state `{ "movement": <value> }` to Losant. This value will be `1` or `true` when movement is present and `0` or `false` in the other cases.

### Flashing

**Connect the NodeMCU dev kit to USB.**

The following commands should be pasted into the terminal; then press Enter to run them.

```sh
$ cd /location/to/losant-mqtt-mongoose-os
```

Build and flash the firmware:

```sh
$ mos build --arch esp8266 && mos flash
```

Configure WiFi:

```sh
$ mos wifi WIFI_SSID WIFI_PASSWORD
```

You must replace the following values:

* WIFI_SSID - Your WiFi SSID.
* WIFI_PASSWORD - Your WiFi password.

Configure MQTT connection to Losant:

```sh
$ mos config-set mqtt.client_id=LOSANT_DEVICE_ID \
  mqtt.user=LOSANT_ACCESS_KEY \
  mqtt.pass=LOSANT_ACCESS_SECRET \
  device.id=LOSANT_DEVICE_ID
```

You have already obtained the `LOSANT_DEVICE_ID`, `LOSANT_ACCESS_KEY`, and `LOSANT_ACCESS_SECRET`.

Now that we've configured WiFi and the Losant credentials, our device should be connected and ready to go. In the next section, we will talk about the many ways to debug and verify that your device is connected.

### Verify

Mongoose OS has the ability stream the logs from the device via serial to the terminal. These logs will display all the `print` information in our firmware, and helpful Mongoose OS logs. To stream logs to the terminal:

```sh
$ mos console
```

![Mos Console](/images/getting-started/losant-iot-dev-kits/motion-sensor/mos-console.png "Mos Console")

Mongoose OS also has a web UI where you can monitor logs, flash devices, and update the firmware with a web-based IDE.

![Mos UI](/images/getting-started/losant-iot-dev-kits/motion-sensor/mos-ui.gif "Mos UI")  

To open up the mos web UI:

```sh
$ mos
```

On the other end, if you go to your [application overview](/applications/overview/) page in Losant, you'll see the [communication log](/applications/overview/#communication-log). This gives you a ton of helpful information about what's happening in your application. Here you will be able to see successful connections:

![Communication log](/images/getting-started/losant-iot-dev-kits/motion-sensor/losant-iot-communication-log-success.png "Communication log")

Lastly, you can use the [data explorer](/applications/data-explorer/) to see the data that is stored in Losant. The Data Explorer allows you to easily explore, aggregate and analyze historical data across all of the devices in an application.

![Losant Data Explorer](/images/getting-started/losant-iot-dev-kits/motion-sensor/data-explorer.png "Losant Data Explorer")

It’s now time to start making use of this data.

## 6. Set Up Alerts

Now that sensor data is flowing into Losant, we can set up our alerts to be notified by SMS and email whenever the sensor is triggered. For this, we're going to use [Losant Workflows](/workflows/overview/).

First, create a new workflow and name it whatever you want.

![Create Workflow](/images/getting-started/losant-iot-dev-kits/motion-sensor/create-workflow.png "Create Workflow")

![Workflow Settings](/images/getting-started/losant-iot-dev-kits/motion-sensor/workflow-settings.png "Workflow Settings")

The workflow will start with a [Device Trigger](/workflows/triggers/device/). Every workflow starts with a workflow trigger. This workflow will execute every time the sensor reports state. The firmware that we flashed to it reports state every 2 seconds, so this workflow will be triggered every 2 seconds.

![Device Trigger](/images/getting-started/losant-iot-dev-kits/motion-sensor/device-trigger.png "Device Trigger")

Next, add a [Debug Node](/workflows/outputs/debug/). Whenever a payload hits the debug node it is displayed in the Debug tab. This allows you to easily debug workflows as you are building them.

![Debug](/images/getting-started/losant-iot-dev-kits/motion-sensor/debug-node.png "Debug")

In the workflow, you also have the ability to see the payload flow, in real time, through the workflow. First, you must deploy the workflow. Then, select the debug icon in the top right of the workflow pallet.

![Live Payload](/images/getting-started/losant-iot-dev-kits/motion-sensor/live-payload.png "Live Payload")

Now, you can visualize the payloads in the workflow like so:

![Debug Gif](/images/getting-started/losant-iot-dev-kits/motion-sensor/debug.gif "Conditional Gif")

Next, we need to read the `movement` and act on it. For this, we can use a [Latch node](/workflows/logic/latch/), which is a type of conditional node.

Latches work very similarly to conditional nodes, but only allow the true path to be executed once (latched). The true path can only be executed again if a reset condition is met (unlatched).

We use a Latch node here because we don't want to get an email or SMS every time the sensor reports a `movement` - remember that the device is reporting every 2 seconds. We only want to be alerted once when movement happens and then only alerted again if new movement was discovered. We will only unlatch this node if the `movement` goes back to false to indicate that we didn't see movement anymore. At that point, it's safe to alert us again when our sensor sees movement.

![Conditional](/images/getting-started/losant-iot-dev-kits/motion-sensor/conditional.png "Conditional")

Then, after we deploy, we can see how this payload interacts with the workflow. Notice, because of the Latch node, the payload will only take the success path once.

![Conditional Gif](/images/getting-started/losant-iot-dev-kits/motion-sensor/conditional.gif "Conditional Gif")

Lastly, we need to notify ourselves. We can use the [SMS node](/workflows/outputs/sms/) or the [Email node](/workflows/outputs/email/). In the example, the SMS node is used. The `SMS` and `Email` nodes. These are pretty straightforward. Whenever the latch determines there is movement (and it's not already latched), these two nodes will be executed. The SMS node simply sends a message to the number stored in the `smsNumber` global configuration field and the email node sends a message to the addressed stored in the `email` global configuration field.

![SMS](/images/getting-started/losant-iot-dev-kits/motion-sensor/sms.png "SMS")

## 8. Build a Dashboard

In this step, we're going to build a dashboard to visualize the real-time and sensor readings. First, create a new dashboard from the `Dashboards` menu.

![Create Dashboard Menu](/images/getting-started/losant-iot-dev-kits/motion-sensor/create-dashboard-menu.png "Create Dashboard Menu")

You can name the dashboard anything you'd like. If you'd like to [let other people](/dashboards/overview/#dashboard-access-control) see your dashboard, you can optionally modify the access control level after creating the dashboard.

![Dashboard Settings](/images/getting-started/losant-iot-dev-kits/motion-sensor/dashboard-settings.png "Dashboard Settings")

Next, add a time series block.

![Add Time](/images/getting-started/losant-iot-dev-kits/motion-sensor/add-time.png "Add Time")

Next, you'll be able to configure the block settings. Give the block a header and choose your application. We'll be displaying historical data.

![Time Settings](/images/getting-started/losant-iot-dev-kits/motion-sensor/time-settings.png "Time Settings")

![Time Settings](/images/getting-started/losant-iot-dev-kits/motion-sensor/time-settings-1.png "Time Settings")

We want to show the average movement, every 30 seconds, over the last hour. Set the `Time Range` and `One Point Every` appropriately. Next, select your device and the `movement` attribute. As soon as all the fields are filled out, you should see a real-time preview on the top-right of the screen.

Click `Add Block` to add the graph to your dashboard.

![Dashboard with Time](/images/getting-started/losant-iot-dev-kits/motion-sensor/dashboard-with-time.png "Dashboard with Time")

Now, you can add more blocks to your dashboard to complete your virtual security guard.

![Full Dashboard](/images/getting-started/losant-iot-dev-kits/motion-sensor/dashboard.png "Full Dashboard")

And with that, your motion sensor kit is now ready to go. If you need some extra challenges, here are some things you can try:

1. Add a [Streaming Gauge Block](/dashboards/gauge/) to your dashboard to see a real time feed.
1. Configure an alert if movement happens between specific time intervals with the [Time Range Node](/workflows/logic/time-range/).

<a href="https://twitter.com/share" class="twitter-share-button" data-url="https://store.losant.com/products/losant-motion-sensor-kit" data-text="Green thumb activated! Just installed my @LosantHQ  #IoT motion sensor kit" data-size="large">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

Don't stop now! Losant has several kits available.

1. Losant Builder Kit ( [Buy Now](https://store.losant.com/products/losant-builder-kit) | [Instructions](/getting-started/losant-iot-dev-kits/builder-kit/) )
1. Moisture Sensor Kit ( [Buy Now](https://store.losant.com/products/losant-moisture-sensor-kit) | [Instructions](/getting-started/losant-iot-dev-kits/moisture-sensor-kit/) )
1. Door Sensor Kit ( [Buy Now](https://store.losant.com/products/losant-door-sensor-kit) | [Instructions](/getting-started/losant-iot-dev-kits/door-sensor-kit/) )
1. LCD Kit ( [Buy Now](https://store.losant.com/products/lcd-kit) | [Instructions](/getting-started/losant-iot-dev-kits/lcd-kit/) )
