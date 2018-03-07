# Device Commands

Device commands allow you to instruct your device to take some kind of action. Commands include a name and an optional payload. It's then up to the device's firmware to take the appropriate action based on the command and payload.

![Command Diagram](/images/devices/command-diagram.png "Command Diagram")

## Sending Commands

Commands are typically invoked from Losant workflows. Another common way to invoke commands is using the Losant API from a custom interface like a mobile app. For example, a thermostat may have a companion mobile app that allows the user to remotely set the temperature. The developer would then send a command over the Losant REST API to set the temperature. The device will then receive the command and take the appropriate action, which is likely to turn on or off the furnace or air conditioner.

Losant workflows provide a way to easily send commands to devices based on any number of triggers. The example below will send a command to a thermostat to disable "away" mode when a person is detected by a separate smoke detector device that has a motion sensor.

![Away Mode Workflow](/images/devices/away-mode-workflow.png "Away Mode Workflow")

In the above example, the smoke detector is reporting state whenever motion is detected or not. The condition node checks that motion is detected. The condition might look something like `{{ data.motion }} == true`. If motion is detected, it then sends a command to the thermostat to disable its "away" mode. The command name is `set-away` and the payload is `{ "away" : false }`.

Command names and payloads can be anything. It's entirely up the device and its firmware for what commands will be supported.

## Handling Commands

Commands can currently only be received over an [MQTT connection](/mqtt/overview/#subscribing-to-commands) to Losant. The Losant MQTT clients make connecting and receiving commands very easy for custom devices. All commands contain a name and an optional payload, sent as a JSON string that takes the following form:

```json
{
  "name" : "the-command-name",
  "payload" : {
    "key": "value",
    "another-key": "another-value"
  }
}
```

Below is an example of using the Losant Arduino MQTT client to handle a command and turn on an LED.

```arduino
// Called whenever the device receives a command from the Losant Platform.
void handleCommand(LosantCommand *command) {
  Serial.print("Command received: ");
  Serial.println(command->name);
  if(strcmp(command->name, "turn-on-led") == 0) {
    digitalWrite(LED_PIN, 1);
  }
}

LosantDevice device("my-device-id");
device.connectSecure(wifiClient, "my-access-key", "my-access-secret");

// Subscribe to commands.
device.onCommand(&handleCommand);
```

If you wish to send a payload with your commands, that value can be accessed and passed on to your handlers as well.

```arduino
void handleCommand(LosantCommand *command) {
  JsonObject& payload = *command->payload;
  payload.printTo(Serial); // print the entire payload
  Serial.println(payload['key']); // print the 'key' property of the payload object
}
```

Note: If you are sending payloads of even moderate size, and your commands are failing to reach your microcontroller, it may be necessary to adjust the MQTT's maximum packet size. Add the following line in your sketch:

```arduino
#define MQTT_MAX_PACKET_SIZE 256
```

### Handling Commands on Edge Compute Devices

You can also send commands to [Edge Compute](/devices/edge-compute/) devices that are running the Losant Edge Agent. In that case, responding and acting on commands is as easy as designing workflows with the [Device Command Trigger](/workflows/triggers/device-command/) and deploying them to the relevant devices. That trigger will fire whenever the device receives a command, and the command will be available on the workflow payload.
