description: Learn how to use your web browser to connect to the Losant broker and test your devices and workflows.

# Device Simulator

The device simulator makes it possible to test [devices](/devices/overview/) configured within your application, and how events and messages emitted by those devices affect your IoT solutions. By treating your web browser as a stand-in for the device, the simulator allows for quickly testing state reports and connection events and how, for example, the [workflows](/workflows/overview/) they trigger affect your application as a whole.

![Device Simulator](/images/devices/simulator-overview.png "Device Simulator")

The device simulator can be reached from the device's overview page, by clicking the "Simulator" link in the left column.

## Connection Manager

The device simulator works by establishing a connection between the [Losant broker](/mqtt/overview/#the-losant-message-broker) and your web browser, authenticating the browser as the device itself. The simulator's connection status is displayed in the connection manager's header.

To get started, paste any [access key and secret](/applications/access-keys/) that is scoped to your device into the connection manager's input fields and click the "Connect" button. If authentication succeeds, the simulator will connect.

![Simulator Connection Manager](/images/devices/simulator-connection-manager.png "Simulator Connection Manager")

You may also generate an access key and secret scoped to the selected device directly from the connection manager by clicking "Generate Key/Secret". This will auto-fill the input fields with the newly created credentials. You may also download the generated key and secret for future use. The credentials will work not only for the simulator, but also for connecting to the Losant broker through the device itself.

To disconnect the simulator, click the "Disconnect" button at the bottom of the connection manager. **The simulator will also disconnect if you navigate your browser away from the simulator page.**

### Connections From Other Sources

A device may only hold one connection to the Losant broker at a time; therefore, if the device is already connected to the broker, you will be unable to connect the device simulator until that device's connection has been broken. This is to prevent the simulator from kicking a real, deployed device offline.

![Simulator Blocked](/images/devices/simulator-blocked.png "Simulator Blocked")

Likewise, if the simulator is connected and a connection event comes in from another source (such as the device itself), the simulator will disconnect and will not attempt to reconnect.

## Test Scripts

Test scripts allow for reporting state for your device's attributes on a regular interval. Any attribute can be included in (or excluded from) the state reports, and static or randomly generated values can be used in each report. The script is managed in the "Test Script" tab beneath the connection manager.

![Simulator Test Script](/images/devices/simulator-test-script.png "Simulator Test Script")

### Test Script Configuration

You will see a section for each of your device's attributes within the test script configuration panel. For each attribute, you have three top-level options:

- **No value** excludes the attribute from the script's state report.
- **Set a static value ...** reports the same value for that attribute with each script run. This value must validate against the attribute's type; for example, strings cannot be reported for number attributes.
- **Set a random value ...** reports a random value with each state report. That random value requires some constraint configuration, which is different for each attribute type ...
    - **Numbers** require a minimum and maximum value (inclusive). The randomly generated number will always be an integer.
    - **Strings** require a defined string length. The generated value will be any combination of uppercase letters, lowercase letters and numbers matching that length.
    - **GPS attributes** require a center point in an [accepted GPS format](/devices/state/#state-attributes) and a radius in meters. All generated points will fall within that circle.
    - **Booleans** require no additional configuration. The value will report as either `true` or `false`.

### Running Test Scripts

At the bottom of the script manager is an input for setting the interval (in seconds) at which this script should run. For example, if the script is set to run every 5 seconds, the values configured in the script will generate and report state for the device once every 5 seconds.

The script can only be started if the device simulator is connected. The script will stop when the "Stop Script" button is clicked or when the simulator disconnects (manually, through network error or due to another connection event).

## Single State Reports

Individual state reports may also be submitted whenever the simulator is connected, even while a test script is running. Click the "Single Report" tab next to the "Test Script" tab to configure and submit a single state report.

![Simulator Single State Report](/images/devices/simulator-single-report.png "Simulator Single State Report")

Submitting an individual state report is useful for testing data anomalies; for example, if a test script is reporting "normal" values on a regular basis, you can submit a single state report with "irregular" data in the middle of a script run to see how your workflows respond.

### Single State Configuration

Each of your device's attributes will be displayed within the configuration panel, along with inputs that are respective of the attribute types. A value may be supplied for any or all attributes, though just like with the test scripts, each value must validate against the attribute type.

## Simulator Log

The simulator log is a log of all events emitted by the simulator, **not events from the device itself.** This is an important distinction to understand when testing your devices and comparing simulator output to what is actually registered as data against the device.

![Simulator Log](/images/devices/simulator-log.png "Simulator Log")

For example, say you have a [test script](#test-scripts) reporting a number attribute's value as a random number between 1 and 100 every second. Within your application, you may have a workflow with a [device state trigger](/workflows/triggers/device/) for the device you're simulating, and that workflow could, for example ...

- Cap the attribute's value at 75 and re-report the device's number attribute as `75`.
- Only accept state reports on a five-second interval, throwing away any state report that comes within five seconds of the previously accepted report.
- Round the number attribute to the nearest 10 and re-report state.
- Report state for a completely different attribute based on the value of the number attribute being reported, and reporting that value at the same timestamp as the original state report. If you happened to report a value for the unrelated attribute in the same state report, that value would be overridden.

The simulator log will only reflect the output of the test script, and not the data manipulations described in the situations above.

## Limitations

Currently, the device simulator can only be used to test [standalone and gateway devices](/devices/overview/#device-type). Peripheral devices cannot connect to the platform directly and instead require a gateway to report on their behalf, which is not supported in the simulator at this time.
