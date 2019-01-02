---
description: Learn about listing your Workflows on a Losant Dashboard.
---

# Workflow List

The Workflow List Block displays a list of workflows within a given application. The list links to each workflow and displays each one's name, enabled / disabled status and a count of runs and errors in the last 24 hours.

![Workflows List](/images/dashboards/workflows-example.png "Workflows List")

## Configuration

The block takes one optional parameter: a filter to reduce the list of workflows by name and by type.

The name filter accepts an asterisk `*` to search for any occurrence of the given characters in the device name. For example:

* Filtering with "geo" will display a workflow called "Geofence" but hide one called "Park My Geo Prizm"
* Filtering with "\*geo", will show both the "Geofence" and "Park My Geo Prizm" workflows

To display workflows with any name for a given application, do not provide a filter.

The type filter by default will include only `Application Workflows` and `Edge Workflows`. At least one type of workflow is required to be checked.
If you include `Experience Workflows` with `Application Workflows` or `Edge Workflows` or both, the `Edge Workflows` will be the application's develop version workflows. However, if you only choose `Experience Workflows`, you will be allowed to specify the version to display.

![Workflow List Config](/images/dashboards/workflows-filter.png "Workflow List Config")
