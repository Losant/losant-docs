flowclass: Edge 1.0.0
description: Learn more about the Losant Modbus: Read Node.

# Modbus: Read

The Modbus Read Node allows you to read multiple registers from your modbus machine. This node is *only* available in workflows for your edge device agent.

![Modbus Read Node](/images/workflows/data/modbus-read-node.png "Modbus Read Node")

## Configuration

![Modbus Read Node Configuration](/images/workflows/data/modbus-read-node-configuration.png "Modbus Read Node Configuration")

There are two main parts of the configuration for this node - Address Configuration and Read Instructions.

Address Configuration contains four fields - host template, port template, unit ID template, endianness. All are [templatable](/workflows/accessing-payload-data/#string-templates) expect for endianness. Endianness has two options: `Big` or `Little`.

Read Instructions have four fields - register type, address template, length template, result key. This node allows several reads to be done at once, so you can read multiple registers and the results of each will Register Types can be anyone of the following - `Input Registers`, `Holding Registers`, `Discrete Input`, and `Coils`. Address Template is required and is [templatable](/workflows/accessing-payload-data/#string-templates). The address must be a number greater than or equal to 0 and less than 65535. By default, length template is 1, this defines how many registers to read past the given address template. The result key will be the key at which the result of this read is set under the result path. The result key *cannot* be at `errors` or be in the path `errors.`, since the `errors` path is a special path where the node will place any errors that occur during reads. If the result key is present it will *always* be a list of results, even if the length is one. See below for examples.

## Destination Path

![Modbus Read Node Result](/images/workflows/data/modbus-read-node-result.png "Modbus Read Node Result")

The results of the of each read instruction will be placed inside the destination path at the result key. It is important that each result key is named uniquely so the node does not overwrite another read result. If the key is not present it means the read failed, and there will be a list of errors, under the result path at `errors`. If one read fails it does not mean that all reads will fail, the reads will continue until finished. The only time you will get a single error for multiple reads is if the connection could never be made to the modbus itself.

The following is an example of a successful read, where a resultKey is `threeCoils`, and the destination path is `destination.modbusOutput`:

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

## Process Results

The following is an example can be used in of taking modbus read output of two registers and making them into one 32-bit float:

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
