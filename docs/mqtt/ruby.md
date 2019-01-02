---
description: Learn about the Losant Ruby MQTT Client.
---

# Ruby MQTT Client

The Losant Ruby MQTT Client is a gem for Ruby compatible IoT modules (such as the Raspberry Pi or Edison). The library is open source and <a href="https://github.com/Losant/losant-mqtt-ruby" target="_blank">available on GitHub</a>.

Below is a basic example demonstrating how to connect, send [state](/devices/state/), and subscribe to [commands](/devices/commands/).

```ruby
require "losant_mqtt"

EventMachine.run do

  # Construct device
  device = LosantMqtt::Device.new(
    device_id: "my-device-id"
    key: "my-app-access-key",
    secret: "my-app-access-secret")

  # Connect to Losant.
  device.connect

  # Listen for commands.
  device.on(:command) do |d, command|
    puts "#{d.device_id}: Command received."
    puts command["name"]
    puts command["payload"]
  end

  # Send temperature once every second.
  EventMachine::PeriodicTimer.new(1) do
    temp = call_out_to_your_sensor_here()
    device.send_state({ temperature: temp })
  end

end
```

Please refer to the <a href="https://github.com/Losant/losant-mqtt-ruby" target="_blank">repository</a> for detailed documentation and examples.
