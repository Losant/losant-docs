flowclass: Cloud
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant Time Range Node.

# Time Range Node

The Time Range Node allows a workflow to branch based upon the time of the payload compared to a defined time range.

![Time Range Node](/images/workflows/logic/time-range-node.png "Time Range Node")

## Configuration

There are two main sections in configuring the Time Range Node - first choosing the time to compare against the range, and second defining the range itself. When the time to check is within the defined range, the `true` (or right) path out of the node is taken, and when the time to check is not in the defined range, the `false` (or left) path out of the node is taken.

![Time To Check](/images/workflows/logic/time-range-node-check-config.png "Time To Check")

The time to check against is defined using a [payload path](/workflows/accessing-payload-data/#payload-paths) representing a location on the current workflow payload. This can be left blank, and if it is left blank, the time of the payload itself is used. In the above example, we are doing just that - using the time of the payload itself.

The range is defined using HH:MM format for a start time and end time (using 24 hour time format) - for instance 01:00 as the start and 23:00 as the end means that time values 1:00am or later, but earlier than 11:00pm, would fall within the range. The start time value is inclusive, and the end time value is exclusive - meaning that in the 01:00 to 23:00 example, the exact time 01:00 would be in the range but the exact time 23:00 would not be included. Leaving the start or end fields blank defaults those fields to the value 00:00, which means the entire day is included within the range.

You can also choose a time zone for the range (by default the time zone is the current timezone of your browser), or you can select `Payload Template`, and enter a payload path that will resolve in a timezone. The time to check is converted to the selected time zone before comparison.

In addition to specifying a time range, you can also specify days of the week - so you can easily create a Time Range Node that will only match on Saturdays or Sundays, but not the rest of the week. Specifing days of the week can be done in two ways. The first is picking which days you always want to include by checking the buttons. The second is to provide a payload path that will resolve into a list of seven boolean (`true` or `false`) values, such that each value corresponds to a day of the week. The first value of the list represents Sunday, while the last represents Saturday. For example, if you only wanted the time range to include Monday through Friday the payload path should resolve to `[ false, true, true, true, true, true, false ]`.

![Time Range Config](/images/workflows/logic/time-range-node-range-config.png "Time Range Config")

In the above example the workflow will take the `true` (right) path out of the Time Range Node only if the time of the payload is between 1am and 11pm, any day of the week. If the payload is after 11pm, but before 1am, it would take the left path - which has no nodes connected, and so the workflow would stop.

## Optional Output

![Time Range Output](/images/workflows/logic/time-range-node-output.png "Time Range Output")

The Time Range Node has one optional output field. The `Path for Branch` field takes a [payload path](/workflows/accessing-payload-data/#payload-paths), and if it is defined the value `true` or `false` will be placed at the given path, depending on which branch out of the node is taken.
