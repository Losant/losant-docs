---
description: Learn about recording and managing events in the Losant platform.
---

# Events

Events provide a way to collect, view, and respond to exceptional occurrences in your application. For example, if the temperature of a refrigerator exceeds 40 degrees, a temperature warning event could be created. If the temperature then exceeds 50 degrees a temperature error could be created.

![Event List](/images/events/event-list.png "Event List")

## Creating Events

Events are typically created using Losant [workflows](/workflows/overview/). The [events](/workflows/outputs/record-event/) output node allow you to create events as needed.

![Create Event Workflow](/images/events/create-event-workflow.png "Create Event Workflow")

In the above example, a device is reporting temperature state and triggering the workflow. The condition node is checking the value of the temperature. If the value is greater than 50 a temperature error event is created.

## Using Events

Events are typically consumed using the events page, which is accessible under `Events` in the Application menu bar.

![Events Menu](/images/events/events-menu.png "Events Menu")

The events page allows you to review the details about each event, acknowledged them if needed, and resolve them.

Events can also be used to trigger other workflows. In the refrigerator example, if you wanted to perform additional actions when an event gets created, you could use the [event trigger](/workflows/triggers/event/) to run additional workflows.

![Event Trigger](/images/events/event-trigger.png "Event Trigger")

In the above example, the workflow is trigger whenever an event is created with a specific level (error). The workflow then sends an SMS message to alert the user.

## Events Life Cycle

Events include basic life cycle features for proper organization and handling.

`New -> Acknowledged -> Resolved`

How the events transition through these states is entirely up to your and your specific application. A log of who/what transitioned an event (as well as when that occurred) is attached to each event with optional comments and structured data.
