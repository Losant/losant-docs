flowclass: Edge 1.4.0
description: Learn more about the Losant Allen-Bradley: Read Node.

# Allen-Bradley: Read

The Allen-Bradley: Read Node allows you to read multiple tags from your [Allen-Bradley](https://en.wikipedia.org/wiki/Allen-Bradley) CompactLogix or ControlLogix device through EtherNet/IP. This node is only available in [edge workflows](/workflows/edge-workflows/).

![Allen-Bradley Read Node](/images/workflows/data/allen-bradley-read-node.png "Allen-Bradley Read Node")

## Configuration

There are three main parts of the configuration for this node ...

### Address Configuration

![Allen-Bradley Read Node Configuration](/images/workflows/data/allen-bradley-read-node-connection.png "Allen-Bradley Read Node Configuration")

Address Configuration contains three fields:

* **Host:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for the IP address at which the PLC resides.
* **Slot:** (Required) A string template or integer for the PLC Slot number.
* **Keep-Alive Interval:** (Optional) A string template or integer for the seconds between keep-alive requests are sent to the PLC to keep the connection alive. Blank (the default) or 0 turns off the keep-alive request.

### Read Instructions

![Allen-Bradley Read Node Read Instructions](/images/workflows/data/allen-bradley-read-node-instructions.png "Allen-Bradley Read Node Instructions")

You may define multiple read instructions for the Allen-Bradley: Read Node, and you must define at least one. Each instruction has the following fields:

* **Controller or Program Tag:** (Required) A string template or string.
* **Program:** (Optional) A string template or string for the program which your program tag is a member of. 
* **Data Type:** Atomic (SINT, INT, DINT, REAL, BOOL) or string.
* **Result Key:** (Required) The key at which to store the result of this read operation. This key will exist on the [Destination Path](#result) defined below the instructions. This can resolve to any string except `errors`, since that key is reserved for any errors that occur during reads. The value at this key is read as an *signed integer*.

### Destination Path

![Allen-Bradley Read Node Result](/images/workflows/data/allen-bradley-read-node-path.png "Allen-Bradley Read Node Result")

The results of each read instruction will be placed in an object at the `Destination Path` (a [payload path](/workflows/accessing-payload-data/#payload-paths)) at each instruction's `Result Key`. It is important that each key is named uniquely so the node does not overwrite another read result.

If the key is not present, it means the read failed, and there will be a list of errors at the Destination Path under the key `errors`. For this reason, this node restricts Result Keys to not resolve to the path `errors`. Because the tags are read as a group one failed read for a tag may cause the other keys in the group to not appear.

Along with the `Result Key` and possible `errors`, each read object at the `Destination Path` will include a `plcProperties` object key. The PLC Properties object includes current device information about various possible faults, status, version, time, slot, serial number, and name.

The following is an example of a successful read, where an instruction's Result Key is `myProgramDint`, and the Destination Path is `destination.allenStart`:

```json
{
  "destination": {
    "allenStart": {
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
      "myProgramDint": 42
    }
  }
}
```

The following is an example of a failure to read, where a resultKey should have been `myProgramDint`, and the destination path is `destination.allenStart`:

```json
{
  "destination": {
    "allenStart": {
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
      "errors": [ { "type": "ALLEN-BRADLEY_READ_ERROR", "message": "Something useful to help you fix the issue." } ]
    }
  }
}
```
