flowclass: Edge 1.0.0
description: Learn more about the Losant Modbus: Write Node.

# Modbus: Write

The Modbus: Write Node allows you to write to multiple registers from your Modbus machine. This node is only available in [edge workflows](/workflows/edge-workflows/).

![Modbus Write Node](/images/workflows/data/modbus-write-node.png "Modbus Write Node")

## Configuration

There are two main parts of the configuration for this node ...

![Modbus Write Node Configuration](/images/workflows/data/modbus-write-node-configuration.png "Modbus Write Node Configuration")

### Address Configuration

Address Configuration contains three fields:

*   **Host:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for the IP address at which the register(s) resides.
*   **Port:** (Required) A string template or integer for the HTTP port.
*   **Unit ID:** (Required) A string template or integer for the Unit ID at the specified host and port. Defaults to `0`.

### Write Instructions

You may define multiple write instructions for the Modbus: Write Node, and you must define at least one. Each instruction has the following fields, all of which are required:

*   **Address:** A string template or integer for the address at which to write. This should resolve to an integer between `0` and `65534` inclusive.
*   **Register Type:** `Holding Registers` (default) or `Coils`.
*   **Value:** A string template or integer for the value to write.

Address Configuration contains four fields - host template, port template, unit ID template. All are [templatable](/workflows/accessing-payload-data/#string-templates). All of the fields will set up the connection from the node to the Modbus.

Write Instructions have three fields - address template, register type and value template. Address template and value template are both [templatable](/workflows/accessing-payload-data/#string-templates). The register types can be one of the following: `Holding Registers` or `Coils`. All three fields are required. The address template must be a number, between 0 and 65535. The value template must also be a number. The destination path is not required but if it is defined, each write instruction will create a key in the format of `addr-${Number(address)}`. If the write was successful then it will be set to `true` otherwise it will be set to `false`. If any errors occurred there will be an `errors` key on the destination path with the errors listed. See below for more examples.

![Modbus Write Node Result](/images/workflows/data/modbus-write-node-result.png "Modbus Write Node Result")

## Result

The **Destination Path** (a [payload path](/workflows/accessing-payload-data/#payload-paths)) is optional, but if you want to confirm that the write was successful, the path should be set. If set, the result of write instruction will be at a key in the format of `addr-${Number(address)}`, Successful writes will have a value of `true`, and failures will have a value of `false`.

If any errors occurred, there will be an `errors` key in the object at your path defining each error that occurred. The only time you will get a single error for multiple writes is if the connection could never be made to the Modbus itself.

For example, say we want to write to two addresses (one at `23`, and the other at `80`), and we set our Destination Path to `destination.output`. If all write instructions were successful,  the output would look like the following:

```json
"destination": {
  "output": {
    "addr-23": true,
    "addr-80": true
  }
}
```

If an error occurred the output will look like the following:

```json
"destination": {
  "output": {
    "errors": [
      { "type": "MODBUS_WRITE_ERROR", "message": "Some error occurred at 23" },
      { "type": "MODBUS_WRITE_ERROR", "message": "Some error occurred at 80" },
    ],
    "addr-23": false,
    "addr-80": false
  }
}
```

If an error occurred for one write instruction, that does not mean all writes were unsuccessful. If one is successful and the other is not the output might look like the following:

```json
"destination": {
  "output": {
    "errors": [
      { "type": "MODBUS_WRITE_ERROR", "message": "Some error occurred at 23" },
    ],
    "addr-23": false,
    "addr-80": true
  }
}
```
