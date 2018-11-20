flowclass: Application
flowclass: Experience
description: Learn more about the Losant Table: Get Rows Node.

# Table: Get Rows Node

The Data Table: Get Rows Node allows for querying your application's data tables and storing the results of the query on your workflow's payload.

![Get Rows Node](/images/workflows/data/get-rows-overview.png "Get Rows Node")

## Configuration

The node takes a number of parameters, most of which are optional.

### Required Fields

* **Table ID Template:** The table on which the query should be performed. You may select one of your application's tables or enter a [string template](/workflows/accessing-payload-data/#string-templates), which should resolve to a valid table ID.
* **Result Path:** A [payload path](/workflows/accessing-payload-data/#payload-paths) defined at the bottom of the editor for where the result of the query will be stored. This result will include the query itself, the items in the query, and some additional meta information; or, the result will include an error if the query is invalid.

### Query Fields

Building your query within the node is nearly identical to [building a query](/data-tables/overview/#querying-table-data) within the table browsing interface. The only difference is, when building a query within the node, you may use [string templates](/workflows/accessing-payload-data/#string-templates) for each property and value – or, if building an [advanced query](/data-tables/overview/#advanced-queries), you may use a [JSON template](/workflows/accessing-payload-data/#json-templates).

![Get Rows Query](/images/workflows/data/get-rows-query.png "Get Rows Query")

If you selected a data table directly instead of using a template, there will be a section detailing all of the columns in the table and their data types to assist you in building your query.

**The query section is optional.** If you do not include any queries, all rows will be returned and then limited by the filter fields defined below. However, if you do include any piece of a query (e.g. the `Property`), you must also include the other two pieces (the `Operator` and the `Value`).

### Filter Fields

Optionally, you may also include some parameters for sorting, limiting and paginating the results of the query. All of these fields are templatable.

![Get Rows Filter](/images/workflows/data/get-rows-filter.png "Get Rows Filter")

* **Sort By Template** is the field by which the results should be sorted. If using a template, this should resolve to one of your table's column names or one of the [default columns](/data-tables/overview/#default-columns). Default is `id`.
* **Sort Direction Template** must be either `asc`, `desc` or a template that resolves to one of those values. Default is `asc`.
* **Limit Template** must be a number between 1 and 1000, or a template that resolves to such a number. Default is `1000`.
* **Offset Template** must be a number greater than or equal to 0, or a template that resolves to such a number. This is similar to requesting a specific page of results, except you are defining the number of records to skip instead of a page to return. Default is `0`.
