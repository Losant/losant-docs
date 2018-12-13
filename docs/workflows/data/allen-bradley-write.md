flowclass: Edge 1.4.0
description: Learn more about the Losant Allen-Bradley: Write Node.

# Allen-Bradley: Write

The Allen-Bradley: Write Node allows you to write to multiple tags from your [Allen-Bradley](https://en.wikipedia.org/wiki/Allen-Bradley) CompactLogix or ControlLogix device through EtherNet/IP. This node is only available in [edge workflows](/workflows/edge-workflows/).

![Allen-Bradley Write Node](/images/workflows/data/allen-bradley-write-node.png "Allen-Bradley Write Node")

## Configuration

There are three main parts of the configuration for this node ...

### Address Configuration

![Allen-Bradley Write Node Configuration](/images/workflows/data/allen-bradley-write-node-connection.png "Allen-Bradley Write Node Configuration")

Address Configuration contains three fields:

* **Host:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for the IP address at which the PLC resides.
* **Slot:** (Required) A string template or integer for the PLC Slot number.
* **Keep-Alive Interval:** (Optional) A string template or integer for the seconds between keep-alive requests are sent to the PLC to keep the connection alive. Blank (the default) or 0 turns off the keep-alive request.

### Write Instructions

![Allen-Bradley Write Node Write Instructions](/images/workflows/data/allen-bradley-write-node-instructions.png "Allen-Bradley Write Node Instructions")

You may define multiple read instructions for the Allen-Bradley: Write Node, and you must define at least one. Each instruction has the following fields:

* **Controller or Program Tag:** (Required) A string template or string.
* **Program:** (Optional) A string template or string for the program which your program tag is a member of. 
* **Data Type:** Atomic (SINT, INT, DINT, REAL, BOOL) or string.
* **Value:** (Required) A string template or string of the value to write to the tag.

### Destination Path

![Allen-Bradley Write Node Result](/images/workflows/data/allen-bradley-write-node-path.png "Allen-Bradley Write Node Result")

The success or failure of each write instruction will be placed in an object at the `Destination Path` (a [payload path](/workflows/accessing-payload-data/#payload-paths)) (optional) under the `write` key. If the write is successful the `write` value will be `success`, and conversly if the write failed the `write` value will be `fail`.

If the write failed there will be a list of errors at the Destination Path under the key `errors`. Because the tags are written as a group one failed write for a tag may cause the other writes in the group to fail.

Along with the `write` and possible `errors`, each write object at the `Destination Path` will include a `plcProperties` object key. The PLC Properties object includes current device information about various possible faults, status, version, time, slot, serial number, and name.

The following is an example of a successful write, where the Destination Path is `destination.allenWrite`:

```json
{
  "destination": {
    "allenWrite": {
      "plcProperties":{
        "io_faluted": false,
        "majorUnrecoverableFault": false,
        "majorRecoverableFault": false,
        "minorUnrecoverableFault": false,
        "minorRecoverableFault": false,
        "faulted": false,
        "status": 12640,
        "version": "31.11",
        "time": null,
        "slot": 0,
        "serial_number": 1622838845,
        "name": "1769-L16ER/B LOGIX5316ER"
      },
      "write": "success"
    }
  }
}
```

The following is an example of a failure to write:

```json
{
  "destination": {
    "allenWrite": {
      "plcProperties":{
        "io_faluted": false,
        "majorUnrecoverableFault": false,
        "majorRecoverableFault": false,
        "minorUnrecoverableFault": false,
        "minorRecoverableFault": true,
        "faulted": true,
        "status": 12640,
        "version": "31.11",
        "time": null,
        "slot": 0,
        "serial_number": 1622838845,
        "name": "1769-L16ER/B LOGIX5316ER"
      },
      "write": "fail",
      "errors": [ { "type": "ALLEN-BRADLEY_WRITE_ERROR", "message": "Something useful to help you fix the issue." } ]
    }
  }
}
```
