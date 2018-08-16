# Event List

The Event List Block displays a list of events for a given application. The list links to each event and displays each one's subject, level (info, warning, error or critical) and the time the event occurred.

![Event List](/images/dashboards/events-example.png "Event List")

## Configuration

The block takes one required parameter and one optional parameter:

![Event List Config](/images/dashboards/events-config.png "Event List Config")

### Event Status

The block can display events of different statuses. Choose one of the four options:

* **Open** displays all open events. This is the status of all new events created within the platform. This includes all events that have not been acknowledged or resolved by the user.
* **Acknowledged** displays all events that have been acknowledged by the user but have not yet been resolved.
* **Resolved** displays all events resolved by the user.
* **All** displays all of your events within the application, regardless of event status.

### Event Filter

The block allows for a filter to reduce the list of events by subject. The filter accepts an asterisk `*` to search for any occurrence of the given characters in the event subject. For example:

* Filtering with "geo" will display an event called "Geofence" but hide one called "Park My Geo Prizm"
* Filtering with "\*geo", will show both the "Geofence" and "Park My Geo Prizm" events

Do not provide a filter if you wish to display all events within the given event status (All, Open, Acknowledged or Resolved).
