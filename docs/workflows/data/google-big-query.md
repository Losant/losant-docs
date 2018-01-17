# GCP BigQuery Node

The GCP (Google Cloud Platform) BigQuery node allows a workflow to interact with [Google BigQuery](https://cloud.google.com/bigquery/what-is-bigquery) by fetching, creating, updating, or deleting data and optionally storing the result of the operation on the workflow payload.

![GCP BigQuery Node](/images/workflows/data/google-big-query-node.png "GCP BigQuery Node")

## Configuration

Configuration for the node is broken up into four sections.

### Service Account Auth Token

A [service account auth token](https://cloud.google.com/docs/authentication/getting-started#creating_a_service_account) is required for the workflow to authenticate with Google BigQuery. You may enter this token one of two ways:

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

The available options here will change depending on the selected resource and action. For example, if the selected action creates or updates a resource then a request body is required that contains the new or updated resource. Some actions require a dataset ID, some require both a dataset ID and a table ID, and some require neither. There are also some options that are only relevant to a specific resource and action, such as the "include hidden datasets" option when "Datasets: List" is selected.

![Example request config](/images/workflows/data/google-big-query-request-config.png "Example Request Config")

In the example above, the selected resource and action value is "Tabledata: List" and the relevant configuration is being shown.

### Result

Specify a payload path at which to place the results. This may be optional depending on the selected resource and action. If the request succeeds but no result is returned by BigQuery (for example, when deleting a resource)  the result will be `{ success: true }`.

## Query Request Format

The expected format for the Query Request JSON Template section depends on the selected Resource and Action value. Below you'll find example JSON templates for operations that require them.

### Jobs: Query

Requests must match [the structure outlined here](https://cloud.google.com/bigquery/docs/reference/rest/v2/jobs/query#request-body). Properties that are marked as "[Output-only]" do not need to be included in the request (id, kind, etag, etc.) An example request is shown below:

```json
{
  "maxResults": 10,
  "query": "SELECT * FROM [my_dataset.my_database] WHERE id = '{{data.recordId}}' LIMIT 10"
}
```

### Datasets: Insert / Update / Patch

Requests must match [the structure outlined here](https://cloud.google.com/bigquery/docs/reference/rest/v2/datasets#resource). Properties that are marked as "[Output-only]" do not need to be included in the request (id, kind, etag, etc.) An example request is shown below:

```json
{
  "datasetReference": {
    "projectId": "my-project-id-1234",
    "datasetId": "my_dataset"
  },
  "friendlyName": "My dataset",
  "description": "A description of the dataset"
}
```

### Tables: Insert / Update / Patch

Requests must match [the structure outlined here](https://cloud.google.com/bigquery/docs/reference/rest/v2/tables#resource-representations). Properties that are marked as "[Output-only]" do not need to be included in the request (id, kind, etag, etc.) An example request is shown below:

```json
{
  "tableReference": {
    "projectId": "my-project-id-1234",
    "datasetId": "my_dataset",
    "tableId": "my_table"
  },
  "friendlyName": "My table",
  "description": "A description of the table",
  "schema": {
    "fields": [
      {
        "name": "id",
        "type": "INTEGER",
        "mode": "REQUIRED",
        "description": "The record ID"
      },
      {
        "name": "created_on",
        "type": "DATETIME",
        "mode": "REQUIRED",
        "description": "The date & time when the record was created"
      },
      {
        "name": "is_public",
        "type": "BOOLEAN",
        "mode": "NULLABLE",
        "description": "Set to true if the record is public"
      }
    ]
  },
}
```

### Tabledata: Insert All

Requests must match [the structure outlined here](https://cloud.google.com/bigquery/docs/reference/rest/v2/tabledata/insertAll#request-body). Properties that are marked as "[Output-only]" do not need to be included in the request (id, kind, etag, etc.) An example request is shown below:

```json
{
  "rows": [
    {
      "json": {
        "id": 1,
        "created_on": "2018-01-17 15:36:22",
        "is_public": true
      }
    },
    {
      "json": {
        "id": {{data.recordId}},
        "created_on": "{{format data.recordCreatedOn 'YYYY-MM-DD HH:mm:ss'}}",
        "is_public": {{data.recordIsPublic}}
      }
    }
  ]
}
```

Note that the format of each key's value under "json" depends on the field type - in our example above, we're inserting data into the example table shown in the previous section, so `id` and `is_public` **are not** quoted because their types are `INTEGER` and `BOOLEAN`, respectively, while `created_on` **is** quoted.
