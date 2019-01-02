---
description: Learn about listing your Applications on a Losant Dashboard.
---

# Application List

The Application List Block allows you to display a list of your applications on your dashboard. The list includes links to the applications, their names, and their workflow and device count.

![Application List](/images/dashboards/applications-example.png "Application List")

## Configuration

The block takes one optional parameter: a filter to reduce the list of applications by name. The filter accepts an asterisk `*` to search for any occurrence of the given characters in the application name. For example:

* Filtering with "th" will display an application called "Thermostat" but hide one called "Monolith"
* Filtering with "\*th", will show both the "Thermostat" and "Monolith" applications

To display all of your applications, do not provide a filter.

![Application List Config](/images/dashboards/applications-filter.png "Application List Config")
