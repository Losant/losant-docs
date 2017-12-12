# GCP BigQuery

The GCP (Google Cloud Platform) BigQuery node allows a workflow to interact with Google BigQuery by fetching, creating, updating, or deleting data and optionally store the result on the workflow payload.

![GCP BigQuery Node](/images/workflows/data/google-big-query-node.png "GCP BigQuery Node")

## Configuration

Configuration for the node is broken up into four sections.

### Service Account Auth Token

A [service account auth token](https://cloud.google.com/docs/authentication/getting-started#creating_a_service_account) is required for the workflow to authenticate with Google ML. You may enter this token one of two ways:

- **JSON Template** accepts a [JSON template](/workflows/accessing-payload-data/#json-templates) for the token.
- **Payload Path** accepts a [payload path](/workflows/accessing-payload-data/#payload-paths) for the token.

### Resource & Action

Choose a resource to edit and an action to take. Currently the node supports the following resources and actions:

- [Jobs](https://cloud.google.com/bigquery/docs/reference/rest/v2/jobs)
    - [Query](https://cloud.google.com/bigquery/docs/reference/rest/v2/jobs/query)
- [Datasets](https://cloud.google.com/bigquery/docs/reference/rest/v2/datasets)
    - [Insert](https://cloud.google.com/bigquery/docs/reference/rest/v2/datasets/insert)
    - [Get](https://cloud.google.com/bigquery/docs/reference/rest/v2/datasets/get)
    - [List](https://cloud.google.com/bigquery/docs/reference/rest/v2/datasets/list)
    - [Update](https://cloud.google.com/bigquery/docs/reference/rest/v2/datasets/update)
    - [Patch](https://cloud.google.com/bigquery/docs/reference/rest/v2/datasets/patch)
    - [Delete](https://cloud.google.com/bigquery/docs/reference/rest/v2/datasets/delete)
- [Tables](https://cloud.google.com/bigquery/docs/reference/rest/v2/tables)
    - [Insert](https://cloud.google.com/bigquery/docs/reference/rest/v2/tables/insert)
    - [Get](https://cloud.google.com/bigquery/docs/reference/rest/v2/tables/get)
    - [List](https://cloud.google.com/bigquery/docs/reference/rest/v2/tables/list)
    - [Update](https://cloud.google.com/bigquery/docs/reference/rest/v2/tables/update)
    - [Patch](https://cloud.google.com/bigquery/docs/reference/rest/v2/tables/patch)
    - [Delete](https://cloud.google.com/bigquery/docs/reference/rest/v2/tables/delete)
- [Tabledata](https://cloud.google.com/bigquery/docs/reference/rest/v2/tabledata)
    - [Insert All](https://cloud.google.com/bigquery/docs/reference/rest/v2/tabledata/insertAll)
    - [List](https://cloud.google.com/bigquery/docs/reference/rest/v2/tabledata/list)

### Request Config

The available options here will change depending on the selected resource and action. For example, if the selected action creates or updates a resource then a request body is required that contains the new or updated resource. Some actions require a dataset ID, some require both a dataset ID and a table ID, and some require neither. There are also some options that are only relevant to a specific resource & action, such as the "include hidden datasets" option when "Datasets: List" is selected).

### Result

Optionally, you may specify a payload path at which to place the results. If the request succeeds but no result is returned by BigQuery (for example, when deleting a resource)  the result will be `{ success: true }`.
