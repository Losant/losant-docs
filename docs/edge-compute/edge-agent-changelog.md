---
description: Learn about the latest version of the Losant Edge Agent and what's changed over time.
---

# Edge Agent Changelog

This file represents all changes to the `losant-edge-agent` since it's initial release. This project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

<!--
The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).
-->

***

## 1.6.1 - 2019-02-27

### Fixed <a name="1.6.1-fixed"></a>

- Fixed a permissions issue with the Docker image which caused filesystem permission errors with the OPCUA nodes.

***

## 1.6.0 - 2019-02-27

### Added <a name="1.6.0-added"></a>

- Triggers / [Serial](/workflows/triggers/serial/)
- Data / [OPC UA: Read](/workflows/data/opcua-read/)
- Data / [OPC UA: Write](/workflows/data/opcua-write/)
- Data / [OPC UA: Browse](/workflows/data/opcua-browse/)
- Logic / [CSV: Decode](/workflows/data/csv-decode/)
- Logic / [CSV: Encode](/workflows/data/csv-encode/)

### Fixed <a name="1.6.0-fixed"></a>

- Fixed an issue where non-geographic area codes for USA phone numbers were rejected as invalid in the Twilio node.

***

## 1.5.0 - 2019-01-31

### Added <a name="1.5.0-added"></a>

- Triggers / [Redis](/workflows/triggers/redis/)
- Triggers / [Virtual Button](/workflows/triggers/virtual-button/)
- Data / [SQL](/workflows/data/sql/)

### Changed <a name="1.5.0-changed"></a>

- The [HTTP Node](/workflows/data/http/) now supports making requests with client certificates.
- The [HTTP Node](/workflows/data/http/) now supports using a custom CA.
- Update to Node.js 10.15.0.
- Multiple library dependencies were updated.

### Fixed <a name="1.5.0-fixed"></a>

- Fixed an issue where one workflow could monopolize the process and prevent other workflows from running.

***

## 1.4.0 - 2018-12-18

### Added <a name="1.4.0-added"></a>

- Data / [Allen-Bradley: Read](/workflows/data/allen-bradley-read/)
- Data / [Allen-Bradley: Write](/workflows/data/allen-bradley-write/)

***

## 1.3.1 - 2018-11-21

### Fixed <a name="1.3.1-fixed"></a>

- Fixed an issue where a mix of successful and failing modbus reads in a single [Modbus: Read](/workflows/data/modbus-read/) node would not be represented correctly on the payload.
- Fixed an issue with the [MongoDB](/workflows/data/mongo/) where certain connection URIs were incorrectly parsed.

***

## 1.3.0 - 2018-11-08

### Added <a name="1.3.0-added"></a>

- Triggers / [File Watch](/workflows/triggers/file-watch/)

### Changed <a name="1.3.0-changed"></a>

- The [Modbus: Write](/workflows/data/modbus-write/) Node now has an adjustable timeout.
- The [Modbus: Read](/workflows/data/modbus-read/) Node now can be configured to read values as either signed or unsigned, and it has an adjustable timeout.
- Multiple library dependencies were updated.

### Fixed <a name="1.3.0-fixed"></a>

- An issue where using the `currentDateTime` [template helper](/workflows/accessing-payload-data/#format-helpers) by itself without a format argument would result in a blank string has been fixed.
- An issue where the agent would exit without waiting for logs to finish writing has been fixed.
- An issue with [timers](/workflows/triggers/timer/) configured by cron in certain timezones would hang has been fixed.

***

## 1.2.5 - 2018-10-04

### Fixed <a name="1.2.5-fixed"></a>

- The [File: Read](/workflows/data/file-read/) Node now correctly closes the open file handle afterward in all cases.
- When the [File: Read](/workflows/data/file-read/) Node errors, it no longer overwrites the entire payload with the error message in certain cases.
- The [Modbus: Write](/workflows/data/modbus-write/) Node now correctly accepts the full range of a 16 bit unsigned integer for writing to a register.

***

## 1.2.4 - 2018-09-28

### Changed <a name="1.2.4-changed"></a>

- Change the limit on the number of concurrently running nodes to be applied per running workflow instead of globally across all running workflows.

***

## 1.2.3 - 2018-09-27

### Added <a name="1.2.3-added"></a>

- There are now [Alpine](https://hub.docker.com/_/alpine/) based docker images for the Edge Agent.
- The [typeof](/workflows/accessing-payload-data/#format-helpers) handlebars helper has been added.

### Changed <a name="1.2.3-changed"></a>

- The [Run Executable Node](/workflows/data/run-executable/) now supports detaching from the executable.
- The [Geofence Node](/workflows/logic/geofence/) now supports drawing custom polygons.
- The [Array Node](/workflows/logic/array/) now supports concat.
- Update to Node.js 8.12.0.

### Fixed <a name="1.2.3-fixed"></a>

- The [HTTP Node](/workflows/data/http/) now uses `auto` for `ecdhCurve` for SSL connections.

***

## 1.2.2 - 2018-08-22

### Added <a name="1.2.2-added"></a>

- Added a configuration flag to control the queuing of messages while the agent is offline.
- Added the new payload helper [`scaleLinear`](/workflows/accessing-payload-data/#format-helpers).
- Added the new payload helper [`currentDateTime`](/workflows/accessing-payload-data/#format-helpers).

### Changed <a name="1.2.2-changed"></a>

- Improved [Google Big Query](/workflows/data/google-big-query/) and [GoogleML Node](/workflows/data/google-ml/) error handling.
- Clarified certain verbose log messages.

***

## 1.2.1 - 2018-08-07

### Added <a name="1.2.1-added"></a>

- Can now choose to have no expiration time for the [JWT: Create Node](/workflows/logic/jwt-create/).

### Changed <a name="1.2.1-changed"></a>

- [Modbus: Read Node](/workflows/data/modbus-read/) and [Modbus: Write Node](/workflows/data/modbus-write/) now default to port 502.
- Improved [MongoDB Node](/workflows/data/mongo/) error handling.
- A workflow publishing MQTT messages to an invalid or unauthorized topic will no longer cause the agent to disconnect from the Losant Platform.

### Fixed <a name="1.2.1-fixed"></a>

- System clock changes no longer affect the firing of interval timers while the agent is running.
- Debug messages with circular references correctly send to the Losant Platform.

***

## 1.2.0 - 2018-06-21

### Added <a name="1.2.0-added"></a>

- Data / [ServiceNow Node](/workflows/data/service-now/)
- Triggers / [UDP Trigger](/workflows/triggers/udp/)
- Outputs / [UDP Send Node](/workflows/outputs/udp-send/)
- Edge workflow payloads now have environment variables available under the field `agentEnvironment`.
- Edge workflow payloads now have the field `isConnectedToLosant`, representing if the agent is currently connected to Losant.

### Changed <a name="1.2.0-changed"></a>

- Easily set authorization headers for requests on the [HTTP Node](/workflows/data/http/).
- Can now set the path for a cookie on the [HTTP Response Node](/workflows/outputs/http-response/).
- Improved phone number casting for the [Twilio Node](/workflows/outputs/twilio/).
- Update to Node.js 8.11.3.

***

## 1.1.1 - 2018-05-21

### Changed <a name="1.1.1-changed"></a>

- Improved startup messages.
- The [HTTP Node](/workflows/data/http/) now allows for setting timeouts and capturing network errors.

### Fixed <a name="1.1.1-fixed"></a>

- Improved messages for [Slack Node](/workflows/outputs/slack/) errors.
- Support circular references in debug messages.

***

## 1.1.0 - 2018-03-29

### Added <a name="1.1.0-added"></a>

- Logic / [Generate ID Node](/workflows/logic/generate-id/)
- Logic / [Hash Node](/workflows/logic/hash/)

### Changed <a name="1.1.0-changed"></a>

- Improved error messages
- The [Validate Payload Node](/workflows/logic/validate-payload/) now allows for defining your schema using either a [payload path](/workflows/accessing-payload-data/#payload-paths) or a [JSON template](/workflows/accessing-payload-data/#json-templates).

### Fixed <a name="1.1.0-fixed"></a>

- [Modbus: Read Node's](/workflows/data/modbus-read/) "Length" property now defaults to a value of 1 if left blank.
- [Modbus: Read](/workflows/data/modbus-read/) and [Modbus: Write](/workflows/data/modbus-write/) Nodes will now time out if they fail to connect to Modbus.

***

## 1.0.0 - 2018-03-08

### Added <a name="1.0.0-added"></a>

- Triggers / [Timer Trigger](/workflows/triggers/timer/)
- Triggers / [HTTP Request Trigger](/workflows/triggers/request/)
- Triggers / [MQTT Trigger](/workflows/triggers/mqtt/)
- Triggers / [Device: Command Trigger](/workflows/triggers/device-command/)
- Data / [Modbus: Read Node](/workflows/data/modbus-read/)
- Data / [Modbus: Write Node](/workflows/data/modbus-write/)
- Data / [File: Read Node](/workflows/data/file-read/)
- Data / [File: Write Node](/workflows/data/file-write/)
- Data / [Run Executable Node](/workflows/data/run-executable/)
- Outputs / [HTTP Response Node](/workflows/outputs/http-response/)
