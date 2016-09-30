# Record Event Node

The record event node allows a workflow to record an [event](/events/overview) for the current application.

![Record Event Node](/images/workflows/outputs/record-event-node.png "Record Event Node")

## Configuration

There are four parts to configuring a record event node - selecting the level of the event, configuring the event subject, and optionally configuring the detailed event message and any structured data for the event.

![Record Event Node Configuration](/images/workflows/outputs/record-event-node-config.png "Record Event Node Configuration")

The level of the event can be one of "Info", "Warning", "Error", "Critical", or "Payload Template". When "Payload Template" is selected, the level is determined by evaluating the given [string template](/workflows/accessing-payload-data/#string-templates), allowing the level to be dynamically determined from the current workflow payload. When using a template, it must evaluate to one of `info` / `warning` / `error` / `critical` - if it does not, the event creation will fail.

The subject of the event, as well as the message, also support [string templates](/workflows/accessing-payload-data/#string-templates). If the detailed message is not set, the event is created with an empty detailed message. In the above example, the record event node will create an event with the level "Error", the subject "Power Level Critical", and the message "Power level exceeded error threshold at {{ data.power }}".

An event can also be optionally created with some structured data attached, by providing a [payload path](/workflows/accessing-payload-data/#payload-paths) in the `Extra Event Data Path` field. If provided, this JSON path will be evaluated against the payload and the result will be attached to the event as a JSON object.

## Output

![Record Event Node Output](/images/workflows/outputs/record-event-node-output.png "Record Event Node Output")

The record event node can optionally place the ID of the created event onto the payload at an arbitrary [payload path](/workflows/accessing-payload-data/#payload-paths). In the above example, the event ID will be placed on the payload at the path `data.newEventId`. In the case of event creation being throttled, there will be no value placed at the path.

## Notes on Event Creation

Event creation is limited to **one event per second per application**. In general, however, it is recommended that event creation be throttled even further using a [throttle node](/workflows/logic/throttle/) in case of a large burst of potential events, since there is almost never a need to create events that frequently.

Events created through a workflow will be marked with a `sourceType` of `flow`, and a `sourceId` of the ID of the current workflow. This can be seen when viewing the event details page, or in the `data` provided to a workflow using the [event trigger](/workflows/triggers/event).
