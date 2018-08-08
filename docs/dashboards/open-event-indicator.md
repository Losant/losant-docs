# Open Event Indicator

The Open Event Indicator Block allows you to display the most important currently open event in the selected application.

![External Website](/images/dashboards/open-event-indicator-example.png "External Website")

## Configuration

The block has two configuration properties - choosing the application that should be watched for events, and an optional event filter. If the event filter is left blank, the events are not filtered.

![External Config](/images/dashboards/open-event-indicator-config.png "External Config")

## Behavior

The block looks through all open events within the selected application and displays the most "severe" event it finds, searching for and displaying the first open event it finds in the following order ...

* If the event's level is **"Critical"**, the block turns red and display an "error" icon.
* **"Error"** events display in the same manner as critical events.
* A **"Warning"** event will display against an orange background and with a "warning" icon.
* If the event is of an **"Info"** level, the block will be blue with an "info" icon.

If there is more than one event at any of the given levels, the most recently created event will display within the block.

If the application has **no open events**, the block will be green with an "OK" icon and message.

The block will also display a count of all open events within the application.
