# Getting Started with the Raspberry Pi

The <a href="https://www.raspberrypi.org/" target="\_blank">Raspberry Pi</a> is a very popular compute module commonly used in IoT-related projects. This guide covers how to connect the Raspberry Pi to the Losant Platform.

The example for this guide is a button that is connected to the GPIO on the Raspberry Pi. Whenever the button is pressed, a [state](/devices/state) message will be sent to the platform that can be used to trigger actions. To demonstrate device [commands](/devices/state), there is also an LED connected to GPIO that the platform can turn on and off.

The source code for this example is <a href="https://github.com/Losant/example-raspberry-pi" target="\_blank">available on GitHub</a>.

## Install Node.js on the Raspberry Pi

We're going to use the <a href="https://github.com/Losant/losant-mqtt-js" target="\_blank">Losant JavaScript MQTT Client</a> to connect the Raspberry Pi to the Losant Platform. Follow the instructions <a href="https://www.losant.com/blog/how-to-install-nodejs-on-raspberry-pi" target="\_blank">on our blog</a> to install Node.js.

## Install Dependencies

After a lot of research, we have found <a href="http://johnny-five.io/" target="\_blank">Johnny Five</a> to be the best library for working with the Raspberry Pi GPIO. It's very well maintained and works with the most recent versions of Node.js. Combined with the excellent <a href="https://github.com/rwaldron/johnny-five/blob/master/docs/raspi-io.md" target="\_blank">raspi-io</a> module, we can easily read and write to the Raspberry Pi's GPIO.

```sh
$ npm install --save johnny-five raspi-io losant-mqtt
```

Your package.json should look something like this:

```json
{
  ...
  "dependencies": {
    "johnny-five": "^0.9.26",
    "raspi-io": "^5.3.0",
    "losant-mqtt": "^1.0.3"
  }
}
```

## Wiring

The next step is to attach the LED and the button to the Raspberry Pi. The wiring here is pretty straightforward. The LED is attached to GPIO pin 23, and the button is attached to GPIO 21.

![Wiring](/images/getting-started/boards/raspberry-wiring.jpg "Wiring")

Refer to <a href="https://www.raspberrypi.org/documentation/usage/gpio-plus-and-raspi2/" target="\_blank">this documentation</a> for the GPIO numbering on the Raspberry Pi.

## Add Device to Losant

In Losant, <a href="https://accounts.losant.com/create-account" target="\_blank">create an account</a> and an [application](/applications/overview) if you haven't already.

Next, add a [new device](/devices/overview) for the Raspberry Pi. As mentioned before, this example only reports state when the button is pressed. So the only state attribute that's needed is `button`. Since a button usually just has an on/off value, set the data type to `Boolean`.

![Create Raspberry Device](/images/getting-started/boards/create-raspberry-pi-device.png "Create Raspberry Device")

Finally, create an [access key](/applications/access-keys), which you'll use to authenticate the device's connection.

## Send Button Presses

Now we need the Raspberry Pi to connect to Losant and begin sending state. Fortunately Johnny Five and the Losant MQTT Client make this simple.

```javascript
var five = require('johnny-five');
var raspi = require('raspi-io');

var Device = require('losant-mqtt').Device;

// Construct Losant device.
var device = new Device({
  id: 'my-device-id',
  key: 'my-access-key',
  secret: 'my-access-secret'
});

// Connect the device to Losant.
device.connect();

var board = new five.Board({
  io: new raspi()
});


board.on('ready', function() {

  // LED connected to GPIO pin 23.
  var led = new five.Led('GPIO23');

  // Button connected to GPIO 21.
  var button = new five.Button('GPIO21');

  // When the button is pressed.
  button.on('down', function() {

    // Send state to Losant.
    device.sendState({ button: true });
  });
});
```

We first create a Losant device and then a Johnny Five board. Johnny Five handles the detection of the button presses, which we simply send to Losant using `sendState`.

Once the states are being sent, [Losant workflows](/workflows/overview) allow you to trigger any number of useful actions. The below workflow will send an SMS message whenever the button is pressed.

![SMS Workflow](/images/getting-started/boards/raspberry-sms-workflow.png "SMS Workflow")

## Toggle the LED

Along with states, Losant also supports [commands](/devices/commands), which allow you instruct the device to take an action. For this example, the device will watch for a "toggle" command, which will cause it to toggle the LED.

```javascript
board.on('ready', function() {

  // LED connected to GPIO pin 23.
  var led = new five.Led('GPIO23');

  // Button connected to GPIO 21.
  var button = new five.Button('GPIO21');

  // When the button is pressed.
  button.on('down', function() {

    // Send state to Losant.
    device.sendState({ button: true });
  });

  // Hook the command event listener.
  device.on('command', function(command) {
    if(command.name === 'toggle') {
      led.toggle();
    }
  });
});
```

The relevant code has been added to the board's ready callback. To listen for commands, the Losant device will emit the 'command' event whenever one is received from the platform. If the command's name is "toggle" the LED is toggled.

A typical way to send commands is by using a Losant workflow. Below is an example that will send the "toggle" command whenever a virtual button is pressed.

![Command Workflow](/images/getting-started/boards/raspberry-commands.png "Command Workflow")

Whenever the button on the above workflow is clicked, it will send a command with the name "toggle" to the connected Raspberry Pi.
