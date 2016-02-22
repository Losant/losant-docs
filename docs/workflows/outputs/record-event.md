# Record Event

The record event node allows a workflow to record an [event](/events/overview) for the current application.

![Record Event Node](/images/workflows/outputs/record-event-node.png "Record Event Node")

## Configuration

There are three parts to configuring a record event node - selecting the level of the event, configuring the event subject, and optionally configuring the detailed event message.

![Record Event Node Configuration](/images/workflows/outputs/record-event-node-config.png "Record Event Node Configuration")

The level of the event can be one of "Info", "Warning", or "Error". The subject of the event supports payload templating, and so can be determined dynamically based on the current workflow payload. The detailed message is optional, but also supports payload templating if needed. If the detailed message is not set, the event is created with an empty detailed message. In the above example, the record event node will create an event with the level "Error", the subject "Power Level Critical", and the message "Power level exceeded error threshold at {{ data.power }}".

## Notes on Event Creation

Event creation is limited to 1 event per second per application.  In general, however, it is recommended that event creation be throttled even further using a [throttle node](/workflows/logic/throttle/) in case of a large burst of potential events, since there is almost never a need to create events that frequently.

Events created through a workflow will be marked with a `sourceType` of `flow`, and a `sourceId` of the ID of the current workflow.  This can be seen when viewing the event details page, or in the `data` provided to a workflow using the [event trigger](/workflows/triggers/event).
