# Getting Started with the Arduino WiFi 101 Shield

This guide demonstrates how to connect to the [Losant IoT developer platform](https://www.losant.com) using the [Arduino WiFi 101 Shield](https://www.arduino.cc/en/Main/ArduinoWiFiShield101).

## Supported Boards
The [Losant library](https://github.com/Losant/losant-sdk-arduino) and dependencies are supported on a wide variety of Arduino boards, including the [Arduino Zero](https://www.arduino.cc/en/Main/ArduinoBoardZero) and [Arduino 101](https://www.arduino.cc/en/Main/ArduinoBoard101). Currently the [Arduino Uno](https://www.arduino.cc/en/Main/ArduinoBoardUno) does not have enough memory to support both the WiFi 101 Shield and Losant libraries.

## Arduino IDE
Follow the specific instructions for your Arduino board to properly configure the Arduino IDE. Adding the WiFi 101 library to the IDE can be done using the Arduino Library Manager.

## Install Losant Arduino SDK Dependencies
The Losant SDK requires two libraries to be installed: [PubSubClient](https://github.com/knolleary/pubsubclient) and [ArduinoJson](https://github.com/bblanchon/ArduinoJson). Both of these libraries can be installed using the Arduino Library Manager.

![Manage Libaries](http://cdn2.hubspot.net/hubfs/742943/Website/Landing_Pages/Builder_Kit_Instructions/manage-libraries.png?noresize=true "Manage Libaries")

## Install Losant Arduino SDK
The [Losant Arduino SDK](https://github.com/Losant/losant-sdk-arduino) makes it easy to connect your Arduino-based devices to the Losant platform.

Download a zip of the library from the following URL:

[https://github.com/Losant/losant-sdk-arduino/archive/master.zip](https://github.com/Losant/losant-sdk-arduino/archive/master.zip)

Once downloaded, add the library to your Arduino installation by using the Sketch -> Include Library -> Add .ZIP Library menu.

![Add .Zip Library Menu](http://cdn2.hubspot.net/hubfs/742943/Website/Landing_Pages/Builder_Kit_Instructions/add-zip-library-menu.png?noresize=true "Add .ZIP Library Menu")

You can now use the library by adding the following include statement to your sketch:

```arduino
#include <Losant.h>
```

## Connecting to Losant
Connecting to Losant with the Arduino WiFi 101 Shield involves two steps. The first is to connect the shield to the WiFi network, and the second is to connect your device to Losant.

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

// Connects to WiFi and then to the Losant platform.
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

This line uses the WiFiClientSecure instance to connect your device to the Losant platform. The access key and access secret can be obtained through Losant's web portal.

```arduino
device.loop()
```

This loops the underlying WiFiClientSecure instance and performs the necessary communication between the device and Losant. This loop call must be invoked periodically, no less often than once a second.

## Sending State
[State](/devices/state) represents a snapshot of the device at a point in time. This example will use a temperature probe connected to the analog input, A0. The state of a device is defined using one or more attributes. A device's state attributes are defined when the device is registered using Losant's web portal. This example will send a state update to Losant every 15 seconds with the "temperature" attribute.

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

    // Report the state to Losant.
    device.sendState(state);

    lastUpdate = millis();
  }
}

```

Losant uses JSON payloads when reporting state. The above example maps to the JSON object `{ "temperature": value }`. Losant uses the [ArduinoJson](https://github.com/bblanchon/ArduinoJson) library to efficiently build JSON state payloads. The Losant header file automatically includes the ArduinoJson header file, so there's no need to explicitly include it in your sketch.

## Receiving Commands
[Commands](/devices/commands) are sent from Losant to your device and act as a way to instruct the device to take some kind of action. Commands include a name and an optional JSON payload. An example command could be "start recording" with a payload of `{ "resolution": 1080 }`.

```arduino
// Command callback function. Invoked whenever this device receives
// a command from the Losant platform.
void handleCommand(LosantCommand *command) {
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

What command names are supported and what the payloads include is entirely up to your device firmware and your specific application needs.

## Additional Examples
For additional Arduino examples, please refer to the [examples](https://github.com/Losant/losant-sdk-arduino/tree/master/examples) folder of the [Losant Arduino SDK](https://github.com/Losant/losant-sdk-arduino) repository.
