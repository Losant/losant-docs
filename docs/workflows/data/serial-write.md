---
flowclass:
  - Edge 1.7.0
description: 'Learn more about the Losant Serial Write Node.'
---

# Serial Write

The Serial Write allows you to write to a specified [Serial port](https://en.wikipedia.org/wiki/Serial_communication).

![Serial Write Node](/images/workflows/data/serial-write-node.png "Serial Write Node")

## Configuration

Configuration includes the following fields...

![Serial Write Node Configuration](/images/workflows/data/serial-write-node-config.png "Serial Write Node Configuration")

* **Serial Path Template:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) that resolves to the port which the value should be written.
* **Baud Rate:** (Required) the baud rate, speed of communication over a data channel, which by default is `9600`. The following are the accepted baud rates: `110`, `300`, `600`, `1200`, `2400`, `4800`, `9600`, `14400`, `19200`, `38400`, `57600`, `115200`, `128000`, `256000`.
* **Write Template:** (Required) A string template that will be written to the specified serial port.
* **Write Encoding:** (Required) The character encoding of the write template. The following are valid character encoding options: `ASCII`, `UTF8`, `UTF16LE`, `Base64`, `Binary`, `Hex`.
* **Result Path:** A path on the payload to store the result of the serial write. The result will either be true when successfully. Otherwise, if unsuccessful, an object will be placed at the result path with the key "error" such that the value is the error message.

The following is an example of a successful write if you set your result path to `serialResult`:

```json
{
  "serialResult": true
}
```

The following is an example of a failure to write if you set your result path to `serialResult`:

```json
{
  "serialResult": { "error": "Port unexpectedly closed." }
}
```
