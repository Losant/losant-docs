flowclass: Cloud
flowclass: Experience
description: Learn more about the Losant Record Event Node.

# Record Event Node

The Record Event Node allows a workflow to record an [event](/applications/events/) for the current application.

![Record Event Node](/images/workflows/outputs/record-event-node.png "Record Event Node")

## Configuration

There are four parts to configuring a Record Event Node - selecting the level of the event, configuring the event subject, and optionally configuring the detailed event message and any structured data for the event.

![Record Event Node Configuration](/images/workflows/outputs/record-event-node-config.png "Record Event Node Configuration")

The level of the event can be one of "Info", "Warning", "Error", "Critical", or "Payload Template". When "Payload Template" is selected, the level is determined by evaluating the given [string template](/workflows/accessing-payload-data/#string-templates), allowing the level to be dynamically determined from the current workflow payload. When using a template, it must evaluate to one of `info` / `warning` / `error` / `critical` - if it does not, the event creation will fail.

The subject of the event, as well as the message, also support [string templates](/workflows/accessing-payload-data/#string-templates). If the detailed message is not set, the event is created with an empty detailed message. In the above example, the Record Event Node will create an event with the level "Error", the subject "Power Level Critical", and the message "Power level exceeded error threshold at {{ data.power }}". The message for an event will be treated as markdown when displayed on the details page of an event.

An event can also be optionally created with some structured data attached, by providing a [payload path](/workflows/accessing-payload-data/#payload-paths) in the `Extra Event Data Path` field. If provided, this JSON path will be evaluated against the payload and the result will be attached to the event as a JSON object.

## Event Time

![Record Event Node Time Configuration](/images/workflows/outputs/record-event-node-time.png "Record Event Node Time Configuration")

In addition, optionally, the timestamp to use as the creation time of the event can be changed. By default, the current time will be used (the first radio option). But in cases where that timestamp value is not desired, there are two other options - the timestamp of the current workflow payload being processed, or a timestamp on a specified payload path. The current time will often be very similar to the timestamp on the current workflow payload, but not always (depending on the length of time running the workflow takes) - and can in fact be drastically different in the case of non-realtime reports triggering a workflow. When specifying a payload path, the workflow expects the timestamp to conform to the same rules as a timestamp on a [state report](/devices/state/#including-timestamps).

## Output

![Record Event Node Output](/images/workflows/outputs/record-event-node-output.png "Record Event Node Output")

The Record Event Node can optionally place the ID of the created event onto the payload at an arbitrary [payload path](/workflows/accessing-payload-data/#payload-paths). In the above example, the event ID will be placed on the payload at the path `data.newEventId`. In the case of event creation being throttled, there will be no value placed at the path.

## Notes on Event Creation

Event creation is limited to **one event per second per application**. In general, however, it is recommended that event creation be throttled even further using a [Throttle Node](/workflows/logic/throttle/) in case of a large burst of potential events, since there is almost never a need to create events that frequently.

Events created through a workflow will be marked with a `sourceType` of `flow`, and a `sourceId` of the ID of the current workflow. This can be seen when viewing the event details page, or in the `data` provided to a workflow using the [event trigger](/workflows/triggers/event/).
