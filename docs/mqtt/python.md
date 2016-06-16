# Python MQTT Client

The Losant Python MQTT Client is a gem for Python compatible IoT modules such as the Raspberry Pi. The library is open source and <a href="https://github.com/Losant/losant-mqtt-python" target="_blank">available on GitHub</a>.

Below is a basic example demonstrating how to connect, send [state](/devices/state), and subscribe to [commands](/devices/commands).

```python
import time
from losantmqtt import Device

# Construct device
device = Device("my-device-id", "my-app-access-key", "my-app-access-secret")

def on_command(device, command):
    print("Command received.")
    print(command["name"])
    print(command["payload"])

# Listen for commands.
device.add_event_observer("command", on_command)

# Connect to Losant.
device.connect(blocking=False)

# Send temperature once every second.
while True:
    device.loop()
    if device.is_connected():
        temp = call_out_to_your_sensor_here()
        device.send_state({"temperature": temp})
    time.sleep(1)
```

Please refer to the <a href="https://github.com/Losant/losant-mqtt-python" target="_blank">repository</a> for detailed documentation and examples.
