flowclass: Cloud
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant Google Cloud Platform ML Node.

# GCP ML Node

The GCP (Google Cloud Platform) ML Node allows a workflow to send data to [Google ML](https://cloud.google.com/ml-engine/docs/technical-overview) and store the resulting predictions on the workflow payload.

![GCP ML Node](/images/workflows/data/google-ml-node.png "GCP ML Node")

## Prerequisites

If you're new to Google ML, TensorFlow, or machine learning in general, you may want to take some time to look through the following resources:

- [Getting started guide](https://cloud.google.com/ml-engine/docs/getting-started-training-prediction)
- [Machine learning workflow](https://cloud.google.com/ml-engine/docs/ml-solutions-overview)
- [Machine learning resources](https://cloud.google.com/ml-engine/docs/machine-learning-resources)
- [Sample applications](https://cloud.google.com/ml-engine/docs/samples)

## Configuration

Configuration for the node is broken up into four sections.

### Service Account Auth Token

A [service account auth token](https://cloud.google.com/docs/authentication/getting-started#creating_a_service_account) is required for the workflow to authenticate with Google ML. You may enter this token one of two ways:

- **JSON Template** accepts a [JSON template](/workflows/accessing-payload-data/#json-templates) for the token.
- **Payload Path** accepts a [payload path](/workflows/accessing-payload-data/#payload-paths) for the token.

### Cloud ML Model Configuration

Specify the name of the model for which you want to get predictions. You may optionally specify the model version as well; if no version is provided the model's default version will be used. Before you can get predictions from a model, you'll first need to [train](https://cloud.google.com/ml-engine/docs/training-overview) it with sample data and then [deploy](https://cloud.google.com/ml-engine/docs/prediction-overview#model_deployment) it.

### Input

The instances path is a payload path that points to the data you want to get predictions for.

### Output

The output path is a payload path at which to place the prediction results.
