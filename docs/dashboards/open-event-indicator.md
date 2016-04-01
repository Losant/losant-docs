# Open Event Indicator

The open event indicator block allows you to display the most important currently open event in the selected application.

![External Website](/images/dashboards/open-event-indicator-example.png "External Website")

## Configuration

The block has two configuration properties - choosing the application which should be watched for events, and an optional event filter.  If the event filter is left blank, the events are not filtered.

![External Config](/images/dashboards/open-event-indicator-config.png "External Config")

## Behavior

If no events are currently open, the block is green and displays the text "OK".  If there is an "Info" level event open, the block is green and displays the subject of the open event.  If there is a "Warning" level event open, the block is orange and displays the subject of the open event.  If there is a "Error" or "Critical" level event open, the block is red and displays the subject of the open event.
