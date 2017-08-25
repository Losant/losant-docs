# Getting Started with the Raspberry Pi

The <a href="https://www.raspberrypi.org/" target="\_blank">Raspberry Pi</a> is a very popular compute module commonly used in IoT-related projects. This guide covers how to connect the Raspberry Pi to the Losant IoT Platform.

![Raspberry Pi Image](/images/getting-started/boards/raspberry-pi.jpg "Raspberry Pi Image")

The example for this guide is a button that is connected to the GPIO on the Raspberry Pi. Whenever the button is pressed, a [state](/devices/state/) message will be sent to Losant that can be used to [trigger actions](/workflows/overview/). To demonstrate device [commands](/devices/state/), there is also an LED connected to GPIO that Losant can turn on and off from the cloud.

The source code for this example is <a href="https://github.com/Losant/example-raspberry-pi-python" target="\_blank">available on GitHub</a>.

## Install Dependencies

Since Python comes pre-installed on Raspberry Pis, we are going to use Python for this example. If you are not a Python user, here are some great alternatives:  

* <a href="http://johnny-five.io/" target="\_blank">Node.js - Johnny Five</a>  
* <a href="https://gobot.io/" target="\_blank">Golang - GoBot</a>

First, we need to install the Python package manager: [pip](https://pip.pypa.io/en/stable/). Or if you have it already, you can skip this command.
```sh
$ sudo apt-get install python-pip
```
Next, to connect to Losant, we need to install the [Losant Python library](https://github.com/Losant/losant-mqtt-python). Also, we need to install [gpiozero](http://gpiozero.readthedocs.io/en/stable/installing.html), which is a library that provides an interface to GPIO devices with Raspberry Pi.

```sh
$ sudo pip install losant-mqtt gpiozero
```

## Wiring

The next step is to attach the LED and the button to the Raspberry Pi. The wiring here is pretty straightforward. The LED is attached to GPIO pin 23, and the button is attached to GPIO 21.

![Wiring](/images/getting-started/boards/raspberry-wiring.jpg "Wiring")

## Add Device to Losant

In Losant, <a href="https://accounts.losant.com/create-account" target="\_blank">create an account</a> and an [application](/applications/overview/) if you haven't already.

Next, add a [new device](/devices/overview/) for the Raspberry Pi. As mentioned before, this example only reports state when the button is pressed. So the only state attribute that's needed is `button`. Since a button usually just has an on/off value, set the data type to `Boolean`.

![Create Raspberry Device](/images/getting-started/boards/create-raspberry-pi-device.png "Create Raspberry Device")

Finally, create an [access key](/applications/access-keys/), which you'll use to authenticate the device's connection.

## Code
Now let's write the firmware for the device. Create a file called `index.py`. In that file, include this code:

```python
import json
from gpiozero import LED, Button # Import GPIO library: https://gpiozero.readthedocs.io/en/stable/
from time import sleep
from losantmqtt import Device # Import Losant library: https://github.com/Losant/losant-mqtt-python

led_gpio = 23
button_gpio = 21

led = LED(led_gpio)
button = Button(button_gpio)

# Construct Losant device
device = Device("my-device-id", "my-app-access-key", "my-app-access-secret")

def on_command(device, command):
    print(command["name"] + " command received.")

    # Listen for the gpioControl. This name configured in Losant
    if command["name"] == "toggle":
        # toggle the LED
        led.toggle()

def sendDeviceState():
    device.send_state({"button": True})

# Listen for commands.
device.add_event_observer("command", on_command)

print("Listening for device commands")

button.when_pressed = sendDeviceState # Send device state when button is pressed

# Connect to Losant and leave the connection open
device.connect(blocking=True)
```

In `index.py`, we initialize the libraries, setup GPIO, and create a Losant `device`. When creating a device, you give it `my-device-id`, `my-access-key`, and `my-access-secret`. You have already obtained these values from Losant.

You can run the firmware like so:
```sh
$ python index.py
```

For understanding, let's walkthrough the other bits of code.

## Send Button Presses

We need a way to "listen" for a button press. When the button is pressed, we need to sent state to Losant. This state will contin the attribute `button` and the value of `True`.

To do this, we can use gpiozero. First, we set up a [`Button`](http://gpiozero.readthedocs.io/en/stable/api_input.html#button).
```
button = Button(button_gpio)
```
Next, we can define a function to be called when the button is pressed. 
```python
def sendDeviceState():
    device.send_state({"button": True})
```
`Button` has a [`when_pressed`](http://gpiozero.readthedocs.io/en/stable/api_input.html#gpiozero.Button.wait_for_press) property that will call a function you define when the button is pressed. We can do that like so:
```python
button.when_pressed = sendDeviceState # Send device state when button is pressed
```

Once the states are being sent, [Losant workflows](/workflows/overview/) allow you to trigger any number of useful actions. The below workflow will send an SMS message whenever the button is pressed.

![SMS Workflow](/images/getting-started/boards/raspberry-sms-workflow.png "SMS Workflow")

## Toggle the LED

Along with states, Losant also supports [commands](/devices/commands/), which allow you instruct the device to take an action. For this example, the device will watch for a "toggle" command, which will cause it to toggle the LED.

First, we set up an [`LED`](http://gpiozero.readthedocs.io/en/stable/api_output.html#led).
```python
led = LED(led_gpio)
```

The Losant `device` can be configured to call a function when a command from Losant is received. Next, we need to define that function. 

To listen for commands, the Losant device will emit the 'command' event whenever one is received from the platform. If the command's name is "toggle" the LED is toggled.
```python
def on_command(device, command):
    print(command["name"] + " command received.")

    # Listen for the gpioControl. This name configured in Losant
    if command["name"] == "toggle":
        # toggle the LED
        led.toggle()
```
Finally, we can tell the Losant `device` to use this `on_command` function.
```python
# Listen for commands.
device.add_event_observer("command", on_command)
```

A typical way to send commands is by using a Losant workflow. Below is an example that will send the "toggle" command whenever a virtual button is pressed.

![Command Workflow](/images/getting-started/boards/raspberry-commands.png "Command Workflow")

Whenever the button on the above workflow is clicked, it will send a command with the name "toggle" to the connected Raspberry Pi.

Now, you are up and running with the Raspberry Pi and the Losant IoT platform. For more ideas, check out the [Losant Blog](https://www.losant.com/blog) or [Tutorials and Projects](/getting-started/tutorials/). 