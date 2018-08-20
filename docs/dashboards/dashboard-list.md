# Dashboard List

The Dashboard List Block allows you to display a list of your dashboards. The list includes links to the dashboards, their names, and whether each dashboard is visible to the public.

![Dashboard List](/images/dashboards/dashboards-example.png "Dashboard List")

## Configuration

The block takes one optional parameter: a filter to reduce the list of dashboards by name. The filter accepts an asterisk `*` to search for any occurrence of the given characters in the dashboard name. For example:

* Filtering with "th" will display an dashboard called "Thermostat" but hide one called "Monolith"
* Filtering with "\*th", will show both the "Thermostat" and "Monolith" dashboards

To display all of your dashboards, do not provide a filter.

![Dashboard List Config](/images/dashboards/dashboards-filter.png "Dashboard List Config")
