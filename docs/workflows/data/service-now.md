flowclass: Cloud
flowclass: Edge 1.2.0
description: Learn more about the ServiceNow Node.

# ServiceNow Node

The ServiceNow Node allows you to create, update and get records from tables in the [ServiceNow](https://servicenow.com) platform.

![ServiceNow Node](/images/workflows/data/service-now-node.png "ServiceNow Node")

## Configuration

There are three main parts of the configuration for this node ...

![ServiceNow Node Configuration](/images/workflows/data/service-now-node-configuration.png "ServiceNow Node Configuration")

### Address Fields

Either InstanceName Template or URL Template is required.

* **Instance Name Template:** A [string template](/workflows/accessing-payload-data/#string-templates) for your ServiceNow instance that will be used to create the ServiceNow URL. For example, if your instance name is "Acme", the ServiceNow URL would end up being `https://acme.service-now.com`.
* **URL Template:** A string template for the URL address to access your ServiceNow API.

### Authentication Fields

* **Username Template:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for your username for Basic Authentication to ServiceNow.
* **Password Template:** (Required) A string template for your password for Basic Authentication to ServiceNow.

### Table Fields

* **Table Name:** (Required) The name of the table to make an API call at. The following are valid table names: Incident, Facilities Request Task, or Customer Service Case.
* **Action:** (Required) The type of action to perform on the given table. The following are valid table actions: [Get table records](https://developer.servicenow.com/app.do#!/rest_api_doc?id=c_TableAPI), [Insert a new record](https://developer.servicenow.com/app.do#!/rest_api_doc?id=r_TableAPI-POST), [Get table record](https://developer.servicenow.com/app.do#!/rest_api_doc?id=r_TableAPI-GETid), and [Update a table record](https://developer.servicenow.com/app.do#!/rest_api_doc?id=r_TableAPI-PUT).
* **ID Template:** A [string template](/workflows/accessing-payload-data/#string-templates) for the record ID to access on the API call. This field is only required if one of the following actions are chosen: `Get table record` or `Update a table record`.
* **Body Data Method:** The type of data method to use when building a body for the API call. The following are valid body data methods: `Individual Fields`, `JSON Template`, `Payload Path`. This is only applicable to actions that can handle a body, such as: `Insert table record`, `Update a table record`.
* **Body Data:** This is where you can build the body of the request. If you choose `Individual Fields` as your `Body Data Method`, then you can use template strings for your key and value pairs to build your body object. If you choose `JSON Template` as your `Body Data Method`, you can use a [JSON template](/workflows/accessing-payload-data/#json-templates) to build the body object. If you choose `Payload Path` as your `Body Data Method`, enter a [payload path](/workflows/accessing-payload-data/#payload-paths) to an object to use for the body.

#### Query String Fields

What query string parameters are available depends on which action is selected. For more information on formatting each of these query strings, check out the [documentation](https://developer.servicenow.com/app.do#!/rest_api_doc?id=r_TableAPI) on ServiceNow's site. The following are all the different query string options that are available:

* **Query String:** A [string template](/workflows/accessing-payload-data/#string-templates) that is an encoded query used to filter the result set. In the ServiceNow documentation this field is called `sysparm_query`. This field is only available on the action `Get table records`.
* **Display Value:** If this is checked, the result will use the display values for fields instead of the actual values from the database. In the ServiceNow documentation this field is called `sysparm_display_value`. This field is available on the following actions: `Get table records`, `Insert a new row`, `Get a table record`, or `Update table record`.
* **Fields:** A string template that is a common separated list of fields to return in the response. In the ServiceNow documentation this field is called `sysparm_fields`. This field is available on the following actions: `Get table records`, `Insert a new row`, `Get a table record`, or `Update table record`.
* **View:** A string template that is the UI to determine which fields are returned in the response. In the ServiceNow documentation this field is called `sysparm_view`. This field is available on the following actions: `Get table records`, `Insert a new row`, `Get a table record`, or `Update table record`.
* **Limit:** The number of records to return in the result. In the ServiceNow documentation this field is called `sysparm_limit`. This field is only available on the action `Get table records`.
* **Offset:** The number of records to skip from the query result. In the ServiceNow documentation this fields is called `sysparm_offset`. This field is only available on the action `Get table records`.
* **Exclude Reference Link:** If checked, the result will not include additional information for reference fields. In the ServiceNow documentation this field is called `sysparm_exclude_reference_link`. This field is available on the following actions: `Get table records`, `Insert a new row`, `Get a table record`, or `Update table record`.
* **Suppress Pagination Header:** If checked, the result will remove the link header from the response. In the ServiceNow documentation this field is called `sysparm_suppress_pagination_header`. This field is only available on the action `Get table records`.
* **Input Display Value:** If checked, the body fields are treated as display values and transformed into database fields. In the ServiceNow documentation this field is called `sysparm_input_display_value`. This field is on available on the action `Insert a new record`.

### RESPONSE

![ServiceNow Node Result](/images/workflows/data/service-now-node-result.png "ServiceNow Node Result")

* **Result Path:** The result of the API call made to ServiceNow will be placed at this [payload path](/workflows/accessing-payload-data/#payload-paths). This will either contain the result of the response, or error. The result will exist under the key "result", and error will exist under the key "error".

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
