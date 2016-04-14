# Record Event Node

The modify event node allows a workflow to change the state of an existing [event](/events/overview).

![Modify Event Node](/images/workflows/outputs/modify-event-node.png "Modify Event Node")

## Configuration

There are two parts to configuring a modify event node - configuring where to get the ID of the event(s) to modify, and selecting the new state of the event(s).

![Modify Event Node Configuration](/images/workflows/outputs/modify-event-node-config.png "Modify Event Node Configuration")

A JSON path must be provided that should point to where in the payload the event ID(s) to modify are.  The path can point at a single event ID, or it can point at an array of event IDs.  If there are no IDs at the path, or the IDs are invalid (i.e, the event(s) are not found), the modify event node does nothing.

The new state of the event(s) can be one of "Resolved", "Acknowledged", "New", or "Payload Template". When "Payload Template" is selected, the state is determined by evaluating the given template string, allowing the state to be dynamically determined from the current workflow payload.  When using a template, the template string must evaluate to one of `resolved` / `acknowledged` / `new` - if it does not, the event modification will fail.  If the events are already in the requested state, the modify event node does nothing.
