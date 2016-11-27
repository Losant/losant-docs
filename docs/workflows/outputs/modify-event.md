# Record Event Node

The modify event node allows a workflow to change the state of an existing [event](/events/overview).

![Modify Event Node](/images/workflows/outputs/modify-event-node.png "Modify Event Node")

## Configuration

There are three parts to configuring a modify event node - the event ID(s) to modify, selecting the new state of the event(s), and optional event update information.

![Modify Event Node Configuration](/images/workflows/outputs/modify-event-node-config.png "Modify Event Node Configuration")

A [payload path](/workflows/accessing-payload-data/#payload-paths) must be provided that should point to the event ID(s) to modify; the value at the path can be a single event ID or an array of event IDs.  If there are no IDs at the path, or the IDs are invalid (i.e, the event(s) are not found), the modify event node does nothing and the workflow continues.

The new state of the event(s) can be one of "Resolved", "Acknowledged", "New", or "Payload Template". When "Payload Template" is selected, the state is determined by evaluating the given [string template](/workflows/accessing-payload-data/#string-templates), allowing the state to be dynamically determined from the current workflow payload.  When using a string template, it must evaluate to one of `resolved` / `acknowledged` / `new` - if it does not, the event modification will fail.

![Modify Event Node Updates](/images/workflows/outputs/modify-event-node-updates.png "Modify Event Node Updates")

Optionally, comments or additional structured data can be added to an event when updating.  The comment field takes a [string template](/workflows/accessing-payload-data/#string-templates), and will be added to the event update if provided. Comments will be treated as markdown when displayed on the details page of an event. The structured data (the `Extra Event Data Path` field) expects a [payload path](/workflows/accessing-payload-data/#payload-paths), and if provided, this will be evaluated against the payload and the result will be attached to the event update as a JSON object.  Event state changes, comments, and updates are visible when viewing the event in the application.
