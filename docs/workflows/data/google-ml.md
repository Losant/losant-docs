# GCP ML

The GCP (Google Cloud Platform) ML node allows a workflow to send data to Google ML and store the resulting predictions on the workflow payload.

![GCP ML Node](/images/workflows/data/google-ml-node.png "GCP ML Node")

## Configuration

Configuration for the node is broken up into four sections.

### Service Account Auth Token

A [service account auth token](https://cloud.google.com/docs/authentication/getting-started#creating_a_service_account) is required for the workflow to authenticate with Google ML. You may enter this token one of two ways:

- **JSON Template** accepts a [JSON template](/workflows/accessing-payload-data/#json-templates) for the token.
- **Payload Path** accepts a [payload path](/workflows/accessing-payload-data/#payload-paths) for the token.

### Cloud ML Model Configuration

Specify the name of the model for which you want to get predictions. You may optionally specify the model version as well; if no version is provided the model's default version will be used.

### Input

The instances path is a payload path that points to the instances data you want to get predictions for.

### Output

The output path is a payload path at which to place the prediction results.
