---
flowclass:
  - Edge 1.6.0
description: 'Learn more about the Losant OPC UA: Browse Node.'
---

# OPC UA: Browse

The OPC UA: Browse Node allows you to browse node folders on your [OPC UA Server](https://en.wikipedia.org/wiki/OPC_Unified_Architecture). This node is only available in [edge workflows](/workflows/edge-workflows/).

![OPC UA Browse Node](/images/workflows/data/opcua-browse-node.png "OPC UA Browse Node")

## Node Properties

There are four main parts of the properties for this node ...

### Connection Configuration

![OPC UA Browse Node Configuration](/images/workflows/data/opcua-browse-node-connection.png "OPC UA Browse Node Configuration")

Connection Configuration contains:

* **OPC UA URI:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for the OPC UA server URI.
* **Username:** (Optional) A string template for login username.
* **Password:** (Optional) A string template for login password.

### Security Settings

You can optionally select a SSL/TLS **Security Policy** for the connection to the OPC UA server through the dropdown selector. Example: Basic-128 RSA-15

![OPC UA Browse Node SSL/TLS Security](/images/workflows/data/opcua-browse-node-ssl.png "OPC UA Browse Node SSL/TLS Security")

If a **Security Policy** is selected, you will have the option to select between **Sign** or **Sign and Encrypt** security modes. You'll then be required to provide a valid SSL/TLS client certificate and private key.

### Browse Instructions

![OPC UA Browse Node Browse Instructions](/images/workflows/data/opcua-browse-node-instructions.png "OPC UA Browse Node Instructions")

You are required to define browse instructions for the OPC UA: Browse Node. The instructions have the following fields:

* **Namespace Index (ns):** (Optional) A string template or positive integer.
* **Identifier or Browse Name:** (Optional) A string template or string for the node identifier or browse name. If the **Namespace** is left blank and this is a valid node browse name, the path will be resolved. If an identifier, the string should begin with one of the following types:
    * **i=:** for unsigned integer (UINT).
    * **s=:** for string.
    * **g=:** for global unique identifier (GUID).
    * **b=:** for byte string.

If the **Namespace** and **Identifier** are left blank the browse will default to the "root folder".

### Destination Path

![OPC UA Browse Node Result](/images/workflows/data/opcua-browse-node-path.png "OPC UA Browse Node Result")

The results of the browse instruction will be placed in an object with the name of the folder at the `Destination Path` (a [payload path](/workflows/accessing-payload-data/#payload-paths)).

### Result

The following is an example of a successful browse of the "root folder", where the Destination Path is `OPCUA_PLC`:

```json
{
  "OPCUA_PLC": {
    "RootFolder": [
      {
        "nodeClass": "Object (1)",
        "isForward": true,
        "namespaceUri": "http://opcfoundation.org/UA/",
        "identifierType": "Numeric",
        "identifier": 85,
        "namespace": 0,
        "nodeId": "ns=0;i=85",
        "displayName": "locale=null text=Objects",
        "browseName": "Objects"
      },
      { ... },
      { ... }
    ]
  }
}
```

## Node Errors

The following is an example of a failure to browse, and the destination path is `OPCUA_PLC`:

```json
{
  "OPCUA_PLC": {
    "errors": [ { "type": "OPC-UA_BROWSE_ERROR", "message": "Something useful to help you fix the issue." } ]
  }
}
```
