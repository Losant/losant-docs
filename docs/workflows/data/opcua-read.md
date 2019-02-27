---
flowclass:
  - Edge 1.6.0
description: 'Learn more about the Losant OPC UA: Read Node.'
---

# OPC UA: Read

The OPC UA: Read Node allows you to read multiple node values from your [OPC UA Server](https://en.wikipedia.org/wiki/OPC_Unified_Architecture) and connected programmable logic controller (PLC). This node is only available in [edge workflows](/workflows/edge-workflows/).

![OPC UA Read Node](/images/workflows/data/opcua-read-node.png "OPC UA Read Node")

## Node Properties

There are four main parts of the properties for this node ...

### Connection Configuration

![OPC UA Read Node Configuration](/images/workflows/data/opcua-read-node-connection.png "OPC UA Read Node Configuration")

Connection Configuration contains:

* **OPC UA URI:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for the OPC UA server URI.
* **Username:** (Optional) A string template for login username.
* **Password:** (Optional) A string template for login password.

### Security Settings

You can optionally select a SSL/TLS **Security Policy** for the connection to the OPC UA server through the dropdown selector. Example: Basic-128 RSA-15

![OPC UA Read Node SSL/TLS Security](/images/workflows/data/opcua-read-node-ssl.png "OPC UA Read Node SSL/TLS Security")

If a **Security Policy** is selected, you will have the option to select between **Sign** or **Sign and Encrypt** security modes. You'll then be required to provide a valid SSL/TLS client certificate and private key.

### Read Instructions

![OPC UA Read Node Read Instructions](/images/workflows/data/opcua-read-node-instructions.png "OPC UA Read Node Instructions")

You may define multiple read instructions for the OPC UA: Read Node, and you must define at least one. Each instruction has the following fields:

* **Namespace Index (ns):** (Required) A string template or positive integer.
* **Identifier:** (Required) A string template or string for the node identifier. The identifier string should begin with one of the following types:
    * **i=:** for unsigned integer (UINT).
    * **s=:** for string.
    * **g=:** for global unique identifier (GUID).
    * **b=:** for byte string.
* **Result Key:** (Required) The key at which to store the result of this read operation. This key will exist on the [Destination Path](#result) defined below the instructions. This can resolve to any string except `errors`, since that key is reserved for any errors that occur during reads.

### Destination Path

![OPC UA Read Node Result](/images/workflows/data/opcua-read-node-path.png "OPC UA Read Node Result")

The results of each read instruction will be placed in an object at the `Destination Path` (a [payload path](/workflows/accessing-payload-data/#payload-paths)) at each instruction's `Result Key`. It is important that each key is named uniquely so the node does not overwrite another read result.

If the key is not present in the Destination Path of the payload, it means the read failed, and there will be a list of errors at the Destination Path under the key `errors`. For this reason, this node restricts Result Keys to not resolve to the path `errors`. Because the tags are read as a group one failed read for a tag may cause the other keys in the group to not appear.

### Result

The following is an example of a successful read, where an instruction's Result Key is `Power`, and the Destination Path is `OPCUA_PLC`:

```json
{
  "OPCUA_PLC": {
    "Power": 10.01
  }
}
```

## Node Errors

The following is an example of a failure to read, and the destination path is `OPCUA_PLC`:

```json
{
  "OPCUA_PLC": {
    "errors": [ { "type": "OPC-UA_READ_ERROR", "message": "Something useful to help you fix the issue." } ]
  }
}
```
