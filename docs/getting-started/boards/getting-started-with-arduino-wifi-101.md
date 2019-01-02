---
description: Learn more about using the Arduino WiFi 101 Shield with Losant.
---

# Getting Started with the Arduino WiFi 101 Shield

This guide demonstrates how to connect Arduino hardware using the <a href="https://www.arduino.cc/en/Main/ArduinoWiFiShield101" target="\_blank">Arduino WiFi 101 Shield</a> to the <a href="https://www.losant.com" target="\_blank">Losant Enterprise IoT Platform</a>.

## Supported Boards

The [Losant library](https://github.com/Losant/losant-mqtt-arduino) and dependencies are supported on a wide variety of Arduino boards, including:

* [Arduino Zero](https://www.arduino.cc/en/Main/ArduinoBoardZero)
* [Arduino 101](https://www.arduino.cc/en/Main/ArduinoBoard101)

### Not Supported

* [Arduino Uno](https://www.arduino.cc/en/Main/ArduinoBoardUno) - Currently the Uno does not have enough memory to support both the WiFi 101 Shield and Losant libraries.

## Configuring the Arduino IDE

Follow the specific instructions for your Arduino board to properly configure the Arduino IDE.

## Install Dependencies

To successfully use the Wifi Shield, the <a href="https://www.arduino.cc/en/Reference/WiFi101" target="\_blank">WiFi 101 library</a> is needed. The Losant MQTT Client requires two libraries to be installed: [PubSubClient](https://github.com/knolleary/pubsubclient) and [ArduinoJson](https://github.com/bblanchon/ArduinoJson). All of these libraries can be installed using the Arduino Library Manager.

![Manage Libraries](https://cdn2.hubspot.net/hubfs/742943/Website/Landing_Pages/Builder_Kit_Instructions/manage-libraries.png?noresize=true "Manage Libraries")

The first required library is the <a href="https://www.arduino.cc/en/Reference/WiFi101" target="\_blank">WiFi 101 library</a>. Type that in the filter field, select the entry in the list and install the latest version.

![Install Wifi 101 Library](/images/getting-started/boards/wifi-library.png "Install Wifi 101 Library")

The next library is PubSubClient. Type that in the filter field, select the entry in the list and install the latest version.

![Install PubSubClient](/images/getting-started/losant-iot-dev-kits/environment-setup/install-pubsubclient.png "Install PubSubClient")

The next library is ArduinoJson. Repeat the same process again, and install the latest version of ArduinoJson.

![Install ArduinoJson](/images/getting-started/losant-iot-dev-kits/environment-setup/install-arduinojson.png "Install ArduinoJson")

## Install Losant MQTT Client

The [Losant Arduino MQTT Client](https://github.com/Losant/losant-mqtt-arduino) makes it easy to connect your Arduino-based devices to the Losant Platform.

Download a zip of the library from the following URL:

[https://github.com/Losant/losant-mqtt-arduino/archive/master.zip](https://github.com/Losant/losant-mqtt-arduino/archive/master.zip)

Once downloaded, add the library to your Arduino installation by using the Sketch -> Include Library -> Add .ZIP Library menu.

![Add .Zip Library Menu](https://cdn2.hubspot.net/hubfs/742943/Website/Landing_Pages/Builder_Kit_Instructions/add-zip-library-menu.png?noresize=true "Add .ZIP Library Menu")

You can now use the library by adding the following include statement to your sketch:

```arduino
#include <Losant.h>
```

### Create a Device In Losant

We need to register your device with the platform. Log in, Click the `Add Device` button on the top right or select `Add Device` from the Devices dropdown.

![Add Device Menu](/images/getting-started/losant-iot-dev-kits/builder-kit/add-device-menu.png "Add Device Menu")

Next, choose the `Create from Scratch` option.

![Create From Scratch](/images/getting-started/losant-iot-dev-kits/moisture-sensor/add-from-scratch.png "Create From Scratch")

Click the `Create Device` button. The screen will change and show the device’s ID. This ID is required for the following sections. You might want to copy/paste it somewhere convenient.

### Generate An Access Key

Now we need to generate an [access key](/applications/access-keys/) so your device can authenticate against the Losant Platform. Select `Security` from the application menu bar, and then `Device Access Keys` from the left navigation. Then click `Add Access Key`.

![Access Keys](/images/getting-started/losant-iot-dev-kits/builder-kit/access-keys.png "Access Keys")

For these workshops, generate an access key that provides access to all devices in your application.

![Token Restrictions](/images/getting-started/losant-iot-dev-kits/builder-kit/token-restrictions.png "Token Restrictions")

This will cause a popup to appear with your access tokens. Losant ***DOES NOT*** store the secret, so you’ll have to copy it somewhere secure. Both of these values will be needed in the following sections, so make sure you copy/paste them somewhere convenient.

![Access Token Popup](/images/getting-started/losant-iot-dev-kits/builder-kit/access-token-popup.png "Access Token Popup")

## Connecting to Losant

Connecting to Losant with the Arduino WiFi 101 Shield involves two steps. The first is to connect the shield to the WiFi network, and the second is to connect your device to Losant. Lets create a new sketch in Arduino:

```arduino
#include <WiFi101.h>
#include <Losant.h>

// WiFi credentials.
const char* WIFI_SSID = "my-wifi-ssid";
const char* WIFI_PASS = "my-wifi-pass";

// Losant credentials.
const char* LOSANT_DEVICE_ID = "my-device-id";
const char* LOSANT_ACCESS_KEY = "my-access-key";
const char* LOSANT_ACCESS_SECRET = "my-access-secret";

// Create a secure WiFi client. This can also be an instance of the unsecured
// WiFiClient class, but the secure TLS client is recommended.
WiFiSSLClient wifiClient;

// Create an instance of a Losant device.
LosantDevice device(LOSANT_DEVICE_ID);

// Connects to WiFi and then to the Losant Platform.
void connect() {

  // Connect to WiFi.
  Serial.print("Connecting to ");
  Serial.println(WIFI_SSID);

  WiFi.begin(WIFI_SSID, WIFI_PASS);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println();
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  // Connect to Losant.
  Serial.println();
  Serial.print("Connecting to Losant...");

  // Connect the device instance to Losant using TLS encryption.
  device.connectSecure(wifiClient, LOSANT_ACCESS_KEY, LOSANT_ACCESS_SECRET);

  while(!device.connected()) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("Connected!");
}

void setup() {
  Serial.begin(115200);
  while(!Serial) { }

  connect();
}

void loop() {

  bool toReconnect = false;

  if(WiFi.status() != WL_CONNECTED) {
    Serial.println("Disconnected from WiFi");
    toReconnect = true;
  }

  if(!device.connected()) {
    Serial.println("Disconnected from Losant");
    toReconnect = true;
  }

  if(toReconnect) {
    connect();
  }

  device.loop();
}
```

Most of this code is boilerplate [WiFi 101 connection logic](https://www.arduino.cc/en/Guide/ArduinoWiFiShield101). The Losant specific code is in two places:

```arduino
// Connect the device instance to Losant using TLS encryption.
device.connectSecure(wifiClient, LOSANT_ACCESS_KEY, LOSANT_ACCESS_SECRET);
```

This line uses the WiFiClientSecure instance to connect your device to the Losant Platform. The access key and access secret can be obtained through Losant's web portal.

```arduino
device.loop()
```

This loops the underlying WiFiClientSecure instance and performs the necessary communication between the device and Losant. This loop call must be invoked periodically, no less often than once a second.

That is all that's required to connect your device to Losant. Next, now we can send and receive data from Losant to put our device to use.

## Sending State

[State](/devices/state/) represents a snapshot of the device at a point in time. Frequently, a state will be data from a sensor. The [Arduino 101](https://www.arduino.cc/en/Main/ArduinoBoard101) has an onboard accelerometer, which could be the state that gets sent to Losant.

In this example, we will use a <a href="https://www.adafruit.com/product/165" target="_blank">temperature probe</a> connected to the analog input, A0. The state of a device is defined using one or more attributes. A device's state attributes are defined when the device is registered using Losant's web portal. This example will send a state update to Losant every 15 seconds with the "temperature" attribute. You will need to update the device you created earlier to accept this attribute

```arduino

int lastUpdate = millis();

void loop() {

  // Every 15 seconds.
  if(millis() - lastUpdate > 15000) {

    // Read the analog input. Typically this will also involve some math
    // to convert the voltage to a temperature, which is specific to the
    // temperature sensor being used.
    int temp = analogRead(A0);

    // Build a JSON object with the state to report.
    StaticJsonBuffer<200> jsonBuffer;
    JsonObject& state = jsonBuffer.createObject();
    state["temperature"] = temp;

    // Report the state to Losant.
    device.sendState(state);

    lastUpdate = millis();
  }
}

```

Losant uses JSON payloads when reporting state. The above example maps to the JSON object `{ "temperature": value }`. Losant uses the [ArduinoJson](https://github.com/bblanchon/ArduinoJson) library to efficiently build JSON state payloads. The Losant header file automatically includes the ArduinoJson header file, so there's no need to explicitly include it in your sketch.

## Receiving Commands

[Commands](/devices/commands/) are sent from Losant to your device and act as a way to instruct the device to take some kind of action. Commands include a name and an optional JSON payload.

Let's assume that we had a camera attached to our device and we needed to dynamically update resolution when the camera starts. An example command could be "start recording" with a payload of `{ "resolution": 1080 }`.

```arduino
// Command callback function. Invoked whenever this device receives
// a command from the Losant Platform.
void handleCommand(LosantCommand *command) {
  Serial.print("Command received: ");
  Serial.println(command->name);

  // Optional command payload. May not be present on all commands.
  JsonObject& payload = *command->payload;

  // Perform action specific to the command received.
  if(strcmp(command->name, "start recording") == 0) {
    int resolution = payload["resolution"];
  }
}

void setup() {

  ...

  // Pass the command handler function to the device.
  // Only one command handler can be specified.
  device.onCommand(&handleCommand);
}
```

What command names are supported and what the payloads include is entirely up to your device firmware and your specific application needs.

## Additional Examples

For additional Arduino examples, please refer to the [examples](https://github.com/Losant/losant-mqtt-arduino/tree/master/examples) folder of the [Losant Arduino MQTT Client](https://github.com/Losant/losant-mqtt-arduino) repository.
