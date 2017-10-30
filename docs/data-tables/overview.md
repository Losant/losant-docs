# Data Tables

Data tables allow for the storage of arbitrary data within your applications. This data can then be edited, queried or deleted either directly through the table interface or through a Losant [workflow](/workflows/overview/).

The amount of data (in bytes) that can be stored in your application's data tables is a [hard-limited resource](/organizations/resource-limits/#hard-limited-resources).

A list of your application's data tables can be reached by clicking the "Data Tables" tab in your application menu bar.

![Data Table List](/images/data-tables/data-table-list.png "Data Table List")

## Creating a Data Table

To create a data table, click the "Add Table" button in the top right corner of your application's data table list.

A data table's configuration consists of:

* **Name** - The table's name. This field is required, though the name of the table itself has no effect on its functionality.
* **Description** - This is an optional, longer description of the table.
* **Columns** - Though columns are optional, a table without columns is effectively useless. More information about [column definition](#table-columns) is below.

![Data Table Name and Description](/images/data-tables/data-table-name-desc.png "Data Table Name and Description")

Once your configuration is complete, click the "Add Data Table" button in the page's footer.

## Table Columns

You may define as many as 100 columns per table in addition to the [default columns](#default-columns) listed below.

The **column name**, which is the unique identifier against which data will be added and queried, must meet the following rules:

* Must be 1 to 255 characters.
* May only consist of uppercase letters, lowercase letters, numbers, underscores (\_) and hyphens (-).
* Must be unique within the table; the same column name cannot be used twice.
* Must not conflict with any of the default column names listed below.

### Default Columns

Every table automatically has the following columns, whose values per row are auto-generated:

* **id** is a Losant-generated alphanumeric ID for the row. This value cannot be changed.
* **createdAt** is the time at which the row was inserted into the table. This timestamp will never change.
* **updatedAt** is the last time the row was updated. If the row has never been updated, this will be equal to the timestamp in the `createdAt` column; otherwise, the timestamp will reflect the last time the row was edited.

### Column Data Types

When defining a column, you must set its data type as one of the following:

* **String** columns can contain any [string](https://en.wikipedia.org/wiki/String_(computer_science)) as its cells' values.
* **Number** means the column's values must be any rational number.
* **Boolean** columns must contain values of either `true` or `false`.

The one exception to the data type rules is that, if the column's [constraint](#column-constraints) is defined as `optional` (see below), a cell within a column of any data type may also have its value explicitly set to `null`.

![Data Table Columns](/images/data-tables/data-table-columns.png "Data Table Columns")

### Column Constraints

Every column requires one of three constraints be defined:

* **Unique** requires the value to be unique across all rows in your data table. Attempting to add or update a row where the value for this column matches the value in another row, the action will fail.
* **Required** means a value other than `null` must be supplied for this column. (For string data types, empty strings are OK.) Failing to provide a value will cause the addition / edit to fail.
* **Optional** puts no constraints on the value entered for the column, so long as the value's data type matches the type defined for the column.

### Default Values

For optional columns, you may also define a **default value** for the column. If provided, this value will be inserted into that row's column (on row creation only, not on row edit) if you do not define a property for that column. Note that providing a value of `null` will **not** lead to the default value being entered in the column; rather, `null` will be inserted for that column's value.

## Editing a Data Table

A table's name and description may be changed at any time without any adverse effect on the table and its data. Columns can also be added or removed at any time; however, these actions can lead to undesirable results.

To edit the properties of an existing table, click the "Edit Table" button in the top right corner of the table.

![Data Table Edit Button](/images/data-tables/data-table-edit-btn.png "Data Table Edit Button")

### Adding a Column

Adding a column to your table is not a dangerous action, but there are a few things to note when doing so:

* Any rows that existed before the creation of the new column will have `null` values set for that column, even if the new column has the `Unique` or `Required` constraint. The value can be changed at any time, but the new value must validate against the column's data type and constraint.
* If you define a default value for the column, the default will only be applied to new rows; existing table rows will not retroactively get the default value for the new column.
* Adding a column of the same name as a previously deleted column **will not restore data** from the deleted column, even if the new column's data type and constraint also match the deleted column.

### Removing a Column

You will receive a warning if you attempt to remove a column from your table, as doing so will have the following consequences on your application:

![Data Table Column Delete Warning](/images/data-tables/data-table-col-delete-warning.png "Data Table Column Delete Warning")

* **All data for the column will be deleted**, even if you immediately add a new column with the same name, data type and constraint. This data cannot be recovered.
* Any [Table Get Rows](/workflows/data/table-get-rows/) nodes that query against the removed column **will throw errors** in your workflows, as the query is invalid if the column no longer exists.
* Any workflows inserting or updating rows with values defined for the removed column will continue to function normally; values for the removed column will simply be ignored.

## Working with Table Data

To view the data within your table, click a table's name within the list of your application's tables. This will lead to an interface where you can browse table rows, edit data and perform [advanced queries](#querying-table-data).

### Sorting Data

By default, your table displays up to 1,000 rows per page, sorted by creation date with the most recently created row at the top. You may change the sort field or the sort direction by clicking the arrows alongside each column's name.

![Data Table Sorting](/images/data-tables/data-table-sort.png "Data Table Sorting")

### Adding a Row

To manually add a row to a data table, click the "Add Row" button in the top right corner of the table browsing interface. This will open an editor pane alongside the table where values can be added for each column. Then, click the "Add Row" button at the bottom of the pane to insert the row into the table.

![Data Table Add Row](/images/data-tables/data-table-add-row.png "Data Table Add Row")

**Note:** Depending on the values entered for the row and the table's current [sort](#sorting-data) / [query](#querying-table-rows) rules, your new row may not be immediately visible after it is added.

Alternatively, you may add table rows through a workflow using the [Table Insert Row](/workflows/data/table-insert-row/) node.

### Editing a Row

You may edit any table row by clicking the row ID in the table browsing interface. This will bring up an editor pane, similar to [adding a row](#adding-a-row) but with the row's current values filled in. The same validation rules around data types and column constraints apply when editing a row; for example, if editing a uniquely constrained string column, the new value must also be unique within the table. (Once the edit is complete, the original value will be available for use in other table columns.)

![Data Table Update Row](/images/data-tables/data-table-update-row.png "Data Table Update Row")

You may also use the [Table Update Row](/workflows/data/table-update-row/) node to update a row using a workflow.

### Deleting a Row

To delete a table row, select a row as if to [edit its contents](#editing-a-row) and click the "Delete Row" button in the editor pane. Once a row has been deleted, any [uniquely constrained](#column-constraints) values within the row will be available for other rows to use.

You may also use the [Table Delete Row](/workflows/data/table-delete-row/) node to delete a row using a workflow.

## Querying Table Data

To filter your table rows based on the data within them, you may add a query within the table browsing interface. To add a query, click the "Edit" icon in the filter box above the table; similarly, to clear filter results, click the "Remove" icon in the filter box.

![Data Table Edit Query](/images/data-tables/data-table-edit-query.png "Data Table Edit Query")

### Any / All Queries

At the top of the query builder is a select box to choose your query mode. Two of the options – `Match any of the following ...` and `Match all of the following ...` – provide an interface for building single comparisons per column. Each of your columns can be queried by certain operators depending on the column type ...

* **id** columns can only be tested for equality or inequality against a valid Losant ID.
* **createdAt** and **updatedAt** columns can be tested against dates that are equal to, not equal to, or before or after a provided date.
* **String** and **Boolean** data types can be compared for equality, inequality or `null` value checks.
* **Number** data types can be compared for equality, inequality, or greater than or less than comparisons against a value you define. They may also be checked against `null` value status.

![Data Table Simple Query](/images/data-tables/data-table-simple-query.png "Data Table Simple Query")

Queries built in `Match any ...` mode will return rows where any of the defined lines return `true` for the row. In `Match all ...` mode, only rows where every line returns `true` will be included in the query.

### Advanced Queries

If you'd like to build an advanced query, you may choose the `Advanced` option in the mode selector. Losant uses a query language similar to [MongoDB's find() syntax](https://docs.mongodb.com/manual/reference/method/db.collection.find/).

![Data Table Advanced Query](/images/data-tables/data-table-advanced-query.png "Data Table Advanced Query")

Valid logical operators include:

* [$or](https://docs.mongodb.com/manual/reference/operator/query/or/) for "Match any" queries
* [$and](https://docs.mongodb.com/manual/reference/operator/query/and/) for "Match all" queries

Valid comparison operators include:

* [$eq](https://docs.mongodb.com/manual/reference/operator/query/eq/) for equality checks (`===`)
* [$ne](https://docs.mongodb.com/manual/reference/operator/query/ne/) for inequality checks (`!==`)
* [$gt](https://docs.mongodb.com/manual/reference/operator/query/gt/) for greater than checks (`>`)
* [$gte](https://docs.mongodb.com/manual/reference/operator/query/gte/) for greater than or equal to checks (`>=`)
* [$lt](https://docs.mongodb.com/manual/reference/operator/query/lt/) for less than checks (`<`)
* [$lte](https://docs.mongodb.com/manual/reference/operator/query/lte/) for less than or equal to checks (`<=`)

## Exporting a Data Table

![Data Table Export](/images/data-tables/data-table-export.png "Data Table Export")

You can request a CSV export of a data table using the "Export..." button in the top right corner of the table. This will generate a CSV file of the data table and send you an email when the export is complete. The email includes a link which will allow you to download the generated file (the link is time sensitive and will only work for 7 days). This request can only be made 1 every 5 minutes per data table.

![Data Table Export Form](/images/data-tables/data-table-export-email.png "Data Table Export Form")

## Deleting a Data Table

To delete a data table, click the "Delete" icon next to any table on the list page, or by clicking the "Delete" button in the footer of a data table's edit page.

Note that deleting a data table will also delete **all table data** and may possibly cause any workflows that interact with your data table to throw errors. Deleting a data table **cannot be undone**.
