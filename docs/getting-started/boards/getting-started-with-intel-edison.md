# Getting Started with the Intel Edison

The <a href="http://www.intel.com/content/www/us/en/do-it-yourself/edison.html" target="_blank">Intel Edison</a> is a very capable compute module that runs Linux. It's an ideal IoT device because it has built-in WiFi and Bluetooth connectivity. This guide will cover how to connect an Intel Edison to the Losant Developer Platform.

## Setup the Edison and XDK

The Edison requires some setting up before it's ready to use. Follow our <a href="https://www.losant.com/blog/getting-started-with-the-intel-edison" target="_blank">setup guide</a> to flash and connect the Edison to your WiFi network.

Next, follow <a href="https://software.intel.com/en-us/intel-xdk-iot-edition-guide" target="_blank">Intel's instructions</a> for installing, configuring, and connect the Intel XDK to the Edison board.

![Install XDK](/images/getting-started/boards/install-xdk.png "Install XDK")

Be sure to enable the `Intel XDK IoT Edition` in the options. At the time of this writing, the installer also installs v1.6.5 of the Arduino IDE, which is not the latest. The Arduino IDE is not needed to program the Edison, but if you'd like it anyway, we recommend installing the latest directly from <a href="https://www.arduino.cc/en/Main/Software" target="_blank">Arduino</a>.

## Programming the Edison

Create a new project using the Intel XDK. Losant provides an open source <a href="https://github.com/Losant/losant-mqtt-js" target="_blank">JavaScript MQTT Client</a> that can be used to easily connect the Edison to the Losant platform.

Add the `losant-mqtt` module to the package.json dependencies.

```json
{
  "name": "MyEdisonProject",
  "description": "",
  "version": "0.0.0",
  "main": "main.js",
  "engines": {
    "node": ">=0.10.0"
  },
  "dependencies": {
    "losant-mqtt" : "^1.0.0"
  }
}
```

## Connecting to Losant

To connect your device to Losant, simply create an instance of the Device object, pass it your access keys, and call connect.

```javascript
var Device = require('losant-mqtt').Device;

// Construct a device instance.
var device = new Device({
  id: 'my-device-id',
  key: 'my-access-key',
  secret: 'my-access-secret'
});

// Connect device to Losant.
device.connect();
```

The device ID is obtained by first adding your [device](/devices/overview/) to your Losant application. [Access keys](/applications/access-keys/) allow you to grant access on a per-device or per-application basis.

## Sending State

Once the device is connected you can begin reporting [state](/devices/state/). For this example, the Edison will report the value of a TMP36 temperature sensor every one second.

```javascript
// Reading temperature from analog input.
var temp = new mraa.Aio(0);

// Once a second, read the temp and report to Losant.
setInterval(function() {

  // Read temp voltage and convert.
  var tempRaw = temp.read();
  var degreesC = (((tempRaw / 1024) * 5) - 0.52) * 100;
  var degreesF = degreesC * 1.8 + 32;

  console.log(degreesC);
  console.log(degreesF);

  // Report state to Losant.
  device.sendState({ temp: degreesF });

}, 1000);
```

## Handling Commands

[Commands](/devices/commands/) allow you to instruct your device to take some kind of action. Commands include a name and an optional payload. Subscribing to commands is done by attaching the `command` event listener.

```javascript
// Attach event listener for commands.
device.on('command', function(command) {
  console.log(command.name);
  console.log(command.payload);
});
```

The full source for this examples can be found on the Losant <a href="https://github.com/Losant/losant-mqtt-js" target="_blank">JavaScript MQTT Client</a> GitHub repository.
