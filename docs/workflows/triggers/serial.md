---
flowclass:
  - Edge 1.6.0
description: Learn more about the Losant Serial Trigger.
---

# Serial Trigger

The Serial Trigger will trigger a workflow whenever the [Edge Compute device](/devices/edge-compute/) receives enough data via [Serial](https://en.wikipedia.org/wiki/Serial_communication) to satisfy the configured trigger.

![Serial Trigger](/images/workflows/triggers/serial-trigger.png "Serial Trigger")

## Configuration

The Serial Trigger has several pieces of configuration in order to successfully listen for data.

- **Serial Path**: the serial port to listen on.
- **Baud Rate**: the baud rate, speed of communication over a data channel, which by default is `9600`. The following are the accepted baud rates: `110`, `300`, `600`, `1200`, `2400`, `4800`, `9600`, `14400`, `19200`, `38400`, `57600`, `115200`, `128000`, `256000`.
- **Write After Port Opens**: This is an optional field, where after the port opens this string will be written once. It will also be encoded using the `Output Ending` field.
- **Parse Method**: This field is required and by default is `Byte Length`. This field can either be `Byte Length` or `Delimiter`, and it tells the serial port listener how to chunk up the data as it is received.
- **Byte Length**: This field is required if the parse method is `Byte Length` and it is the number of bytes to wait for before firing the trigger.
- **Delimiter**: This field is required if the parse method is `Delimiter`, and it is the string you are waiting to receive to fire the trigger. This delimiter will **not** be included in the serial data on the payload.
- **Output Encoding**: This field is required and by default is UTF8. The following are valid character encoding options: `ASCII`, `UTF8`, `UTF16LE`, `Base64`, `Binary`, `Hex`.

![Serial Trigger Configuration](/images/workflows/triggers/serial-trigger-conf.png "Serial Trigger Configuration")

## Payload

The payload will include a `serial` field under the data field which contains the data that was received from the serial port. In the general case, a Serial workflow payload will look like the following:

```json
{
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "data": {
    "serial": <data recieved from the serial port>,
  },
  "deviceId": <id of the edge device>,
  "deviceName": <the edge device name>,
  "deviceTags": {<any tags for the edge device>},
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "flowVersion": <name of the current workflow version>,
  "globals": <object of workflow globals>,
  "isConnectedToLosant": <if the agent is connected to Losant>,
  "agentEnvironment": <object of environment variables>,
  "time": <time the serial trigger fired the trigger>,
  "triggerId": <serial id>,
  "triggerType": "serial"
}
```
