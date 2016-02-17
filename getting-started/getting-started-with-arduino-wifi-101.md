Getting Started with the Arduino WiFi 101 Shield
============

This guide demonstrates how to connect to the [Structure IoT developer platform](https://getstructure.io) using the [Arduino WiFi 101 Shield](https://www.arduino.cc/en/Main/ArduinoWiFiShield101).

## Supported Boards
The Structure library and dependencies are supported on a wide variety of Arduino boards, including the [Arduino Zero](https://www.arduino.cc/en/Main/ArduinoBoardZero) and [Arduino 101](https://www.arduino.cc/en/Main/ArduinoBoard101). Currently the [Arduino Uno](https://www.arduino.cc/en/Main/ArduinoBoardUno) does not have enough memory to support both the WiFi 101 Shield and Structure libraries.

## Arduino IDE
Follow the specific instructions for your Arduino board to properly configure the Arduino IDE. Adding the WiFi 101 library to the IDE can be done using the Arduino Library Manager.

## Install Structure Arduino SDK Dependencies
The Structure SDK requires two libraries to be installed: [PubSubClient](https://github.com/knolleary/pubsubclient) and [ArduinoJson](https://github.com/bblanchon/ArduinoJson). Both of these libraries can be installed using the Arduino Library Manager.

![Manage Libaries](http://cdn2.hubspot.net/hubfs/742943/Website/Landing_Pages/Builder_Kit_Instructions/manage-libraries.png?noresize=true "Manage Libaries")

![Install PubSubClient](http://cdn2.hubspot.net/hubfs/742943/Website/Landing_Pages/Builder_Kit_Instructions/install-pubsubclient.png?noresize "Install PubSubClient")

![Install ArduinoJson](http://cdn2.hubspot.net/hubfs/742943/Website/Landing_Pages/Builder_Kit_Instructions/install-arduinojson.png?noresize=true "Install ArduinoJson")

## Install Structure Arduino SDK
The [Structure Arduino SDK](https://github.com/GetStructure/structure-sdk-arduino) makes it easy to connect your Arduino-based devices to the Structure platform.

Download a zip of the library from the following URL:

https://github.com/GetStructure/structure-sdk-arduino/archive/master.zip

Next, add the library to your Arduino installation by using the Sketch -> Include Library -> Add .ZIP Library menu.

![Add .Zip Library Menu](http://cdn2.hubspot.net/hubfs/742943/Website/Landing_Pages/Builder_Kit_Instructions/add-zip-library-menu.png?noresize=true "Add .ZIP Library Menu")

You can now use the library by adding the following include in your sketch:

```arduino
#include <Structure.h>
```

## Connecting to Structure
Connecting to Structure with the Arduino WiFi 101 Shield involves two steps. The first is to connect the shield to the WiFi network. The second is to connect your device to Structure.

```arduino
#include <WiFi101.h>
#include <Structure.h>

// WiFi credentials.
const char* WIFI_SSID = "my-wifi-ssid";
const char* WIFI_PASS = "my-wifi-pass";

// Structure credentials.
const char* STRUCTURE_DEVICE_ID = "my-device-id";
const char* STRUCTURE_ACCESS_KEY = "my-access-key";
const char* STRUCTURE_ACCESS_SECRET = "my-access-secret";

// Create a secure WiFi client. This can also be an instance of the unsecured
// WiFiClient class, but the secure TLS client is recommended.
WiFiClientSecure wifiClient;

// Create an instance of a Structure device.
StructureDevice device(STRUCTURE_DEVICE_ID);

// Connects to WiFi and then to the Structure platform.
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

  // Connect to Structure.
  Serial.println();
  Serial.print("Connecting to Structure...");

  // Connect the device instance to Structure using TLS encryption.
  device.connectSecure(wifiClient, STRUCTURE_ACCESS_KEY, STRUCTURE_ACCESS_SECRET);

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
    Serial.println("Disconnected from Structure");
    toReconnect = true;
  }

  if(toReconnect) {
    connect();
  }

  device.loop();
}
```

Most of this code is boilerplate [WiFi 101 connection logic](https://www.arduino.cc/en/Guide/ArduinoWiFiShield101). The Structure specific code is only in two places.

```arduino
// Connect the device instance to Structure using TLS encryption.
device.connectSecure(wifiClient, STRUCTURE_ACCESS_KEY, STRUCTURE_ACCESS_SECRET);
```

This line uses the WiFiClientSecure client to connect your device to the Structure platform. The access key and access secret can be obtained through Structure's web portal.

```arduino
device.loop()
```

This loops the underlying WiFiClientSecure and performs the necessary communication between the device and Structure. This loop call must be invoked periodically, no less often than once a second.

## Sending State
State represents a snapshot of the device at some point in time. This example will use a temperature probe connected to analog input A0. The state of a device is defined as one more attributes. A device's state attributes are defined when the device is registered using Structure's web portal. This example will send a state update to Structure every 15 seconds with the "temperature" attribute.

```arduino

int lastUpdate = millis();

void loop() {

  // Every 15 seconds.
  if(millis() - lastUpdate > 15000) {

    // Read the analog input. Typically this will also involve some math
    // to convert the voltage to a temperature, which is specific to the
    // temperature sensor being used.
    int temp = analogRead(A0);

    // Build a json object with the state to report.
    StaticJsonBuffer<200> jsonBuffer;
    JsonObject& state = jsonBuffer.createObject();
    state["temperature"] = temp;

    // Report the state to Structure.
    device.sendState(state);

    lastUpdate = millis();
  }
}

```

Structure uses JSON payloads when reporting state. The above example maps to a JSON object that looks like `{ "temperature": value }`. Structure uses the [ArduinoJson](https://github.com/bblanchon/ArduinoJson) to efficiently build JSON state payloads. The Structure header file automatically includes the ArduinoJson header file, so there's no need to explicitly include it as well.

## Receiving Commands
Commands are sent from Structure to your device. Commands include a name and an optional JSON payload. An example command could be "start recording" with a payload of `{ "resolution": 1080 }`.

```arduino
// Command callback function. Invoked whenever this device receives
// a command from the Structure platform.
void handleCommand(StructureCommand *command) {
  Serial.print("Command received: ");
  Serial.println(command->name);

  // Optional command payload. May not be present on all commands.
  JsonObject& payload = command->payload;

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

## Additional Examples
For additional Arduino examples, please refer to the [examples](https://github.com/GetStructure/structure-sdk-arduino/tree/master/examples) folder of the [Structure Arduino SDK](https://github.com/GetStructure/structure-sdk-arduino) repository.

Copyright (c) 2016 Structure. All rights reserved.
