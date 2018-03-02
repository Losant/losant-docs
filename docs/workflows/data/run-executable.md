flowclass: Edge 1.0.0
description: Learn more about the Losant Run Executable Node.

# Run Executable

The Run Executable Node allows an edge workflow to run a script or process on the locally on an [Edge Compute](/devices/edge-compute/) device.

![Run Executable Node](/images/workflows/data/run-executable-node.png "Run Executable Node")

## Configuration

There are two main configuration sections for the Run Executable Node - configuring specifics around the command to run, and then the environment variables for the command.

![Run Executable Node Configuration](/images/workflows/data/run-executable-node-config.png "Run Executable Node Configuration")

The most important part is the `Command` string itself. This is a templatable field that should resolve to a script or executable on the local machine. In the example above, the node is will attempt to run the command `/opt/serial-reader/bin/read-state`. You can set the `Current Working Directory` for the command as well - if you leave this blank, it will be the current working directory for the Losant Edge Agent. Finally, you can set the expected encoding for the output of the command - by default, this is `UTF8`.

![Run Executable Node Environment Variables](/images/workflows/data/run-executable-node-env-vars.png "Run Executable Node Environment Variables")

You can also set environment variables for the command. By default, when the command is run, it will be run with no environment variables. In the case above, one environment variable is set: `SERIAL_PORT` is set to `{{deviceTags.serialPort.[0]}}`.

![Run Executable Node Node Output](/images/workflows/data/run-executable-node-output.png "Run Executable Node Output")

Finally, if the command that is being executed returns a result, it can optionally be stored for later use in the workflow. In the example above, the result will be stored at the [payload path](/workflows/accessing-payload-data/#payload-paths) `data.myExecResults` on the current payload. What is returned, though, is not *just* the result; it is a result object with potentially other useful information. The result object will have fields for the command's `stdout` and `stderr`, as well as fields for the `exitCode` of the command and the termination `signal` for the command. In the case that a command fails to run, there will also be an `error` field with any errors. For example, here is an example payload after the above workflow node has been run:

```json
{
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Example App",
  "data": {
    "myExecResults": {
      "stdout": "45",
      "stderr": "",
      "signal": null,
      "exitCode": 0
    },
    ...
  },
  "deviceId": "56c8967bb8df0f0100d629120",
  "deviceName": "My Factory Device",
  "deviceTags": {
    "floor": ["2"],
    "location": ["warehouse1"]
  },
  "flowName": "Example Workflow",
  "flowId": "56c74add04d0b50100043381",
  "flowVersion": "My Version Name",
  "globals": { },
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "triggerId": "deviceCommand",
  "triggerType": "deviceCommand"
}
```

### Notes on Errors

There are many reasons that the Run Executable node could error, but here are a few of the more common cases:

* The command given in the `Command` template does not exist or is invalid in some way.
* The path given for the `Current Working Directory` does not exist.
* The Losant Edge Agent did not have permission to execute the given command.
* The command took longer than the maximum allowed 30 seconds to complete.