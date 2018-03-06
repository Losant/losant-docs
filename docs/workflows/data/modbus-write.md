flowclass: Edge 1.0.0
description: Learn more about the Losant Modbus: Write Node.

# Modbus: Write

The Modbus Write Node allows you to write to multiple registers from your modbus machine. This node is *only* available in workflows for your edge device agent.

![Modbus Write Node](/images/workflows/data/modbus-write-node.png "Modbus Write Node")

## Configuration

![Modbus Write Node Configuration](/images/workflows/data/modbus-write-node-configuration.png "Modbus Write Node Configuration")

There are two main parts of the configuration for this node - Address Configuration and Write Instructions.

Address Configuration contains four fields - host template, port template, unit ID template. All are [templatable](/workflows/accessing-payload-data/#string-templates). All of the fields will set up the connection from the node to the modbus.

Write Instructions have three fields - address template, register type and value template. Address template and value template are both [templatable](/workflows/accessing-payload-data/#string-templates). The register types can be one of the following: `Holding Registers` or `Coils`. All three fields are required. The address template must be a number, between 0 and 65535. The value template must also be a number. The destination path is not required but if it is defined, each write instruction will create a key in the format of `addr-${Number(address)}`, if the write was successful then it will be set to true otherwise it will be set to false. If any errors occurred there will be an `errors` key on the destination path with the errors defined inside. See below for more examples.

![Modbus Write Node Result](/images/workflows/data/modbus-write-node-result.png "Modbus Write Node Result")

## Results

The destination path is not required but if you want to confirm that the write was successful it should be set. If any errors occurred there will be an `errors` key under the destination path that defines each error that occurred. The only time you will get a single error for multiple writes is if the connection could never be made to the modbus itself. For example if we want to write to two addresses. One at `23`, and the other at `80`, and we set out destination path to `destination.output`. If it all write instructions are successful the output would look like the following:

```json
"destination": {
  "output": {
    "addr-23": true,
    "addr-80": true
  }
}
```

If an error occurred the output may look like the following:

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

If an error occurred for one write instruction that does not mean all writes were unsuccessful, if one is successful and the other is not the output might look like the following:

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
