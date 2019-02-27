---
description: Learn more about Losant's Data Table Dashboard Block
---

# Data Table

The Data Table Block displays a list of rows from one of your [application data tables](/data-tables/overview/).

![Data Table](/images/dashboards/data-table-overview.png "Data Table")

## Configuration

Configuring the Data Table Block is broken up over three sections ...

### Choosing a Data Table

First, choose one of your application's data tables from which rows should be returned.

![Select Data Table](/images/dashboards/data-table-select-table.png "Select Data Table")

### Building a Query

Optionally, you may include a query to only return a subset of your table's rows. Building a query is done the same way as building a query in the [Table: Get Rows Node](/workflows/data/table-get-rows/#query-fields), where an array of individual queries can be joined with an "OR" or "AND" operator.

![Data Table Simple Query](/images/dashboards/data-table-query-simple.png "Data Table Simple Query")

The "Property" and "Value" fields for each section of the query support [string templates](/workflows/accessing-payload-data/) resolving to values in your [dashboard context](/dashboards/context-variables/). When building an advanced query, the field supports [JSON templates](/workflows/accessing-payload-data/#json-templates).

![Data Table Advanced Query](/images/dashboards/data-table-query-advanced.png "Data Table Advanced Query")

### Setting Default Sort Order

After choosing a table, from the configuration screen, you may use the sort arrows in the block preview's table header to set the default sort column and direction.

![Data Table Default Sort](/images/dashboards/data-table-default-sort.png "Data Table Default Sort")

Dashboard users can choose different sort options by clicking these arrows on the dashboard, but every time they leave the page and return to it, the block will reset to its default sort order.
