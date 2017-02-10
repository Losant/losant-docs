# LCD Kit Instructions

The <a href="https://store.losant.com/products/lcd-kit" target="_blank"> LCD Kit</a> includes everything to add a display to your hardware project. These instructions provide a step-by-step overview to build and configure your own Internet-connected weather station. This station displays a summary of the outside weather, temperature, and time. However, with this kit, you could display other bits of information besides weather.

![Weather Station](/images/getting-started/losant-iot-dev-kits/lcd-kit/weather-station.jpg "Weather Station")

As you follow these instructions, if you run into any issues, please refer to the [Losant Documentation](https://docs.losant.com) and the [Losant Forums](https://forums.losant.com) for help.

## Materials

![Losant LCD Kit Materials](/images/getting-started/losant-iot-dev-kits/lcd-kit/lcd-kit-materials.png "Losant LCD Kit Materials")

Your kit should include the following items:

* 1 [NodeMCU development board](https://www.amazon.com/HiLetgo-Version-NodeMCU-Internet-Development/dp/B010O1G1ES)

* 1 [16x2 LCD Screen](https://www.amazon.com/Arducam-HD44780-Character-Backlight-Interface/dp/B01985FB6A) - with Hitachi HD44780 compatible controller

* 1 [TMP36 temperature sensor](https://www.adafruit.com/product/165)

* 4 [male-to-female jumper wires](https://www.adafruit.com/product/826)

* 5 [male-to-male jumper wires](https://www.adafruit.com/product/758)

* 1 [half-size solderless breadboard](https://www.adafruit.com/products/64)

* 1 [micro USB cable](https://www.amazon.com/AmazonBasics-USB-Male-Micro-Cable/dp/B01EK87T9M)

## 1. Environment Setup

To properly program the kit's microcontroller, please follow the **<a href="/getting-started/losant-iot-dev-kits/environment-setup/" target="_blank">environment setup instructions</a>**. The NodeMCU included in this kit is programmed using the Arduino toolchain. These steps only need to be completed once, so if you've already done this for a previous kit, you can skip this step.

Additionally to the setup instructions, we need to install the <a href="https://github.com/marcoschwartz/LiquidCrystal_I2C" target="_blank">LiquidCrystal_I2C</a> library. This library will allow us to control LCD displays with the <a href="https://learn.sparkfun.com/tutorials/i2c" target="_blank">I2C protocol</a>.

To install the LiquidCrystal_I2C library, open the library manager from the `Sketch -> Include Library -> Manage Libraries` menu and search for LiquidCrystal_I2C. There are a couple of similar libraries, so, you will want to choose the one by `Frank de Brabander`.

![Liquid Crystal I2C Library](/images/getting-started/losant-iot-dev-kits/lcd-kit/i2c-library.png "Liquid Crystal I2C Library")

Once installed, your environment is ready.

## 2. Wiring

***Disconnect the microcontroller from USB before wiring.***

In this step we're going to to connect the temperature sensor and LCD to the microcontroller. Below is the wiring diagram.

![Wiring Image](/images/getting-started/losant-iot-dev-kits/lcd-kit/lcd-wiring-diagram.png "Wiring Image")

1. Push the microcontroller into terminals 1-15 on either side of the center line, which are rows `b` and `i`. The USB port should be facing away from the breadboard.
1. Use a female-to-male jump wire to connect the VIN pin on the microcontroller `j1` to the VCC pin on the LCD. The color of the jump wire doesn't matter.
1. Use a female-to-male jump wire to connect the GND pin on the microcontroller `j2` to the GND pin on the LCD.
1. Use a female-to-male jump wire to connect the SCL pin on the microcontroller `a14` to the D1 pin on the LCD.
1. Use a female-to-male jump wire to connect the SDA pin on the microcontroller `a13` to the D2 pin on the LCD.
1. Connect the 3V3 pin from the NodeMCU (j5) to the positive rail with a jump wire.
1. Connect the GND pin from the NodeMCU (j5) to the negative rail with a jump wire.
1. Add the tmp36 temperature sensor to terminals f21, f22, and f23. It’s VERY IMPORTANT that the sensor is oriented the right way with the flat side facing the top of the board – towards column j.
1. Connect the rightmost lead (f21) of the temperature sensor to the negative rail using a jump wire.
1. Connect the leftmost lead (f23) of the temperature sensor to the positive rail using a jump wire.
1. Connect the center lead (f22) to the A0 pin on the NodeMCU (terminal j15) with a jump wire.

![Wiring Image](/images/getting-started/losant-iot-dev-kits/lcd-kit/wiring-image.jpg "Wiring Image")

Once you have everything wired up, it's important that the two pins on the back of the LCD are tied together. These two pins power the backlight.

![Backlight Pin](/images/getting-started/losant-iot-dev-kits/lcd-kit/lcd-backlight-pin.png "Backlight Pin")

There is also a <a target="_blank" href="https://en.wikipedia.org/wiki/Potentiometer">potentiometer</a> on the back of the display. The potentiometer controls the contrast of the text on the LCD. So, once you start working on your device, if you can't see any text, try adjusting the contrast.

![LCD Potentiometer](/images/getting-started/losant-iot-dev-kits/lcd-kit/lcd-potentiometer.png "LCD Potentiometer")

## 3. Losant Setup

In this section, you’ll register for a Losant account, create your application, and add a device for your kit.

### Create Account

If you don't already have an account, navigate to Losant to <a href="https://accounts.losant.com/create-account" target="_blank">create an account</a>.

### Create Application

In Losant, every thing starts with an application. All devices and workflows belong to applications. So, **create an application** and you can name it whatever you want.

![Create Application](/images/getting-started/losant-iot-dev-kits/builder-kit/create-application.png "Create Application")

![Application Name](/images/getting-started/losant-iot-dev-kits/lcd-kit/application-name.png "Application Name")

### Add Device

A device in Losant is a single thing or widget. A device could be car, thermostat, smart bulb, or any kind of custom gadget. Devices can contain many sensors or attached peripherals. In this example, our device is our weather station.

The next step is to register the device with the platform. **Select `Add Device` from the Devices dropdown. Next, choose the `Create Blank Device` option.**

![Add Device Menu](/images/getting-started/losant-iot-dev-kits/lcd-kit/add-device.png "Add Device Menu")

![Device Name](/images/getting-started/losant-iot-dev-kits/lcd-kit/device-name.png "Device Name")

![Device Settings](/images/getting-started/losant-iot-dev-kits/lcd-kit/device-settings.png "Device Settings")

1. Name the device anything you want.
1. "Description" can be left blank, or fill it with whatever you want.
1. For "Device Type", leave "Standalone" selected.
1. Add a device attribute with the type `Number` and the name `tempF`.
1. Add a device attribute with the type `Number` and the name `tempC`.

The device attributes specify what state information the device reports. The firmware that you’ll flash in the following sections will report whenever a button is pressed, the temperature in Celsius (tempC), and the temperature in Fahrenheit (tempF). Device attributes are ***case-sensitive***, so make sure to enter these ***exactly as they appear***.

Click the `Create Device` button. The screen will change and show the device’s ID. This ID is required for the following sections. You might want to copy/paste it somewhere convenient.

![Device ID](/images/getting-started/losant-iot-dev-kits/lcd-kit/device-id.png "Device ID")

### Generate An Access Key

Now we need to generate an [access key](/applications/access-keys/) so your device can authenticate against the Losant platform. Select `Security` from the application menu bar, and then `Device Access Keys` from the left navigation. Then click `Add Access Key`.

![Access Keys](/images/getting-started/losant-iot-dev-kits/builder-kit/access-keys.png "Access Keys")

Generate an access key that provides access to all devices in your application.

![Token Restrictions](/images/getting-started/losant-iot-dev-kits/builder-kit/token-restrictions.png "Token Restrictions")

This will cause a popup to appear with your access tokens. Losant ***DOES NOT*** store the secret, so you’ll have to copy it somewhere secure. Both of these values will be needed in the following sections, so make sure you copy/paste them somewhere convenient.

![Access Token Popup](/images/getting-started/losant-iot-dev-kits/lcd-kit/access-token-popup.png "Access Token Popup")

## 4. Flash the Firmware

### Get the Firmware

Now let's get the firmware you'll be flashing to the device. Download and extract the following zip file to your computer. We'll be editing and opening these files using the Arduino IDE, so put it somewhere convenient.

[https://github.com/Losant/losant-kit-lcd/archive/master.zip](https://github.com/Losant/losant-kit-lcd/archive/master.zip)

If you're familiar with git, you can also clone the repository from here:

[https://github.com/Losant/losant-kit-lcd](https://github.com/Losant/losant-kit-lcd)

### Flashing

Connect the microcontroller to your computer with the supplied USB cable. Make sure the device shows up under the Arduino IDE's `Tools -> Port` menu and it's selected. If the device does not show up, please review the [Environment Setup](https://docs.losant.com/getting-started/losant-iot-dev-kits/environment-setup/) guide.

With the Arduino IDE, use the `File -> Open` menu to navigate to where you downloaded and extracted the kit source code and open the file `losant-kit-lcd/losant-kit-lcd.ino`. Edit the following variables at the top of the file.

1. WIFI_SSID = the name of your WiFi network
1. WIFI_PASS = your WiFi password
1. LOSANT_DEVICE_ID = set this to the ID you received after adding the device to the Losant application
1. LOSANT_ACCESS_KEY = set this to the access key you generated after creating the Losant application
1. LOSANT_ACCESS_SECRET = set this to the access secret you generated after creating the Losant application

![Update Variables](/images/getting-started/losant-iot-dev-kits/lcd-kit/update-variables.png "Update Variables")

Your code will automatically be saved as part of the upload process when it's flashed to the device. After editing the code, open the Arduino IDE's Serial Monitor and change the baud rate to 115200. The serial monitor can be opened using the button on the top right of the Arduino IDE or using the `Tools -> Serial Monitor` menu.

![Open Serial Monitor](/images/getting-started/losant-iot-dev-kits/lcd-kit/serial-monitor-button.png "Open Serial Monitor")

![Serial Monitor Baud](/images/getting-started/losant-iot-dev-kits/builder-kit/serial-monitor-baud.png "Serial Monitor Baud")

The serial monitor won't print any information until we flash the device with the source code in the next step.

Upload the firmware to the device by clicking the `Upload` button or the `Sketch -> Upload` menu. This will take a few seconds and the microcontroller will rapidly blink a blue light while it’s uploading.

![Upload Button](/images/getting-started/losant-iot-dev-kits/lcd-kit/upload-button.png "Upload Button")

After the upload is complete, the Serial Monitor should start printing information about it connecting to WiFi and Losant. It may also print some garbage, but that's just part of the board booting up.

![Serial Output](/images/getting-started/losant-iot-dev-kits/lcd-kit/serial-output.png "Serial Output")

Every 15 seconds the firmware is publishing to Losant the inside temperature of the room you are in. Here is why that payload to Losant looks like:

```json
{ "tempC": <value>, "tempF": <value> }
```

It’s now time to display the rest of the weather data on the LCD screen.

## 5. Displaying Data on LCD

As we've seen, Losant can capture state from the device. Losant can also send commands back to the device. In this case, we can send a command to the device with information we want it to display on the screen. In the firmware we flashed, there is a function called `handleCommand`:

```C
void handleCommand(LosantCommand *command) {
  Serial.print("Command received: ");
  Serial.println(command->name);
  JsonObject& payload = *command->payload;

  if (strcmp(command->name, "refresh") == 0) {
    payload.printTo(Serial);
    // Clear the screen.
    lcd.clear();

    // Move the cursor to the start of the first line and print the text.
    lcd.setCursor(0,0);
    lcd.print(payload["L1"].asString());

    // Move the cursor to the start of the second line and print the text.
    lcd.setCursor(0,1);
    lcd.print(payload["L2"].asString());
  }

}
```

The <a href="/mqtt/arduino/" target="_blank">Losant Arduino firmware</a> uses MQTT to communication with devices. Once a MQTT payload is received, `handleCommand` will be called. As you can see, we are looking for a command called `refresh`. If received, it will print `L1` (Line One) and `L2` (Line Two) to the LCD screen. This allows us to easily edit and control what the screen displays with out having to continuously flash the device with new firmware.

When sending larger payloads, you may have to [change a parameter to allow MQTT to send larger packet sizes.](https://forums.losant.com/t/sending-commands-with-larger-payloads/135)

We have the inside temperature data - this is the temperature displayed in the Serial output. Now, we need to get the outside weather and time to display it. We will use a <a href="/workflows/overview/" target="_blank">workflow</a> for this.

### Create a Workflow

Workflows are the primary way for your devices to communicate with each other and other services. Workflows allow you to trigger notifications, create events, send commands, and many more. Workflows are basically the brains of your connected solution.

**First, create a new workflow and name it whatever you want.**

![Create Workflow](/images/getting-started/losant-iot-dev-kits/lcd-kit/create-workflow.png "Create Workflow")

### Import Workflow

As a way to get up and running as fast as possible, we've provided you a workflow you can import. In the firmware zip file you downloaded earlier, there is a file named `lcd-weather-station.flow`. Import this file into your workflow using the import tools on the workflow properties panel.

![Import Workflow](/images/getting-started/losant-iot-dev-kits/lcd-kit/import-workflow.png "Import Workflow")

Once imported, your workflow should look like the following:

![Imported Workflow](/images/getting-started/losant-iot-dev-kits/lcd-kit/imported-workflow.png "Imported Workflow")

### Workflow Overview

Let's talk about how this workflow works. All workflows start with a trigger. For this example, we have three triggers. When<a href="https://docs.losant.com/workflows/triggers/on-connect/" target="_blank"> the device is started</a>, we want to grab the weather and send it down to the device. We also need a <a href="https://docs.losant.com/workflows/triggers/timer/" target="_blank"> timer</a> to send data periodically. Lastly, we can configure a <a href="https://docs.losant.com/workflows/triggers/virtual-button/" target="_blank"> button</a> to send the data on demand. We simply want this workflow to run and send time and weather data to our device.

### Node Errors

You'll notice that there are two nodes that have small error icons: the `On Connect` trigger and the `Device Command` output. These have errors because they need a device to be configured. Click on each of them and select your device from the dropdown. The two nodes should be configured for the same device.

![Nodes with Errors](/images/getting-started/losant-iot-dev-kits/lcd-kit/nodes-with-errors.png "Nodes with Errors")

Lets walkthrough the other nodes and make sure that they are properly configured.

### Timer

A <a href="https://store.losant.com/products/losant-lcd-kit" target="_blank">Timer</a> node will trigger on a interval you define.

![Workflow Timer](/images/getting-started/losant-iot-dev-kits/lcd-kit/workflow-timer.png "Workflow Timer")

For reasons explained later, we will use this workflow to simulate time. So, we need it to run once a minute.

### HTTP

The HTTP node allows us to connect to external services. To get the outside weather data, we can use the <a href="https://darksky.net/dev/" target="_blank">Dark Sky API</a>.

![Workflow HTTP](/images/getting-started/losant-iot-dev-kits/lcd-kit/workflow-http.png "Workflow HTTP")

#### Sign up for Dark Sky API

<a href="https://darksky.net/dev/register" target="_blank">Signing up</a> for the Dark Sky API is extremely simple and only requires an email address. Once you sign up you'll be provided an API key. Keep this handy for future steps. This API key gives you 1,000 requests free each day, which is more than enough for this application.

![Dark Sky API Key](/images/getting-started/walkthrough/dark-sky-api-key.png "Dark Sky API Key")

No, sorry, the API key in the above screenshot won't work.

Click the HTTP node to configure it. There are two important configuration options for the HTTP node. The first is the URL and the second is where to store the result. The URL will be Dark Sky's API endpoint:

```
https://api.darksky.net/forecast/APIKEY/LATITUDE,LONGITUDE
```

The `APIKEY` should be replaced by the key you obtained in step 1 after registering for Dark Sky. The `LATITUDE` and `LONGITUDE` are the coordinates, in decimal degrees, of the location to request. <a href="http://mygeoposition.com" target="_blank">MyGeoPosition.com</a> is a neat tool to get these coordinates if you don't have them handy. Here's the coordinates of Losant's headquarters if you'd like to use these:

```
https://api.darksky.net/forecast/APIKEY/39.1119359,-84.51254
```

The second required configuration parameter for this HTTP node is the location on the payload to put the result. Workflows work by passing a payload through each node in the workflow. Nodes can add, remove, or modify the payload as needed as it flows through them. In this case, we're going to add a `weather` field to the payload that will hold the response from the Dark Sky API.

### Function

The NodeMCU does not have an internal clock. So, keeping time is a little challenging. It is possible to configure it to be synced with an <a href="https://en.wikipedia.org/wiki/Network_Time_Protocol" target="_blank">NTP server</a> but, for time's sake, we can simulate time in a workflow. Losant has a <a href="https://docs.losant.com/workflows/logic/function/" target="_blank">Function</a> node that we can use to run our own JavaScript to get the time.

![Workflow Function](/images/getting-started/losant-iot-dev-kits/lcd-kit/workflow-function.png "Workflow Function")

In our Function node, we have this code:

```javascript
var d = new Date();
d.setHours(d.getHours() - 5); // Time is in UTC. So, we subtract 5 to get the correct time. Five is the offset for EST time.
d = d.toLocaleTimeString().replace(/:\d+ /, ' '); // current time, e.g. "1:54 PM"

payload.time = d // append time to payload
```

Time is now appended to our payload to send later.

### Math

In many situations, we need to do some simple calculations to our data before sending it some where else. In this case, since we have limited space on the LCD screen, we want our temperatures to be whole numbers, not decimals. Losant provides a <a href="https://docs.losant.com/workflows/logic/math/" target="_blank">Math</a> node to solve this problem.

![Workflow Math](/images/getting-started/losant-iot-dev-kits/lcd-kit/workflow-math.png "Workflow Math")

In our math node, we can round the temperature:

`round({{ weather.body.currently.temperature }})`

`weather.body.currently.temperature` will now be rounded in our payload.

### Device Command

Now that we have all the data, we need to format it and send it to the device. For this purpose, we use the <a href="http://localhost:8000/workflows/outputs/device-command/" target="_blank">Device Command node</a>.

![Workflow Device Command](/images/getting-started/losant-iot-dev-kits/lcd-kit/workflow-device-command.png "Workflow Device Command")

As seen earlier, we need to send the device `L1` and `L2`. In this node we can configure a JSON payload that contains both:

```
{
  "L1": "{{ time }}      {{ weather.body.currently.temperature }}",
  "L2": "{{weather.body.currently.summary}} "
}
```
### Deploy

With all fields configured you can now deploy this workflow and begin sending data to your device.

![Deploy Workflow](/images/getting-started/losant-iot-dev-kits/lcd-kit/deploy-workflow.png "Deploy Workflow")

Once you deploy, after one minute, you should see the weather information being displayed on the LCD.

![Kit Complete](/images/getting-started/losant-iot-dev-kits/lcd-kit/kit-complete.jpg "Kit Complete")

## 7. What's next?

This workflow is just a starting point. Losant can connect this device to many different outputs and other 3rd-party services. As an additional challenge, see if you can figure out how to Slack a message to your office whenever it gets to hot.

Since the firmware accepts line one and line two, you can send it any data for all different types of projects!

<a href="https://twitter.com/share" class="twitter-share-button" data-url="https://store.losant.com/products/lcd-kit" data-text="Just installed my @LosantHQ  #IoT LCD kit" data-size="large">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

Don't stop now! Losant has several kits available.

1. Losant Builder Kit ( [Buy Now](https://store.losant.com/products/losant-builder-kit) | [Instructions](/getting-started/losant-iot-dev-kits/builder-kit/) )
1. Moisture Sensor Kit ( [Buy Now](https://store.losant.com/products/losant-moisture-sensor-kit) | [Instructions](/getting-started/losant-iot-dev-kits/moisture-sensor-kit/) )
1. Door Sensor Kit ( [Buy Now](https://store.losant.com/products/losant-door-sensor-kit) | [Instructions](/getting-started/losant-iot-dev-kits/door-sensor-kit/) )
1. LCD Kit ( [Buy Now](https://store.losant.com/products/lcd-kit) | [Instructions](/getting-started/losant-iot-dev-kits/lcd-kit/) )
