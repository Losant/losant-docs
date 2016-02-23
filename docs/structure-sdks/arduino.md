# Arduino SDK

The Structure Arduino SDK is a C++ library designed to work on a variety of Arduino compatible boards. The library is open source and <a href="https://github.com/GetStructure/structure-sdk-arduino" target="_blank">available on GitHub</a>.

Below is a basic example for connecting and Arduino board with an Arduino 101 WiFi Shield.

```arduino
#include <WiFi101.h>
#include <Structure.h>

// WiFi credentials.
const char* WIFI_SSID = "WIFI_SSID";
const char* WIFI_PASS = "WIFI_PASS";

// Structure credentials.
const char* STRUCTURE_DEVICE_ID = "my-device-id";
const char* STRUCTURE_ACCESS_KEY = "my-app-key";
const char* STRUCTURE_ACCESS_SECRET = "my-app-secret";

const int BUTTON_PIN = 14;
const int LED_PIN = 12;

bool ledState = false;

WiFiSSLClient wifiClient;

StructureDevice device(STRUCTURE_DEVICE_ID);

// Toggles and LED on or off.
void toggle() {
  Serial.println("Toggling LED.");
  ledState = !ledState;
  digitalWrite(LED_PIN, ledState ? HIGH : LOW);
}

// Called whenever the device receives a command from the Structure platform.
void handleCommand(StructureCommand *command) {
  Serial.print("Command received: ");
  Serial.println(command->name);

  if(strcmp(command->name, "toggle") == 0) {
    toggle();
  }
}

void connect() {

  WiFi.begin(WIFI_SSID, WIFI_PASS);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  // Connect to Structure.
  device.connectSecure(wifiClient, STRUCTURE_ACCESS_KEY, STRUCTURE_ACCESS_SECRET);

  while(!device.connected()) {
    delay(500);
  }
}

void setup() {
  Serial.begin(115200);
  delay(100);
  pinMode(BUTTON_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);

  // Register the command handler to be called when a command is received
  // from the Structure platform.
  device.onCommand(&handleCommand);

  connect();
}

void buttonPressed() {
  Serial.println("Button Pressed!");

  // Structure uses a JSON protocol. Construct the simple state object.
  // { "button" : true }
  StaticJsonBuffer<200> jsonBuffer;
  JsonObject& root = jsonBuffer.createObject();
  root["button"] = true;

  // Send the state to Structure.
  device.sendState(root);
}

int buttonState = 0;

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

  int currentRead = digitalRead(BUTTON_PIN);

  if(currentRead != buttonState) {
    buttonState = currentRead;
    if(buttonState) {
      buttonPressed();
    }
  }

  delay(100);
}
```

Please refer to the <a href="https://github.com/GetStructure/structure-sdk-arduino" target="_blank">repository</a> for detailed documentation and examples.
