flowclass: Edge 1.0.0
description: Learn more about the Losant Modbus: Read Node.

# Modbus: Read

The Modbus: Read Node allows you to read multiple registers from your [Modbus](https://en.wikipedia.org/wiki/Modbus). This node is only available in [edge workflows](/workflows/edge-workflows/).

![Modbus Read Node](/images/workflows/data/modbus-read-node.png "Modbus Read Node")

## Configuration

There are three main parts of the configuration for this node ...

![Modbus Read Node Configuration](/images/workflows/data/modbus-read-node-configuration.png "Modbus Read Node Configuration")

### Address Configuration

Address Configuration contains four fields:

* **Host:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for the IP address at which the register(s) resides.
* **Port:** (Required) A string template or integer for the HTTP port.
* **Unit ID:** (Required) A string template or integer for the Unit ID at the specified host and port. Defaults to `0`.
* **Endianness:** The [endianness](https://en.wikipedia.org/wiki/Endianness), or sequential order of bytes. Defaults to "Big".

### Read Instructions

You may define multiple read instructions for the Modbus: Read Node, and you must define at least one. Each instruction has the following fields:

* **Register Type:** (Required) `Input Registers` (default), `Holding Registers`, `Discrete Input`, or `Coils`.
* **Address:** (Required) A string template or integer for the address at which to read. This should resolve to an integer between `0` and `65534` inclusive.
* **Length:** The length for this read instruction. This field is optional, but if it set, it should resolve to an integer greater than `0`. If not set, the length defaults to `1`.
* **Result Key:** (Required) The key at which to store the result of this read operation. This key will exist on the [Destination Path](#result) defined below the instructions. This can resolve to any string except `errors`, since that key is reserved for any errors that occur during reads. The value at this key is read as an *signed integer*.

### Destination Path

![Modbus Read Node Result](/images/workflows/data/modbus-read-node-result.png "Modbus Read Node Result")

The results of each read instruction will be placed in an object at the `Destination Path` (a [payload path](/workflows/accessing-payload-data/#payload-paths)) at each instruction's `Result Key`. Each result is returned as an array. It is important that each key is named uniquely so the node does not overwrite another read result.

If the key is not present, it means the read failed, and there will be a list of errors at the Destination Path under the key `errors`. For this reason, this node restricts Result Keys to not resolve to the path `errors`. If one read fails, it does not mean that all reads will fail; rather, the reads will continue until finished. The only time you will get a single error for multiple reads is if the connection could never be made to the Modbus itself.

The following is an example of a successful read, where an instruction's Result Key is `threeCoils`, and the Destination Path is `destination.modbusOutput`:

```json
{
  "destination": {
    "modbusOutput": {
      "threeCoils": [ 1, 0, 1 ]
    }
  }
}
```

The following is an example of a failure to read, where a resultKey should have been `threeCoils`, and the destination path is `destination.modbusOutput`:

```json
{
  "destination": {
    "modbusOutput": {
      "errors": [ { "type": "MODBUS_READ_ERROR", "message": "Something useful to help you fix the issue." } ]
    }
  }
}
```

## Processing Results

The following is an example of taking two Modbus read results and making them into one 32-bit float:

```javascript
const modbus = payload.modbus
const buffer = new ArrayBuffer(4);
const view = new DataView(buffer);
view.setInt16(0, modbus.systemPressure[0], false);
view.setInt16(2, modbus.systemPressure[1], false);
payload.state = {
  systemPressure: view.getFloat32(0, false)
}
```
