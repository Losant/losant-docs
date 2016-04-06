# Device State

Device state is one of the core communication and data components of the Losant platform. A device's state represents a snapshot of the device at some point in time. For example, if the device has a temperature sensor, it might report the temperature every minute of so. Losant stores every state request and makes them available in visualizations and workflow triggers.

![Device State](/images/devices/state-diagram.png "Device State")

## State Attributes

State is defined as one or more attributes. Typically an attribute maps to a single sensor or other data source. In order to Losant to process and store device state, you must define the attributes that the device will report.

![Device Attributes](/images/devices/device-attributes.png "Device Attributes")

Losant supports and understands a built-in set of data types for device attributes. These include `String`, `Number`, `GPS String`, and `Boolean`. If you specify a state attribute as one data type and report something different, the Losant platform will attempt to convert the incoming data type into the one specified.

GPS attributes must be reported in one of four ways:

*   [Decimal Degrees](https://en.wikipedia.org/wiki/Decimal_degrees)<br/>
    Example: `37.33233141,-122.0312186`

*   [Degrees Minutes Seconds](https://en.wikipedia.org/wiki/Degree_(angle)#Subdivisions) (also known as Sexagesimal)<br/>
    Example: `37°19'56.39"N,122°1'52.38"W`

*   [NMEA GLL](http://www.gpsinformation.org/dale/nmea.htm#GLL)<br/>
    Example: `$GPGLL,3906.71226,N,8430.74572,W,000653,A,*24`

*   [NMEA GGA](http://www.gpsinformation.org/dale/nmea.htm#GGA)<br/>
    Example: `$GPGLL,3719.940,N,12201.873,S,225444,A,*1C`

Attributes can be added and removed from a device at any time. If you change the data type of an existing attribute, the previous data for that attribute will be lost. This is because Losant won't be able to aggregate data of two different data types for the same attribute.

## Reporting State

A device can report state as often as needed, as long as it's within the Losant platform's [rate limitations](/limits/overview). Devices are not required to report all attributes every time. For example, a thermostat might report the `inside-temp` attribute every few minutes, but only report the `temp-setting` attribute when the user changes it.

Devices typically report state over an MQTT or REST connection. The Losant SDKs make it easy to form MQTT connections and report state to Losant. If your device only reports state every few minutes or every few hours, then the REST interface likely makes more sense so it doesn't have to maintain a persistent connection.

[Virtual devices](/devices/overview/#device-configuration) cannot report their own state. Reporting the state of a virtual device is typically done using a workflow.

## Using State

Once your device is reporting state, the information is most commonly used for dashboard visualizations and [workflow triggers](/workflows/triggers/device/).

There are many dashboard blocks that show state information. The blocks can either show the real-time value as it's reported or show aggregates over time. A thermostat, for example, might want graph the average indoor temperature per day over the last 30 days.

Device state can also trigger workflows. Workflows are the primary way your devices will connect with each other and the outside world. A typical workflow for a thermostat might be to send an SMS if the indoor temperature drops below 40 degrees, which would indicate the user's furnace is malfunctioning.
