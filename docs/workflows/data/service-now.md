flowclass: Cloud
flowclass: Edge 1.2.0
description: Learn more about the Losant Modbus: Read Node.

# ServiceNow Node

The ServiceNow Node allows you to create, update and get rows from tables: Incident, Facilities Request Task, Customer Service Case.

![ServiceNow Node](/images/workflows/data/service-now-node.png "ServiceNow Node")

## Configuration

There are three main parts of the configuration for this node ...

![ServiceNow Node Configuration](/images/workflows/data/service-now-node-configuration.png "ServiceNow Node Configuration")

### Address Fields

Address Fields specify where to make the API call to ServiceNow, either Instance Name Template or URL Template is required:

* **Instance Name Template:** A [string template](/workflows/accessing-payload-data/#string-templates) the name of your ServiceNow instance that will be used to create the ServiceNow URL, e.g. `https://${INSTANCE NAME TEMPLATE}.service-now.com`
* **URL Template:** A string template for the URL address to access your ServiceNow API.
* **Namespace Template:** (Required) A string template for the ServiceNow namespace to use on the API route.

### Authentication Fields

* **Username Template:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) of your username for Basic Authentication to ServiceNow.
* **Password Template:** (Required) A string template of your password for Basic Authentication to ServiceNow.

### Table Fields

* **Table Name:** (Required) The name of the table to make an API call at. The following are valid table names: Incident, Facilities Request Task, or Customer Service Case.
* **Action:** (Required) The type of action to perform on the given table. The following are valid table actions: [Get table rows](https://developer.servicenow.com/app.do#!/rest_api_doc?v=jakarta&id=c_TableAPI), [Insert a new row](https://developer.servicenow.com/app.do#!/rest_api_doc?v=jakarta&id=r_TableAPI-POST), [Get table row](https://developer.servicenow.com/app.do#!/rest_api_doc?v=jakarta&id=r_TableAPI-GETid), [Patch a table row](https://developer.servicenow.com/app.do#!/rest_api_doc?v=jakarta&id=r_TableAPI-PATCH), and [Replace a table row](https://developer.servicenow.com/app.do#!/rest_api_doc?v=jakarta&id=r_TableAPI-PUT).
* **ID Template:** A [string template](/workflows/accessing-payload-data/#string-templates) for the row ID to access on the API call. This field is only required if one of the following actions are chosen: `Get table row`, `Patch a table row` or `Replace a table row`.
* **Body Data Method:** The type of data method to use when building a body for the API call. The following are valid body data methods: `Individual Fields`, `JSON Template`, `Payload Path`. This is only applicable to actions that can handle a body, such as: `Insert table row`, `Patch a table row` or `Replace a table row`.
* **Body Data:** This is where you can build the body of the request. If you choose `Individual Fields` as your `Body Data Method`, then you can use template strings for your key and value pairs to build your body object. If you choose `JSON Template` as your `Body Data Method`, you can use a [JSON template](/workflows/accessing-payload-data/#json-templates) to build the body object. If you choose `Payload Path` as your `Body Data Method`, enter a [payload path](/workflows/accessing-payload-data/#payload-paths) and that path should evaluate to an object.

#### Query String Fields

Depending on which `Action` is selected will depend on what query string parameters are available. For more information on formating each of these query string, checkout the [documentation](https://developer.servicenow.com/app.do#!/rest_api_doc?v=jakarta) on ServiceNow's site. The following are all the different query string options that are available:

* **Query String:** A [string template](/workflows/accessing-payload-data/#string-templates) that is an encoded query used to filter the result set. In the ServiceNow documentation this field is called `sysparm_query`. This field is only available on the action `Get Table Rows`.
* **Display Value:** If this is checked, the result will use the display values for fields instead of the actual values from the database. In the ServiceNode documentation this field is called `sysparm_display_value`. This field is available on the following actions: `Get Table Rows`, `Insert a new row`, `Get table row`, `Patch table row`, or `Replace table row`.
* **Fields:** A string template that is a common separated list of fields to return in the response. In the ServiceNow documentation this field is called `sysparm_fields`. This field is available on the following actions: `Get Table Rows`, `Insert a new row`, `Get table row`, `Patch table row`, or `Replace table row`.
* **View:** A string template that is the UI to determine which fields are returned in the response. In the ServiceNow documentation this field is called `sysparm_view`. This field is available on the following actions: `Get Table Rows`, `Insert a new row`, `Get table row`, `Patch table row`, or `Replace table row`.
* **Limit:** The number of records to return in the result. In the ServiceNow documentation this field is called `sysparm_limit`. This field is only available on the action `Get Table Rows`.
* **Offset:** The number of records to skip from the query result. In the ServiceNow documentation this fields is called `sysparm_offset`. This field is only available on the action `Get Table Rows`.
* **Exclude Reference Link:** If checked the result will not include additional information for reference fields. In the ServiceNow documentation this field is called `sysparm_exclude_reference_link`. This field is available on the following actions: `Get Table Rows`, `Insert a new row`, `Get table row`, `Patch table row`, or `Replace table row`.
* **Suppress Pagination Header:** If check the result will remove the Link header from the response. In the ServiceNow documentation this field is called `sysparm_exclude_reference_link`. This field is only available on the action `Get Table Rows`.
* **Input Display Value:** If checked the body fields are treated at display values and transformed into database fields. In the ServiceNow documentation this field is called `sysparm_input_display_value`. This field is available on the following actions: `Insert a new row`, or  `Patch table row`.

### RESPONSE

![ServiceNow Node Result](/images/workflows/data/service-now-node-result.png "ServiceNow Node Result")

* **Result Path:** The result of the API call made to ServiceNow, will be placed at this [payload path](/workflows/accessing-payload-data/#payload-paths). This will either contain the result of the response, or a error. The result will exist under the key "result", and error will exist under the key "error".

The following is an example of a successful call to get a single row back from the table `Incidents`, where the result path is `serviceNow.response`:

```json
{
  "serviceNow": {
    "response": {
      "result": {
        "parent": "",
        "caused_by": "1234",
        "sys_update_by": "admin"
      }
    }
  }
}
```

The following is an example of an unsuccessful call to the `Incidents` table, where the result path is `serviceNow.response`:

```json
{
  "serviceNow": {
    "response": {
      "error": {
        "statusCode": 401,
        "message": "User not Authenticated"
      }
    }
  }
}
```
