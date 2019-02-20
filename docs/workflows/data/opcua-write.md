---
flowclass:
  - Edge 1.6.0
description: 'Learn more about the Losant OPC UA: Write Node.'
---

# OPC UA: Write

The OPC UA: Write Node allows you to write new node values to your [OPC UA Server](https://en.wikipedia.org/wiki/OPC_Unified_Architecture) and connected programmable logic controller (PLC). This node is only available in [edge workflows](/workflows/edge-workflows/).

![OPC UA Write Node](/images/workflows/data/opcua-write-node.png "OPC UA Write Node")

## Node Properties

There are four main parts of the properties for this node ...

### Connection Configuration

![OPC UA Write Node Configuration](/images/workflows/data/opcua-write-node-connection.png "OPC UA Write Node Configuration")

Connection Configuration contains:

* **OPC UA URI:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for the OPC UA server URI.
* **Username:** (Optional) A string template for login username.
* **Password:** (Optional) A string template for login password.

### Security Settings

You can optionally select a SSL/TLS **Security Policy** for the connection to the OPC UA server through the dropdown selector. Example: Basic-128 RSA-15

![OPC UA Write Node SSL/TLS Security](/images/workflows/data/opcua-write-node-ssl.png "OPC UA Write Node SSL/TLS Security")

If a **Security Policy** is selected, you will have the option to select between **Sign** or **Sign and Encrypt** security modes. You'll then be required to provide a valid SSL/TLS client certificate and private key.

### Write Instructions

![OPC UA Write Node Write Instructions](/images/workflows/data/opcua-write-node-instructions.png "OPC UA Write Node Instructions")

You are required to define write instructions for the OPC UA: Write Node. The instructions have the following fields:

* **Namespace Index (ns):** (Required) A string template or positive integer.
* **Identifier:** (Required) A string template or string for the node identifier. The identifier string should begin with one of the following types:
    * **i=:** for unsigned integer (UINT).
    * **s=:** for string.
    * **g=:** for global unique identifier (GUID).
    * **b=:** for byte string.
* **Value String Template/Payload Path:** (Required) The value can be a string template or from a payload path. Note: If your node value is an array you will need to provide the array values on a payload path.

### Destination Path

![OPC UA Write Node Result](/images/workflows/data/opcua-write-node-path.png "OPC UA Write Node Result")

The results of the write instruction will optionally be placed in an object at the `Destination Path` (a [payload path](/workflows/accessing-payload-data/#payload-paths)).

### Result

The following is an example of a successful write and the Destination Path is `OPCUA_PLC`:

```json
{
  "OPCUA_PLC": {
    "write": "success"
    }
}
```

## Node Errors

The following is an example of a failure to write and the destination path is `OPCUA_PLC`:

```json
{
  "OPCUA_PLC": {
    "write": "fail"
    "errors": [ { "type": "OPC-UA_WRITE_ERROR", "message": "Something useful to help you fix the issue." } ]
  }
}
```
