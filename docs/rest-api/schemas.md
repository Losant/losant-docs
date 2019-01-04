---
description: A comprehensive list of the JSON schemas defining the objects expected by and returned from the Losant API. Learn More.
---

# Schemas

## API Token

Schema for a single API Token

### Schema <a name="api-token-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "apiTokenId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "ownerId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "ownerType": {
      "type": "string",
      "enum": [
        "application"
      ]
    },
    "creatorId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creatorType": {
      "type": "string",
      "enum": [
        "apiToken",
        "user",
        "flow"
      ]
    },
    "creatorName": {
      "type": "string",
      "maxLength": 1024
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "expirationDate": {
      "type": "string",
      "format": "date-time"
    },
    "scope": {
      "type": "array",
      "items": {
        "type": "string",
        "minLength": 1,
        "maxLength": 1024
      }
    },
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ]
    },
    "token": {
      "type": "string",
      "minLength": 1
    }
  }
}
```

<small></small>

### Example <a name="api-token-example"></a>

```json
{
  "id": "575ec7417ae143cd83dc4a95",
  "apiTokenId": "575ec7417ae143cd83dc4a95",
  "creatorId": "575ed70c7ae143cd83dc4aa9",
  "creatorType": "user",
  "ownerId": "575ec8687ae143cd83dc4a97",
  "ownerType": "application",
  "name": "My API Token",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "expirationDate": "2017-06-13T04:00:00.000Z",
  "scope": [
    "all.Application"
  ],
  "status": "active",
  "token": "the_actual_token_string"
}
```

<br/>
## API Token Patch

Schema for the body of an API Token modification request

### Schema <a name="api-token-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ]
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="api-token-patch-example"></a>

```json
{
  "name": "My Updated API Token",
  "status": "inactive"
}
```

<br/>
## API Tokens

Schema for a collection of API Tokens

### Schema <a name="api-tokens-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "API Token",
        "description": "Schema for a single API Token",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "apiTokenId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "ownerId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "ownerType": {
            "type": "string",
            "enum": [
              "application"
            ]
          },
          "creatorId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creatorType": {
            "type": "string",
            "enum": [
              "apiToken",
              "user",
              "flow"
            ]
          },
          "creatorName": {
            "type": "string",
            "maxLength": 1024
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "expirationDate": {
            "type": "string",
            "format": "date-time"
          },
          "scope": {
            "type": "array",
            "items": {
              "type": "string",
              "minLength": 1,
              "maxLength": 1024
            }
          },
          "status": {
            "type": "string",
            "enum": [
              "active",
              "inactive"
            ]
          },
          "token": {
            "type": "string",
            "minLength": 1
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "ownerId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "ownerType": {
      "type": "string",
      "enum": [
        "application"
      ]
    }
  }
}
```

<small></small>

### Example <a name="api-tokens-example"></a>

```json
{
  "items": [
    {
      "id": "575ec7417ae143cd83dc4a95",
      "apiTokenId": "575ec7417ae143cd83dc4a95",
      "creatorId": "575ed70c7ae143cd83dc4aa9",
      "creatorType": "user",
      "ownerId": "575ec8687ae143cd83dc4a97",
      "ownerType": "application",
      "name": "My API Token",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "expirationDate": "2017-06-13T04:00:00.000Z",
      "scope": [
        "all.Application"
      ],
      "status": "active",
      "token": "the_actual_token_string"
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "ownerId": "575ec8687ae143cd83dc4a97",
  "ownerType": "application"
}
```

<br/>
## Application

Schema for a single Application

### Schema <a name="application-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "ownerId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "ownerType": {
      "type": "string",
      "enum": [
        "user",
        "organization"
      ]
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "endpointSlug": {
      "type": "string",
      "minLength": 4,
      "maxLength": 63,
      "pattern": "^[0-9a-z-]*$"
    },
    "expUserTokenCutoff": {
      "type": "string",
      "format": "date-time"
    },
    "endpointDefaultCors": {
      "type": "boolean"
    },
    "globals": {
      "type": "array",
      "maxItems": 100,
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "json": {
            "type": "string",
            "minLength": 1,
            "maxLength": 32767
          },
          "cloudOnly": {
            "type": "boolean",
            "default": false
          }
        },
        "additionalProperties": false,
        "required": [
          "key",
          "json"
        ]
      }
    },
    "summary": {
      "type": "object",
      "properties": {
        "apiTokenCount": {
          "type": "number"
        },
        "keyCount": {
          "type": "number"
        },
        "deviceCount": {
          "type": "number"
        },
        "dataTableCount": {
          "type": "number"
        },
        "deviceRecipeCount": {
          "type": "number"
        },
        "eventCount": {
          "type": "number"
        },
        "experienceDomainCount": {
          "type": "number"
        },
        "experienceEndpointCount": {
          "type": "number"
        },
        "experienceGroupCount": {
          "type": "number"
        },
        "experienceSlugCount": {
          "type": "number"
        },
        "experienceUserCount": {
          "type": "number"
        },
        "experienceVersionCount": {
          "type": "number"
        },
        "experienceViewCount": {
          "type": "number"
        },
        "fileCount": {
          "type": "number"
        },
        "flowCount": {
          "type": "number"
        },
        "integrationCount": {
          "type": "number"
        },
        "webhookCount": {
          "type": "number"
        }
      }
    },
    "ftueTracking": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "version": {
            "type": "number"
          },
          "status": {
            "type": "string",
            "enum": [
              "skipped",
              "completed"
            ]
          }
        },
        "required": [
          "name",
          "version",
          "status"
        ],
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "archiveConfig": {
      "type": "object",
      "properties": {
        "directory": {
          "type": "string",
          "max": 255
        },
        "mode": {
          "type": "string",
          "enum": [
            "all",
            "whitelist",
            "blacklist"
          ]
        },
        "deviceIds": {
          "type": "array",
          "items": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "maxItems": 1000
        },
        "deviceTags": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "key": {
                "type": "string",
                "pattern": "^[0-9a-zA-Z_-]{1,255}$"
              },
              "value": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            },
            "additionalProperties": false
          },
          "maxItems": 100
        },
        "s3": {
          "type": "object",
          "properties": {
            "bucket": {
              "type": "string",
              "max": 255
            },
            "accessKeyId": {
              "type": "string",
              "min": 16,
              "max": 128
            },
            "secretAccessKey": {
              "type": "string",
              "min": 16,
              "max": 128
            },
            "region": {
              "type": "string",
              "max": 128
            }
          },
          "required": [
            "bucket",
            "accessKeyId",
            "secretAccessKey",
            "region"
          ],
          "additionalProperties": false
        },
        "gcs": {
          "type": "object",
          "properties": {
            "projectId": {
              "type": "string",
              "minLength": 1,
              "maxLength": 1024
            },
            "keyJson": {
              "type": "string",
              "maxLength": 32767,
              "minLength": 50
            },
            "bucket": {
              "type": "string",
              "max": 255
            }
          },
          "required": [
            "projectId",
            "keyJson",
            "bucket"
          ],
          "additionalProperties": false
        }
      },
      "additionalProperties": false
    }
  }
}
```

<small></small>

### Example <a name="application-example"></a>

```json
{
  "id": "575ec8687ae143cd83dc4a97",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "ownerId": "575ed70c7ae143cd83dc4aa9",
  "ownerType": "user",
  "name": "My Application",
  "description": "The is the best application description",
  "summary": {
    "deviceCount": 5,
    "flowCount": 2,
    "webhookCount": 0,
    "eventCount": 0,
    "keyCount": 1,
    "deviceRecipeCount": 0
  },
  "archiveConfig": {
    "s3": {
      "bucket": "bucketName",
      "accessKeyId": "awsAccessKey",
      "accessSecretKey": "awsSecretKey",
      "region": "us-west-1"
    },
    "mode": "all",
    "deviceIds": [
      "575ec8687ae143cd83dc4a95",
      "575ec8687ae143cd83dc4a91"
    ]
  }
}
```

<br/>
## Application API Token Post

Schema for the body of an Application API Token creation request

### Schema <a name="application-api-token-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "expirationDate": {
      "type": "string",
      "format": "date-time"
    },
    "scope": {
      "type": "array",
      "uniqueItems": true,
      "items": {
        "type": "string",
        "enum": [
          "all.Application",
          "all.Application.read",
          "all.Device",
          "all.Device.read",
          "application.*",
          "applicationApiToken.*",
          "applicationApiTokens.*",
          "applicationKey.*",
          "applicationKeys.*",
          "data.*",
          "dataTable.*",
          "dataTables.*",
          "dataTableRow.*",
          "dataTableRows.*",
          "device.*",
          "deviceRecipe.*",
          "deviceRecipes.*",
          "devices.*",
          "edgeDeployments.*",
          "event.*",
          "events.*",
          "experience.*",
          "experienceDomain.*",
          "experienceDomains.*",
          "experienceEndpoint.*",
          "experienceEndpoints.*",
          "experienceGroup.*",
          "experienceGroups.*",
          "experienceSlug.*",
          "experienceSlugs.*",
          "experienceUser.*",
          "experienceUsers.*",
          "experienceVersion.*",
          "experienceVersions.*",
          "experienceView.*",
          "experienceViews.*",
          "integration.*",
          "integrations.*",
          "file.*",
          "files.*",
          "flow.*",
          "flows.*",
          "flowVersion.*",
          "flowVersions.*",
          "webhook.*",
          "webhooks.*",
          "application.archiveData",
          "application.backfillArchiveData",
          "application.debug",
          "application.delete",
          "application.get",
          "application.mqttPublishMessage",
          "application.mqttSubscriptionStream",
          "application.patch",
          "application.payloadCounts",
          "applicationApiToken.delete",
          "applicationApiToken.get",
          "applicationApiToken.patch",
          "applicationApiTokens.get",
          "applicationApiTokens.post",
          "applicationKey.delete",
          "applicationKey.get",
          "applicationKey.patch",
          "applicationKeys.get",
          "applicationKeys.post",
          "data.lastValueQuery",
          "data.timeSeriesQuery",
          "dataTable.addColumn",
          "dataTable.delete",
          "dataTable.get",
          "dataTable.patch",
          "dataTable.removeColumn",
          "dataTableRow.delete",
          "dataTableRow.get",
          "dataTableRow.patch",
          "dataTableRows.get",
          "dataTableRows.post",
          "dataTableRows.query",
          "dataTableRows.export",
          "dataTableRows.delete",
          "dataTableRows.truncate",
          "dataTables.get",
          "dataTables.post",
          "device.commandStream",
          "device.debug",
          "device.delete",
          "device.export",
          "device.get",
          "device.getCommand",
          "device.getCompositeState",
          "device.getLogEntries",
          "device.getState",
          "device.patch",
          "device.removeData",
          "device.sendCommand",
          "device.sendState",
          "device.setConnectionStatus",
          "device.stateStream",
          "deviceRecipe.bulkCreate",
          "deviceRecipe.delete",
          "deviceRecipe.get",
          "deviceRecipe.patch",
          "deviceRecipes.get",
          "deviceRecipes.post",
          "devices.detailedSummary",
          "devices.export",
          "devices.get",
          "devices.post",
          "devices.sendCommand",
          "edgeDeployments.get",
          "edgeDeployments.release",
          "edgeDeployments.remove",
          "edgeDeployments.replace",
          "event.delete",
          "event.get",
          "event.patch",
          "events.get",
          "events.mostRecentBySeverity",
          "events.patch",
          "events.post",
          "experience.delete",
          "experience.bootstrap",
          "experienceDomain.delete",
          "experienceDomain.get",
          "experienceDomain.patch",
          "experienceDomains.get",
          "experienceDomains.post",
          "experienceEndpoint.delete",
          "experienceEndpoint.get",
          "experienceEndpoint.patch",
          "experienceEndpoints.get",
          "experienceEndpoints.post",
          "experienceEndpoints.stats",
          "experienceGroup.delete",
          "experienceGroup.get",
          "experienceGroup.patch",
          "experienceGroups.detailedSummary",
          "experienceGroups.get",
          "experienceGroups.post",
          "experienceSlug.delete",
          "experienceSlug.get",
          "experienceSlug.patch",
          "experienceSlugs.get",
          "experienceSlugs.post",
          "experienceUser.delete",
          "experienceUser.get",
          "experienceUser.patch",
          "experienceUsers.detailedSummary",
          "experienceUsers.get",
          "experienceUsers.post",
          "experienceVersion.delete",
          "experienceVersion.get",
          "experienceVersion.patch",
          "experienceVersions.get",
          "experienceVersions.post",
          "experienceView.debug",
          "experienceView.delete",
          "experienceView.get",
          "experienceView.patch",
          "experienceViews.debug",
          "experienceViews.detailedSummary",
          "experienceViews.get",
          "experienceViews.post",
          "file.get",
          "file.patch",
          "file.move",
          "file.delete",
          "files.get",
          "files.post",
          "flow.debug",
          "flow.delete",
          "flow.clearStorageEntries",
          "flow.get",
          "flow.getStorageEntries",
          "flow.log",
          "flow.patch",
          "flow.pressVirtualButton",
          "flow.setStorageEntry",
          "flows.get",
          "flows.getByVersion",
          "flows.import",
          "flows.post",
          "flowVersion.delete",
          "flowVersion.get",
          "flowVersion.log",
          "flowVersion.patch",
          "flowVersions.get",
          "flowVersions.post",
          "integration.delete",
          "integration.get",
          "integration.patch",
          "integrations.get",
          "integrations.post",
          "webhook.delete",
          "webhook.get",
          "webhook.patch",
          "webhooks.get",
          "webhooks.post"
        ]
      }
    },
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ]
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```

<small></small>

### Example <a name="application-api-token-post-example"></a>

```json
{
  "name": "My New API Token",
  "expirationDate": "2017-06-13T04:00:00.000Z",
  "scope": [
    "all.Application"
  ],
  "status": "active"
}
```

<br/>
## Application Key

Schema for a single Application Key

### Schema <a name="application-key-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationKeyId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "key": {
      "type": "string"
    },
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ]
    },
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  }
}
```

<small></small>

### Example <a name="application-key-example"></a>

```json
{
  "id": "575ec76c7ae143cd83dc4a96",
  "applicationKeyId": "575ec76c7ae143cd83dc4a96",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "key": "this_would_be_the_key",
  "status": "active",
  "description": "An example key description"
}
```

<br/>
## Application Key Patch

Schema for the body of an Application Key modification request

### Schema <a name="application-key-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ]
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="application-key-patch-example"></a>

```json
{
  "status": "active",
  "description": "An example updated key description"
}
```

<br/>
## Application Key Post

Schema for the body of an Application Key creation request

### Schema <a name="application-key-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="application-key-post-example"></a>

```json
{
  "description": "An example new key description"
}
```

<br/>
## Application Key Post Response

Schema for a response of Application Key creation

### Schema <a name="application-key-post-response-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationKeyId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "key": {
      "type": "string"
    },
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ]
    },
    "secret": {
      "type": "string"
    },
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  }
}
```

<small></small>

### Example <a name="application-key-post-response-example"></a>

```json
{
  "id": "575ec76c7ae143cd83dc4a96",
  "applicationKeyId": "575ec76c7ae143cd83dc4a96",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "key": "this_would_be_the_key",
  "status": "active",
  "secret": "shhhSecret",
  "description": "An example key description"
}
```

<br/>
## Application Keys

Schema for a collection of Application Keys

### Schema <a name="application-keys-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Application Key",
        "description": "Schema for a single Application Key",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationKeyId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "key": {
            "type": "string"
          },
          "status": {
            "type": "string",
            "enum": [
              "active",
              "inactive"
            ]
          },
          "deviceIds": {
            "type": "array",
            "items": {
              "type": "string",
              "pattern": "^[A-Fa-f\\d]{24}$"
            },
            "maxItems": 1000
          },
          "deviceTags": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "value": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 255
                }
              },
              "additionalProperties": false
            },
            "maxItems": 100
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="application-keys-example"></a>

```json
{
  "items": [
    {
      "id": "575ec76c7ae143cd83dc4a96",
      "applicationKeyId": "575ec76c7ae143cd83dc4a96",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "key": "this_would_be_the_key",
      "status": "active",
      "description": "An example key description"
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "key",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Application Patch

Schema for the body of an Application modification request

### Schema <a name="application-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "endpointSlug": {
      "type": "string",
      "minLength": 4,
      "maxLength": 63,
      "pattern": "^[0-9a-z-]*$"
    },
    "expUserTokenCutoff": {
      "type": "string",
      "format": "date-time"
    },
    "endpointDefaultCors": {
      "type": "boolean"
    },
    "globals": {
      "type": "array",
      "maxItems": 100,
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "json": {
            "type": "string",
            "minLength": 1,
            "maxLength": 32767
          },
          "cloudOnly": {
            "type": "boolean",
            "default": false
          }
        },
        "additionalProperties": false,
        "required": [
          "key",
          "json"
        ]
      }
    },
    "ftueTracking": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "version": {
            "type": "number"
          },
          "status": {
            "type": "string",
            "enum": [
              "skipped",
              "completed"
            ]
          }
        },
        "required": [
          "name",
          "version",
          "status"
        ],
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "archiveConfig": {
      "type": "object",
      "properties": {
        "directory": {
          "type": "string",
          "max": 255
        },
        "mode": {
          "type": "string",
          "enum": [
            "all",
            "whitelist",
            "blacklist"
          ]
        },
        "deviceIds": {
          "type": "array",
          "items": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "maxItems": 1000
        },
        "deviceTags": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "key": {
                "type": "string",
                "pattern": "^[0-9a-zA-Z_-]{1,255}$"
              },
              "value": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            },
            "additionalProperties": false
          },
          "maxItems": 100
        },
        "s3": {
          "type": "object",
          "properties": {
            "bucket": {
              "type": "string",
              "max": 255
            },
            "accessKeyId": {
              "type": "string",
              "min": 16,
              "max": 128
            },
            "secretAccessKey": {
              "type": "string",
              "min": 16,
              "max": 128
            },
            "region": {
              "type": "string",
              "max": 128
            }
          },
          "required": [
            "bucket",
            "accessKeyId",
            "secretAccessKey",
            "region"
          ],
          "additionalProperties": false
        },
        "gcs": {
          "type": "object",
          "properties": {
            "projectId": {
              "type": "string",
              "minLength": 1,
              "maxLength": 1024
            },
            "keyJson": {
              "type": "string",
              "maxLength": 32767,
              "minLength": 50
            },
            "bucket": {
              "type": "string",
              "max": 255
            }
          },
          "required": [
            "projectId",
            "keyJson",
            "bucket"
          ],
          "additionalProperties": false
        }
      },
      "additionalProperties": false
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="application-patch-example"></a>

```json
{
  "name": "My Updated Application",
  "description": "Description of my updated application"
}
```

<br/>
## Application Post

Schema for the body of an Application creation request

### Schema <a name="application-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "endpointSlug": {
      "type": "string",
      "minLength": 4,
      "maxLength": 63,
      "pattern": "^[0-9a-z-]*$"
    },
    "expUserTokenCutoff": {
      "type": "string",
      "format": "date-time"
    },
    "endpointDefaultCors": {
      "type": "boolean"
    },
    "globals": {
      "type": "array",
      "maxItems": 100,
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "json": {
            "type": "string",
            "minLength": 1,
            "maxLength": 32767
          },
          "cloudOnly": {
            "type": "boolean",
            "default": false
          }
        },
        "additionalProperties": false,
        "required": [
          "key",
          "json"
        ]
      }
    },
    "archiveConfig": {
      "type": "object",
      "properties": {
        "directory": {
          "type": "string",
          "max": 255
        },
        "mode": {
          "type": "string",
          "enum": [
            "all",
            "whitelist",
            "blacklist"
          ]
        },
        "deviceIds": {
          "type": "array",
          "items": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "maxItems": 1000
        },
        "deviceTags": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "key": {
                "type": "string",
                "pattern": "^[0-9a-zA-Z_-]{1,255}$"
              },
              "value": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            },
            "additionalProperties": false
          },
          "maxItems": 100
        },
        "s3": {
          "type": "object",
          "properties": {
            "bucket": {
              "type": "string",
              "max": 255
            },
            "accessKeyId": {
              "type": "string",
              "min": 16,
              "max": 128
            },
            "secretAccessKey": {
              "type": "string",
              "min": 16,
              "max": 128
            },
            "region": {
              "type": "string",
              "max": 128
            }
          },
          "required": [
            "bucket",
            "accessKeyId",
            "secretAccessKey",
            "region"
          ],
          "additionalProperties": false
        },
        "gcs": {
          "type": "object",
          "properties": {
            "projectId": {
              "type": "string",
              "minLength": 1,
              "maxLength": 1024
            },
            "keyJson": {
              "type": "string",
              "maxLength": 32767,
              "minLength": 50
            },
            "bucket": {
              "type": "string",
              "max": 255
            }
          },
          "required": [
            "projectId",
            "keyJson",
            "bucket"
          ],
          "additionalProperties": false
        }
      },
      "additionalProperties": false
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```

<small></small>

### Example <a name="application-post-example"></a>

```json
{
  "name": "My New Application",
  "description": "Description of my new application"
}
```

<br/>
## Applications

Schema for a collection of Applications

### Schema <a name="applications-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Application",
        "description": "Schema for a single Application",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "ownerId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "ownerType": {
            "type": "string",
            "enum": [
              "user",
              "organization"
            ]
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "endpointSlug": {
            "type": "string",
            "minLength": 4,
            "maxLength": 63,
            "pattern": "^[0-9a-z-]*$"
          },
          "expUserTokenCutoff": {
            "type": "string",
            "format": "date-time"
          },
          "endpointDefaultCors": {
            "type": "boolean"
          },
          "globals": {
            "type": "array",
            "maxItems": 100,
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "json": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32767
                },
                "cloudOnly": {
                  "type": "boolean",
                  "default": false
                }
              },
              "additionalProperties": false,
              "required": [
                "key",
                "json"
              ]
            }
          },
          "summary": {
            "type": "object",
            "properties": {
              "apiTokenCount": {
                "type": "number"
              },
              "keyCount": {
                "type": "number"
              },
              "deviceCount": {
                "type": "number"
              },
              "dataTableCount": {
                "type": "number"
              },
              "deviceRecipeCount": {
                "type": "number"
              },
              "eventCount": {
                "type": "number"
              },
              "experienceDomainCount": {
                "type": "number"
              },
              "experienceEndpointCount": {
                "type": "number"
              },
              "experienceGroupCount": {
                "type": "number"
              },
              "experienceSlugCount": {
                "type": "number"
              },
              "experienceUserCount": {
                "type": "number"
              },
              "experienceVersionCount": {
                "type": "number"
              },
              "experienceViewCount": {
                "type": "number"
              },
              "fileCount": {
                "type": "number"
              },
              "flowCount": {
                "type": "number"
              },
              "integrationCount": {
                "type": "number"
              },
              "webhookCount": {
                "type": "number"
              }
            }
          },
          "ftueTracking": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "name": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "version": {
                  "type": "number"
                },
                "status": {
                  "type": "string",
                  "enum": [
                    "skipped",
                    "completed"
                  ]
                }
              },
              "required": [
                "name",
                "version",
                "status"
              ],
              "additionalProperties": false
            },
            "maxItems": 100
          },
          "archiveConfig": {
            "type": "object",
            "properties": {
              "directory": {
                "type": "string",
                "max": 255
              },
              "mode": {
                "type": "string",
                "enum": [
                  "all",
                  "whitelist",
                  "blacklist"
                ]
              },
              "deviceIds": {
                "type": "array",
                "items": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "maxItems": 1000
              },
              "deviceTags": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                    },
                    "value": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 255
                    }
                  },
                  "additionalProperties": false
                },
                "maxItems": 100
              },
              "s3": {
                "type": "object",
                "properties": {
                  "bucket": {
                    "type": "string",
                    "max": 255
                  },
                  "accessKeyId": {
                    "type": "string",
                    "min": 16,
                    "max": 128
                  },
                  "secretAccessKey": {
                    "type": "string",
                    "min": 16,
                    "max": 128
                  },
                  "region": {
                    "type": "string",
                    "max": 128
                  }
                },
                "required": [
                  "bucket",
                  "accessKeyId",
                  "secretAccessKey",
                  "region"
                ],
                "additionalProperties": false
              },
              "gcs": {
                "type": "object",
                "properties": {
                  "projectId": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "keyJson": {
                    "type": "string",
                    "maxLength": 32767,
                    "minLength": 50
                  },
                  "bucket": {
                    "type": "string",
                    "max": 255
                  }
                },
                "required": [
                  "projectId",
                  "keyJson",
                  "bucket"
                ],
                "additionalProperties": false
              }
            },
            "additionalProperties": false
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    }
  }
}
```

<small></small>

### Example <a name="applications-example"></a>

```json
{
  "items": [
    {
      "id": "575ec8687ae143cd83dc4a97",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "ownerId": "575ed70c7ae143cd83dc4aa9",
      "ownerType": "user",
      "name": "My Application",
      "description": "The is the best application description",
      "summary": {
        "deviceCount": 5,
        "flowCount": 2,
        "webhookCount": 0,
        "eventCount": 0,
        "keyCount": 1,
        "deviceRecipeCount": 0
      },
      "archiveConfig": {
        "s3": {
          "bucket": "bucketName",
          "accessKeyId": "awsAccessKey",
          "accessSecretKey": "awsSecretKey",
          "region": "us-west-1"
        },
        "mode": "all",
        "deviceIds": [
          "575ec8687ae143cd83dc4a95",
          "575ec8687ae143cd83dc4a91"
        ]
      }
    }
  ],
  "count": 1,
  "totalCount": 8,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc"
}
```

<br/>
## Audit Log

Schema for a single Audit Log entry

### Schema <a name="audit-log-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "auditLogId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "primaryTargetId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "primaryTargetType": {
      "type": "string",
      "enum": [
        "Application",
        "Dashboard",
        "Solution",
        "OrgInvite"
      ]
    },
    "primaryTargetName": {
      "type": "string",
      "maxLength": 1024
    },
    "secondaryTargetId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "secondaryTargetType": {
      "type": "string",
      "enum": [
        "ApiToken",
        "ApplicationKey",
        "DataTable",
        "Device",
        "DeviceRecipe",
        "Event",
        "ExperienceDomain",
        "ExperienceEndpoint",
        "ExperienceGroup",
        "ExperienceSlug",
        "ExperienceUser",
        "ExperienceVersion",
        "ExperienceView",
        "File",
        "Flow",
        "SolutionUser",
        "Integration",
        "Webhook"
      ]
    },
    "secondaryTargetName": {
      "type": "string",
      "maxLength": 1024
    },
    "actorId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "actorType": {
      "type": "string",
      "enum": [
        "Application",
        "Device",
        "Flow",
        "SolutionUser",
        "User",
        "ApiToken"
      ]
    },
    "actorName": {
      "type": "string",
      "maxLength": 1024
    },
    "requestResource": {
      "type": "string",
      "maxLength": 1024
    },
    "requestAction": {
      "type": "string",
      "maxLength": 1024
    },
    "requestQueryParams": {
      "type": "object"
    },
    "requestBody": {
      "type": "object"
    },
    "requestPathParams": {
      "type": "object"
    },
    "responseBody": {
      "type": "object"
    },
    "responseStatus": {
      "type": "integer",
      "minimum": 100,
      "maximum": 599
    }
  }
}
```

<small></small>

### Example <a name="audit-log-example"></a>

```json
{
  "id": "586e9d5151265cb9d72f6ec6",
  "auditLogId": "586e9d5151265cb9d72f6ec6",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "orgId": "575ed6e87ae143cd83dc4aa8",
  "primaryTargetId": "575ec8687ae143cd83dc4a97",
  "primaryTargetType": "Application",
  "primaryTargetName": "My Application",
  "actorId": "575ed70c7ae143cd83dc4aa9",
  "actorType": "User",
  "actorName": "example@losant.com",
  "requestResource": "application",
  "requestAction": "delete",
  "requestQueryParams": {},
  "requestBody": {},
  "requestPathParams": {
    "applicationId": "575ec8687ae143cd83dc4a97"
  },
  "responseBody": {
    "success": true
  },
  "responseStatus": 200
}
```

<br/>
## Audit Log Filter

Schema for the filter of an audit log query

### Schema <a name="audit-log-filter-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "primaryTarget": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "type": {
            "type": "string",
            "enum": [
              "Application",
              "Dashboard",
              "Solution",
              "OrgInvite"
            ]
          },
          "name": {
            "type": "string",
            "maxLength": 1024
          }
        },
        "additionalProperties": false
      }
    },
    "secondaryTarget": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "type": {
            "type": "string",
            "enum": [
              "ApiToken",
              "ApplicationKey",
              "DataTable",
              "Device",
              "DeviceRecipe",
              "Event",
              "ExperienceDomain",
              "ExperienceEndpoint",
              "ExperienceGroup",
              "ExperienceSlug",
              "ExperienceUser",
              "ExperienceVersion",
              "ExperienceView",
              "File",
              "Flow",
              "SolutionUser",
              "Integration",
              "Webhook"
            ]
          },
          "name": {
            "type": "string",
            "maxLength": 1024
          }
        },
        "additionalProperties": false
      }
    },
    "actor": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "type": {
            "type": "string",
            "enum": [
              "Application",
              "Device",
              "Flow",
              "SolutionUser",
              "User",
              "ApiToken"
            ]
          },
          "name": {
            "type": "string",
            "maxLength": 1024
          }
        },
        "additionalProperties": false
      }
    },
    "request": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "resource": {
            "type": "string",
            "maxLength": 1024
          },
          "action": {
            "type": "string",
            "maxLength": 1024
          }
        },
        "additionalProperties": false
      }
    },
    "responseCode": {
      "type": "array",
      "items": {
        "type": "integer",
        "minimum": 100,
        "maximum": 599
      }
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="audit-log-filter-example"></a>

```json
{
  "primaryTarget": [
    {
      "type": "Dashboard"
    },
    {
      "type": "Application",
      "id": "575ec8687ae143cd83dc4a97"
    }
  ],
  "actor": [
    {
      "type": "User",
      "id": "575ed70c7ae143cd83dc4aa9"
    }
  ]
}
```

<br/>
## Audit Logs

Schema for a collection of Audit Logs

### Schema <a name="audit-logs-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Audit Log",
        "description": "Schema for a single Audit Log entry",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "auditLogId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "orgId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "primaryTargetId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "primaryTargetType": {
            "type": "string",
            "enum": [
              "Application",
              "Dashboard",
              "Solution",
              "OrgInvite"
            ]
          },
          "primaryTargetName": {
            "type": "string",
            "maxLength": 1024
          },
          "secondaryTargetId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "secondaryTargetType": {
            "type": "string",
            "enum": [
              "ApiToken",
              "ApplicationKey",
              "DataTable",
              "Device",
              "DeviceRecipe",
              "Event",
              "ExperienceDomain",
              "ExperienceEndpoint",
              "ExperienceGroup",
              "ExperienceSlug",
              "ExperienceUser",
              "ExperienceVersion",
              "ExperienceView",
              "File",
              "Flow",
              "SolutionUser",
              "Integration",
              "Webhook"
            ]
          },
          "secondaryTargetName": {
            "type": "string",
            "maxLength": 1024
          },
          "actorId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "actorType": {
            "type": "string",
            "enum": [
              "Application",
              "Device",
              "Flow",
              "SolutionUser",
              "User",
              "ApiToken"
            ]
          },
          "actorName": {
            "type": "string",
            "maxLength": 1024
          },
          "requestResource": {
            "type": "string",
            "maxLength": 1024
          },
          "requestAction": {
            "type": "string",
            "maxLength": 1024
          },
          "requestQueryParams": {
            "type": "object"
          },
          "requestBody": {
            "type": "object"
          },
          "requestPathParams": {
            "type": "object"
          },
          "responseBody": {
            "type": "object"
          },
          "responseStatus": {
            "type": "integer",
            "minimum": 100,
            "maximum": 599
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="audit-logs-example"></a>

```json
{
  "items": [
    {
      "id": "586e9d5151265cb9d72f6ec6",
      "auditLogId": "586e9d5151265cb9d72f6ec6",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "orgId": "575ed6e87ae143cd83dc4aa8",
      "primaryTargetId": "575ec8687ae143cd83dc4a97",
      "primaryTargetType": "Application",
      "primaryTargetName": "My Application",
      "actorId": "575ed70c7ae143cd83dc4aa9",
      "actorType": "User",
      "actorName": "example@losant.com",
      "requestResource": "application",
      "requestAction": "delete",
      "requestQueryParams": {},
      "requestBody": {},
      "requestPathParams": {
        "applicationId": "575ec8687ae143cd83dc4a97"
      },
      "responseBody": {
        "success": true
      },
      "responseStatus": 200
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "creationDate",
  "sortDirection": "desc",
  "orgId": "575ed6e87ae143cd83dc4aa8"
}
```

<br/>
## Authenticated Device

Schema for the successful response when authenticating a Device

### Schema <a name="authenticated-device-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "gateway",
        "peripheral",
        "floating",
        "edgeCompute"
      ]
    },
    "token": {
      "type": "string",
      "minLength": 1
    }
  },
  "required": [
    "applicationId",
    "deviceId",
    "deviceClass",
    "token"
  ]
}
```

<small></small>

### Example <a name="authenticated-device-example"></a>

```json
{
  "applicationId": "575ec8687ae143cd83dc4a97",
  "deviceId": "575ecf887ae143cd83dc4aa2",
  "deviceClass": "standalone",
  "token": "token_to_use_for_authenticating_subsequent_requests"
}
```

<br/>
## Authenticated Solution User

Schema for the successful response when authenticating a Solution User

### Schema <a name="authenticated-solution-user-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "solutionUserId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "token": {
      "type": "string",
      "minLength": 1
    }
  },
  "required": [
    "solutionUserId",
    "token"
  ]
}
```

<small></small>

### Example <a name="authenticated-solution-user-example"></a>

```json
{
  "solutionUserId": "566116085df4b701000258e3",
  "token": "token_to_use_for_authenticating_subsequent_requests"
}
```

<br/>
## Authenticated User

Schema for the successful response when authenticating a User

### Schema <a name="authenticated-user-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "userId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "token": {
      "type": "string",
      "minLength": 1
    }
  },
  "required": [
    "userId",
    "token"
  ]
}
```

<small></small>

### Example <a name="authenticated-user-example"></a>

```json
{
  "userId": "575ed70c7ae143cd83dc4aa9",
  "token": "token_to_use_for_authenticating_subsequent_requests"
}
```

<br/>
## Change Password

Schema for the body of a request to change the current user&#x27;s password

### Schema <a name="change-password-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "twoFactorCode": {
      "type": "string",
      "maxLength": 2048
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048
    },
    "newPassword": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048,
      "pattern": "^(?=.*[A-Z])(?=.*[^A-z0-9])(?=.*[0-9])(?=.*[a-z]).{8,}$"
    },
    "invalidateExistingTokens": {
      "type": "boolean"
    },
    "tokenTTL": {
      "type": "integer",
      "minimum": 0
    }
  },
  "required": [
    "password",
    "newPassword"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="change-password-example"></a>

```json
{
  "newPassword": "yourNewPassword",
  "password": "yourCurrentPassword",
  "invalidateExistingTokens": true
}
```

<br/>
## Composite Device State

Schema for a composite Device state

### Schema <a name="composite-device-state-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "patternProperties": {
    "^[0-9a-zA-Z_-]{1,255}$": {
      "type": "object",
      "properties": {
        "value": {
          "type": [
            "number",
            "string",
            "boolean"
          ]
        },
        "time": {
          "oneOf": [
            {
              "type": "string"
            },
            {
              "type": "number"
            },
            {
              "type": "object",
              "properties": {
                "$date": {
                  "type": "string"
                }
              },
              "additionalProperties": false,
              "required": [
                "$date"
              ]
            }
          ]
        },
        "relayId": {
          "type": "string"
        }
      }
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="composite-device-state-example"></a>

```json
{
  "voltage": {
    "time": "2016-06-13T04:00:00.000Z",
    "value": 22.4
  },
  "loaded": {
    "time": "2016-06-13T03:00:00.000Z",
    "value": false
  }
}
```

<br/>
## Dashboard

Schema for a single Dashboard

### Schema <a name="dashboard-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "dashboardId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "ownerId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "ownerType": {
      "type": "string",
      "enum": [
        "user",
        "organization"
      ]
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "refreshRate": {
      "type": "number",
      "minimum": 5,
      "maximum": 600
    },
    "defaultTheme": {
      "type": "string",
      "enum": [
        "dark",
        "light"
      ]
    },
    "isPasswordProtected": {
      "type": "boolean"
    },
    "public": {
      "type": "boolean"
    },
    "reportConfigs": {
      "type": "array",
      "max": 10,
      "items": {
        "type": "object",
        "additionalProperties": false,
        "required": [
          "cron",
          "toEmail"
        ],
        "properties": {
          "id": {
            "type": "string",
            "max": 14
          },
          "cron": {
            "type": "string",
            "max": 255
          },
          "toEmail": {
            "type": "array",
            "min": 1,
            "max": 10,
            "items": {
              "type": "string",
              "format": "email",
              "maxLength": 1024
            }
          },
          "subject": {
            "type": "string",
            "max": 255
          },
          "message": {
            "type": "string",
            "max": 32767
          },
          "theme": {
            "type": "string",
            "enum": [
              "dark",
              "light"
            ]
          },
          "timezone": {
            "type": "string",
            "max": 255
          }
        }
      }
    },
    "blocks": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "maxLength": 255
          },
          "blockType": {
            "type": "string",
            "enum": [
              "application-list",
              "bar",
              "custom-chart",
              "dashboard-list",
              "data-table",
              "device-list",
              "device-log",
              "device-state-table",
              "event-list",
              "gauge",
              "graph",
              "heatmap",
              "iframe",
              "image",
              "indicator",
              "input",
              "map",
              "open-event-indicator",
              "pie",
              "position-chart",
              "section-header",
              "workflow-list"
            ]
          },
          "title": {
            "type": "string",
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "startX": {
            "type": "number"
          },
          "startY": {
            "type": "number"
          },
          "width": {
            "type": "number"
          },
          "height": {
            "type": "number"
          },
          "config": {
            "type": "object"
          }
        },
        "required": [
          "blockType",
          "startX",
          "startY",
          "width",
          "height"
        ],
        "additionalProperties": false
      }
    },
    "contextConfiguration": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "type": {
            "type": "string",
            "enum": [
              "deviceAttribute",
              "deviceId",
              "deviceTag",
              "number",
              "string"
            ]
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "defaultValue": {
            "oneOf": [
              {
                "type": "string",
                "maxLength": 32767
              },
              {
                "type": "number"
              },
              {
                "type": "object",
                "properties": {
                  "key": {
                    "type": "string",
                    "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                  },
                  "value": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 255
                  }
                },
                "additionalProperties": false
              }
            ]
          },
          "validationEnabled": {
            "type": "boolean"
          },
          "validationConfig": {
            "type": "object",
            "properties": {
              "min": {
                "type": "number"
              },
              "max": {
                "type": "number"
              },
              "regExp": {
                "type": "string",
                "maxLength": 1024
              },
              "attributes": {
                "type": "array",
                "items": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "maxItems": 100
              },
              "deviceIds": {
                "type": "array",
                "items": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "maxItems": 1000
              },
              "deviceTags": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                    },
                    "value": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 255
                    }
                  },
                  "additionalProperties": false
                },
                "maxItems": 100
              }
            },
            "additionalProperties": false
          }
        },
        "required": [
          "name",
          "type",
          "defaultValue"
        ],
        "additionalProperties": false
      },
      "maxItems": 100
    }
  }
}
```

<small></small>

### Example <a name="dashboard-example"></a>

```json
{
  "id": "575ece2b7ae143cd83dc4a9b",
  "dashboardId": "575ece2b7ae143cd83dc4a9b",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "ownerId": "575ed70c7ae143cd83dc4aa9",
  "ownerType": "user",
  "name": "My Dashboard",
  "description": "The best dashboard description",
  "refreshRate": 60,
  "public": false,
  "blocks": [],
  "reportConfigs": [
    {
      "toEmail": [
        "test@email.com"
      ],
      "cron": "0 0 12 * * MON-FRI *",
      "theme": "dark",
      "subject": "Daily Dashboard Report"
    }
  ]
}
```

<br/>
## Dashboard Context Instance

Schema for a dashboard context instance

### Schema <a name="dashboard-context-instance-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "patternProperties": {
    "^[0-9a-zA-Z_-]{1,255}$": {
      "oneOf": [
        {
          "type": "string",
          "maxLength": 32767
        },
        {
          "type": "number"
        },
        {
          "type": "object",
          "properties": {
            "key": {
              "type": "string",
              "pattern": "^[0-9a-zA-Z_-]{1,255}$"
            },
            "value": {
              "type": "string",
              "minLength": 1,
              "maxLength": 255
            }
          },
          "additionalProperties": false
        }
      ]
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="dashboard-context-instance-example"></a>

```json
{
  "myContextVariable": "myValue",
  "myOtherVariable": "575ecf887ae143cd83dc4aa2"
}
```

<br/>
## Dashboard Patch

Schema for the body of a Dashboard modification request

### Schema <a name="dashboard-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "blocks": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "maxLength": 255
          },
          "blockType": {
            "type": "string",
            "enum": [
              "application-list",
              "bar",
              "custom-chart",
              "dashboard-list",
              "data-table",
              "device-list",
              "device-log",
              "device-state-table",
              "event-list",
              "gauge",
              "graph",
              "heatmap",
              "iframe",
              "image",
              "indicator",
              "input",
              "map",
              "open-event-indicator",
              "pie",
              "position-chart",
              "section-header",
              "workflow-list"
            ]
          },
          "title": {
            "type": "string",
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "startX": {
            "type": "number"
          },
          "startY": {
            "type": "number"
          },
          "width": {
            "type": "number"
          },
          "height": {
            "type": "number"
          },
          "config": {
            "type": "object"
          }
        },
        "required": [
          "blockType",
          "startX",
          "startY",
          "width",
          "height"
        ],
        "additionalProperties": false
      }
    },
    "reportConfigs": {
      "type": "array",
      "max": 10,
      "items": {
        "type": "object",
        "additionalProperties": false,
        "required": [
          "cron",
          "toEmail"
        ],
        "properties": {
          "id": {
            "type": "string",
            "max": 14
          },
          "cron": {
            "type": "string",
            "max": 255
          },
          "toEmail": {
            "type": "array",
            "min": 1,
            "max": 10,
            "items": {
              "type": "string",
              "format": "email",
              "maxLength": 1024
            }
          },
          "subject": {
            "type": "string",
            "max": 255
          },
          "message": {
            "type": "string",
            "max": 32767
          },
          "theme": {
            "type": "string",
            "enum": [
              "dark",
              "light"
            ]
          },
          "timezone": {
            "type": "string",
            "max": 255
          }
        }
      }
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "refreshRate": {
      "type": "number",
      "minimum": 5,
      "maximum": 600
    },
    "defaultTheme": {
      "type": "string",
      "enum": [
        "dark",
        "light"
      ]
    },
    "public": {
      "type": "boolean"
    },
    "password": {
      "type": [
        "string",
        "null"
      ]
    },
    "contextConfiguration": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "type": {
            "type": "string",
            "enum": [
              "deviceAttribute",
              "deviceId",
              "deviceTag",
              "number",
              "string"
            ]
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "defaultValue": {
            "oneOf": [
              {
                "type": "string",
                "maxLength": 32767
              },
              {
                "type": "number"
              },
              {
                "type": "object",
                "properties": {
                  "key": {
                    "type": "string",
                    "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                  },
                  "value": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 255
                  }
                },
                "additionalProperties": false
              }
            ]
          },
          "validationEnabled": {
            "type": "boolean"
          },
          "validationConfig": {
            "type": "object",
            "properties": {
              "min": {
                "type": "number"
              },
              "max": {
                "type": "number"
              },
              "regExp": {
                "type": "string",
                "maxLength": 1024
              },
              "attributes": {
                "type": "array",
                "items": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "maxItems": 100
              },
              "deviceIds": {
                "type": "array",
                "items": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "maxItems": 1000
              },
              "deviceTags": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                    },
                    "value": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 255
                    }
                  },
                  "additionalProperties": false
                },
                "maxItems": 100
              }
            },
            "additionalProperties": false
          }
        },
        "required": [
          "name",
          "type",
          "defaultValue"
        ],
        "additionalProperties": false
      },
      "maxItems": 100
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="dashboard-patch-example"></a>

```json
{
  "name": "My Updated Dashboard",
  "description": "Description of my updated dashboard",
  "refreshRate": 300,
  "public": true
}
```

<br/>
## Dashboard Post

Schema for the body of a Dashboard creation request

### Schema <a name="dashboard-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "blocks": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "maxLength": 255
          },
          "blockType": {
            "type": "string",
            "enum": [
              "application-list",
              "bar",
              "custom-chart",
              "dashboard-list",
              "data-table",
              "device-list",
              "device-log",
              "device-state-table",
              "event-list",
              "gauge",
              "graph",
              "heatmap",
              "iframe",
              "image",
              "indicator",
              "input",
              "map",
              "open-event-indicator",
              "pie",
              "position-chart",
              "section-header",
              "workflow-list"
            ]
          },
          "title": {
            "type": "string",
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "startX": {
            "type": "number"
          },
          "startY": {
            "type": "number"
          },
          "width": {
            "type": "number"
          },
          "height": {
            "type": "number"
          },
          "config": {
            "type": "object"
          }
        },
        "required": [
          "blockType",
          "startX",
          "startY",
          "width",
          "height"
        ],
        "additionalProperties": false
      }
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "refreshRate": {
      "type": "number",
      "minimum": 5,
      "maximum": 600
    },
    "defaultTheme": {
      "type": "string",
      "enum": [
        "dark",
        "light"
      ]
    },
    "reportConfigs": {
      "type": "array",
      "max": 10,
      "items": {
        "type": "object",
        "additionalProperties": false,
        "required": [
          "cron",
          "toEmail"
        ],
        "properties": {
          "id": {
            "type": "string",
            "max": 14
          },
          "cron": {
            "type": "string",
            "max": 255
          },
          "toEmail": {
            "type": "array",
            "min": 1,
            "max": 10,
            "items": {
              "type": "string",
              "format": "email",
              "maxLength": 1024
            }
          },
          "subject": {
            "type": "string",
            "max": 255
          },
          "message": {
            "type": "string",
            "max": 32767
          },
          "theme": {
            "type": "string",
            "enum": [
              "dark",
              "light"
            ]
          },
          "timezone": {
            "type": "string",
            "max": 255
          }
        }
      }
    },
    "public": {
      "type": "boolean"
    },
    "password": {
      "type": [
        "string",
        "null"
      ]
    },
    "contextConfiguration": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "type": {
            "type": "string",
            "enum": [
              "deviceAttribute",
              "deviceId",
              "deviceTag",
              "number",
              "string"
            ]
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "defaultValue": {
            "oneOf": [
              {
                "type": "string",
                "maxLength": 32767
              },
              {
                "type": "number"
              },
              {
                "type": "object",
                "properties": {
                  "key": {
                    "type": "string",
                    "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                  },
                  "value": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 255
                  }
                },
                "additionalProperties": false
              }
            ]
          },
          "validationEnabled": {
            "type": "boolean"
          },
          "validationConfig": {
            "type": "object",
            "properties": {
              "min": {
                "type": "number"
              },
              "max": {
                "type": "number"
              },
              "regExp": {
                "type": "string",
                "maxLength": 1024
              },
              "attributes": {
                "type": "array",
                "items": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "maxItems": 100
              },
              "deviceIds": {
                "type": "array",
                "items": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "maxItems": 1000
              },
              "deviceTags": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                    },
                    "value": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 255
                    }
                  },
                  "additionalProperties": false
                },
                "maxItems": 100
              }
            },
            "additionalProperties": false
          }
        },
        "required": [
          "name",
          "type",
          "defaultValue"
        ],
        "additionalProperties": false
      },
      "maxItems": 100
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```

<small></small>

### Example <a name="dashboard-post-example"></a>

```json
{
  "name": "My New Dashboard",
  "public": false
}
```

<br/>
## Dashboards

Schema for a collection of Dashboards

### Schema <a name="dashboards-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Dashboard",
        "description": "Schema for a single Dashboard",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "dashboardId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "ownerId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "ownerType": {
            "type": "string",
            "enum": [
              "user",
              "organization"
            ]
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "refreshRate": {
            "type": "number",
            "minimum": 5,
            "maximum": 600
          },
          "defaultTheme": {
            "type": "string",
            "enum": [
              "dark",
              "light"
            ]
          },
          "isPasswordProtected": {
            "type": "boolean"
          },
          "public": {
            "type": "boolean"
          },
          "reportConfigs": {
            "type": "array",
            "max": 10,
            "items": {
              "type": "object",
              "additionalProperties": false,
              "required": [
                "cron",
                "toEmail"
              ],
              "properties": {
                "id": {
                  "type": "string",
                  "max": 14
                },
                "cron": {
                  "type": "string",
                  "max": 255
                },
                "toEmail": {
                  "type": "array",
                  "min": 1,
                  "max": 10,
                  "items": {
                    "type": "string",
                    "format": "email",
                    "maxLength": 1024
                  }
                },
                "subject": {
                  "type": "string",
                  "max": 255
                },
                "message": {
                  "type": "string",
                  "max": 32767
                },
                "theme": {
                  "type": "string",
                  "enum": [
                    "dark",
                    "light"
                  ]
                },
                "timezone": {
                  "type": "string",
                  "max": 255
                }
              }
            }
          },
          "blocks": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "id": {
                  "type": "string",
                  "maxLength": 255
                },
                "blockType": {
                  "type": "string",
                  "enum": [
                    "application-list",
                    "bar",
                    "custom-chart",
                    "dashboard-list",
                    "data-table",
                    "device-list",
                    "device-log",
                    "device-state-table",
                    "event-list",
                    "gauge",
                    "graph",
                    "heatmap",
                    "iframe",
                    "image",
                    "indicator",
                    "input",
                    "map",
                    "open-event-indicator",
                    "pie",
                    "position-chart",
                    "section-header",
                    "workflow-list"
                  ]
                },
                "title": {
                  "type": "string",
                  "maxLength": 255
                },
                "description": {
                  "type": "string",
                  "maxLength": 32767
                },
                "applicationId": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "startX": {
                  "type": "number"
                },
                "startY": {
                  "type": "number"
                },
                "width": {
                  "type": "number"
                },
                "height": {
                  "type": "number"
                },
                "config": {
                  "type": "object"
                }
              },
              "required": [
                "blockType",
                "startX",
                "startY",
                "width",
                "height"
              ],
              "additionalProperties": false
            }
          },
          "contextConfiguration": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "name": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "type": {
                  "type": "string",
                  "enum": [
                    "deviceAttribute",
                    "deviceId",
                    "deviceTag",
                    "number",
                    "string"
                  ]
                },
                "applicationId": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "defaultValue": {
                  "oneOf": [
                    {
                      "type": "string",
                      "maxLength": 32767
                    },
                    {
                      "type": "number"
                    },
                    {
                      "type": "object",
                      "properties": {
                        "key": {
                          "type": "string",
                          "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                        },
                        "value": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 255
                        }
                      },
                      "additionalProperties": false
                    }
                  ]
                },
                "validationEnabled": {
                  "type": "boolean"
                },
                "validationConfig": {
                  "type": "object",
                  "properties": {
                    "min": {
                      "type": "number"
                    },
                    "max": {
                      "type": "number"
                    },
                    "regExp": {
                      "type": "string",
                      "maxLength": 1024
                    },
                    "attributes": {
                      "type": "array",
                      "items": {
                        "type": "string",
                        "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                      },
                      "maxItems": 100
                    },
                    "deviceIds": {
                      "type": "array",
                      "items": {
                        "type": "string",
                        "pattern": "^[A-Fa-f\\d]{24}$"
                      },
                      "maxItems": 1000
                    },
                    "deviceTags": {
                      "type": "array",
                      "items": {
                        "type": "object",
                        "properties": {
                          "key": {
                            "type": "string",
                            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                          },
                          "value": {
                            "type": "string",
                            "minLength": 1,
                            "maxLength": 255
                          }
                        },
                        "additionalProperties": false
                      },
                      "maxItems": 100
                    }
                  },
                  "additionalProperties": false
                }
              },
              "required": [
                "name",
                "type",
                "defaultValue"
              ],
              "additionalProperties": false
            },
            "maxItems": 100
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    }
  }
}
```

<small></small>

### Example <a name="dashboards-example"></a>

```json
{
  "items": [
    {
      "id": "575ece2b7ae143cd83dc4a9b",
      "dashboardId": "575ece2b7ae143cd83dc4a9b",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "ownerId": "575ed70c7ae143cd83dc4aa9",
      "ownerType": "user",
      "name": "My Dashboard",
      "description": "The best dashboard description",
      "refreshRate": 60,
      "public": false,
      "blocks": [],
      "reportConfigs": [
        {
          "toEmail": [
            "test@email.com"
          ],
          "cron": "0 0 12 * * MON-FRI *",
          "theme": "dark",
          "subject": "Daily Dashboard Report"
        }
      ]
    }
  ],
  "count": 1,
  "totalCount": 5,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc"
}
```

<br/>
## Data Table

Schema for a single Data Table

### Schema <a name="data-table-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "dataTableId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "columns": {
      "type": "array",
      "items": {
        "title": "Data Table Column",
        "description": "Schema for a single Data Table Column",
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "boolean"
            ]
          },
          "constraint": {
            "type": "string",
            "enum": [
              "unique",
              "required",
              "optional"
            ]
          },
          "defaultValue": {
            "type": [
              "string",
              "number",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType",
          "constraint"
        ],
        "additionalProperties": false
      },
      "maxItems": 50
    }
  }
}
```

<small></small>

### Example <a name="data-table-example"></a>

```json
{
  "id": "596e6ce831761df4231708f1",
  "dataTableId": "596e6ce831761df4231708f1",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Data Table",
  "columns": [
    {
      "name": "myColumn1",
      "dataType": "string",
      "defaultValue": "aDefault"
    }
  ]
}
```

<br/>
## Data Table Column

Schema for a single Data Table Column

### Schema <a name="data-table-column-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "pattern": "^[0-9a-zA-Z_-]{1,255}$"
    },
    "dataType": {
      "type": "string",
      "enum": [
        "string",
        "number",
        "boolean"
      ]
    },
    "constraint": {
      "type": "string",
      "enum": [
        "unique",
        "required",
        "optional"
      ]
    },
    "defaultValue": {
      "type": [
        "string",
        "number",
        "boolean"
      ]
    }
  },
  "required": [
    "name",
    "dataType",
    "constraint"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="data-table-column-example"></a>

```json
{
  "name": "myOptionalColumn",
  "dataType": "string",
  "constraint": "optional",
  "defaultValue": "aDefault"
}
```

<br/>
## Data Table Patch

Schema for the body of a Data Table modification request

### Schema <a name="data-table-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="data-table-patch-example"></a>

```json
{
  "name": "My Updated Data Table"
}
```

<br/>
## Data Table Post

Schema for the body of a Data Table creation request

### Schema <a name="data-table-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "columns": {
      "type": "array",
      "items": {
        "title": "Data Table Column",
        "description": "Schema for a single Data Table Column",
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "boolean"
            ]
          },
          "constraint": {
            "type": "string",
            "enum": [
              "unique",
              "required",
              "optional"
            ]
          },
          "defaultValue": {
            "type": [
              "string",
              "number",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType",
          "constraint"
        ],
        "additionalProperties": false
      },
      "maxItems": 50
    }
  },
  "required": [
    "name"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="data-table-post-example"></a>

```json
{
  "name": "My Data Table",
  "columns": [
    {
      "name": "myColumn1",
      "dataType": "string",
      "constraint": "unique"
    }
  ]
}
```

<br/>
## Data Table Query

Schema for a data table query

### Schema <a name="data-table-query-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "$and": {
      "type": "array",
      "items": {
        "$ref": "#/definitions/dataTableQuery"
      }
    },
    "$or": {
      "type": "array",
      "items": {
        "$ref": "#/definitions/dataTableQuery"
      }
    }
  },
  "patternProperties": {
    "^[0-9a-zA-Z_-]{1,255}$": {
      "oneOf": [
        {
          "type": [
            "string",
            "number",
            "boolean",
            "null"
          ]
        },
        {
          "type": "object",
          "properties": {
            "$eq": {
              "type": [
                "string",
                "number",
                "boolean",
                "null"
              ]
            },
            "$ne": {
              "type": [
                "string",
                "number",
                "boolean",
                "null"
              ]
            },
            "$gt": {
              "type": [
                "string",
                "number",
                "boolean",
                "null"
              ]
            },
            "$lt": {
              "type": [
                "string",
                "number",
                "boolean",
                "null"
              ]
            },
            "$gte": {
              "type": [
                "string",
                "number",
                "boolean",
                "null"
              ]
            },
            "$lte": {
              "type": [
                "string",
                "number",
                "boolean",
                "null"
              ]
            }
          }
        }
      ]
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="data-table-query-example"></a>

```json
{
  "$or": [
    {
      "myCol1": {
        "$ne": 0
      }
    },
    {
      "myCol2": 5
    }
  ]
}
```

<br/>
## Data Table Row

Schema for a single Data Table Row

### Schema <a name="data-table-row-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "createdAt": {
      "type": "string",
      "format": "date-time"
    },
    "updatedAt": {
      "type": "string",
      "format": "date-time"
    }
  },
  "patternProperties": {
    "^[0-9a-zA-Z_-]{1,255}$": {
      "type": [
        "string",
        "number",
        "boolean",
        "null"
      ]
    }
  }
}
```

<small></small>

### Example <a name="data-table-row-example"></a>

```json
{
  "id": "596fbb703fc088453872e609",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "myColumn": "myValue"
}
```

<br/>
## Data Table Row Insert Multiple

Schema for inserting data table rows

### Schema <a name="data-table-row-insert-multiple-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "title": "Data Table Row Insert/Update",
    "description": "Schema for inserting or updating a data table row",
    "type": "object",
    "patternProperties": {
      "^[0-9a-zA-Z_-]{1,255}$": {
        "type": [
          "string",
          "number",
          "boolean",
          "null"
        ]
      }
    },
    "additionalProperties": false
  }
}
```

<small></small>

### Example <a name="data-table-row-insert-multiple-example"></a>

```json
[
  {
    "myColumn1": "myValue"
  },
  {
    "myColumn1": "myValue"
  }
]
```

<br/>
## Data Table Row Insert

Schema for inserting a data table row or rows

### Schema <a name="data-table-row-insert-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "oneOf": [
    {
      "title": "Data Table Row Insert/Update",
      "description": "Schema for inserting or updating a data table row",
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": [
            "string",
            "number",
            "boolean",
            "null"
          ]
        }
      },
      "additionalProperties": false
    },
    {
      "title": "Data Table Row Insert Multiple",
      "description": "Schema for inserting data table rows",
      "type": "array",
      "items": {
        "title": "Data Table Row Insert/Update",
        "description": "Schema for inserting or updating a data table row",
        "type": "object",
        "patternProperties": {
          "^[0-9a-zA-Z_-]{1,255}$": {
            "type": [
              "string",
              "number",
              "boolean",
              "null"
            ]
          }
        },
        "additionalProperties": false
      }
    }
  ]
}
```

<small></small>

### Example <a name="data-table-row-insert-example"></a>

```json
{
  "myColumn1": "myValue"
}
```

<br/>
## Data Table Row Insert Result

Schema for a the result of a single or multiple row insert

### Schema <a name="data-table-row-insert-result-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "oneOf": [
    {
      "title": "Data Table Row",
      "description": "Schema for a single Data Table Row",
      "type": "object",
      "properties": {
        "id": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "createdAt": {
          "type": "string",
          "format": "date-time"
        },
        "updatedAt": {
          "type": "string",
          "format": "date-time"
        }
      },
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": [
            "string",
            "number",
            "boolean",
            "null"
          ]
        }
      }
    },
    {
      "type": "object",
      "properties": {
        "createdAt": {
          "type": "string",
          "format": "date-time"
        },
        "count": {
          "type": "number"
        },
        "rowIds": {
          "type": "array",
          "items": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "maxItems": 1000
        }
      }
    }
  ]
}
```

<small></small>

### Example <a name="data-table-row-insert-result-example"></a>

```json
{
  "id": "596fbb703fc088453872e609",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "myColumn": "myValue"
}
```

<br/>
## Data Table Row Insert/Update

Schema for inserting or updating a data table row

### Schema <a name="data-table-row-insert/update-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "patternProperties": {
    "^[0-9a-zA-Z_-]{1,255}$": {
      "type": [
        "string",
        "number",
        "boolean",
        "null"
      ]
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="data-table-row-insert/update-example"></a>

```json
{
  "myColumn1": "myValue"
}
```

<br/>
## Data Table Rows

Schema for a collection of Data Table Rows

### Schema <a name="data-table-rows-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Data Table Row",
        "description": "Schema for a single Data Table Row",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "createdAt": {
            "type": "string",
            "format": "date-time"
          },
          "updatedAt": {
            "type": "string",
            "format": "date-time"
          }
        },
        "patternProperties": {
          "^[0-9a-zA-Z_-]{1,255}$": {
            "type": [
              "string",
              "number",
              "boolean",
              "null"
            ]
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "limit": {
      "type": "integer"
    },
    "offset": {
      "type": "integer"
    },
    "sortColumn": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "dataTableId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="data-table-rows-example"></a>

```json
{
  "items": [
    {
      "id": "596fbb703fc088453872e609",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "myColumn": "myValue"
    }
  ],
  "count": 1,
  "totalCount": 4,
  "offset": 0,
  "limit": 1,
  "sortColumn": "myColumn1",
  "sortDirection": "asc",
  "dataTableId": "596e6ce831761df4231708f1",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Data Table Rows Delete

Schema for response to data table rows removal

### Schema <a name="data-table-rows-delete-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "removed": {
      "type": "Number"
    }
  }
}
```

<small></small>

### Example <a name="data-table-rows-delete-example"></a>

```json
{
  "removed": 100
}
```

<br/>
## Data Table Export

Schema for the body of a data table export

### Schema <a name="data-table-export-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "query": {
      "title": "Data Table Query",
      "description": "Schema for a data table query",
      "type": "object",
      "properties": {
        "$and": {
          "type": "array",
          "items": {
            "$ref": "#/definitions/dataTableQuery"
          }
        },
        "$or": {
          "type": "array",
          "items": {
            "$ref": "#/definitions/dataTableQuery"
          }
        }
      },
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "oneOf": [
            {
              "type": [
                "string",
                "number",
                "boolean",
                "null"
              ]
            },
            {
              "type": "object",
              "properties": {
                "$eq": {
                  "type": [
                    "string",
                    "number",
                    "boolean",
                    "null"
                  ]
                },
                "$ne": {
                  "type": [
                    "string",
                    "number",
                    "boolean",
                    "null"
                  ]
                },
                "$gt": {
                  "type": [
                    "string",
                    "number",
                    "boolean",
                    "null"
                  ]
                },
                "$lt": {
                  "type": [
                    "string",
                    "number",
                    "boolean",
                    "null"
                  ]
                },
                "$gte": {
                  "type": [
                    "string",
                    "number",
                    "boolean",
                    "null"
                  ]
                },
                "$lte": {
                  "type": [
                    "string",
                    "number",
                    "boolean",
                    "null"
                  ]
                }
              }
            }
          ]
        }
      },
      "additionalProperties": false
    },
    "queryOptions": {
      "type": "object",
      "properties": {
        "sortDirection": {
          "type": "string",
          "enum": [
            "desc",
            "asc"
          ]
        },
        "limit": {
          "type": "number"
        },
        "sortColumn": {
          "type": "string"
        },
        "offset": {
          "type": "number"
        }
      }
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="data-table-export-example"></a>

```json
{
  "email": "email@example.com",
  "query": {
    "$or": [
      {
        "myCol1": {
          "$ne": 0
        }
      },
      {
        "myCol2": 5
      }
    ]
  },
  "queryOptions": {
    "limit": 10000
  }
}
```

<br/>
## Data Tables

Schema for a collection of Data Tables

### Schema <a name="data-tables-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Data Table",
        "description": "Schema for a single Data Table",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "dataTableId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "columns": {
            "type": "array",
            "items": {
              "title": "Data Table Column",
              "description": "Schema for a single Data Table Column",
              "type": "object",
              "properties": {
                "name": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "dataType": {
                  "type": "string",
                  "enum": [
                    "string",
                    "number",
                    "boolean"
                  ]
                },
                "constraint": {
                  "type": "string",
                  "enum": [
                    "unique",
                    "required",
                    "optional"
                  ]
                },
                "defaultValue": {
                  "type": [
                    "string",
                    "number",
                    "boolean"
                  ]
                }
              },
              "required": [
                "name",
                "dataType",
                "constraint"
              ],
              "additionalProperties": false
            },
            "maxItems": 50
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="data-tables-example"></a>

```json
{
  "items": [
    {
      "id": "596e6ce831761df4231708f1",
      "dataTableId": "596e6ce831761df4231708f1",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Data Table",
      "columns": [
        {
          "name": "myColumn1",
          "dataType": "string",
          "defaultValue": "aDefault"
        }
      ]
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Device

Schema for a single Device

### Schema <a name="device-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      },
      "maxItems": 256
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "gateway",
        "peripheral",
        "floating",
        "edgeCompute"
      ]
    },
    "gatewayId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "edgeAgentVersion": {
      "type": "string",
      "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
    },
    "connectionInfo": {
      "type": "object",
      "properties": {
        "time": {
          "type": "string",
          "format": "date-time"
        },
        "connected": {
          "enum": [
            1,
            0,
            null
          ]
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="device-example"></a>

```json
{
  "id": "575ecf887ae143cd83dc4aa2",
  "deviceId": "575ecf887ae143cd83dc4aa2",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Device",
  "description": "A device description",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    },
    {
      "key": "floor",
      "value": "8"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone",
  "connectionInfo": {
    "time": "2016-06-14T08:15:00.000Z",
    "connected": 1
  }
}
```

<br/>
## Device Command

Schema for a command for a single Device

### Schema <a name="device-command-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "time": {
      "oneOf": [
        {
          "type": "string"
        },
        {
          "type": "number"
        },
        {
          "type": "object",
          "properties": {
            "$date": {
              "type": "string"
            }
          },
          "additionalProperties": false,
          "required": [
            "$date"
          ]
        }
      ]
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "payload": {}
  },
  "required": [
    "name"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="device-command-example"></a>

```json
{
  "time": "2016-06-13T04:00:00.000Z",
  "name": "myCommand",
  "payload": [
    1,
    1,
    2,
    3,
    5
  ]
}
```

<br/>
## Device Commands

Schema for an array of Device Commands

### Schema <a name="device-commands-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "title": "Device Command",
    "description": "Schema for a command for a single Device",
    "type": "object",
    "properties": {
      "time": {
        "oneOf": [
          {
            "type": "string"
          },
          {
            "type": "number"
          },
          {
            "type": "object",
            "properties": {
              "$date": {
                "type": "string"
              }
            },
            "additionalProperties": false,
            "required": [
              "$date"
            ]
          }
        ]
      },
      "name": {
        "type": "string",
        "minLength": 1,
        "maxLength": 255
      },
      "payload": {}
    },
    "required": [
      "name"
    ],
    "additionalProperties": false
  }
}
```

<small></small>

### Example <a name="device-commands-example"></a>

```json
[
  {
    "time": "2016-06-13T04:00:00.000Z",
    "name": "myCommand",
    "payload": [
      1,
      1,
      2,
      3,
      5
    ]
  },
  {
    "time": "2016-06-13T04:00:00.000Z",
    "name": "myCommand",
    "payload": [
      1,
      1,
      2,
      3,
      5
    ]
  }
]
```

<br/>
## Device Connection Status

Schema for the body of a request to set a device&#x27;s connection status

### Schema <a name="device-connection-status-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "oneOf": [
    {
      "title": "Device Connected",
      "description": "Schema for marking a device as connected",
      "type": "object",
      "properties": {
        "status": {
          "type": "string",
          "enum": [
            "connected"
          ]
        },
        "connectedAt": {
          "oneOf": [
            {
              "type": "string"
            },
            {
              "type": "number"
            },
            {
              "type": "object",
              "properties": {
                "$date": {
                  "type": "string"
                }
              },
              "additionalProperties": false,
              "required": [
                "$date"
              ]
            }
          ]
        }
      },
      "required": [
        "status"
      ],
      "additionalProperties": false
    },
    {
      "title": "Device Disconnected",
      "description": "Schema for marking a device as disconnected",
      "type": "object",
      "properties": {
        "status": {
          "type": "string",
          "enum": [
            "disconnected"
          ]
        },
        "connectedAt": {
          "oneOf": [
            {
              "type": "string"
            },
            {
              "type": "number"
            },
            {
              "type": "object",
              "properties": {
                "$date": {
                  "type": "string"
                }
              },
              "additionalProperties": false,
              "required": [
                "$date"
              ]
            }
          ]
        },
        "disconnectedAt": {
          "oneOf": [
            {
              "type": "string"
            },
            {
              "type": "number"
            },
            {
              "type": "object",
              "properties": {
                "$date": {
                  "type": "string"
                }
              },
              "additionalProperties": false,
              "required": [
                "$date"
              ]
            }
          ]
        },
        "disconnectReason": {
          "type": "string",
          "maxLength": 1024
        },
        "messagesFromClient": {
          "type": "number"
        },
        "messagesToClient": {
          "type": "number"
        }
      },
      "required": [
        "status"
      ],
      "additionalProperties": false
    }
  ]
}
```

<small></small>

### Example <a name="device-connection-status-example"></a>

```json
{
  "status": "connected"
}
```

<br/>
## Device Credentials

Schema for the body of a Device authentication request

### Schema <a name="device-credentials-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "deviceId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "key": {
      "type": "string"
    },
    "secret": {
      "type": "string"
    },
    "tokenTTL": {
      "type": "integer",
      "minimum": 0
    },
    "requestedScopes": {
      "type": "array",
      "uniqueItems": true,
      "items": {
        "type": "string",
        "enum": [
          "all.Device",
          "all.Device.read",
          "data.timeSeriesQuery",
          "data.lastValueQuery",
          "device.commandStream",
          "device.get",
          "device.getCompositeState",
          "device.getState",
          "device.stateStream",
          "device.getLogEntries",
          "device.getCommand",
          "device.debug",
          "device.sendState",
          "device.sendCommand",
          "device.setConnectionStatus",
          "devices.get",
          "devices.sendCommand"
        ]
      }
    }
  },
  "required": [
    "deviceId",
    "key",
    "secret"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="device-credentials-example"></a>

```json
{
  "deviceId": "575ecf887ae143cd83dc4aa2",
  "key": "this_would_be_the_key",
  "secret": "this_would_be_the_secret"
}
```

<br/>
## Device Log

Log of connection information for a Device

### Schema <a name="device-log-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "connected": {
        "enum": [
          1,
          0
        ]
      },
      "time": {
        "type": "string",
        "format": "date-time"
      },
      "disconnectReason": {
        "type": "string"
      },
      "messagesFromClient": {
        "type": "number"
      },
      "messagesToClient": {
        "type": "number"
      }
    }
  }
}
```

<small></small>

### Example <a name="device-log-example"></a>

```json
[
  {
    "connected": 1,
    "time": "2016-06-03T00:56:22.447Z"
  },
  {
    "connected": 0,
    "disconnectReason": "Connection Lost",
    "messagesFromClient": 2548,
    "messagesToClient": 0,
    "time": "2016-06-03T00:56:21.028Z"
  },
  {
    "connected": 1,
    "time": "2016-06-01T06:24:39.190Z"
  },
  {
    "connected": 0,
    "disconnectReason": "Connection Lost",
    "messagesFromClient": 479,
    "messagesToClient": 0,
    "time": "2016-06-01T06:24:37.925Z"
  },
  {
    "connected": 1,
    "time": "2016-05-31T22:24:48.777Z"
  }
]
```

<br/>
## Device Patch

Schema for the body of a Device modification request

### Schema <a name="device-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      },
      "maxItems": 256
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "gateway",
        "peripheral",
        "floating",
        "edgeCompute"
      ]
    },
    "gatewayId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="device-patch-example"></a>

```json
{
  "name": "My Updated Device",
  "description": "Description of my updated device",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone"
}
```

<br/>
## Device Post

Schema for the body of a Device creation request

### Schema <a name="device-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      },
      "maxItems": 256
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "gateway",
        "peripheral",
        "floating",
        "edgeCompute"
      ]
    },
    "gatewayId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```

<small></small>

### Example <a name="device-post-example"></a>

```json
{
  "name": "My New Device",
  "description": "Description of my new device",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone"
}
```

<br/>
## Device Recipe

Schema for a single Device Recipe

### Schema <a name="device-recipe-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceRecipeId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "deviceName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "deviceDescription": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      },
      "maxItems": 256
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "gateway",
        "peripheral",
        "floating",
        "edgeCompute"
      ]
    },
    "gatewayId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="device-recipe-example"></a>

```json
{
  "id": "575ecec57ae143cd83dc4a9f",
  "deviceRecipeId": "575ecec57ae143cd83dc4a9f",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "Actual recipe name",
  "deviceName": "Future device name",
  "description": "My recipe description",
  "deviceDescription": "Future device description",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone"
}
```

<br/>
## Device Recipe Bulk Create

Schema for the result of a bulk Device creation request

### Schema <a name="device-recipe-bulk-create-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "created": {
      "type": "number"
    },
    "failed": {
      "type": "number"
    },
    "csvResult": {
      "type": "string"
    }
  }
}
```

<small></small>

### Example <a name="device-recipe-bulk-create-example"></a>

```json
{
  "created": 10,
  "failed": 0,
  "csvResult": "a,comma,separated,string,of,results"
}
```

<br/>
## Device Recipe Bulk Create Enqueue

Schema for the result of a bulk Device creation request when creating more than 750 devices

### Schema <a name="device-recipe-bulk-create-enqueue-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "jobQueued": {
      "type": "boolean"
    }
  }
}
```

<small></small>

### Example <a name="device-recipe-bulk-create-enqueue-example"></a>

```json
{
  "jobQueued": true
}
```

<br/>
## Device Recipe Bulk Create Post

Schema for the body of a bulk Device creation request

### Schema <a name="device-recipe-bulk-create-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "nameColumn": {
      "type": "string"
    },
    "descriptionColumn": {
      "type": "string"
    },
    "csv": {
      "type": "string"
    },
    "makeUniqueKeySecret": {
      "type": "boolean"
    },
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    }
  },
  "additionalProperties": false,
  "required": [
    "csv"
  ]
}
```

<small></small>

### Example <a name="device-recipe-bulk-create-post-example"></a>

```json
{
  "nameColumn": "myNameColumn",
  "descriptionColumn": "column2",
  "csv": "a,comma,separated,string,of,input,data"
}
```

<br/>
## Device Recipe Patch

Schema for the body of a Device Recipe modification request

### Schema <a name="device-recipe-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "deviceName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "deviceDescription": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      },
      "maxItems": 256
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "gateway",
        "peripheral",
        "floating",
        "edgeCompute"
      ]
    },
    "gatewayId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="device-recipe-patch-example"></a>

```json
{
  "name": "My Updated Device Recipe",
  "deviceName": "Future device name",
  "description": "Description of my updated device recipe",
  "deviceDescription": "Future device description",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone"
}
```

<br/>
## Device Recipe Post

Schema for the body of a Device Recipe creation request

### Schema <a name="device-recipe-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "deviceName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "deviceDescription": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      },
      "maxItems": 256
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "gateway",
        "peripheral",
        "floating",
        "edgeCompute"
      ]
    },
    "gatewayId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```

<small></small>

### Example <a name="device-recipe-post-example"></a>

```json
{
  "name": "My New Device Recipe",
  "deviceName": "Future device name",
  "description": "Description of my new device recipe",
  "deviceDescription": "Future device description",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone"
}
```

<br/>
## Device Recipes

Schema for a collection of Device Recipes

### Schema <a name="device-recipes-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Device Recipe",
        "description": "Schema for a single Device Recipe",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "deviceRecipeId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "deviceName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "deviceDescription": {
            "type": "string",
            "maxLength": 32767
          },
          "tags": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "value": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 255
                }
              },
              "required": [
                "key",
                "value"
              ],
              "additionalProperties": false
            },
            "maxItems": 100
          },
          "attributes": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "name": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "dataType": {
                  "type": "string",
                  "enum": [
                    "string",
                    "number",
                    "gps",
                    "boolean"
                  ]
                }
              },
              "required": [
                "name",
                "dataType"
              ],
              "additionalProperties": false
            },
            "maxItems": 256
          },
          "deviceClass": {
            "type": "string",
            "enum": [
              "standalone",
              "gateway",
              "peripheral",
              "floating",
              "edgeCompute"
            ]
          },
          "gatewayId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="device-recipes-example"></a>

```json
{
  "items": [
    {
      "id": "575ecec57ae143cd83dc4a9f",
      "deviceRecipeId": "575ecec57ae143cd83dc4a9f",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "Actual recipe name",
      "deviceName": "Future device name",
      "description": "My recipe description",
      "deviceDescription": "Future device description",
      "tags": [
        {
          "key": "TagKey",
          "value": "TagValue"
        }
      ],
      "attributes": [
        {
          "name": "voltage",
          "dataType": "number"
        }
      ],
      "deviceClass": "standalone"
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Device State

Schema for a single Device state

### Schema <a name="device-state-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "time": {
      "oneOf": [
        {
          "type": "string"
        },
        {
          "type": "number"
        },
        {
          "type": "object",
          "properties": {
            "$date": {
              "type": "string"
            }
          },
          "additionalProperties": false,
          "required": [
            "$date"
          ]
        }
      ]
    },
    "relayId": {
      "type": "string"
    },
    "meta": {},
    "data": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": [
            "number",
            "string",
            "boolean"
          ]
        }
      },
      "additionalProperties": false
    },
    "flowVersion": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    }
  },
  "required": [
    "data"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="device-state-example"></a>

```json
{
  "time": "2016-06-13T04:00:00.000Z",
  "data": {
    "voltage": 22.4
  }
}
```

<br/>
## Single or Multiple Device States

Schema for a single device state or an array of device states

### Schema <a name="single-or-multiple-device-states-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "oneOf": [
    {
      "title": "Device State",
      "description": "Schema for a single Device state",
      "type": "object",
      "properties": {
        "time": {
          "oneOf": [
            {
              "type": "string"
            },
            {
              "type": "number"
            },
            {
              "type": "object",
              "properties": {
                "$date": {
                  "type": "string"
                }
              },
              "additionalProperties": false,
              "required": [
                "$date"
              ]
            }
          ]
        },
        "relayId": {
          "type": "string"
        },
        "meta": {},
        "data": {
          "type": "object",
          "patternProperties": {
            "^[0-9a-zA-Z_-]{1,255}$": {
              "type": [
                "number",
                "string",
                "boolean"
              ]
            }
          },
          "additionalProperties": false
        },
        "flowVersion": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "required": [
        "data"
      ],
      "additionalProperties": false
    },
    {
      "title": "Device States",
      "description": "Schema for an array of Device states",
      "type": "array",
      "items": {
        "title": "Device State",
        "description": "Schema for a single Device state",
        "type": "object",
        "properties": {
          "time": {
            "oneOf": [
              {
                "type": "string"
              },
              {
                "type": "number"
              },
              {
                "type": "object",
                "properties": {
                  "$date": {
                    "type": "string"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "$date"
                ]
              }
            ]
          },
          "relayId": {
            "type": "string"
          },
          "meta": {},
          "data": {
            "type": "object",
            "patternProperties": {
              "^[0-9a-zA-Z_-]{1,255}$": {
                "type": [
                  "number",
                  "string",
                  "boolean"
                ]
              }
            },
            "additionalProperties": false
          },
          "flowVersion": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "data"
        ],
        "additionalProperties": false
      }
    }
  ]
}
```

<small></small>

### Example <a name="single-or-multiple-device-states-example"></a>

```json
{
  "time": "2016-06-13T04:00:00.000Z",
  "data": {
    "voltage": 22.4
  }
}
```

<br/>
## Device States

Schema for an array of Device states

### Schema <a name="device-states-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "title": "Device State",
    "description": "Schema for a single Device state",
    "type": "object",
    "properties": {
      "time": {
        "oneOf": [
          {
            "type": "string"
          },
          {
            "type": "number"
          },
          {
            "type": "object",
            "properties": {
              "$date": {
                "type": "string"
              }
            },
            "additionalProperties": false,
            "required": [
              "$date"
            ]
          }
        ]
      },
      "relayId": {
        "type": "string"
      },
      "meta": {},
      "data": {
        "type": "object",
        "patternProperties": {
          "^[0-9a-zA-Z_-]{1,255}$": {
            "type": [
              "number",
              "string",
              "boolean"
            ]
          }
        },
        "additionalProperties": false
      },
      "flowVersion": {
        "type": "string",
        "minLength": 1,
        "maxLength": 255
      }
    },
    "required": [
      "data"
    ],
    "additionalProperties": false
  }
}
```

<small></small>

### Example <a name="device-states-example"></a>

```json
[
  {
    "time": "2016-06-13T04:00:00.000Z",
    "data": {
      "voltage": 22.4
    }
  },
  {
    "time": "2016-06-13T04:00:00.000Z",
    "data": {
      "voltage": 22.4
    }
  }
]
```

<br/>
## Device Tag Filter

Array of Tags for filtering devices. Tag keys and tag values are optional.

### Schema <a name="device-tag-filter-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "key": {
        "type": "string",
        "pattern": "^[0-9a-zA-Z_-]{1,255}$"
      },
      "value": {
        "type": "string",
        "minLength": 1,
        "maxLength": 255
      }
    },
    "additionalProperties": false
  },
  "maxItems": 100
}
```

<small></small>

### Example <a name="device-tag-filter-example"></a>

```json
[
  {
    "key": "Floor",
    "value": "2"
  },
  {
    "key": "Serial"
  }
]
```

<br/>
## Devices

Schema for a collection of Devices

### Schema <a name="devices-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Device",
        "description": "Schema for a single Device",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "deviceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "tags": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "value": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 255
                }
              },
              "required": [
                "key",
                "value"
              ],
              "additionalProperties": false
            },
            "maxItems": 100
          },
          "attributes": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "name": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "dataType": {
                  "type": "string",
                  "enum": [
                    "string",
                    "number",
                    "gps",
                    "boolean"
                  ]
                }
              },
              "required": [
                "name",
                "dataType"
              ],
              "additionalProperties": false
            },
            "maxItems": 256
          },
          "deviceClass": {
            "type": "string",
            "enum": [
              "standalone",
              "gateway",
              "peripheral",
              "floating",
              "edgeCompute"
            ]
          },
          "gatewayId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "edgeAgentVersion": {
            "type": "string",
            "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
          },
          "connectionInfo": {
            "type": "object",
            "properties": {
              "time": {
                "type": "string",
                "format": "date-time"
              },
              "connected": {
                "enum": [
                  1,
                  0,
                  null
                ]
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "gateway",
        "peripheral",
        "floating",
        "edgeCompute"
      ]
    },
    "tagFilter": {
      "title": "Device Tag Filter",
      "description": "Array of Tags for filtering devices. Tag keys and tag values are optional.",
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      },
      "maxItems": 100
    }
  }
}
```

<small></small>

### Example <a name="devices-example"></a>

```json
{
  "items": [
    {
      "id": "575ecf887ae143cd83dc4aa2",
      "deviceId": "575ecf887ae143cd83dc4aa2",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Device",
      "description": "A device description",
      "tags": [
        {
          "key": "TagKey",
          "value": "TagValue"
        },
        {
          "key": "floor",
          "value": "8"
        }
      ],
      "attributes": [
        {
          "name": "voltage",
          "dataType": "number"
        }
      ],
      "deviceClass": "standalone",
      "connectionInfo": {
        "time": "2016-06-14T08:15:00.000Z",
        "connected": 1
      }
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Disable Two Factor Auth

Schema for the body of a request to disable two factor auth

### Schema <a name="disable-two-factor-auth-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "twoFactorCode": {
      "type": "string",
      "maxLength": 2048
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048
    }
  },
  "required": [
    "password",
    "twoFactorCode"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="disable-two-factor-auth-example"></a>

```json
{
  "twoFactorCode": "123123",
  "password": "this would be your password"
}
```

<br/>
## Edge Deployment

Schema for a single deployment of an edge workflow to an edge device

### Schema <a name="edge-deployment-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "edgeDeploymentId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "flowId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "flowName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "currentVersion": {
      "type": [
        "string",
        "null"
      ],
      "minLength": 1,
      "maxLength": 255
    },
    "desiredVersion": {
      "type": [
        "string",
        "null"
      ],
      "minLength": 1,
      "maxLength": 255
    },
    "logs": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "sourceType": {
            "type": "string",
            "enum": [
              "flow",
              "user",
              "device",
              "apiToken"
            ]
          },
          "sourceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "date": {
            "type": "string",
            "format": "date-time"
          },
          "changeType": {
            "type": "string",
            "enum": [
              "current",
              "desired"
            ]
          },
          "newValue": {
            "type": [
              "string",
              "null"
            ],
            "minLength": 1,
            "maxLength": 255
          },
          "previousValue": {
            "type": [
              "string",
              "null"
            ],
            "minLength": 1,
            "maxLength": 255
          },
          "attemptedValue": {
            "type": [
              "string",
              "null"
            ],
            "minLength": 1,
            "maxLength": 255
          },
          "error": {
            "type": "string"
          }
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="edge-deployment-example"></a>

```json
{
  "id": "5a591be186b70d7b9f9b0954",
  "edgeDeploymentId": "5a591be186b70d7b9f9b0954",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "deviceId": "575ecf887ae143cd83dc4aa2",
  "flowId": "575ed18f7ae143cd83dc4aa6",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "desiredVersion": "v1.4.0",
  "currentVersion": null,
  "logs": [
    {
      "sourceType": "user",
      "sourceId": "575ed70c7ae143cd83dc4aa9",
      "date": "2016-06-13T04:00:00.000Z",
      "changeType": "desired",
      "newValue": "v1.4.0",
      "previousValue": null
    }
  ]
}
```

<br/>
## Edge Deployment Release

Schema for deploying an edge workflow to one or more edge devices

### Schema <a name="edge-deployment-release-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "flowId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "version": {
      "type": [
        "string",
        "null"
      ],
      "minLength": 1,
      "maxLength": 255
    },
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      },
      "maxItems": 100
    }
  },
  "additionalProperties": false,
  "required": [
    "flowId",
    "version"
  ]
}
```

<small></small>

### Example <a name="edge-deployment-release-example"></a>

```json
{
  "flowId": "575ed18f7ae143cd83dc4aa6",
  "version": "v1.2.3",
  "deviceIds": [
    "575ecf887ae143cd83dc4aa2"
  ]
}
```

<br/>
## Edge Deployment Remove

Schema for removing edge deployments. Can remove a specific workflow from a specific device, can remove all workflows from a specific device, or can remove a specific workflow from all devices.

### Schema <a name="edge-deployment-remove-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "flowId": {
      "type": [
        "string",
        "null"
      ],
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceId": {
      "type": [
        "string",
        "null"
      ],
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "additionalProperties": false,
  "required": [
    "flowId",
    "deviceId"
  ]
}
```

<small></small>

### Example <a name="edge-deployment-remove-example"></a>

```json
{
  "flowId": "575ed18f7ae143cd83dc4aa6",
  "deviceId": null
}
```

<br/>
## Edge Deployment Replace

Schema for replacing a deployment of a workflow version with a different workflow version

### Schema <a name="edge-deployment-replace-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "flowId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "oldVersion": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "newVersion": {
      "type": [
        "string",
        "null"
      ],
      "minLength": 1,
      "maxLength": 255
    }
  },
  "additionalProperties": false,
  "required": [
    "flowId",
    "oldVersion",
    "newVersion"
  ]
}
```

<small></small>

### Example <a name="edge-deployment-replace-example"></a>

```json
{
  "flowId": "575ed18f7ae143cd83dc4aa6",
  "oldVersion": "v1.2.3",
  "newVersion": "v1.2.4"
}
```

<br/>
## Edge Deployments

Schema for a collection of Edge Deployments

### Schema <a name="edge-deployments-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Edge Deployment",
        "description": "Schema for a single deployment of an edge workflow to an edge device",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "edgeDeploymentId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "deviceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "deviceName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "flowId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "flowName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "currentVersion": {
            "type": [
              "string",
              "null"
            ],
            "minLength": 1,
            "maxLength": 255
          },
          "desiredVersion": {
            "type": [
              "string",
              "null"
            ],
            "minLength": 1,
            "maxLength": 255
          },
          "logs": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "sourceType": {
                  "type": "string",
                  "enum": [
                    "flow",
                    "user",
                    "device",
                    "apiToken"
                  ]
                },
                "sourceId": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "date": {
                  "type": "string",
                  "format": "date-time"
                },
                "changeType": {
                  "type": "string",
                  "enum": [
                    "current",
                    "desired"
                  ]
                },
                "newValue": {
                  "type": [
                    "string",
                    "null"
                  ],
                  "minLength": 1,
                  "maxLength": 255
                },
                "previousValue": {
                  "type": [
                    "string",
                    "null"
                  ],
                  "minLength": 1,
                  "maxLength": 255
                },
                "attemptedValue": {
                  "type": [
                    "string",
                    "null"
                  ],
                  "minLength": 1,
                  "maxLength": 255
                },
                "error": {
                  "type": "string"
                }
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "flowId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "version": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    }
  }
}
```

<small></small>

### Example <a name="edge-deployments-example"></a>

```json
{
  "items": [
    {
      "id": "5a591be186b70d7b9f9b0954",
      "edgeDeploymentId": "5a591be186b70d7b9f9b0954",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "deviceId": "575ecf887ae143cd83dc4aa2",
      "flowId": "575ed18f7ae143cd83dc4aa6",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "desiredVersion": "v1.4.0",
      "currentVersion": null,
      "logs": [
        {
          "sourceType": "user",
          "sourceId": "575ed70c7ae143cd83dc4aa9",
          "date": "2016-06-13T04:00:00.000Z",
          "changeType": "desired",
          "newValue": "v1.4.0",
          "previousValue": null
        }
      ]
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "id",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Email Verification Verify

Schema for the body of a request verifying an email

### Schema <a name="email-verification-verify-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "token": {
      "type": "string",
      "minLength": 1
    }
  },
  "required": [
    "email",
    "token"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="email-verification-verify-example"></a>

```json
{
  "email": "example@losant.com",
  "token": "the email verification token"
}
```

<br/>
## Enable Two Factor Auth

Schema for the body of a request to enable two factor auth

### Schema <a name="enable-two-factor-auth-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "twoFactorAuthKey": {
      "type": "string",
      "minLength": 52,
      "maxLength": 52
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048
    }
  },
  "required": [
    "password",
    "twoFactorAuthKey"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="enable-two-factor-auth-example"></a>

```json
{
  "twoFactorAuthKey": "HBBGWJJVOVLXS4ZGNRTDOUKTMESFUR3BMRWVQND2HJYT44TOMVJA",
  "password": "this would be your password"
}
```

<br/>
## Error

Schema for errors returned by the API

### Schema <a name="error-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "type": {
      "type": "string"
    },
    "message": {
      "type": "string"
    }
  }
}
```

<small></small>

### Example <a name="error-example"></a>

```json
{
  "type": "NotFound",
  "message": "Application was not found"
}
```

<br/>
## Event

Schema for a single Event

### Schema <a name="event-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "eventId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "sourceType": {
      "type": "string",
      "enum": [
        "flow",
        "user",
        "device",
        "apiToken"
      ]
    },
    "sourceId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "level": {
      "type": "string",
      "enum": [
        "info",
        "warning",
        "error",
        "critical"
      ]
    },
    "state": {
      "type": "string",
      "enum": [
        "new",
        "acknowledged",
        "resolved"
      ]
    },
    "subject": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "message": {
      "type": "string",
      "maxLength": 32767
    },
    "data": {},
    "updates": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "sourceType": {
            "type": "string",
            "enum": [
              "flow",
              "user",
              "device",
              "apiToken"
            ]
          },
          "sourceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "comment": {
            "type": "string",
            "maxLength": 32767
          },
          "data": {},
          "stateChange": {
            "type": "object",
            "properties": {
              "old": {
                "type": "string",
                "enum": [
                  "new",
                  "acknowledged",
                  "resolved"
                ]
              },
              "new": {
                "type": "string",
                "enum": [
                  "new",
                  "acknowledged",
                  "resolved"
                ]
              }
            }
          }
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="event-example"></a>

```json
{
  "id": "575ed0de7ae143cd83dc4aa5",
  "eventId": "575ed0de7ae143cd83dc4aa5",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "sourceType": "user",
  "sourceId": "575ed70c7ae143cd83dc4aa9",
  "level": "info",
  "state": "new",
  "subject": "Power levels critical",
  "message": "Power levels on device 432 have surpassed critical thresholds",
  "updates": []
}
```

<br/>
## Event Patch

Schema for the body of an Event modification request

### Schema <a name="event-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "state": {
      "type": "string",
      "enum": [
        "new",
        "acknowledged",
        "resolved"
      ]
    },
    "comment": {
      "type": "string",
      "maxLength": 32767
    },
    "data": {}
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="event-patch-example"></a>

```json
{
  "state": "acknowledged",
  "comment": "Looking into this issue"
}
```

<br/>
## Event Post

Schema for the body of an Event creation request

### Schema <a name="event-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "level": {
      "type": "string",
      "enum": [
        "info",
        "warning",
        "error",
        "critical"
      ]
    },
    "state": {
      "type": "string",
      "enum": [
        "new",
        "acknowledged",
        "resolved"
      ]
    },
    "subject": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "message": {
      "type": "string",
      "maxLength": 32767
    },
    "data": {}
  },
  "required": [
    "level",
    "state",
    "subject"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="event-post-example"></a>

```json
{
  "level": "info",
  "state": "new",
  "subject": "Power levels critical",
  "message": "Power levels on device 432 have surpassed critical thresholds"
}
```

<br/>
## Events

Schema for a collection of Events

### Schema <a name="events-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Event",
        "description": "Schema for a single Event",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "eventId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "sourceType": {
            "type": "string",
            "enum": [
              "flow",
              "user",
              "device",
              "apiToken"
            ]
          },
          "sourceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "level": {
            "type": "string",
            "enum": [
              "info",
              "warning",
              "error",
              "critical"
            ]
          },
          "state": {
            "type": "string",
            "enum": [
              "new",
              "acknowledged",
              "resolved"
            ]
          },
          "subject": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "message": {
            "type": "string",
            "maxLength": 32767
          },
          "data": {},
          "updates": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "sourceType": {
                  "type": "string",
                  "enum": [
                    "flow",
                    "user",
                    "device",
                    "apiToken"
                  ]
                },
                "sourceId": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "creationDate": {
                  "type": "string",
                  "format": "date-time"
                },
                "comment": {
                  "type": "string",
                  "maxLength": 32767
                },
                "data": {},
                "stateChange": {
                  "type": "object",
                  "properties": {
                    "old": {
                      "type": "string",
                      "enum": [
                        "new",
                        "acknowledged",
                        "resolved"
                      ]
                    },
                    "new": {
                      "type": "string",
                      "enum": [
                        "new",
                        "acknowledged",
                        "resolved"
                      ]
                    }
                  }
                }
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "state": {
      "type": "string",
      "enum": [
        "new",
        "acknowledged",
        "resolved"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="events-example"></a>

```json
{
  "items": [
    {
      "id": "575ed0de7ae143cd83dc4aa5",
      "eventId": "575ed0de7ae143cd83dc4aa5",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "sourceType": "user",
      "sourceId": "575ed70c7ae143cd83dc4aa9",
      "level": "info",
      "state": "new",
      "subject": "Power levels critical",
      "message": "Power levels on device 432 have surpassed critical thresholds",
      "updates": []
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "subject",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "state": "new"
}
```

<br/>
## Experience Bootstrap Options

The body of an experience bootstrap request

### Schema <a name="experience-bootstrap-options-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "replaceExisting": {
      "type": "boolean",
      "default": false
    },
    "createUsers": {
      "type": "boolean",
      "default": true
    },
    "createGroups": {
      "type": "boolean",
      "default": true
    },
    "slug": {
      "type": "string",
      "minLength": 4,
      "maxLength": 63,
      "pattern": "^[0-9a-z-]*$"
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="experience-bootstrap-options-example"></a>

```json
{
  "replaceExisting": true
}
```

<br/>
## Experience Bootstrap Result

The result of an experience bootstrap request

### Schema <a name="experience-bootstrap-result-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "resourceSuffix": {
      "type": "string"
    },
    "password": {
      "type": "string"
    },
    "email": {
      "type": "string"
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="experience-bootstrap-result-example"></a>

```json
{
  "homePath": "/",
  "password": "examplePass",
  "email": "example.user@example.com"
}
```

<br/>
## Experience Domain

Schema for a single Experience Domain

### Schema <a name="experience-domain-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "experienceDomainId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "sslCert": {
      "type": "string",
      "maxLength": 32767,
      "minLength": 50
    },
    "sslBundle": {
      "type": "string",
      "maxLength": 32767,
      "minLength": 50
    },
    "domainName": {
      "type": "string",
      "maxLength": 1024,
      "minLength": 3
    },
    "version": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    }
  }
}
```

<small></small>

### Example <a name="experience-domain-example"></a>

```json
{
  "id": "58c1de6c8f812590d8e82980",
  "experienceDomainId": "58c1de6c8f812590d8e82980",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "domainName": "my.example.domain.com",
  "version": "develop"
}
```

<br/>
## Experience Domain Patch

Schema for the body of an Experience Domain modification request

### Schema <a name="experience-domain-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "sslKey": {
      "$oneOf": [
        {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        },
        {
          "type": null
        }
      ]
    },
    "sslCert": {
      "$oneOf": [
        {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        },
        {
          "type": null
        }
      ]
    },
    "sslBundle": {
      "$oneOf": [
        {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        },
        {
          "type": null
        }
      ]
    },
    "version": {
      "$oneOf": [
        {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        },
        {
          "type": null
        }
      ]
    },
    "domainName": {
      "type": "string",
      "maxLength": 1024,
      "minLength": 3
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="experience-domain-patch-example"></a>

```json
{
  "domainName": "my.example.domain.com",
  "sslCert": "MY_SSL_CERTIFICATE",
  "sslKey": "MY_SSL_KEY",
  "version": "develop"
}
```

<br/>
## Experience Domain Post

Schema for the body of an Experience Domain creation request

### Schema <a name="experience-domain-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "sslKey": {
      "type": "string",
      "maxLength": 32767,
      "minLength": 50
    },
    "sslCert": {
      "type": "string",
      "maxLength": 32767,
      "minLength": 50
    },
    "sslBundle": {
      "type": "string",
      "maxLength": 32767,
      "minLength": 50
    },
    "domainName": {
      "type": "string",
      "maxLength": 1024,
      "minLength": 3
    },
    "version": {
      "$oneOf": [
        {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        },
        {
          "type": null
        }
      ]
    }
  },
  "additionalProperties": false,
  "required": [
    "domainName"
  ]
}
```

<small></small>

### Example <a name="experience-domain-post-example"></a>

```json
{
  "domainName": "my.example.domain.com",
  "sslCert": "MY_SSL_CERTIFICATE",
  "sslKey": "MY_SSL_KEY",
  "version": "develop"
}
```

<br/>
## Experience Domains

Schema for a collection of Experience Domains

### Schema <a name="experience-domains-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Experience Domain",
        "description": "Schema for a single Experience Domain",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "experienceDomainId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "sslCert": {
            "type": "string",
            "maxLength": 32767,
            "minLength": 50
          },
          "sslBundle": {
            "type": "string",
            "maxLength": 32767,
            "minLength": 50
          },
          "domainName": {
            "type": "string",
            "maxLength": 1024,
            "minLength": 3
          },
          "version": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="experience-domains-example"></a>

```json
{
  "items": [
    {
      "id": "58c1de6c8f812590d8e82980",
      "experienceDomainId": "58c1de6c8f812590d8e82980",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "domainName": "my.example.domain.com",
      "version": "develop"
    }
  ],
  "count": 1,
  "totalCount": 1,
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Experience Endpoint

Schema for a single Experience Endpoint

### Schema <a name="experience-endpoint-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "experienceEndpointId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "createdById": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "createdByType": {
      "type": "string",
      "enum": [
        "flow",
        "user",
        "apiToken"
      ]
    },
    "lastUpdatedById": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "lastUpdatedByType": {
      "type": "string",
      "enum": [
        "flow",
        "user",
        "apiToken"
      ]
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "route": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "enabled": {
      "type": "boolean"
    },
    "method": {
      "type": "string",
      "enum": [
        "delete",
        "get",
        "options",
        "patch",
        "post",
        "put"
      ]
    },
    "access": {
      "type": "string",
      "enum": [
        "public",
        "authenticated",
        "group"
      ]
    },
    "endpointTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    },
    "staticReply": {
      "oneOf": [
        {
          "type": "object",
          "properties": {
            "value": {
              "type": "string"
            },
            "statusCode": {
              "type": "number",
              "min": 100,
              "max": 599,
              "integer": true
            },
            "type": {
              "type": "string",
              "enum": [
                "page",
                "redirect"
              ]
            }
          },
          "required": [
            "value",
            "type"
          ],
          "additionalProperties": false
        },
        {
          "type": "null"
        }
      ]
    },
    "unauthorizedReply": {
      "oneOf": [
        {
          "type": "object",
          "properties": {
            "value": {
              "type": "string"
            },
            "statusCode": {
              "type": "number",
              "min": 100,
              "max": 599,
              "integer": true
            },
            "type": {
              "type": "string",
              "enum": [
                "page",
                "redirect"
              ]
            }
          },
          "required": [
            "value",
            "type"
          ],
          "additionalProperties": false
        },
        {
          "type": "null"
        }
      ]
    },
    "experienceGroups": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          }
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="experience-endpoint-example"></a>

```json
{
  "id": "58c1de6c8f812590d8e82980",
  "experienceEndpointId": "58c1de6c8f812590d8e82980",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "route": "/my/route/{id}",
  "enabled": true,
  "method": "get",
  "access": "group",
  "experienceGroups": [
    {
      "name": "myGroup",
      "id": "58b9d794cbfafe1be675744f"
    }
  ]
}
```

<br/>
## Experience Endpoint Patch

Schema for the body of an Experience Endpoint modification request

### Schema <a name="experience-endpoint-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "route": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "enabled": {
      "type": "boolean"
    },
    "method": {
      "type": "string",
      "enum": [
        "delete",
        "get",
        "options",
        "patch",
        "post",
        "put"
      ]
    },
    "access": {
      "type": "string",
      "enum": [
        "public",
        "authenticated",
        "group"
      ]
    },
    "endpointTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    },
    "experienceGroupIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "staticReply": {
      "oneOf": [
        {
          "type": "object",
          "properties": {
            "value": {
              "type": "string"
            },
            "statusCode": {
              "type": "number",
              "min": 100,
              "max": 599,
              "integer": true
            },
            "type": {
              "type": "string",
              "enum": [
                "page",
                "redirect"
              ]
            }
          },
          "required": [
            "value",
            "type"
          ],
          "additionalProperties": false
        },
        {
          "type": "null"
        }
      ]
    },
    "unauthorizedReply": {
      "oneOf": [
        {
          "type": "object",
          "properties": {
            "value": {
              "type": "string"
            },
            "statusCode": {
              "type": "number",
              "min": 100,
              "max": 599,
              "integer": true
            },
            "type": {
              "type": "string",
              "enum": [
                "page",
                "redirect"
              ]
            }
          },
          "required": [
            "value",
            "type"
          ],
          "additionalProperties": false
        },
        {
          "type": "null"
        }
      ]
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="experience-endpoint-patch-example"></a>

```json
{
  "access": "group",
  "experienceGroupIds": [
    "58c1de6f8f812590d8e82983"
  ]
}
```

<br/>
## Experience Endpoint Post

Schema for the body of an Experience Endpoint creation request

### Schema <a name="experience-endpoint-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "route": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "enabled": {
      "type": "boolean"
    },
    "method": {
      "type": "string",
      "enum": [
        "delete",
        "get",
        "options",
        "patch",
        "post",
        "put"
      ]
    },
    "access": {
      "type": "string",
      "enum": [
        "public",
        "authenticated",
        "group"
      ]
    },
    "endpointTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    },
    "experienceGroupIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "staticReply": {
      "oneOf": [
        {
          "type": "object",
          "properties": {
            "value": {
              "type": "string"
            },
            "statusCode": {
              "type": "number",
              "min": 100,
              "max": 599,
              "integer": true
            },
            "type": {
              "type": "string",
              "enum": [
                "page",
                "redirect"
              ]
            }
          },
          "required": [
            "value",
            "type"
          ],
          "additionalProperties": false
        },
        {
          "type": "null"
        }
      ]
    },
    "unauthorizedReply": {
      "oneOf": [
        {
          "type": "object",
          "properties": {
            "value": {
              "type": "string"
            },
            "statusCode": {
              "type": "number",
              "min": 100,
              "max": 599,
              "integer": true
            },
            "type": {
              "type": "string",
              "enum": [
                "page",
                "redirect"
              ]
            }
          },
          "required": [
            "value",
            "type"
          ],
          "additionalProperties": false
        },
        {
          "type": "null"
        }
      ]
    }
  },
  "additionalProperties": false,
  "required": [
    "route",
    "method"
  ]
}
```

<small></small>

### Example <a name="experience-endpoint-post-example"></a>

```json
{
  "route": "/my/route/{id}",
  "method": "get",
  "access": "public"
}
```

<br/>
## Experience Endpoint Stats

Schema for stats for an experience&#x27;s endpoints

### Schema <a name="experience-endpoint-stats-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "patternProperties": {
    ".*": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "time": {
            "type": "string",
            "format": "date-time"
          },
          "count": {
            "type": "number"
          }
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="experience-endpoint-stats-example"></a>

```json
{
  "58cae95a0f5fcd000138ed0d": [
    {
      "time": "2017-03-21T20:00:00.000Z",
      "count": 10
    },
    {
      "time": "2017-03-21T21:00:00.000Z",
      "count": 1
    }
  ],
  "NotFound": [
    {
      "time": "2017-03-21T20:00:00.000Z",
      "count": 1
    },
    {
      "time": "2017-03-21T21:00:00.000Z",
      "count": 4
    }
  ]
}
```

<br/>
## Experience Endpoints

Schema for a collection of Experience Endpoints

### Schema <a name="experience-endpoints-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Experience Endpoint",
        "description": "Schema for a single Experience Endpoint",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "experienceEndpointId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "createdById": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "createdByType": {
            "type": "string",
            "enum": [
              "flow",
              "user",
              "apiToken"
            ]
          },
          "lastUpdatedById": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "lastUpdatedByType": {
            "type": "string",
            "enum": [
              "flow",
              "user",
              "apiToken"
            ]
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "route": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "enabled": {
            "type": "boolean"
          },
          "method": {
            "type": "string",
            "enum": [
              "delete",
              "get",
              "options",
              "patch",
              "post",
              "put"
            ]
          },
          "access": {
            "type": "string",
            "enum": [
              "public",
              "authenticated",
              "group"
            ]
          },
          "endpointTags": {
            "type": "object",
            "patternProperties": {
              "^[0-9a-zA-Z_-]{1,255}$": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            },
            "additionalProperties": false
          },
          "staticReply": {
            "oneOf": [
              {
                "type": "object",
                "properties": {
                  "value": {
                    "type": "string"
                  },
                  "statusCode": {
                    "type": "number",
                    "min": 100,
                    "max": 599,
                    "integer": true
                  },
                  "type": {
                    "type": "string",
                    "enum": [
                      "page",
                      "redirect"
                    ]
                  }
                },
                "required": [
                  "value",
                  "type"
                ],
                "additionalProperties": false
              },
              {
                "type": "null"
              }
            ]
          },
          "unauthorizedReply": {
            "oneOf": [
              {
                "type": "object",
                "properties": {
                  "value": {
                    "type": "string"
                  },
                  "statusCode": {
                    "type": "number",
                    "min": 100,
                    "max": 599,
                    "integer": true
                  },
                  "type": {
                    "type": "string",
                    "enum": [
                      "page",
                      "redirect"
                    ]
                  }
                },
                "required": [
                  "value",
                  "type"
                ],
                "additionalProperties": false
              },
              {
                "type": "null"
              }
            ]
          },
          "experienceGroups": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "name": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 255
                },
                "id": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                }
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "experienceGroupId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "notFoundRequestCount": {
      "type": "number"
    }
  }
}
```

<small></small>

### Example <a name="experience-endpoints-example"></a>

```json
{
  "items": [
    {
      "id": "58c1de6c8f812590d8e82980",
      "experienceEndpointId": "58c1de6c8f812590d8e82980",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "route": "/my/route/{id}",
      "enabled": true,
      "method": "get",
      "access": "group",
      "experienceGroups": [
        {
          "name": "myGroup",
          "id": "58b9d794cbfafe1be675744f"
        }
      ]
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Experience Group

Schema for a single Experience Group

### Schema <a name="experience-group-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "experienceGroupId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "experienceUserIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "experienceEndpointIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "groupTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    }
  }
}
```

<small></small>

### Example <a name="experience-group-example"></a>

```json
{
  "id": "58b9d794cbfafe1be675744f",
  "experienceGroupId": "58b9d794cbfafe1be675744f",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Group",
  "experienceUserIds": [
    "58b9d782cbfafe1be675744d",
    "58b9d787cbfafe1be675744e"
  ],
  "experienceEndpointIds": [
    "58b9d743cbfafe1be675744b",
    "58b9d743cbfafe1be675744c"
  ]
}
```

<br/>
## Experience Group Patch

Schema for the body of an Experience Group modification request

### Schema <a name="experience-group-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "experienceUserIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "experienceEndpointIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "groupTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="experience-group-patch-example"></a>

```json
{
  "name": "My New Group Name",
  "experienceUserIds": [
    "575ed70c7ae143cd83dc4aa9",
    "675ed70c7ae143cd83dc4aa9"
  ],
  "experienceEndpointIds": [
    "58b9d743cbfafe1be675744b",
    "58b9d743cbfafe1be675744c"
  ]
}
```

<br/>
## Experience Group Post

Schema for the body of an Experience Group creation request

### Schema <a name="experience-group-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "experienceUserIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "experienceEndpointIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "groupTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```

<small></small>

### Example <a name="experience-group-post-example"></a>

```json
{
  "name": "My Group",
  "experienceUserIds": [
    "575ed70c7ae143cd83dc4aa9",
    "675ed70c7ae143cd83dc4aa9"
  ],
  "experienceEndpointIds": [
    "58b9d743cbfafe1be675744b",
    "58b9d743cbfafe1be675744c"
  ]
}
```

<br/>
## Experience Groups

Schema for a collection of Experience Groups

### Schema <a name="experience-groups-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Experience Group",
        "description": "Schema for a single Experience Group",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "experienceGroupId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "experienceUserIds": {
            "type": "array",
            "items": {
              "type": "string",
              "pattern": "^[A-Fa-f\\d]{24}$"
            },
            "maxItems": 1000
          },
          "experienceEndpointIds": {
            "type": "array",
            "items": {
              "type": "string",
              "pattern": "^[A-Fa-f\\d]{24}$"
            },
            "maxItems": 1000
          },
          "groupTags": {
            "type": "object",
            "patternProperties": {
              "^[0-9a-zA-Z_-]{1,255}$": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            },
            "additionalProperties": false
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="experience-groups-example"></a>

```json
{
  "items": [
    {
      "id": "58b9d794cbfafe1be675744f",
      "experienceGroupId": "58b9d794cbfafe1be675744f",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Group",
      "experienceUserIds": [
        "58b9d782cbfafe1be675744d",
        "58b9d787cbfafe1be675744e"
      ],
      "experienceEndpointIds": [
        "58b9d743cbfafe1be675744b",
        "58b9d743cbfafe1be675744c"
      ]
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Experience Slug

Schema for a single Experience Slug

### Schema <a name="experience-slug-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "experienceSlugId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "slug": {
      "type": "string",
      "minLength": 4,
      "maxLength": 63,
      "pattern": "^[0-9a-z-]*$"
    },
    "version": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    }
  }
}
```

<small></small>

### Example <a name="experience-slug-example"></a>

```json
{
  "id": "5b995e51ea9994b50d745284",
  "experienceSlugId": "5b995e51ea9994b50d745284",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "slug": "my-custom-slug",
  "version": "develop"
}
```

<br/>
## Experience Slug Patch

Schema for the body of an Experience Slug modification request

### Schema <a name="experience-slug-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "version": {
      "$oneOf": [
        {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        },
        {
          "type": null
        }
      ]
    },
    "slug": {
      "type": "string",
      "minLength": 4,
      "maxLength": 63,
      "pattern": "^[0-9a-z-]*$"
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="experience-slug-patch-example"></a>

```json
{
  "slug": "my-new-slug",
  "version": null
}
```

<br/>
## Experience Slug Post

Schema for the body of an Experience Slug creation request

### Schema <a name="experience-slug-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "version": {
      "$oneOf": [
        {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        },
        {
          "type": null
        }
      ]
    },
    "slug": {
      "type": "string",
      "minLength": 4,
      "maxLength": 63,
      "pattern": "^[0-9a-z-]*$"
    }
  },
  "additionalProperties": false,
  "required": [
    "slug"
  ]
}
```

<small></small>

### Example <a name="experience-slug-post-example"></a>

```json
{
  "slug": "my-custom-slug",
  "version": "develop"
}
```

<br/>
## Experience Slugs

Schema for a collection of Experience Slugs

### Schema <a name="experience-slugs-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Experience Slug",
        "description": "Schema for a single Experience Slug",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "experienceSlugId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "slug": {
            "type": "string",
            "minLength": 4,
            "maxLength": 63,
            "pattern": "^[0-9a-z-]*$"
          },
          "version": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="experience-slugs-example"></a>

```json
{
  "items": [
    {
      "id": "5b995e51ea9994b50d745284",
      "experienceSlugId": "5b995e51ea9994b50d745284",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "slug": "my-custom-slug",
      "version": "develop"
    }
  ],
  "count": 1,
  "totalCount": 1,
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Experience User

Schema for a single Experience User

### Schema <a name="experience-user-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "experienceUserId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "passwordLastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "lastLogin": {
      "type": "string",
      "format": "date-time"
    },
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "maxLength": 1024
    },
    "avatarUrl": {
      "type": "string",
      "format": "url"
    },
    "tokenCutoff": {
      "type": "string",
      "format": "date-time"
    },
    "userTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    },
    "experienceGroups": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          }
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="experience-user-example"></a>

```json
{
  "id": "58b9d782cbfafe1be675744d",
  "experienceUserId": "58b9d782cbfafe1be675744d",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "passwordLastUpdated": "2016-06-13T04:00:00.000Z",
  "lastLogin": "2016-06-13T04:00:00.000Z",
  "email": "example@experienceuser.com",
  "firstName": "Example",
  "lastName": "Name",
  "avatarUrl": "https://example.avatar.url/is_here.png",
  "userTags": {
    "customKey": "customValue"
  }
}
```

<br/>
## Experience User Patch

Schema for the body of an Experience User modification request

### Schema <a name="experience-user-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "maxLength": 1024
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048
    },
    "tokenCutoff": {
      "type": "string",
      "format": "date-time"
    },
    "userTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    },
    "experienceGroupIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="experience-user-patch-example"></a>

```json
{
  "password": "aNewPassword",
  "userTags": {
    "customKey": "newCustomValue"
  }
}
```

<br/>
## Experience User Post

Schema for the body of an Experience User creation request

### Schema <a name="experience-user-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "maxLength": 1024
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048
    },
    "tokenCutoff": {
      "type": "string",
      "format": "date-time"
    },
    "userTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    },
    "experienceGroupIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    }
  },
  "additionalProperties": false,
  "required": [
    "email",
    "password"
  ]
}
```

<small></small>

### Example <a name="experience-user-post-example"></a>

```json
{
  "email": "example@experienceuser.com",
  "firstName": "Example",
  "lastName": "Name",
  "password": "aUserPassword",
  "userTags": {
    "customKey": "customValue"
  }
}
```

<br/>
## Experience Users

Schema for a collection of Experience Users

### Schema <a name="experience-users-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Experience User",
        "description": "Schema for a single Experience User",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "experienceUserId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "passwordLastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "lastLogin": {
            "type": "string",
            "format": "date-time"
          },
          "email": {
            "type": "string",
            "format": "email",
            "maxLength": 1024
          },
          "firstName": {
            "type": "string",
            "maxLength": 1024
          },
          "lastName": {
            "type": "string",
            "maxLength": 1024
          },
          "avatarUrl": {
            "type": "string",
            "format": "url"
          },
          "tokenCutoff": {
            "type": "string",
            "format": "date-time"
          },
          "userTags": {
            "type": "object",
            "patternProperties": {
              "^[0-9a-zA-Z_-]{1,255}$": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            },
            "additionalProperties": false
          },
          "experienceGroups": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "name": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 255
                },
                "id": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                }
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "experienceGroupId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="experience-users-example"></a>

```json
{
  "items": [
    {
      "id": "58b9d782cbfafe1be675744d",
      "experienceUserId": "58b9d782cbfafe1be675744d",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "passwordLastUpdated": "2016-06-13T04:00:00.000Z",
      "lastLogin": "2016-06-13T04:00:00.000Z",
      "email": "example@experienceuser.com",
      "firstName": "Example",
      "lastName": "Name",
      "avatarUrl": "https://example.avatar.url/is_here.png",
      "userTags": {
        "customKey": "customValue"
      }
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Experience Version

Schema for a single Experience Version

### Schema <a name="experience-version-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "experienceVersionId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "createdById": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "createdByType": {
      "type": "string",
      "enum": [
        "flow",
        "user",
        "apiToken"
      ]
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "endpointDefaultCors": {
      "type": "boolean"
    },
    "version": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "attachedDomains": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "domainName": {
            "type": "string",
            "maxLength": 1024,
            "minLength": 3
          },
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          }
        }
      }
    },
    "attachedSlugs": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "slug": {
            "type": "string"
          },
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          }
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="experience-version-example"></a>

```json
{
  "id": "5b995ec6ea9994b50d745285",
  "experienceVersionId": "5b995ec6ea9994b50d745285",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "version": "myVersionName",
  "endpointDefaultCors": true,
  "attachedDomains": [
    {
      "id": "58c1de6c8f812590d8e82980",
      "domainName": "my.example.domain.com"
    }
  ],
  "attachedSlugs": [
    {
      "id": "5b995e51ea9994b50d745284",
      "slug": "my-custom-slug"
    }
  ]
}
```

<br/>
## Experience Version Patch

Schema for the body of an Experience Version modification request

### Schema <a name="experience-version-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "endpointDefaultCors": {
      "type": "boolean"
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "sourceVersionIdOrName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="experience-version-patch-example"></a>

```json
{
  "endpointDefaultCors": false
}
```

<br/>
## Experience Version Post

Schema for the body of an Experience Version creation request

### Schema <a name="experience-version-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "version": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "domainIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "slugIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    }
  },
  "additionalProperties": false,
  "required": [
    "version"
  ]
}
```

<small></small>

### Example <a name="experience-version-post-example"></a>

```json
{
  "version": "myNewVersion",
  "description": "my version description",
  "domainIds": [
    "58c1de6c8f812590d8e82980"
  ],
  "slugIds": [
    "5b995e51ea9994b50d745284"
  ]
}
```

<br/>
## Experience Versions

Schema for a collection of Experience Versions

### Schema <a name="experience-versions-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Experience Version",
        "description": "Schema for a single Experience Version",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "experienceVersionId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "createdById": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "createdByType": {
            "type": "string",
            "enum": [
              "flow",
              "user",
              "apiToken"
            ]
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "endpointDefaultCors": {
            "type": "boolean"
          },
          "version": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "attachedDomains": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "domainName": {
                  "type": "string",
                  "maxLength": 1024,
                  "minLength": 3
                },
                "id": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                }
              }
            }
          },
          "attachedSlugs": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "slug": {
                  "type": "string"
                },
                "id": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                }
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="experience-versions-example"></a>

```json
{
  "items": [
    {
      "id": "5b995ec6ea9994b50d745285",
      "experienceVersionId": "5b995ec6ea9994b50d745285",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "version": "myVersionName",
      "endpointDefaultCors": true,
      "attachedDomains": [
        {
          "id": "58c1de6c8f812590d8e82980",
          "domainName": "my.example.domain.com"
        }
      ],
      "attachedSlugs": [
        {
          "id": "5b995e51ea9994b50d745284",
          "slug": "my-custom-slug"
        }
      ]
    }
  ],
  "count": 1,
  "totalCount": 1,
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Experience View

Schema for a single Experience View

### Schema <a name="experience-view-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "experienceViewId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "createdById": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "createdByType": {
      "type": "string",
      "enum": [
        "flow",
        "user",
        "apiToken"
      ]
    },
    "lastUpdatedById": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "lastUpdatedByType": {
      "type": "string",
      "enum": [
        "flow",
        "user",
        "apiToken"
      ]
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "viewType": {
      "type": "string",
      "enum": [
        "layout",
        "page",
        "component"
      ]
    },
    "layoutId": {
      "type": [
        "string",
        "null"
      ],
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "layoutName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "body": {
      "type": "string",
      "maxLength": 131072,
      "minLength": 1
    },
    "viewTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    }
  }
}
```

<small></small>

### Example <a name="experience-view-example"></a>

```json
{
  "id": "59cc5c628246c6caed4b16c1",
  "experienceViewId": "59cc5c628246c6caed4b16c1",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Page View",
  "viewType": "page",
  "body": "<p>{{data}}</p>",
  "layoutId": "59cc5cad8246c6caed4b16c2",
  "viewTags": {
    "customKey": "customValue"
  }
}
```

<br/>
## Experience View Patch

Schema for the body of an Experience View modification request

### Schema <a name="experience-view-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "layoutId": {
      "type": [
        "string",
        "null"
      ],
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "body": {
      "type": "string",
      "maxLength": 131072,
      "minLength": 1
    },
    "viewTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="experience-view-patch-example"></a>

```json
{
  "body": "New Content! <p>{{newData}}</p>",
  "viewTags": {
    "customKey": "newCustomValue"
  }
}
```

<br/>
## Experience View Post

Schema for the body of an Experience View creation request

### Schema <a name="experience-view-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "viewType": {
      "type": "string",
      "enum": [
        "layout",
        "page",
        "component"
      ]
    },
    "layoutId": {
      "type": [
        "string",
        "null"
      ],
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "body": {
      "type": "string",
      "maxLength": 131072,
      "minLength": 1
    },
    "viewTags": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        }
      },
      "additionalProperties": false
    }
  },
  "additionalProperties": false,
  "required": [
    "name",
    "viewType",
    "body"
  ]
}
```

<small></small>

### Example <a name="experience-view-post-example"></a>

```json
{
  "name": "My Page View",
  "viewType": "page",
  "body": "<p>{{data}}</p>",
  "layoutId": "59cc5cad8246c6caed4b16c2",
  "viewTags": {
    "customKey": "customValue"
  }
}
```

<br/>
## Experience Views

Schema for a collection of Experience Views

### Schema <a name="experience-views-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Experience View",
        "description": "Schema for a single Experience View",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "experienceViewId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "createdById": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "createdByType": {
            "type": "string",
            "enum": [
              "flow",
              "user",
              "apiToken"
            ]
          },
          "lastUpdatedById": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "lastUpdatedByType": {
            "type": "string",
            "enum": [
              "flow",
              "user",
              "apiToken"
            ]
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "viewType": {
            "type": "string",
            "enum": [
              "layout",
              "page",
              "component"
            ]
          },
          "layoutId": {
            "type": [
              "string",
              "null"
            ],
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "layoutName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "body": {
            "type": "string",
            "maxLength": 131072,
            "minLength": 1
          },
          "viewTags": {
            "type": "object",
            "patternProperties": {
              "^[0-9a-zA-Z_-]{1,255}$": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            },
            "additionalProperties": false
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "viewType": {
      "type": "string",
      "enum": [
        "layout",
        "page",
        "component"
      ]
    }
  }
}
```

<small></small>

### Example <a name="experience-views-example"></a>

```json
{
  "items": [
    {
      "id": "59cc5c628246c6caed4b16c1",
      "experienceViewId": "59cc5c628246c6caed4b16c1",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Page View",
      "viewType": "page",
      "body": "<p>{{data}}</p>",
      "layoutId": "59cc5cad8246c6caed4b16c2",
      "viewTags": {
        "customKey": "customValue"
      }
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## File Schema

Schema for a single file

### Schema <a name="file-schema-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "authorId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "authorType": {
      "type": "string",
      "enum": [
        "flow",
        "user",
        "device",
        "apiToken"
      ]
    },
    "status": {
      "type": "string",
      "enum": [
        "pending",
        "moving",
        "deleting",
        "completed"
      ]
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "parentDirectory": {
      "type": "string",
      "maxLength": 1024
    },
    "type": {
      "type": "string",
      "enum": [
        "file",
        "directory"
      ]
    },
    "fileSize": {
      "type": "number"
    },
    "s3etag": {
      "type": "string"
    },
    "contentType": {
      "type": "string",
      "maxLength": 1024
    },
    "fileDimensions": {
      "type": "object",
      "properties": {
        "width": {
          "type": "number"
        },
        "height": {
          "type": "number"
        }
      }
    },
    "moveIntoId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "url": {
      "type": "string"
    }
  }
}
```

<small></small>

### Example <a name="file-schema-example"></a>

```json
{
  "id": "575ec8687ae143cd83dc4a97",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "authorId": "575ed70c7ae143cd83dc4aa9",
  "authorType": "user",
  "status": "pending",
  "name": "file.csv",
  "type": "file",
  "parentDirectory": "/",
  "fileSize": 500,
  "contentType": "text/csv"
}
```

<br/>
## File Patch

Schema to patch a file

### Schema <a name="file-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "fileSize": {
      "type": "number"
    },
    "contentType": {
      "type": "string",
      "maxLength": 1024
    },
    "fileDimensions": {
      "type": "object",
      "properties": {
        "width": {
          "type": "number"
        },
        "height": {
          "type": "number"
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="file-patch-example"></a>

```json
{
  "fileSize": 500,
  "contentType": "image",
  "fileDimensions": {
    "width": 200,
    "height": 200
  }
}
```

<br/>
## File Post

Schema to create a single file or directory

### Schema <a name="file-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "parentDirectory": {
      "type": "string",
      "maxLength": 1024
    },
    "type": {
      "type": "string",
      "enum": [
        "file",
        "directory"
      ]
    },
    "fileSize": {
      "type": "number"
    },
    "contentType": {
      "type": "string",
      "maxLength": 1024
    },
    "fileDimensions": {
      "type": "object",
      "properties": {
        "width": {
          "type": "number"
        },
        "height": {
          "type": "number"
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="file-post-example"></a>

```json
{
  "name": "file.csv",
  "type": "file",
  "parentDirectory": "/",
  "fileSize": 500,
  "contentType": "text/csv"
}
```

<br/>
## File Post Response

Schema to upload the file to s3

### Schema <a name="file-post-response-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "authorId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "authorType": {
      "type": "string",
      "enum": [
        "flow",
        "user",
        "device",
        "apiToken"
      ]
    },
    "status": {
      "type": "string",
      "enum": [
        "pending",
        "moving",
        "deleting",
        "completed"
      ]
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "parentDirectory": {
      "type": "string",
      "maxLength": 1024
    },
    "type": {
      "type": "string",
      "enum": [
        "file",
        "directory"
      ]
    },
    "fileSize": {
      "type": "number"
    },
    "contentType": {
      "type": "string",
      "maxLength": 1024
    },
    "fileDimensions": {
      "type": "object",
      "properties": {
        "width": {
          "type": "number"
        },
        "height": {
          "type": "number"
        }
      }
    },
    "upload": {
      "url": {
        "type": "string"
      },
      "fields": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string"
          },
          "bucket": {
            "type": "string"
          },
          "X-Amz-Algorithm": {
            "type": "string"
          },
          "X-Amz-Credential": {
            "type": "string"
          },
          "X-Amz-Date": {
            "type": "string"
          },
          "Policy": {
            "type": "string"
          },
          "X-Amz-Signature": {
            "type": "string"
          }
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="file-post-response-example"></a>

```json
{
  "id": "575ec8687ae143cd83dc4a97",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "authorId": "575ed70c7ae143cd83dc4aa9",
  "authorType": "user",
  "status": "pending",
  "name": "file.csv",
  "type": "file",
  "parentDirectory": "/",
  "fileSize": 500,
  "contentType": "text/csv",
  "upload": {
    "url": "https://s3.us-west-1.amazonaws.com/a-bucket-on-amazon",
    "fields": {
      "key": "5630dcbe1035c9d0011/file.js",
      "bucket": "a-bucket-on-amazon",
      "X-Amz-Algorithm": "AWS4-HMAC-SHA256",
      "X-Amz-Credential": "AKIAJPGQGBQX4PYM6FXA/20180416/us-west-1/s3/aws4_request",
      "X-Amz-Date": "20180416T142402Z",
      "Policy": "wMloiLCJjb25kaXRpb25zIjpbeyJrZXkiOiI1NjMwZGNiZTEwM2Y4ZTQ4NWM5ZDAwMTEvZmlsZS5qcyJ9LHsiYnVja2V0IjoibG9zYW50LWZpbGVzIn0seyJYLUFtei1BbGdvcml0aG0iOiJBV1M0LUhNQUMtU0hBMjU2In0seyJYLUFtei1DcmVkZW50aWFsIjoiQUtJQUpQR1FHQlFYNFBZTTZGWEEvMjAxODA0MTYvdXMtd2VzdC0xL3MzL2F3czRfcmVxdWVzdCJ9LHsiWC1BbXotRGF0ZSI6IjIwMTgwNDE2VDE0MjQwMloifV19",
      "X-Amz-Signature": "a4a411df572c43b4427ff08ef51763bc2d834fa399c3688f347d936370"
    }
  }
}
```

<br/>
## Files Schema

Schema for a collection of files

### Schema <a name="files-schema-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "File Schema",
        "description": "Schema for a single file",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "authorId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "authorType": {
            "type": "string",
            "enum": [
              "flow",
              "user",
              "device",
              "apiToken"
            ]
          },
          "status": {
            "type": "string",
            "enum": [
              "pending",
              "moving",
              "deleting",
              "completed"
            ]
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "parentDirectory": {
            "type": "string",
            "maxLength": 1024
          },
          "type": {
            "type": "string",
            "enum": [
              "file",
              "directory"
            ]
          },
          "fileSize": {
            "type": "number"
          },
          "s3etag": {
            "type": "string"
          },
          "contentType": {
            "type": "string",
            "maxLength": 1024
          },
          "fileDimensions": {
            "type": "object",
            "properties": {
              "width": {
                "type": "number"
              },
              "height": {
                "type": "number"
              }
            }
          },
          "moveIntoId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "url": {
            "type": "string"
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    }
  }
}
```

<small></small>

### Example <a name="files-schema-example"></a>

```json
{
  "items": [
    {
      "id": "575ec8687ae143cd83dc4a97",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "authorId": "575ed70c7ae143cd83dc4aa9",
      "authorType": "user",
      "status": "pending",
      "name": "file.csv",
      "type": "file",
      "parentDirectory": "/",
      "fileSize": 500,
      "contentType": "text/csv"
    },
    {
      "id": "575ec8687ae143cd83dc4a96",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "authorId": "575ed70c7ae143cd83dc4aa9",
      "authorType": "user",
      "status": "completed",
      "name": "b",
      "type": "directory",
      "parentDirectory": "/a/",
      "fileSize": 500,
      "contentType": "text/csv"
    }
  ],
  "count": 2
}
```

<br/>
## Workflow

Schema for a single Workflow

### Schema <a name="workflow-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "flowId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "iconData": {
      "type": "string",
      "maxLength": 32767,
      "pattern": "^data:image/(jpg|jpeg|png|svg\\+xml);base64,[0-9a-zA-Z+/=]*$"
    },
    "enabled": {
      "type": "boolean"
    },
    "defaultVersionId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "minimumAgentVersion": {
      "type": "string",
      "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
    },
    "flowClass": {
      "type": "string",
      "enum": [
        "cloud",
        "edge",
        "experience",
        "customNode"
      ]
    },
    "triggers": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "maxLength": 1024
          },
          "type": {
            "type": "string",
            "enum": [
              "dataTable",
              "deviceCommand",
              "deviceId",
              "deviceIdConnect",
              "deviceIdDisconnect",
              "deviceIdInactivity",
              "deviceTag",
              "deviceTagConnect",
              "deviceTagDisconnect",
              "deviceTagInactivity",
              "endpoint",
              "event",
              "fileWatch",
              "integration",
              "mqttTopic",
              "request",
              "customNodeStart",
              "timer",
              "udp",
              "virtualButton",
              "webhook"
            ]
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string",
                "maxLength": 255
              },
              "maxItems": 100
            },
            "maxItems": 100
          }
        },
        "additionalProperties": false,
        "required": [
          "type"
        ]
      }
    },
    "nodes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "maxLength": 1024
          },
          "type": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string",
                "maxLength": 255
              },
              "maxItems": 100
            },
            "maxItems": 100
          }
        },
        "additionalProperties": false,
        "required": [
          "type"
        ]
      }
    },
    "customNodeConfig": {
      "type": "object",
      "properties": {
        "outputCount": {
          "type": "number",
          "enum": [
            1,
            2
          ]
        },
        "resultMode": {
          "type": "string",
          "enum": [
            "optional",
            "required",
            "none"
          ]
        },
        "resultDescription": {
          "type": "string",
          "maxLength": 32767
        },
        "fields": {
          "type": "array",
          "maxItems": 100,
          "items": {
            "oneOf": [
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "checkbox"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "select"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "options": {
                    "type": "array",
                    "minItems": 1,
                    "maxItems": 100,
                    "items": {
                      "type": "object",
                      "properties": {
                        "label": {
                          "type": "string",
                          "maxLength": 1024
                        },
                        "value": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "value"
                      ]
                    }
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label",
                  "defaultValue",
                  "options"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "stringTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "maxLength": 1024
                  },
                  "required": {
                    "type": "boolean"
                  },
                  "validRegExp": {
                    "type": "string",
                    "maxLength": 1024
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "numberTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "number"
                  },
                  "required": {
                    "type": "boolean"
                  },
                  "validMin": {
                    "type": "number"
                  },
                  "validMax": {
                    "type": "number"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "jsonTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "required": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "payloadPath"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "required": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "section"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              }
            ]
          }
        }
      },
      "additionalProperties": false,
      "required": [
        "outputCount",
        "resultMode",
        "fields"
      ]
    },
    "customNodeSupports": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": [
          "cloud"
        ]
      }
    },
    "customNodeUseCount": {
      "type": "number"
    },
    "globals": {
      "type": "array",
      "maxItems": 100,
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "json": {
            "type": "string",
            "minLength": 1,
            "maxLength": 32767
          }
        },
        "additionalProperties": false,
        "required": [
          "key",
          "json"
        ]
      }
    },
    "deletedInDevelop": {
      "type": "boolean"
    },
    "stats": {
      "type": "object",
      "properties": {
        "runCount": {
          "type": "number"
        },
        "errorCount": {
          "type": "number"
        },
        "byVersion": {
          "type": "object",
          "patternProperties": {
            ".*": {
              "type": "object",
              "properties": {
                "runCount": {
                  "type": "number"
                },
                "errorCount": {
                  "type": "number"
                }
              }
            }
          }
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="workflow-example"></a>

```json
{
  "id": "575ed18f7ae143cd83dc4aa6",
  "flowId": "575ed18f7ae143cd83dc4aa6",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Workflow",
  "description": "Description of my empty workflow",
  "enabled": true,
  "triggers": [],
  "nodes": [],
  "globals": [],
  "stats": {
    "runCount": 0,
    "errorCount": 0
  }
}
```

<br/>
## Workflow Log

Log of aggregated workflow run information

### Schema <a name="workflow-log-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "flowVersionId": {
        "type": "string"
      },
      "time": {
        "type": "string",
        "format": "date-time"
      },
      "pathsFailed": {
        "type": "number"
      },
      "pathsCompleted": {
        "type": "number"
      },
      "runCount": {
        "type": "number"
      },
      "wallTime": {
        "type": "number"
      },
      "errors": {
        "type": "array",
        "items": {}
      }
    }
  }
}
```

<small></small>

### Example <a name="workflow-log-example"></a>

```json
[
  {
    "flowVersionId": "develop",
    "time": "2016-06-03T00:56:22.447Z",
    "pathsFailed": 0,
    "pathsCompleted": 1,
    "runCount": 1,
    "wallTime": 450,
    "errors": []
  },
  {
    "flowVersionId": "develop",
    "time": "2016-06-03T00:56:22.447Z",
    "pathsFailed": 0,
    "pathsCompleted": 1,
    "runCount": 3,
    "wallTime": 152,
    "errors": []
  }
]
```

<br/>
## Workflow Patch

Schema for the body of a Workflow modification request

### Schema <a name="workflow-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "iconData": {
      "oneOf": [
        {
          "type": "string",
          "maxLength": 32767,
          "pattern": "^data:image/(jpg|jpeg|png|svg\\+xml);base64,[0-9a-zA-Z+/=]*$"
        },
        {
          "type": "null"
        }
      ]
    },
    "enabled": {
      "type": "boolean"
    },
    "defaultVersionId": {
      "oneOf": [
        {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        {
          "type": "null"
        }
      ]
    },
    "triggers": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "maxLength": 1024
          },
          "type": {
            "type": "string",
            "enum": [
              "dataTable",
              "deviceCommand",
              "deviceId",
              "deviceIdConnect",
              "deviceIdDisconnect",
              "deviceIdInactivity",
              "deviceTag",
              "deviceTagConnect",
              "deviceTagDisconnect",
              "deviceTagInactivity",
              "endpoint",
              "event",
              "fileWatch",
              "integration",
              "mqttTopic",
              "request",
              "customNodeStart",
              "timer",
              "udp",
              "virtualButton",
              "webhook"
            ]
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string",
                "maxLength": 255
              },
              "maxItems": 100
            },
            "maxItems": 100
          }
        },
        "additionalProperties": false,
        "required": [
          "type"
        ]
      }
    },
    "nodes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "maxLength": 1024
          },
          "type": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string",
                "maxLength": 255
              },
              "maxItems": 100
            },
            "maxItems": 100
          }
        },
        "additionalProperties": false,
        "required": [
          "type"
        ]
      }
    },
    "globals": {
      "type": "array",
      "maxItems": 100,
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "json": {
            "type": "string",
            "minLength": 1,
            "maxLength": 32767
          }
        },
        "additionalProperties": false,
        "required": [
          "key",
          "json"
        ]
      }
    },
    "minimumAgentVersion": {
      "type": "string",
      "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
    },
    "customNodeConfig": {
      "type": "object",
      "properties": {
        "outputCount": {
          "type": "number",
          "enum": [
            1,
            2
          ]
        },
        "resultMode": {
          "type": "string",
          "enum": [
            "optional",
            "required",
            "none"
          ]
        },
        "resultDescription": {
          "type": "string",
          "maxLength": 32767
        },
        "fields": {
          "type": "array",
          "maxItems": 100,
          "items": {
            "oneOf": [
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "checkbox"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "select"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "options": {
                    "type": "array",
                    "minItems": 1,
                    "maxItems": 100,
                    "items": {
                      "type": "object",
                      "properties": {
                        "label": {
                          "type": "string",
                          "maxLength": 1024
                        },
                        "value": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "value"
                      ]
                    }
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label",
                  "defaultValue",
                  "options"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "stringTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "maxLength": 1024
                  },
                  "required": {
                    "type": "boolean"
                  },
                  "validRegExp": {
                    "type": "string",
                    "maxLength": 1024
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "numberTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "number"
                  },
                  "required": {
                    "type": "boolean"
                  },
                  "validMin": {
                    "type": "number"
                  },
                  "validMax": {
                    "type": "number"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "jsonTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "required": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "payloadPath"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "required": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "section"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              }
            ]
          }
        }
      },
      "additionalProperties": false,
      "required": [
        "outputCount",
        "resultMode",
        "fields"
      ]
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="workflow-patch-example"></a>

```json
{
  "name": "My Updated Workflow",
  "description": "Description of my updated workflow",
  "enabled": false
}
```

<br/>
## Workflow Post

Schema for the body of a Workflow creation request

### Schema <a name="workflow-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "iconData": {
      "oneOf": [
        {
          "type": "string",
          "maxLength": 32767,
          "pattern": "^data:image/(jpg|jpeg|png|svg\\+xml);base64,[0-9a-zA-Z+/=]*$"
        },
        {
          "type": "null"
        }
      ]
    },
    "enabled": {
      "type": "boolean"
    },
    "triggers": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "maxLength": 1024
          },
          "type": {
            "type": "string",
            "enum": [
              "dataTable",
              "deviceCommand",
              "deviceId",
              "deviceIdConnect",
              "deviceIdDisconnect",
              "deviceIdInactivity",
              "deviceTag",
              "deviceTagConnect",
              "deviceTagDisconnect",
              "deviceTagInactivity",
              "endpoint",
              "event",
              "fileWatch",
              "integration",
              "mqttTopic",
              "request",
              "customNodeStart",
              "timer",
              "udp",
              "virtualButton",
              "webhook"
            ]
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string",
                "maxLength": 255
              },
              "maxItems": 100
            },
            "maxItems": 100
          }
        },
        "additionalProperties": false,
        "required": [
          "type"
        ]
      }
    },
    "nodes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "maxLength": 1024
          },
          "type": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string",
                "maxLength": 255
              },
              "maxItems": 100
            },
            "maxItems": 100
          }
        },
        "additionalProperties": false,
        "required": [
          "type"
        ]
      }
    },
    "globals": {
      "type": "array",
      "maxItems": 100,
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "json": {
            "type": "string",
            "minLength": 1,
            "maxLength": 32767
          }
        },
        "additionalProperties": false,
        "required": [
          "key",
          "json"
        ]
      }
    },
    "flowClass": {
      "type": "string",
      "enum": [
        "cloud",
        "edge",
        "experience",
        "customNode"
      ]
    },
    "minimumAgentVersion": {
      "type": "string",
      "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
    },
    "customNodeConfig": {
      "type": "object",
      "properties": {
        "outputCount": {
          "type": "number",
          "enum": [
            1,
            2
          ]
        },
        "resultMode": {
          "type": "string",
          "enum": [
            "optional",
            "required",
            "none"
          ]
        },
        "resultDescription": {
          "type": "string",
          "maxLength": 32767
        },
        "fields": {
          "type": "array",
          "maxItems": 100,
          "items": {
            "oneOf": [
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "checkbox"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "select"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "options": {
                    "type": "array",
                    "minItems": 1,
                    "maxItems": 100,
                    "items": {
                      "type": "object",
                      "properties": {
                        "label": {
                          "type": "string",
                          "maxLength": 1024
                        },
                        "value": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "value"
                      ]
                    }
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label",
                  "defaultValue",
                  "options"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "stringTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "maxLength": 1024
                  },
                  "required": {
                    "type": "boolean"
                  },
                  "validRegExp": {
                    "type": "string",
                    "maxLength": 1024
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "numberTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "number"
                  },
                  "required": {
                    "type": "boolean"
                  },
                  "validMin": {
                    "type": "number"
                  },
                  "validMax": {
                    "type": "number"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "jsonTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "required": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "payloadPath"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "required": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "section"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              }
            ]
          }
        }
      },
      "additionalProperties": false,
      "required": [
        "outputCount",
        "resultMode",
        "fields"
      ]
    },
    "customNodeSupports": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": [
          "cloud"
        ]
      }
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```

<small></small>

### Example <a name="workflow-post-example"></a>

```json
{
  "name": "My New Workflow",
  "description": "Description of my new workflow"
}
```

<br/>
## Workflow Storage Entries

Set of persistent workflow storage values

### Schema <a name="workflow-storage-entries-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "patternProperties": {
    "^.{1,255}$": {}
  }
}
```

<small></small>

### Example <a name="workflow-storage-entries-example"></a>

```json
{
  "myStorageKey": "hello",
  "other key": [
    13,
    21,
    34
  ]
}
```

<br/>
## Workflow Storage Entry

Schema for the body of a request to set a Workflow storage entry

### Schema <a name="workflow-storage-entry-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "key": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "value": {}
  },
  "additionalProperties": false,
  "required": [
    "key"
  ]
}
```

<small></small>

### Example <a name="workflow-storage-entry-example"></a>

```json
{
  "key": "myStorageKey",
  "value": 12
}
```

<br/>
## Workflow Trigger Filter

Array of triggers for filtering workflows. Trigger keys and trigger types are optional.

### Schema <a name="workflow-trigger-filter-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "key": {
        "type": "string",
        "maxLength": 1024
      },
      "type": {
        "type": "string",
        "maxLength": 1024
      }
    },
    "additionalProperties": false
  },
  "maxItems": 100
}
```

<small></small>

### Example <a name="workflow-trigger-filter-example"></a>

```json
[
  {
    "type": "webhook",
    "key": "575ed78e7ae143cd83dc4aab"
  }
]
```

<br/>
## Workflow Version

Schema for a single Workflow Version

### Schema <a name="workflow-version-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "oneOf": [
    {
      "description": "Schema for a single Cloud/Edge/Custom Node Workflow Version",
      "type": "object",
      "properties": {
        "id": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "flowVersionId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "flowId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "applicationId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "creationDate": {
          "type": "string",
          "format": "date-time"
        },
        "lastUpdated": {
          "type": "string",
          "format": "date-time"
        },
        "version": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        },
        "notes": {
          "type": "string",
          "maxLength": 32767
        },
        "enabled": {
          "type": "boolean"
        },
        "triggers": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "key": {
                "type": "string",
                "maxLength": 1024
              },
              "type": {
                "type": "string",
                "enum": [
                  "dataTable",
                  "deviceCommand",
                  "deviceId",
                  "deviceIdConnect",
                  "deviceIdDisconnect",
                  "deviceIdInactivity",
                  "deviceTag",
                  "deviceTagConnect",
                  "deviceTagDisconnect",
                  "deviceTagInactivity",
                  "endpoint",
                  "event",
                  "fileWatch",
                  "integration",
                  "mqttTopic",
                  "request",
                  "customNodeStart",
                  "timer",
                  "udp",
                  "virtualButton",
                  "webhook"
                ]
              },
              "config": {
                "type": "object"
              },
              "meta": {
                "type": "object"
              },
              "outputIds": {
                "type": "array",
                "items": {
                  "type": "array",
                  "items": {
                    "type": "string",
                    "maxLength": 255
                  },
                  "maxItems": 100
                },
                "maxItems": 100
              }
            },
            "additionalProperties": false,
            "required": [
              "type"
            ]
          }
        },
        "nodes": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "maxLength": 1024
              },
              "type": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "config": {
                "type": "object"
              },
              "meta": {
                "type": "object"
              },
              "outputIds": {
                "type": "array",
                "items": {
                  "type": "array",
                  "items": {
                    "type": "string",
                    "maxLength": 255
                  },
                  "maxItems": 100
                },
                "maxItems": 100
              }
            },
            "additionalProperties": false,
            "required": [
              "type"
            ]
          }
        },
        "globals": {
          "type": "array",
          "maxItems": 100,
          "items": {
            "type": "object",
            "properties": {
              "key": {
                "type": "string",
                "pattern": "^[0-9a-zA-Z_-]{1,255}$"
              },
              "json": {
                "type": "string",
                "minLength": 1,
                "maxLength": 32767
              }
            },
            "additionalProperties": false,
            "required": [
              "key",
              "json"
            ]
          }
        },
        "minimumAgentVersion": {
          "type": "string",
          "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
        },
        "customNodeConfig": {
          "type": "object",
          "properties": {
            "outputCount": {
              "type": "number",
              "enum": [
                1,
                2
              ]
            },
            "resultMode": {
              "type": "string",
              "enum": [
                "optional",
                "required",
                "none"
              ]
            },
            "resultDescription": {
              "type": "string",
              "maxLength": 32767
            },
            "fields": {
              "type": "array",
              "maxItems": 100,
              "items": {
                "oneOf": [
                  {
                    "type": "object",
                    "properties": {
                      "type": {
                        "type": "string",
                        "enum": [
                          "checkbox"
                        ]
                      },
                      "label": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "id": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "description": {
                        "type": "string",
                        "maxLength": 32767
                      },
                      "defaultValue": {
                        "type": "boolean"
                      }
                    },
                    "additionalProperties": false,
                    "required": [
                      "type",
                      "label"
                    ]
                  },
                  {
                    "type": "object",
                    "properties": {
                      "type": {
                        "type": "string",
                        "enum": [
                          "select"
                        ]
                      },
                      "label": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "id": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "description": {
                        "type": "string",
                        "maxLength": 32767
                      },
                      "defaultValue": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "options": {
                        "type": "array",
                        "minItems": 1,
                        "maxItems": 100,
                        "items": {
                          "type": "object",
                          "properties": {
                            "label": {
                              "type": "string",
                              "maxLength": 1024
                            },
                            "value": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "value"
                          ]
                        }
                      }
                    },
                    "additionalProperties": false,
                    "required": [
                      "type",
                      "label",
                      "defaultValue",
                      "options"
                    ]
                  },
                  {
                    "type": "object",
                    "properties": {
                      "type": {
                        "type": "string",
                        "enum": [
                          "stringTemplate"
                        ]
                      },
                      "label": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "id": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "description": {
                        "type": "string",
                        "maxLength": 32767
                      },
                      "defaultValue": {
                        "type": "string",
                        "maxLength": 1024
                      },
                      "required": {
                        "type": "boolean"
                      },
                      "validRegExp": {
                        "type": "string",
                        "maxLength": 1024
                      }
                    },
                    "additionalProperties": false,
                    "required": [
                      "type",
                      "label"
                    ]
                  },
                  {
                    "type": "object",
                    "properties": {
                      "type": {
                        "type": "string",
                        "enum": [
                          "numberTemplate"
                        ]
                      },
                      "label": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "id": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "description": {
                        "type": "string",
                        "maxLength": 32767
                      },
                      "defaultValue": {
                        "type": "number"
                      },
                      "required": {
                        "type": "boolean"
                      },
                      "validMin": {
                        "type": "number"
                      },
                      "validMax": {
                        "type": "number"
                      }
                    },
                    "additionalProperties": false,
                    "required": [
                      "type",
                      "label"
                    ]
                  },
                  {
                    "type": "object",
                    "properties": {
                      "type": {
                        "type": "string",
                        "enum": [
                          "jsonTemplate"
                        ]
                      },
                      "label": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "id": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "description": {
                        "type": "string",
                        "maxLength": 32767
                      },
                      "defaultValue": {
                        "type": "string",
                        "maxLength": 32767
                      },
                      "required": {
                        "type": "boolean"
                      }
                    },
                    "additionalProperties": false,
                    "required": [
                      "type",
                      "label"
                    ]
                  },
                  {
                    "type": "object",
                    "properties": {
                      "type": {
                        "type": "string",
                        "enum": [
                          "payloadPath"
                        ]
                      },
                      "label": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "id": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "description": {
                        "type": "string",
                        "maxLength": 32767
                      },
                      "required": {
                        "type": "boolean"
                      }
                    },
                    "additionalProperties": false,
                    "required": [
                      "type",
                      "label"
                    ]
                  },
                  {
                    "type": "object",
                    "properties": {
                      "type": {
                        "type": "string",
                        "enum": [
                          "section"
                        ]
                      },
                      "label": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "id": {
                        "type": "string",
                        "minLength": 1,
                        "maxLength": 1024
                      },
                      "description": {
                        "type": "string",
                        "maxLength": 32767
                      }
                    },
                    "additionalProperties": false,
                    "required": [
                      "type",
                      "label"
                    ]
                  }
                ]
              }
            }
          },
          "additionalProperties": false,
          "required": [
            "outputCount",
            "resultMode",
            "fields"
          ]
        },
        "stats": {
          "type": "object",
          "properties": {
            "runCount": {
              "type": "number"
            },
            "errorCount": {
              "type": "number"
            },
            "byVersion": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "object",
                  "properties": {
                    "runCount": {
                      "type": "number"
                    },
                    "errorCount": {
                      "type": "number"
                    }
                  }
                }
              }
            }
          }
        }
      }
    },
    {
      "description": "Schema for a single Experience Workflow Version",
      "type": "object",
      "properties": {
        "id": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "flowVersionId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "flowId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "applicationId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "creationDate": {
          "type": "string",
          "format": "date-time"
        },
        "lastUpdated": {
          "type": "string",
          "format": "date-time"
        },
        "name": {
          "type": "string",
          "minLength": 1,
          "maxLength": 255
        },
        "description": {
          "type": "string",
          "maxLength": 32767
        },
        "iconData": {
          "type": "string",
          "maxLength": 32767,
          "pattern": "^data:image/(jpg|jpeg|png|svg\\+xml);base64,[0-9a-zA-Z+/=]*$"
        },
        "flowClass": {
          "type": "string",
          "enum": [
            "experience"
          ]
        },
        "versions": {
          "type": "array",
          "items": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "enabled": {
          "type": "boolean"
        },
        "triggers": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "key": {
                "type": "string",
                "maxLength": 1024
              },
              "type": {
                "type": "string",
                "enum": [
                  "dataTable",
                  "deviceCommand",
                  "deviceId",
                  "deviceIdConnect",
                  "deviceIdDisconnect",
                  "deviceIdInactivity",
                  "deviceTag",
                  "deviceTagConnect",
                  "deviceTagDisconnect",
                  "deviceTagInactivity",
                  "endpoint",
                  "event",
                  "fileWatch",
                  "integration",
                  "mqttTopic",
                  "request",
                  "customNodeStart",
                  "timer",
                  "udp",
                  "virtualButton",
                  "webhook"
                ]
              },
              "config": {
                "type": "object"
              },
              "meta": {
                "type": "object"
              },
              "outputIds": {
                "type": "array",
                "items": {
                  "type": "array",
                  "items": {
                    "type": "string",
                    "maxLength": 255
                  },
                  "maxItems": 100
                },
                "maxItems": 100
              }
            },
            "additionalProperties": false,
            "required": [
              "type"
            ]
          }
        },
        "nodes": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "maxLength": 1024
              },
              "type": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "config": {
                "type": "object"
              },
              "meta": {
                "type": "object"
              },
              "outputIds": {
                "type": "array",
                "items": {
                  "type": "array",
                  "items": {
                    "type": "string",
                    "maxLength": 255
                  },
                  "maxItems": 100
                },
                "maxItems": 100
              }
            },
            "additionalProperties": false,
            "required": [
              "type"
            ]
          }
        },
        "globals": {
          "type": "array",
          "maxItems": 100,
          "items": {
            "type": "object",
            "properties": {
              "key": {
                "type": "string",
                "pattern": "^[0-9a-zA-Z_-]{1,255}$"
              },
              "json": {
                "type": "string",
                "minLength": 1,
                "maxLength": 32767
              }
            },
            "additionalProperties": false,
            "required": [
              "key",
              "json"
            ]
          }
        },
        "stats": {
          "type": "object",
          "properties": {
            "runCount": {
              "type": "number"
            },
            "errorCount": {
              "type": "number"
            },
            "byVersion": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "object",
                  "properties": {
                    "runCount": {
                      "type": "number"
                    },
                    "errorCount": {
                      "type": "number"
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  ]
}
```

<small></small>

### Example <a name="workflow-version-example"></a>

```json
{
  "id": "675ed18f7ae143cd83dc4bb7",
  "flowVersionId": "675ed18f7ae143cd83dc4bb7",
  "flowId": "575ed18f7ae143cd83dc4aa6",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "version": "v1.2.3",
  "notes": "Description of my workflow version",
  "enabled": true,
  "triggers": [],
  "nodes": [],
  "globals": []
}
```

<br/>
## Workflow Version Patch

Schema for the body of a Workflow Version modification request

### Schema <a name="workflow-version-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "notes": {
      "type": "string",
      "maxLength": 32767
    },
    "enabled": {
      "type": "boolean"
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="workflow-version-patch-example"></a>

```json
{
  "notes": "Updated workflow version notes",
  "enabled": false
}
```

<br/>
## Workflow Version Post

Schema for the body of a Workflow Version creation request

### Schema <a name="workflow-version-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "version": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "notes": {
      "type": "string",
      "maxLength": 32767
    },
    "enabled": {
      "type": "boolean"
    },
    "triggers": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "maxLength": 1024
          },
          "type": {
            "type": "string",
            "enum": [
              "dataTable",
              "deviceCommand",
              "deviceId",
              "deviceIdConnect",
              "deviceIdDisconnect",
              "deviceIdInactivity",
              "deviceTag",
              "deviceTagConnect",
              "deviceTagDisconnect",
              "deviceTagInactivity",
              "endpoint",
              "event",
              "fileWatch",
              "integration",
              "mqttTopic",
              "request",
              "customNodeStart",
              "timer",
              "udp",
              "virtualButton",
              "webhook"
            ]
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string",
                "maxLength": 255
              },
              "maxItems": 100
            },
            "maxItems": 100
          }
        },
        "additionalProperties": false,
        "required": [
          "type"
        ]
      }
    },
    "nodes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "maxLength": 1024
          },
          "type": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string",
                "maxLength": 255
              },
              "maxItems": 100
            },
            "maxItems": 100
          }
        },
        "additionalProperties": false,
        "required": [
          "type"
        ]
      }
    },
    "globals": {
      "type": "array",
      "maxItems": 100,
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "json": {
            "type": "string",
            "minLength": 1,
            "maxLength": 32767
          }
        },
        "additionalProperties": false,
        "required": [
          "key",
          "json"
        ]
      }
    },
    "minimumAgentVersion": {
      "type": "string",
      "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
    },
    "customNodeConfig": {
      "type": "object",
      "properties": {
        "outputCount": {
          "type": "number",
          "enum": [
            1,
            2
          ]
        },
        "resultMode": {
          "type": "string",
          "enum": [
            "optional",
            "required",
            "none"
          ]
        },
        "resultDescription": {
          "type": "string",
          "maxLength": 32767
        },
        "fields": {
          "type": "array",
          "maxItems": 100,
          "items": {
            "oneOf": [
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "checkbox"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "select"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "options": {
                    "type": "array",
                    "minItems": 1,
                    "maxItems": 100,
                    "items": {
                      "type": "object",
                      "properties": {
                        "label": {
                          "type": "string",
                          "maxLength": 1024
                        },
                        "value": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "value"
                      ]
                    }
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label",
                  "defaultValue",
                  "options"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "stringTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "maxLength": 1024
                  },
                  "required": {
                    "type": "boolean"
                  },
                  "validRegExp": {
                    "type": "string",
                    "maxLength": 1024
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "numberTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "number"
                  },
                  "required": {
                    "type": "boolean"
                  },
                  "validMin": {
                    "type": "number"
                  },
                  "validMax": {
                    "type": "number"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "jsonTemplate"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "defaultValue": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "required": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "payloadPath"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "required": {
                    "type": "boolean"
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              },
              {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string",
                    "enum": [
                      "section"
                    ]
                  },
                  "label": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "id": {
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 1024
                  },
                  "description": {
                    "type": "string",
                    "maxLength": 32767
                  }
                },
                "additionalProperties": false,
                "required": [
                  "type",
                  "label"
                ]
              }
            ]
          }
        }
      },
      "additionalProperties": false,
      "required": [
        "outputCount",
        "resultMode",
        "fields"
      ]
    }
  },
  "additionalProperties": false,
  "required": [
    "version"
  ]
}
```

<small></small>

### Example <a name="workflow-version-post-example"></a>

```json
{
  "version": "v1.2.3",
  "notes": "Notes about my new workflow version",
  "enabled": false
}
```

<br/>
## Workflow Versions

Schema for a collection of Workflow Versions

### Schema <a name="workflow-versions-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Workflow Version",
        "description": "Schema for a single Workflow Version",
        "oneOf": [
          {
            "description": "Schema for a single Cloud/Edge/Custom Node Workflow Version",
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "flowVersionId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "flowId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "applicationId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "creationDate": {
                "type": "string",
                "format": "date-time"
              },
              "lastUpdated": {
                "type": "string",
                "format": "date-time"
              },
              "version": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              },
              "notes": {
                "type": "string",
                "maxLength": 32767
              },
              "enabled": {
                "type": "boolean"
              },
              "triggers": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "maxLength": 1024
                    },
                    "type": {
                      "type": "string",
                      "enum": [
                        "dataTable",
                        "deviceCommand",
                        "deviceId",
                        "deviceIdConnect",
                        "deviceIdDisconnect",
                        "deviceIdInactivity",
                        "deviceTag",
                        "deviceTagConnect",
                        "deviceTagDisconnect",
                        "deviceTagInactivity",
                        "endpoint",
                        "event",
                        "fileWatch",
                        "integration",
                        "mqttTopic",
                        "request",
                        "customNodeStart",
                        "timer",
                        "udp",
                        "virtualButton",
                        "webhook"
                      ]
                    },
                    "config": {
                      "type": "object"
                    },
                    "meta": {
                      "type": "object"
                    },
                    "outputIds": {
                      "type": "array",
                      "items": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "maxLength": 255
                        },
                        "maxItems": 100
                      },
                      "maxItems": 100
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "type"
                  ]
                }
              },
              "nodes": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "id": {
                      "type": "string",
                      "maxLength": 1024
                    },
                    "type": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 1024
                    },
                    "config": {
                      "type": "object"
                    },
                    "meta": {
                      "type": "object"
                    },
                    "outputIds": {
                      "type": "array",
                      "items": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "maxLength": 255
                        },
                        "maxItems": 100
                      },
                      "maxItems": 100
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "type"
                  ]
                }
              },
              "globals": {
                "type": "array",
                "maxItems": 100,
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                    },
                    "json": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 32767
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "key",
                    "json"
                  ]
                }
              },
              "minimumAgentVersion": {
                "type": "string",
                "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
              },
              "customNodeConfig": {
                "type": "object",
                "properties": {
                  "outputCount": {
                    "type": "number",
                    "enum": [
                      1,
                      2
                    ]
                  },
                  "resultMode": {
                    "type": "string",
                    "enum": [
                      "optional",
                      "required",
                      "none"
                    ]
                  },
                  "resultDescription": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "fields": {
                    "type": "array",
                    "maxItems": 100,
                    "items": {
                      "oneOf": [
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "checkbox"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "defaultValue": {
                              "type": "boolean"
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "select"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "defaultValue": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "options": {
                              "type": "array",
                              "minItems": 1,
                              "maxItems": 100,
                              "items": {
                                "type": "object",
                                "properties": {
                                  "label": {
                                    "type": "string",
                                    "maxLength": 1024
                                  },
                                  "value": {
                                    "type": "string",
                                    "minLength": 1,
                                    "maxLength": 1024
                                  }
                                },
                                "additionalProperties": false,
                                "required": [
                                  "value"
                                ]
                              }
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label",
                            "defaultValue",
                            "options"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "stringTemplate"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "defaultValue": {
                              "type": "string",
                              "maxLength": 1024
                            },
                            "required": {
                              "type": "boolean"
                            },
                            "validRegExp": {
                              "type": "string",
                              "maxLength": 1024
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "numberTemplate"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "defaultValue": {
                              "type": "number"
                            },
                            "required": {
                              "type": "boolean"
                            },
                            "validMin": {
                              "type": "number"
                            },
                            "validMax": {
                              "type": "number"
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "jsonTemplate"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "defaultValue": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "required": {
                              "type": "boolean"
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "payloadPath"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "required": {
                              "type": "boolean"
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "section"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        }
                      ]
                    }
                  }
                },
                "additionalProperties": false,
                "required": [
                  "outputCount",
                  "resultMode",
                  "fields"
                ]
              },
              "stats": {
                "type": "object",
                "properties": {
                  "runCount": {
                    "type": "number"
                  },
                  "errorCount": {
                    "type": "number"
                  },
                  "byVersion": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "object",
                        "properties": {
                          "runCount": {
                            "type": "number"
                          },
                          "errorCount": {
                            "type": "number"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          {
            "description": "Schema for a single Experience Workflow Version",
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "flowVersionId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "flowId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "applicationId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "creationDate": {
                "type": "string",
                "format": "date-time"
              },
              "lastUpdated": {
                "type": "string",
                "format": "date-time"
              },
              "name": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              },
              "description": {
                "type": "string",
                "maxLength": 32767
              },
              "iconData": {
                "type": "string",
                "maxLength": 32767,
                "pattern": "^data:image/(jpg|jpeg|png|svg\\+xml);base64,[0-9a-zA-Z+/=]*$"
              },
              "flowClass": {
                "type": "string",
                "enum": [
                  "experience"
                ]
              },
              "versions": {
                "type": "array",
                "items": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 255
                }
              },
              "enabled": {
                "type": "boolean"
              },
              "triggers": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "maxLength": 1024
                    },
                    "type": {
                      "type": "string",
                      "enum": [
                        "dataTable",
                        "deviceCommand",
                        "deviceId",
                        "deviceIdConnect",
                        "deviceIdDisconnect",
                        "deviceIdInactivity",
                        "deviceTag",
                        "deviceTagConnect",
                        "deviceTagDisconnect",
                        "deviceTagInactivity",
                        "endpoint",
                        "event",
                        "fileWatch",
                        "integration",
                        "mqttTopic",
                        "request",
                        "customNodeStart",
                        "timer",
                        "udp",
                        "virtualButton",
                        "webhook"
                      ]
                    },
                    "config": {
                      "type": "object"
                    },
                    "meta": {
                      "type": "object"
                    },
                    "outputIds": {
                      "type": "array",
                      "items": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "maxLength": 255
                        },
                        "maxItems": 100
                      },
                      "maxItems": 100
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "type"
                  ]
                }
              },
              "nodes": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "id": {
                      "type": "string",
                      "maxLength": 1024
                    },
                    "type": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 1024
                    },
                    "config": {
                      "type": "object"
                    },
                    "meta": {
                      "type": "object"
                    },
                    "outputIds": {
                      "type": "array",
                      "items": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "maxLength": 255
                        },
                        "maxItems": 100
                      },
                      "maxItems": 100
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "type"
                  ]
                }
              },
              "globals": {
                "type": "array",
                "maxItems": 100,
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                    },
                    "json": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 32767
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "key",
                    "json"
                  ]
                }
              },
              "stats": {
                "type": "object",
                "properties": {
                  "runCount": {
                    "type": "number"
                  },
                  "errorCount": {
                    "type": "number"
                  },
                  "byVersion": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "object",
                        "properties": {
                          "runCount": {
                            "type": "number"
                          },
                          "errorCount": {
                            "type": "number"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        ]
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "flowId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="workflow-versions-example"></a>

```json
{
  "items": [
    {
      "id": "675ed18f7ae143cd83dc4bb7",
      "flowVersionId": "675ed18f7ae143cd83dc4bb7",
      "flowId": "575ed18f7ae143cd83dc4aa6",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "version": "v1.2.3",
      "notes": "Description of my workflow version",
      "enabled": true,
      "triggers": [],
      "nodes": [],
      "globals": []
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "version",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "flowId": "575ed18f7ae143cd83dc4aa6"
}
```

<br/>
## Workflows

Schema for a collection of Workflows

### Schema <a name="workflows-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Workflow",
        "description": "Schema for a single Workflow",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "flowId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "iconData": {
            "type": "string",
            "maxLength": 32767,
            "pattern": "^data:image/(jpg|jpeg|png|svg\\+xml);base64,[0-9a-zA-Z+/=]*$"
          },
          "enabled": {
            "type": "boolean"
          },
          "defaultVersionId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "minimumAgentVersion": {
            "type": "string",
            "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
          },
          "flowClass": {
            "type": "string",
            "enum": [
              "cloud",
              "edge",
              "experience",
              "customNode"
            ]
          },
          "triggers": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "maxLength": 1024
                },
                "type": {
                  "type": "string",
                  "enum": [
                    "dataTable",
                    "deviceCommand",
                    "deviceId",
                    "deviceIdConnect",
                    "deviceIdDisconnect",
                    "deviceIdInactivity",
                    "deviceTag",
                    "deviceTagConnect",
                    "deviceTagDisconnect",
                    "deviceTagInactivity",
                    "endpoint",
                    "event",
                    "fileWatch",
                    "integration",
                    "mqttTopic",
                    "request",
                    "customNodeStart",
                    "timer",
                    "udp",
                    "virtualButton",
                    "webhook"
                  ]
                },
                "config": {
                  "type": "object"
                },
                "meta": {
                  "type": "object"
                },
                "outputIds": {
                  "type": "array",
                  "items": {
                    "type": "array",
                    "items": {
                      "type": "string",
                      "maxLength": 255
                    },
                    "maxItems": 100
                  },
                  "maxItems": 100
                }
              },
              "additionalProperties": false,
              "required": [
                "type"
              ]
            }
          },
          "nodes": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "id": {
                  "type": "string",
                  "maxLength": 1024
                },
                "type": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 1024
                },
                "config": {
                  "type": "object"
                },
                "meta": {
                  "type": "object"
                },
                "outputIds": {
                  "type": "array",
                  "items": {
                    "type": "array",
                    "items": {
                      "type": "string",
                      "maxLength": 255
                    },
                    "maxItems": 100
                  },
                  "maxItems": 100
                }
              },
              "additionalProperties": false,
              "required": [
                "type"
              ]
            }
          },
          "customNodeConfig": {
            "type": "object",
            "properties": {
              "outputCount": {
                "type": "number",
                "enum": [
                  1,
                  2
                ]
              },
              "resultMode": {
                "type": "string",
                "enum": [
                  "optional",
                  "required",
                  "none"
                ]
              },
              "resultDescription": {
                "type": "string",
                "maxLength": 32767
              },
              "fields": {
                "type": "array",
                "maxItems": 100,
                "items": {
                  "oneOf": [
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "checkbox"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "select"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "options": {
                          "type": "array",
                          "minItems": 1,
                          "maxItems": 100,
                          "items": {
                            "type": "object",
                            "properties": {
                              "label": {
                                "type": "string",
                                "maxLength": 1024
                              },
                              "value": {
                                "type": "string",
                                "minLength": 1,
                                "maxLength": 1024
                              }
                            },
                            "additionalProperties": false,
                            "required": [
                              "value"
                            ]
                          }
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label",
                        "defaultValue",
                        "options"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "stringTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "maxLength": 1024
                        },
                        "required": {
                          "type": "boolean"
                        },
                        "validRegExp": {
                          "type": "string",
                          "maxLength": 1024
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "numberTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "number"
                        },
                        "required": {
                          "type": "boolean"
                        },
                        "validMin": {
                          "type": "number"
                        },
                        "validMax": {
                          "type": "number"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "jsonTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "required": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "payloadPath"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "required": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "section"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    }
                  ]
                }
              }
            },
            "additionalProperties": false,
            "required": [
              "outputCount",
              "resultMode",
              "fields"
            ]
          },
          "customNodeSupports": {
            "type": "array",
            "items": {
              "type": "string",
              "enum": [
                "cloud"
              ]
            }
          },
          "customNodeUseCount": {
            "type": "number"
          },
          "globals": {
            "type": "array",
            "maxItems": 100,
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "json": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32767
                }
              },
              "additionalProperties": false,
              "required": [
                "key",
                "json"
              ]
            }
          },
          "deletedInDevelop": {
            "type": "boolean"
          },
          "stats": {
            "type": "object",
            "properties": {
              "runCount": {
                "type": "number"
              },
              "errorCount": {
                "type": "number"
              },
              "byVersion": {
                "type": "object",
                "patternProperties": {
                  ".*": {
                    "type": "object",
                    "properties": {
                      "runCount": {
                        "type": "number"
                      },
                      "errorCount": {
                        "type": "number"
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "flowClass": {
      "type": "string",
      "enum": [
        "cloud",
        "edge",
        "experience",
        "customNode"
      ]
    }
  }
}
```

<small></small>

### Example <a name="workflows-example"></a>

```json
{
  "items": [
    {
      "id": "575ed18f7ae143cd83dc4aa6",
      "flowId": "575ed18f7ae143cd83dc4aa6",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Workflow",
      "description": "Description of my empty workflow",
      "enabled": true,
      "triggers": [],
      "nodes": [],
      "globals": [],
      "stats": {
        "runCount": 0,
        "errorCount": 0
      }
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Workflow Import

Schema for the body of a workflow import request

### Schema <a name="workflow-import-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "flows": {
      "maxItems": 1000,
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "iconData": {
            "type": "string",
            "maxLength": 32767,
            "pattern": "^data:image/(jpg|jpeg|png|svg\\+xml);base64,[0-9a-zA-Z+/=]*$"
          },
          "enabled": {
            "type": "boolean"
          },
          "triggers": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "maxLength": 1024
                },
                "type": {
                  "type": "string",
                  "enum": [
                    "dataTable",
                    "deviceCommand",
                    "deviceId",
                    "deviceIdConnect",
                    "deviceIdDisconnect",
                    "deviceIdInactivity",
                    "deviceTag",
                    "deviceTagConnect",
                    "deviceTagDisconnect",
                    "deviceTagInactivity",
                    "endpoint",
                    "event",
                    "fileWatch",
                    "integration",
                    "mqttTopic",
                    "request",
                    "customNodeStart",
                    "timer",
                    "udp",
                    "virtualButton",
                    "webhook"
                  ]
                },
                "config": {
                  "type": "object"
                },
                "meta": {
                  "type": "object"
                },
                "outputIds": {
                  "type": "array",
                  "items": {
                    "type": "array",
                    "items": {
                      "type": "string",
                      "maxLength": 255
                    },
                    "maxItems": 100
                  },
                  "maxItems": 100
                }
              },
              "additionalProperties": false,
              "required": [
                "type"
              ]
            }
          },
          "nodes": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "id": {
                  "type": "string",
                  "maxLength": 1024
                },
                "type": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 1024
                },
                "config": {
                  "type": "object"
                },
                "meta": {
                  "type": "object"
                },
                "outputIds": {
                  "type": "array",
                  "items": {
                    "type": "array",
                    "items": {
                      "type": "string",
                      "maxLength": 255
                    },
                    "maxItems": 100
                  },
                  "maxItems": 100
                }
              },
              "additionalProperties": false,
              "required": [
                "type"
              ]
            }
          },
          "globals": {
            "type": "array",
            "maxItems": 100,
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "json": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32767
                }
              },
              "additionalProperties": false,
              "required": [
                "key",
                "json"
              ]
            }
          },
          "flowClass": {
            "type": "string",
            "enum": [
              "cloud",
              "edge",
              "experience",
              "customNode"
            ]
          },
          "defaultVersionId": {
            "oneOf": [
              {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              {
                "type": "null"
              }
            ]
          },
          "minimumAgentVersion": {
            "type": "string",
            "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
          },
          "customNodeConfig": {
            "type": "object",
            "properties": {
              "outputCount": {
                "type": "number",
                "enum": [
                  1,
                  2
                ]
              },
              "resultMode": {
                "type": "string",
                "enum": [
                  "optional",
                  "required",
                  "none"
                ]
              },
              "resultDescription": {
                "type": "string",
                "maxLength": 32767
              },
              "fields": {
                "type": "array",
                "maxItems": 100,
                "items": {
                  "oneOf": [
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "checkbox"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "select"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "options": {
                          "type": "array",
                          "minItems": 1,
                          "maxItems": 100,
                          "items": {
                            "type": "object",
                            "properties": {
                              "label": {
                                "type": "string",
                                "maxLength": 1024
                              },
                              "value": {
                                "type": "string",
                                "minLength": 1,
                                "maxLength": 1024
                              }
                            },
                            "additionalProperties": false,
                            "required": [
                              "value"
                            ]
                          }
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label",
                        "defaultValue",
                        "options"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "stringTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "maxLength": 1024
                        },
                        "required": {
                          "type": "boolean"
                        },
                        "validRegExp": {
                          "type": "string",
                          "maxLength": 1024
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "numberTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "number"
                        },
                        "required": {
                          "type": "boolean"
                        },
                        "validMin": {
                          "type": "number"
                        },
                        "validMax": {
                          "type": "number"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "jsonTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "required": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "payloadPath"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "required": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "section"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    }
                  ]
                }
              }
            },
            "additionalProperties": false,
            "required": [
              "outputCount",
              "resultMode",
              "fields"
            ]
          },
          "customNodeSupports": {
            "type": "array",
            "items": {
              "type": "string",
              "enum": [
                "cloud"
              ]
            }
          }
        },
        "additionalProperties": {
          "type": "string",
          "maxLength": 1024
        },
        "required": [
          "name"
        ]
      }
    },
    "flowVersions": {
      "maxItems": 1000,
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "flowId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "version": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "notes": {
            "type": "string",
            "maxLength": 32767
          },
          "enabled": {
            "type": "boolean"
          },
          "triggers": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "maxLength": 1024
                },
                "type": {
                  "type": "string",
                  "enum": [
                    "dataTable",
                    "deviceCommand",
                    "deviceId",
                    "deviceIdConnect",
                    "deviceIdDisconnect",
                    "deviceIdInactivity",
                    "deviceTag",
                    "deviceTagConnect",
                    "deviceTagDisconnect",
                    "deviceTagInactivity",
                    "endpoint",
                    "event",
                    "fileWatch",
                    "integration",
                    "mqttTopic",
                    "request",
                    "customNodeStart",
                    "timer",
                    "udp",
                    "virtualButton",
                    "webhook"
                  ]
                },
                "config": {
                  "type": "object"
                },
                "meta": {
                  "type": "object"
                },
                "outputIds": {
                  "type": "array",
                  "items": {
                    "type": "array",
                    "items": {
                      "type": "string",
                      "maxLength": 255
                    },
                    "maxItems": 100
                  },
                  "maxItems": 100
                }
              },
              "additionalProperties": false,
              "required": [
                "type"
              ]
            }
          },
          "nodes": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "id": {
                  "type": "string",
                  "maxLength": 1024
                },
                "type": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 1024
                },
                "config": {
                  "type": "object"
                },
                "meta": {
                  "type": "object"
                },
                "outputIds": {
                  "type": "array",
                  "items": {
                    "type": "array",
                    "items": {
                      "type": "string",
                      "maxLength": 255
                    },
                    "maxItems": 100
                  },
                  "maxItems": 100
                }
              },
              "additionalProperties": false,
              "required": [
                "type"
              ]
            }
          },
          "globals": {
            "type": "array",
            "maxItems": 100,
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "json": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32767
                }
              },
              "additionalProperties": false,
              "required": [
                "key",
                "json"
              ]
            }
          },
          "minimumAgentVersion": {
            "type": "string",
            "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
          },
          "customNodeConfig": {
            "type": "object",
            "properties": {
              "outputCount": {
                "type": "number",
                "enum": [
                  1,
                  2
                ]
              },
              "resultMode": {
                "type": "string",
                "enum": [
                  "optional",
                  "required",
                  "none"
                ]
              },
              "resultDescription": {
                "type": "string",
                "maxLength": 32767
              },
              "fields": {
                "type": "array",
                "maxItems": 100,
                "items": {
                  "oneOf": [
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "checkbox"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "select"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "options": {
                          "type": "array",
                          "minItems": 1,
                          "maxItems": 100,
                          "items": {
                            "type": "object",
                            "properties": {
                              "label": {
                                "type": "string",
                                "maxLength": 1024
                              },
                              "value": {
                                "type": "string",
                                "minLength": 1,
                                "maxLength": 1024
                              }
                            },
                            "additionalProperties": false,
                            "required": [
                              "value"
                            ]
                          }
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label",
                        "defaultValue",
                        "options"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "stringTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "maxLength": 1024
                        },
                        "required": {
                          "type": "boolean"
                        },
                        "validRegExp": {
                          "type": "string",
                          "maxLength": 1024
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "numberTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "number"
                        },
                        "required": {
                          "type": "boolean"
                        },
                        "validMin": {
                          "type": "number"
                        },
                        "validMax": {
                          "type": "number"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "jsonTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "required": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "payloadPath"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "required": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "section"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    }
                  ]
                }
              }
            },
            "additionalProperties": false,
            "required": [
              "outputCount",
              "resultMode",
              "fields"
            ]
          }
        },
        "additionalProperties": {
          "type": "string",
          "maxLength": 1024
        },
        "required": [
          "version"
        ]
      }
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="workflow-import-example"></a>

```json
{
  "flows": [
    {
      "id": "575ed18f7ae143cd83dc4aa6",
      "flowId": "575ed18f7ae143cd83dc4aa6",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Workflow",
      "description": "Description of my empty workflow",
      "enabled": true,
      "triggers": [],
      "nodes": [],
      "globals": [],
      "stats": {
        "runCount": 0,
        "errorCount": 0
      }
    }
  ],
  "flowVersions": []
}
```

<br/>
## Workflow Import Result

Schema for the result of a workflow import request

### Schema <a name="workflow-import-result-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "flows": {
      "maxItems": 1000,
      "type": "array",
      "items": {
        "title": "Workflow",
        "description": "Schema for a single Workflow",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "flowId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "iconData": {
            "type": "string",
            "maxLength": 32767,
            "pattern": "^data:image/(jpg|jpeg|png|svg\\+xml);base64,[0-9a-zA-Z+/=]*$"
          },
          "enabled": {
            "type": "boolean"
          },
          "defaultVersionId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "minimumAgentVersion": {
            "type": "string",
            "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
          },
          "flowClass": {
            "type": "string",
            "enum": [
              "cloud",
              "edge",
              "experience",
              "customNode"
            ]
          },
          "triggers": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "maxLength": 1024
                },
                "type": {
                  "type": "string",
                  "enum": [
                    "dataTable",
                    "deviceCommand",
                    "deviceId",
                    "deviceIdConnect",
                    "deviceIdDisconnect",
                    "deviceIdInactivity",
                    "deviceTag",
                    "deviceTagConnect",
                    "deviceTagDisconnect",
                    "deviceTagInactivity",
                    "endpoint",
                    "event",
                    "fileWatch",
                    "integration",
                    "mqttTopic",
                    "request",
                    "customNodeStart",
                    "timer",
                    "udp",
                    "virtualButton",
                    "webhook"
                  ]
                },
                "config": {
                  "type": "object"
                },
                "meta": {
                  "type": "object"
                },
                "outputIds": {
                  "type": "array",
                  "items": {
                    "type": "array",
                    "items": {
                      "type": "string",
                      "maxLength": 255
                    },
                    "maxItems": 100
                  },
                  "maxItems": 100
                }
              },
              "additionalProperties": false,
              "required": [
                "type"
              ]
            }
          },
          "nodes": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "id": {
                  "type": "string",
                  "maxLength": 1024
                },
                "type": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 1024
                },
                "config": {
                  "type": "object"
                },
                "meta": {
                  "type": "object"
                },
                "outputIds": {
                  "type": "array",
                  "items": {
                    "type": "array",
                    "items": {
                      "type": "string",
                      "maxLength": 255
                    },
                    "maxItems": 100
                  },
                  "maxItems": 100
                }
              },
              "additionalProperties": false,
              "required": [
                "type"
              ]
            }
          },
          "customNodeConfig": {
            "type": "object",
            "properties": {
              "outputCount": {
                "type": "number",
                "enum": [
                  1,
                  2
                ]
              },
              "resultMode": {
                "type": "string",
                "enum": [
                  "optional",
                  "required",
                  "none"
                ]
              },
              "resultDescription": {
                "type": "string",
                "maxLength": 32767
              },
              "fields": {
                "type": "array",
                "maxItems": 100,
                "items": {
                  "oneOf": [
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "checkbox"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "select"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "options": {
                          "type": "array",
                          "minItems": 1,
                          "maxItems": 100,
                          "items": {
                            "type": "object",
                            "properties": {
                              "label": {
                                "type": "string",
                                "maxLength": 1024
                              },
                              "value": {
                                "type": "string",
                                "minLength": 1,
                                "maxLength": 1024
                              }
                            },
                            "additionalProperties": false,
                            "required": [
                              "value"
                            ]
                          }
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label",
                        "defaultValue",
                        "options"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "stringTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "maxLength": 1024
                        },
                        "required": {
                          "type": "boolean"
                        },
                        "validRegExp": {
                          "type": "string",
                          "maxLength": 1024
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "numberTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "number"
                        },
                        "required": {
                          "type": "boolean"
                        },
                        "validMin": {
                          "type": "number"
                        },
                        "validMax": {
                          "type": "number"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "jsonTemplate"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "defaultValue": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "required": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "payloadPath"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        },
                        "required": {
                          "type": "boolean"
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    },
                    {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string",
                          "enum": [
                            "section"
                          ]
                        },
                        "label": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "id": {
                          "type": "string",
                          "minLength": 1,
                          "maxLength": 1024
                        },
                        "description": {
                          "type": "string",
                          "maxLength": 32767
                        }
                      },
                      "additionalProperties": false,
                      "required": [
                        "type",
                        "label"
                      ]
                    }
                  ]
                }
              }
            },
            "additionalProperties": false,
            "required": [
              "outputCount",
              "resultMode",
              "fields"
            ]
          },
          "customNodeSupports": {
            "type": "array",
            "items": {
              "type": "string",
              "enum": [
                "cloud"
              ]
            }
          },
          "customNodeUseCount": {
            "type": "number"
          },
          "globals": {
            "type": "array",
            "maxItems": 100,
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "json": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32767
                }
              },
              "additionalProperties": false,
              "required": [
                "key",
                "json"
              ]
            }
          },
          "deletedInDevelop": {
            "type": "boolean"
          },
          "stats": {
            "type": "object",
            "properties": {
              "runCount": {
                "type": "number"
              },
              "errorCount": {
                "type": "number"
              },
              "byVersion": {
                "type": "object",
                "patternProperties": {
                  ".*": {
                    "type": "object",
                    "properties": {
                      "runCount": {
                        "type": "number"
                      },
                      "errorCount": {
                        "type": "number"
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    },
    "flowVersions": {
      "maxItems": 1000,
      "type": "array",
      "items": {
        "title": "Workflow Version",
        "description": "Schema for a single Workflow Version",
        "oneOf": [
          {
            "description": "Schema for a single Cloud/Edge/Custom Node Workflow Version",
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "flowVersionId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "flowId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "applicationId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "creationDate": {
                "type": "string",
                "format": "date-time"
              },
              "lastUpdated": {
                "type": "string",
                "format": "date-time"
              },
              "version": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              },
              "notes": {
                "type": "string",
                "maxLength": 32767
              },
              "enabled": {
                "type": "boolean"
              },
              "triggers": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "maxLength": 1024
                    },
                    "type": {
                      "type": "string",
                      "enum": [
                        "dataTable",
                        "deviceCommand",
                        "deviceId",
                        "deviceIdConnect",
                        "deviceIdDisconnect",
                        "deviceIdInactivity",
                        "deviceTag",
                        "deviceTagConnect",
                        "deviceTagDisconnect",
                        "deviceTagInactivity",
                        "endpoint",
                        "event",
                        "fileWatch",
                        "integration",
                        "mqttTopic",
                        "request",
                        "customNodeStart",
                        "timer",
                        "udp",
                        "virtualButton",
                        "webhook"
                      ]
                    },
                    "config": {
                      "type": "object"
                    },
                    "meta": {
                      "type": "object"
                    },
                    "outputIds": {
                      "type": "array",
                      "items": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "maxLength": 255
                        },
                        "maxItems": 100
                      },
                      "maxItems": 100
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "type"
                  ]
                }
              },
              "nodes": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "id": {
                      "type": "string",
                      "maxLength": 1024
                    },
                    "type": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 1024
                    },
                    "config": {
                      "type": "object"
                    },
                    "meta": {
                      "type": "object"
                    },
                    "outputIds": {
                      "type": "array",
                      "items": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "maxLength": 255
                        },
                        "maxItems": 100
                      },
                      "maxItems": 100
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "type"
                  ]
                }
              },
              "globals": {
                "type": "array",
                "maxItems": 100,
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                    },
                    "json": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 32767
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "key",
                    "json"
                  ]
                }
              },
              "minimumAgentVersion": {
                "type": "string",
                "pattern": "^(0|([1-9]\\d*))\\.(0|([1-9]\\d*))\\.(0|([1-9]\\d*))$"
              },
              "customNodeConfig": {
                "type": "object",
                "properties": {
                  "outputCount": {
                    "type": "number",
                    "enum": [
                      1,
                      2
                    ]
                  },
                  "resultMode": {
                    "type": "string",
                    "enum": [
                      "optional",
                      "required",
                      "none"
                    ]
                  },
                  "resultDescription": {
                    "type": "string",
                    "maxLength": 32767
                  },
                  "fields": {
                    "type": "array",
                    "maxItems": 100,
                    "items": {
                      "oneOf": [
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "checkbox"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "defaultValue": {
                              "type": "boolean"
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "select"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "defaultValue": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "options": {
                              "type": "array",
                              "minItems": 1,
                              "maxItems": 100,
                              "items": {
                                "type": "object",
                                "properties": {
                                  "label": {
                                    "type": "string",
                                    "maxLength": 1024
                                  },
                                  "value": {
                                    "type": "string",
                                    "minLength": 1,
                                    "maxLength": 1024
                                  }
                                },
                                "additionalProperties": false,
                                "required": [
                                  "value"
                                ]
                              }
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label",
                            "defaultValue",
                            "options"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "stringTemplate"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "defaultValue": {
                              "type": "string",
                              "maxLength": 1024
                            },
                            "required": {
                              "type": "boolean"
                            },
                            "validRegExp": {
                              "type": "string",
                              "maxLength": 1024
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "numberTemplate"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "defaultValue": {
                              "type": "number"
                            },
                            "required": {
                              "type": "boolean"
                            },
                            "validMin": {
                              "type": "number"
                            },
                            "validMax": {
                              "type": "number"
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "jsonTemplate"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "defaultValue": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "required": {
                              "type": "boolean"
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "payloadPath"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            },
                            "required": {
                              "type": "boolean"
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string",
                              "enum": [
                                "section"
                              ]
                            },
                            "label": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "id": {
                              "type": "string",
                              "minLength": 1,
                              "maxLength": 1024
                            },
                            "description": {
                              "type": "string",
                              "maxLength": 32767
                            }
                          },
                          "additionalProperties": false,
                          "required": [
                            "type",
                            "label"
                          ]
                        }
                      ]
                    }
                  }
                },
                "additionalProperties": false,
                "required": [
                  "outputCount",
                  "resultMode",
                  "fields"
                ]
              },
              "stats": {
                "type": "object",
                "properties": {
                  "runCount": {
                    "type": "number"
                  },
                  "errorCount": {
                    "type": "number"
                  },
                  "byVersion": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "object",
                        "properties": {
                          "runCount": {
                            "type": "number"
                          },
                          "errorCount": {
                            "type": "number"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          {
            "description": "Schema for a single Experience Workflow Version",
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "flowVersionId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "flowId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "applicationId": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "creationDate": {
                "type": "string",
                "format": "date-time"
              },
              "lastUpdated": {
                "type": "string",
                "format": "date-time"
              },
              "name": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              },
              "description": {
                "type": "string",
                "maxLength": 32767
              },
              "iconData": {
                "type": "string",
                "maxLength": 32767,
                "pattern": "^data:image/(jpg|jpeg|png|svg\\+xml);base64,[0-9a-zA-Z+/=]*$"
              },
              "flowClass": {
                "type": "string",
                "enum": [
                  "experience"
                ]
              },
              "versions": {
                "type": "array",
                "items": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 255
                }
              },
              "enabled": {
                "type": "boolean"
              },
              "triggers": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "maxLength": 1024
                    },
                    "type": {
                      "type": "string",
                      "enum": [
                        "dataTable",
                        "deviceCommand",
                        "deviceId",
                        "deviceIdConnect",
                        "deviceIdDisconnect",
                        "deviceIdInactivity",
                        "deviceTag",
                        "deviceTagConnect",
                        "deviceTagDisconnect",
                        "deviceTagInactivity",
                        "endpoint",
                        "event",
                        "fileWatch",
                        "integration",
                        "mqttTopic",
                        "request",
                        "customNodeStart",
                        "timer",
                        "udp",
                        "virtualButton",
                        "webhook"
                      ]
                    },
                    "config": {
                      "type": "object"
                    },
                    "meta": {
                      "type": "object"
                    },
                    "outputIds": {
                      "type": "array",
                      "items": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "maxLength": 255
                        },
                        "maxItems": 100
                      },
                      "maxItems": 100
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "type"
                  ]
                }
              },
              "nodes": {
                "type": "array",
                "items": {
                  "type": "object",
                  "properties": {
                    "id": {
                      "type": "string",
                      "maxLength": 1024
                    },
                    "type": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 1024
                    },
                    "config": {
                      "type": "object"
                    },
                    "meta": {
                      "type": "object"
                    },
                    "outputIds": {
                      "type": "array",
                      "items": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "maxLength": 255
                        },
                        "maxItems": 100
                      },
                      "maxItems": 100
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "type"
                  ]
                }
              },
              "globals": {
                "type": "array",
                "maxItems": 100,
                "items": {
                  "type": "object",
                  "properties": {
                    "key": {
                      "type": "string",
                      "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                    },
                    "json": {
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 32767
                    }
                  },
                  "additionalProperties": false,
                  "required": [
                    "key",
                    "json"
                  ]
                }
              },
              "stats": {
                "type": "object",
                "properties": {
                  "runCount": {
                    "type": "number"
                  },
                  "errorCount": {
                    "type": "number"
                  },
                  "byVersion": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "object",
                        "properties": {
                          "runCount": {
                            "type": "number"
                          },
                          "errorCount": {
                            "type": "number"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        ]
      }
    },
    "importedFlowIdMap": {
      "type": "object",
      "patternProperties": {
        "^[A-Fa-f\\d]{24}$": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        }
      }
    },
    "importedVersionIdMap": {
      "type": "object",
      "patternProperties": {
        "^[A-Fa-f\\d]{24}$": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="workflow-import-result-example"></a>

```json
{
  "flows": [
    {
      "id": "575ed18f7ae143cd83dc4aa6",
      "flowId": "575ed18f7ae143cd83dc4aa6",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Workflow",
      "description": "Description of my empty workflow",
      "enabled": true,
      "triggers": [],
      "nodes": [],
      "globals": [],
      "stats": {
        "runCount": 0,
        "errorCount": 0
      }
    }
  ],
  "flowVersions": [],
  "importedFlowIdMap": {
    "575ed18f7ae143cd83dc4aa6": "575efbcc7ae143cd83dc4aae"
  },
  "importedVersionIdMap": {}
}
```

<br/>
## Github Login

Schema for the body of a Github login request

### Schema <a name="github-login-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "accessToken": {
      "type": "string",
      "minLength": 1
    },
    "requestedScopes": {
      "type": "array",
      "uniqueItems": true,
      "items": {
        "oneOf": [
          {
            "oneOf": [
              {
                "type": "string",
                "enum": [
                  "all.Application",
                  "all.Application.read",
                  "all.Device",
                  "all.Device.read",
                  "application.*",
                  "applicationApiToken.*",
                  "applicationApiTokens.*",
                  "applicationKey.*",
                  "applicationKeys.*",
                  "data.*",
                  "dataTable.*",
                  "dataTables.*",
                  "dataTableRow.*",
                  "dataTableRows.*",
                  "device.*",
                  "deviceRecipe.*",
                  "deviceRecipes.*",
                  "devices.*",
                  "edgeDeployments.*",
                  "event.*",
                  "events.*",
                  "experience.*",
                  "experienceDomain.*",
                  "experienceDomains.*",
                  "experienceEndpoint.*",
                  "experienceEndpoints.*",
                  "experienceGroup.*",
                  "experienceGroups.*",
                  "experienceSlug.*",
                  "experienceSlugs.*",
                  "experienceUser.*",
                  "experienceUsers.*",
                  "experienceVersion.*",
                  "experienceVersions.*",
                  "experienceView.*",
                  "experienceViews.*",
                  "integration.*",
                  "integrations.*",
                  "file.*",
                  "files.*",
                  "flow.*",
                  "flows.*",
                  "flowVersion.*",
                  "flowVersions.*",
                  "webhook.*",
                  "webhooks.*",
                  "application.archiveData",
                  "application.backfillArchiveData",
                  "application.debug",
                  "application.delete",
                  "application.get",
                  "application.mqttPublishMessage",
                  "application.mqttSubscriptionStream",
                  "application.patch",
                  "application.payloadCounts",
                  "applicationApiToken.delete",
                  "applicationApiToken.get",
                  "applicationApiToken.patch",
                  "applicationApiTokens.get",
                  "applicationApiTokens.post",
                  "applicationKey.delete",
                  "applicationKey.get",
                  "applicationKey.patch",
                  "applicationKeys.get",
                  "applicationKeys.post",
                  "data.lastValueQuery",
                  "data.timeSeriesQuery",
                  "dataTable.addColumn",
                  "dataTable.delete",
                  "dataTable.get",
                  "dataTable.patch",
                  "dataTable.removeColumn",
                  "dataTableRow.delete",
                  "dataTableRow.get",
                  "dataTableRow.patch",
                  "dataTableRows.get",
                  "dataTableRows.post",
                  "dataTableRows.query",
                  "dataTableRows.export",
                  "dataTableRows.delete",
                  "dataTableRows.truncate",
                  "dataTables.get",
                  "dataTables.post",
                  "device.commandStream",
                  "device.debug",
                  "device.delete",
                  "device.export",
                  "device.get",
                  "device.getCommand",
                  "device.getCompositeState",
                  "device.getLogEntries",
                  "device.getState",
                  "device.patch",
                  "device.removeData",
                  "device.sendCommand",
                  "device.sendState",
                  "device.setConnectionStatus",
                  "device.stateStream",
                  "deviceRecipe.bulkCreate",
                  "deviceRecipe.delete",
                  "deviceRecipe.get",
                  "deviceRecipe.patch",
                  "deviceRecipes.get",
                  "deviceRecipes.post",
                  "devices.detailedSummary",
                  "devices.export",
                  "devices.get",
                  "devices.post",
                  "devices.sendCommand",
                  "edgeDeployments.get",
                  "edgeDeployments.release",
                  "edgeDeployments.remove",
                  "edgeDeployments.replace",
                  "event.delete",
                  "event.get",
                  "event.patch",
                  "events.get",
                  "events.mostRecentBySeverity",
                  "events.patch",
                  "events.post",
                  "experience.delete",
                  "experience.bootstrap",
                  "experienceDomain.delete",
                  "experienceDomain.get",
                  "experienceDomain.patch",
                  "experienceDomains.get",
                  "experienceDomains.post",
                  "experienceEndpoint.delete",
                  "experienceEndpoint.get",
                  "experienceEndpoint.patch",
                  "experienceEndpoints.get",
                  "experienceEndpoints.post",
                  "experienceEndpoints.stats",
                  "experienceGroup.delete",
                  "experienceGroup.get",
                  "experienceGroup.patch",
                  "experienceGroups.detailedSummary",
                  "experienceGroups.get",
                  "experienceGroups.post",
                  "experienceSlug.delete",
                  "experienceSlug.get",
                  "experienceSlug.patch",
                  "experienceSlugs.get",
                  "experienceSlugs.post",
                  "experienceUser.delete",
                  "experienceUser.get",
                  "experienceUser.patch",
                  "experienceUsers.detailedSummary",
                  "experienceUsers.get",
                  "experienceUsers.post",
                  "experienceVersion.delete",
                  "experienceVersion.get",
                  "experienceVersion.patch",
                  "experienceVersions.get",
                  "experienceVersions.post",
                  "experienceView.debug",
                  "experienceView.delete",
                  "experienceView.get",
                  "experienceView.patch",
                  "experienceViews.debug",
                  "experienceViews.detailedSummary",
                  "experienceViews.get",
                  "experienceViews.post",
                  "file.get",
                  "file.patch",
                  "file.move",
                  "file.delete",
                  "files.get",
                  "files.post",
                  "flow.debug",
                  "flow.delete",
                  "flow.clearStorageEntries",
                  "flow.get",
                  "flow.getStorageEntries",
                  "flow.log",
                  "flow.patch",
                  "flow.pressVirtualButton",
                  "flow.setStorageEntry",
                  "flows.get",
                  "flows.getByVersion",
                  "flows.import",
                  "flows.post",
                  "flowVersion.delete",
                  "flowVersion.get",
                  "flowVersion.log",
                  "flowVersion.patch",
                  "flowVersions.get",
                  "flowVersions.post",
                  "integration.delete",
                  "integration.get",
                  "integration.patch",
                  "integrations.get",
                  "integrations.post",
                  "webhook.delete",
                  "webhook.get",
                  "webhook.patch",
                  "webhooks.get",
                  "webhooks.post"
                ]
              },
              {
                "type": "string",
                "enum": [
                  "all.Organization",
                  "all.Organization.read",
                  "applications.*",
                  "auditLog.*",
                  "auditLogs.*",
                  "dashboard.*",
                  "dashboards.*",
                  "org.*",
                  "solution.*",
                  "solutions.*",
                  "solutionUser.*",
                  "solutionUsers.*",
                  "applications.get",
                  "applications.post",
                  "auditLog.get",
                  "auditLogs.get",
                  "dashboard.patch",
                  "dashboard.delete",
                  "dashboards.get",
                  "dashboards.post",
                  "org.get",
                  "org.patch",
                  "org.delete",
                  "org.pendingInvites",
                  "org.inviteMember",
                  "org.revokeInvite",
                  "org.modifyMember",
                  "org.removeMember",
                  "org.payloadCounts",
                  "org.invoices",
                  "org.currentCard",
                  "org.chargeDetails",
                  "org.transferResources",
                  "solutionUser.get",
                  "solutionUser.patch",
                  "solutionUser.delete",
                  "solutionUsers.get",
                  "solutionUsers.post",
                  "solution.get",
                  "solution.patch",
                  "solution.delete",
                  "solutions.get",
                  "solutions.post"
                ]
              }
            ]
          },
          {
            "type": "string",
            "enum": [
              "all.User",
              "all.User.read",
              "me.*",
              "orgs.*",
              "me.get",
              "me.patch",
              "me.delete",
              "me.verifyEmail",
              "me.changePassword",
              "me.enableTwoFactorAuth",
              "me.disableTwoFactorAuth",
              "me.disconnectGithub",
              "me.connectGithub",
              "me.disconnectTwitter",
              "me.connectTwitter",
              "me.addRecentItem",
              "me.fetchRecentItems",
              "me.payloadCounts",
              "me.transferResources",
              "orgs.get",
              "orgs.post"
            ]
          }
        ]
      }
    },
    "tokenTTL": {
      "type": "integer",
      "minimum": 0
    }
  },
  "required": [
    "accessToken"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="github-login-example"></a>

```json
{
  "accessToken": "the github access token"
}
```

<br/>
## Integration

Schema for a single Integration

### Schema <a name="integration-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "integrationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "integrationType": {
      "type": "string",
      "enum": [
        "googlePubSub",
        "meridian",
        "mqtt",
        "particle"
      ]
    },
    "enabled": {
      "type": "boolean"
    },
    "topics": {
      "type": "array",
      "items": {
        "type": "string",
        "minLength": 1,
        "maxLength": 1024
      }
    },
    "googlePubSubConfig": {
      "type": "object",
      "properties": {
        "projectId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "keyJson": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        }
      },
      "additionalProperties": false,
      "required": [
        "projectId",
        "keyJson"
      ]
    },
    "mqttConfig": {
      "type": "object",
      "properties": {
        "clientId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "username": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "password": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "clean": {
          "type": "boolean"
        },
        "port": {
          "type": "number",
          "minimum": 1,
          "maximum": 65535
        },
        "protocol": {
          "type": "string",
          "enum": [
            "mqtt",
            "mqtts",
            "ws",
            "wss"
          ]
        },
        "host": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "privateKey": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        },
        "certificate": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        },
        "caCertificate": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        }
      },
      "additionalProperties": false,
      "required": [
        "port",
        "protocol",
        "host"
      ]
    },
    "particleConfig": {
      "type": "object",
      "properties": {
        "accessToken": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "productSlugOrId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "orgSlugOrId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "deviceNameOrId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        }
      },
      "additionalProperties": false,
      "required": [
        "accessToken"
      ]
    },
    "meridianConfig": {
      "type": "object",
      "properties": {
        "authenticationToken": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "locationId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "assetUpdates": {
          "type": "boolean"
        },
        "zoneUpdates": {
          "type": "boolean"
        }
      },
      "additionalProperties": false,
      "required": [
        "authenticationToken",
        "locationId"
      ]
    },
    "status": {
      "lastKeepAlive": {
        "type": [
          "number"
        ]
      },
      "nextAttempt": {
        "type": [
          "number"
        ]
      },
      "connectInfo": {
        "type": "object",
        "properties": {
          "ts": {
            "type": [
              "number",
              "null"
            ]
          }
        }
      },
      "disconnectInfo": {
        "type": "object",
        "properties": {
          "ts": {
            "type": [
              "number",
              "null"
            ]
          },
          "error": {
            "type": "string"
          }
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="integration-example"></a>

```json
{
  "id": "58ec07f20c747f65243d0d76",
  "integrationId": "58ec07f20c747f65243d0d76",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "Example Integrations",
  "integrationType": "mqtt",
  "enabled": true,
  "topics": [
    "myTopic"
  ],
  "mqttConfig": {
    "clientId": "exampleClientId",
    "username": "exampleUsername",
    "password": "examplePassword",
    "port": 8883,
    "protocol": "mqtts",
    "host": "broker.example.com"
  },
  "status": {
    "lastKeepAlive": 1491863679994,
    "connectInfo": {
      "ts": 1490629589313
    },
    "disconnectInfo": {
      "ts": 1490629587190,
      "error": "Keepalive Timeout"
    }
  }
}
```

<br/>
## Integration Patch

Schema for the body of an Integration modification request

### Schema <a name="integration-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "integrationType": {
      "type": "string",
      "enum": [
        "googlePubSub",
        "meridian",
        "mqtt",
        "particle"
      ]
    },
    "enabled": {
      "type": "boolean"
    },
    "topics": {
      "type": "array",
      "items": {
        "type": "string",
        "minLength": 1,
        "maxLength": 1024
      }
    },
    "googlePubSubConfig": {
      "type": "object",
      "properties": {
        "projectId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "keyJson": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        }
      },
      "additionalProperties": false,
      "required": [
        "projectId",
        "keyJson"
      ]
    },
    "mqttConfig": {
      "type": "object",
      "properties": {
        "clientId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "username": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "password": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "clean": {
          "type": "boolean"
        },
        "port": {
          "type": "number",
          "minimum": 1,
          "maximum": 65535
        },
        "protocol": {
          "type": "string",
          "enum": [
            "mqtt",
            "mqtts",
            "ws",
            "wss"
          ]
        },
        "host": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "privateKey": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        },
        "certificate": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        },
        "caCertificate": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        }
      },
      "additionalProperties": false,
      "required": [
        "port",
        "protocol",
        "host"
      ]
    },
    "particleConfig": {
      "type": "object",
      "properties": {
        "accessToken": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "productSlugOrId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "orgSlugOrId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "deviceNameOrId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        }
      },
      "additionalProperties": false,
      "required": [
        "accessToken"
      ]
    },
    "meridianConfig": {
      "type": "object",
      "properties": {
        "authenticationToken": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "locationId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "assetUpdates": {
          "type": "boolean"
        },
        "zoneUpdates": {
          "type": "boolean"
        }
      },
      "additionalProperties": false,
      "required": [
        "authenticationToken",
        "locationId"
      ]
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="integration-patch-example"></a>

```json
{
  "topics": [
    "differentTopic"
  ]
}
```

<br/>
## Integration Post

Schema for the body of an Integration creation request

### Schema <a name="integration-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "integrationType": {
      "type": "string",
      "enum": [
        "googlePubSub",
        "meridian",
        "mqtt",
        "particle"
      ]
    },
    "enabled": {
      "type": "boolean"
    },
    "topics": {
      "type": "array",
      "items": {
        "type": "string",
        "minLength": 1,
        "maxLength": 1024
      }
    },
    "googlePubSubConfig": {
      "type": "object",
      "properties": {
        "projectId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "keyJson": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        }
      },
      "additionalProperties": false,
      "required": [
        "projectId",
        "keyJson"
      ]
    },
    "mqttConfig": {
      "type": "object",
      "properties": {
        "clientId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "username": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "password": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "clean": {
          "type": "boolean"
        },
        "port": {
          "type": "number",
          "minimum": 1,
          "maximum": 65535
        },
        "protocol": {
          "type": "string",
          "enum": [
            "mqtt",
            "mqtts",
            "ws",
            "wss"
          ]
        },
        "host": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "privateKey": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        },
        "certificate": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        },
        "caCertificate": {
          "type": "string",
          "maxLength": 32767,
          "minLength": 50
        }
      },
      "additionalProperties": false,
      "required": [
        "port",
        "protocol",
        "host"
      ]
    },
    "particleConfig": {
      "type": "object",
      "properties": {
        "accessToken": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "productSlugOrId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "orgSlugOrId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "deviceNameOrId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        }
      },
      "additionalProperties": false,
      "required": [
        "accessToken"
      ]
    },
    "meridianConfig": {
      "type": "object",
      "properties": {
        "authenticationToken": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "locationId": {
          "type": "string",
          "minLength": 1,
          "maxLength": 1024
        },
        "assetUpdates": {
          "type": "boolean"
        },
        "zoneUpdates": {
          "type": "boolean"
        }
      },
      "additionalProperties": false,
      "required": [
        "authenticationToken",
        "locationId"
      ]
    }
  },
  "additionalProperties": false,
  "required": [
    "name",
    "integrationType"
  ]
}
```

<small></small>

### Example <a name="integration-post-example"></a>

```json
{
  "name": "Example Integrations",
  "integrationType": "mqtt",
  "topics": [
    "myTopic"
  ],
  "mqttConfig": {
    "clientId": "exampleClientId",
    "username": "exampleUsername",
    "password": "examplePassword",
    "port": 8883,
    "protocol": "mqtts",
    "host": "broker.example.com"
  }
}
```

<br/>
## Integrations

Schema for a collection of Integrations

### Schema <a name="integrations-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Integration",
        "description": "Schema for a single Integration",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "integrationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "integrationType": {
            "type": "string",
            "enum": [
              "googlePubSub",
              "meridian",
              "mqtt",
              "particle"
            ]
          },
          "enabled": {
            "type": "boolean"
          },
          "topics": {
            "type": "array",
            "items": {
              "type": "string",
              "minLength": 1,
              "maxLength": 1024
            }
          },
          "googlePubSubConfig": {
            "type": "object",
            "properties": {
              "projectId": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "keyJson": {
                "type": "string",
                "maxLength": 32767,
                "minLength": 50
              }
            },
            "additionalProperties": false,
            "required": [
              "projectId",
              "keyJson"
            ]
          },
          "mqttConfig": {
            "type": "object",
            "properties": {
              "clientId": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "username": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "password": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "clean": {
                "type": "boolean"
              },
              "port": {
                "type": "number",
                "minimum": 1,
                "maximum": 65535
              },
              "protocol": {
                "type": "string",
                "enum": [
                  "mqtt",
                  "mqtts",
                  "ws",
                  "wss"
                ]
              },
              "host": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "privateKey": {
                "type": "string",
                "maxLength": 32767,
                "minLength": 50
              },
              "certificate": {
                "type": "string",
                "maxLength": 32767,
                "minLength": 50
              },
              "caCertificate": {
                "type": "string",
                "maxLength": 32767,
                "minLength": 50
              }
            },
            "additionalProperties": false,
            "required": [
              "port",
              "protocol",
              "host"
            ]
          },
          "particleConfig": {
            "type": "object",
            "properties": {
              "accessToken": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "productSlugOrId": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "orgSlugOrId": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "deviceNameOrId": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              }
            },
            "additionalProperties": false,
            "required": [
              "accessToken"
            ]
          },
          "meridianConfig": {
            "type": "object",
            "properties": {
              "authenticationToken": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "locationId": {
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },
              "assetUpdates": {
                "type": "boolean"
              },
              "zoneUpdates": {
                "type": "boolean"
              }
            },
            "additionalProperties": false,
            "required": [
              "authenticationToken",
              "locationId"
            ]
          },
          "status": {
            "lastKeepAlive": {
              "type": [
                "number"
              ]
            },
            "nextAttempt": {
              "type": [
                "number"
              ]
            },
            "connectInfo": {
              "type": "object",
              "properties": {
                "ts": {
                  "type": [
                    "number",
                    "null"
                  ]
                }
              }
            },
            "disconnectInfo": {
              "type": "object",
              "properties": {
                "ts": {
                  "type": [
                    "number",
                    "null"
                  ]
                },
                "error": {
                  "type": "string"
                }
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="integrations-example"></a>

```json
{
  "items": [
    {
      "$ref": "#/examples/integrations"
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
## Last Value Data

Schema for the result of a last value query

### Schema <a name="last-value-data-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "patternProperties": {
    "^[A-Fa-f\\d]{24}$": {
      "type": "object",
      "properties": {
        "time": {
          "type": "string",
          "format": "date-time"
        },
        "data": {
          "type": "object",
          "patternProperties": {
            "^[0-9a-zA-Z_-]{1,255}$": {
              "type": [
                "number",
                "string",
                "boolean"
              ]
            }
          },
          "additionalProperties": false
        }
      },
      "additionalProperties": false,
      "required": [
        "data",
        "time"
      ]
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="last-value-data-example"></a>

```json
{
  "575ecf887ae143cd83dc4aa2": {
    "time": "2016-06-13T04:00:00.000Z",
    "data": {
      "voltage": 12
    }
  },
  "575ef5c97ae143cd83dc4aac": {
    "time": "2016-06-12T08:30:00.000Z",
    "data": {
      "voltage": 19
    }
  }
}
```

<br/>
## Last Value Query

Schema for the body of a last value query request

### Schema <a name="last-value-query-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "attribute": {
      "type": "string",
      "pattern": "^[0-9a-zA-Z_-]{1,255}$"
    },
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="last-value-query-example"></a>

```json
{
  "deviceIds": [
    "575ecf887ae143cd83dc4aa2",
    "575ef5c97ae143cd83dc4aac"
  ],
  "attribute": "voltage"
}
```

<br/>
## Me

Schema for information about the currently authenticated user

### Schema <a name="me-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "userId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "passwordLastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "companyName": {
      "type": "string",
      "maxLength": 1024
    },
    "title": {
      "type": "string",
      "maxLength": 1024
    },
    "phoneNumber": {
      "type": "string",
      "maxLength": 1024
    },
    "location": {
      "type": "string",
      "maxLength": 1024
    },
    "url": {
      "type": "string",
      "maxLength": 1024
    },
    "tokenCutoff": {
      "type": "string",
      "format": "date-time"
    },
    "emailVerified": {
      "type": "boolean"
    },
    "twoFactorAuthEnabled": {
      "type": "boolean"
    },
    "fullName": {
      "type": "string"
    },
    "githubName": {
      "type": "string"
    },
    "twitterName": {
      "type": "string"
    },
    "avatarUrl": {
      "type": "string",
      "format": "url"
    },
    "limits": {
      "apitoken": {
        "type": "number"
      },
      "application": {
        "type": "number"
      },
      "applicationkey": {
        "type": "number"
      },
      "dashboard": {
        "type": "number"
      },
      "datatable": {
        "type": "number"
      },
      "device": {
        "type": "number"
      },
      "devicerecipe": {
        "type": "number"
      },
      "experiencedomain": {
        "type": "number"
      },
      "experienceendpoint": {
        "type": "number"
      },
      "experiencegroup": {
        "type": "number"
      },
      "experienceslug": {
        "type": "number"
      },
      "experienceuser": {
        "type": "number"
      },
      "experienceversion": {
        "type": "number"
      },
      "experienceview": {
        "type": "number"
      },
      "file": {
        "type": "number"
      },
      "flow": {
        "type": "number"
      },
      "integration": {
        "type": "number"
      },
      "webhook": {
        "type": "number"
      },
      "dataTTL": {
        "type": "number"
      },
      "payload": {
        "type": "number"
      }
    },
    "recentDashboards": {
      "title": "Recent Item List",
      "description": "Schema for an array of recent items",
      "type": "object",
      "properties": {
        "itemType": {
          "type": "string",
          "enum": [
            "application",
            "device",
            "flow",
            "dashboard",
            "organization"
          ]
        },
        "parentId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "items": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "name": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            }
          }
        }
      }
    },
    "recentApplications": {
      "title": "Recent Item List",
      "description": "Schema for an array of recent items",
      "type": "object",
      "properties": {
        "itemType": {
          "type": "string",
          "enum": [
            "application",
            "device",
            "flow",
            "dashboard",
            "organization"
          ]
        },
        "parentId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "items": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "name": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            }
          }
        }
      }
    },
    "recentOrganizations": {
      "title": "Recent Item List",
      "description": "Schema for an array of recent items",
      "type": "object",
      "properties": {
        "itemType": {
          "type": "string",
          "enum": [
            "application",
            "device",
            "flow",
            "dashboard",
            "organization"
          ]
        },
        "parentId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "items": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "name": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            }
          }
        }
      }
    },
    "summary": {
      "type": "object",
      "properties": {
        "apiTokenCount": {
          "type": "number"
        },
        "appCount": {
          "type": "number"
        },
        "keyCount": {
          "type": "number"
        },
        "dashCount": {
          "type": "number"
        },
        "dataTableCount": {
          "type": "number"
        },
        "deviceCount": {
          "type": "number"
        },
        "deviceRecipeCount": {
          "type": "number"
        },
        "experienceDomainCount": {
          "type": "number"
        },
        "experienceEndpointCount": {
          "type": "number"
        },
        "experienceGroupCount": {
          "type": "number"
        },
        "experienceSlugCount": {
          "type": "number"
        },
        "experienceUserCount": {
          "type": "number"
        },
        "experienceVersionCount": {
          "type": "number"
        },
        "experienceViewCount": {
          "type": "number"
        },
        "fileCount": {
          "type": "number"
        },
        "flowCount": {
          "type": "number"
        },
        "orgCount": {
          "type": "number"
        },
        "payloadCount": {
          "title": "Payload Counts",
          "description": "Schema for the result of a payload count request",
          "type": "object",
          "properties": {
            "mqttOut": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "mqttIn": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "dataTable": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "deviceState": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "deviceCommand": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "webhook": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "timer": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "event": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "virtualButton": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "deviceConnect": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "deviceDisconnect": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "endpoint": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "integration": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            }
          }
        },
        "integrationCount": {
          "type": "number"
        },
        "webhookCount": {
          "type": "number"
        }
      }
    },
    "currentPeriodStart": {
      "type": "string",
      "format": "date-time"
    },
    "currentPeriodEnd": {
      "type": "string",
      "format": "date-time"
    }
  }
}
```

<small></small>

### Example <a name="me-example"></a>

```json
{
  "id": "575ed70c7ae143cd83dc4aa9",
  "userId": "575ed70c7ae143cd83dc4aa9",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "passwordLastUpdated": "2016-06-13T04:00:00.000Z",
  "email": "example@losant.com",
  "firstName": "Example",
  "lastName": "Name",
  "companyName": "Losant IoT, Inc.",
  "url": "https://www.losant.com",
  "emailVerified": true,
  "twoFactorAuthEnabled": false,
  "fullName": "Example Name",
  "summary": {
    "appCount": 8,
    "dashCount": 5,
    "orgCount": 2,
    "deviceCount": 12,
    "flowCount": 3,
    "webhookCount": 0,
    "keyCount": 2,
    "deviceRecipeCount": 0
  }
}
```

<br/>
## Me Patch

Schema for the body of request to modify the current user

### Schema <a name="me-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "companyName": {
      "type": "string",
      "maxLength": 1024
    },
    "title": {
      "type": "string",
      "maxLength": 1024
    },
    "phoneNumber": {
      "type": "string",
      "maxLength": 1024
    },
    "location": {
      "type": "string",
      "maxLength": 1024
    },
    "url": {
      "type": "string",
      "maxLength": 1024
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048,
      "pattern": "^(?=.*[A-Z])(?=.*[^A-z0-9])(?=.*[0-9])(?=.*[a-z]).{8,}$"
    },
    "tokenCutoff": {
      "type": "string",
      "format": "date-time"
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="me-patch-example"></a>

```json
{
  "email": "example@losant.com",
  "firstName": "Example",
  "lastName": "Name",
  "companyName": "Losant IoT, Inc.",
  "url": "https://www.losant.com",
  "password": "my new password"
}
```

<br/>
## MQTT Publish Body

Schema for the body an MQTT Publish Message request

### Schema <a name="mqtt-publish-body-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "topic": {
      "type": "string",
      "minLength": 1,
      "maxLength": 230
    },
    "message": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "required": [
    "topic",
    "message"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="mqtt-publish-body-example"></a>

```json
{
  "topic": "an/mqtt/topic",
  "message": "The MQTT message!"
}
```

<br/>
## Multi Device Command

Schema for the body of a request to send a command to multiple Devices

### Schema <a name="multi-device-command-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "time": {
      "oneOf": [
        {
          "type": "string"
        },
        {
          "type": "number"
        },
        {
          "type": "object",
          "properties": {
            "$date": {
              "type": "string"
            }
          },
          "additionalProperties": false,
          "required": [
            "$date"
          ]
        }
      ]
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "payload": {},
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    }
  },
  "required": [
    "name"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="multi-device-command-example"></a>

```json
{
  "time": "2016-06-13T04:00:00.000Z",
  "name": "myCommand",
  "payload": [
    1,
    1,
    2,
    3,
    5
  ],
  "deviceTags": [
    {
      "key": "floor",
      "value": 8
    }
  ]
}
```

<br/>
## Organization

Schema for a single Organization

### Schema <a name="organization-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "solutionsEnabled": {
      "type": "boolean"
    },
    "members": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "userId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "firstName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "lastName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "email": {
            "type": "string",
            "format": "email",
            "maxLength": 1024
          },
          "avatarUrl": {
            "type": "string",
            "format": "url"
          },
          "role": {
            "type": "string",
            "enum": [
              "admin",
              "edit",
              "collaborate",
              "view",
              "none"
            ]
          },
          "applicationRoles": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "resourceId": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "role": {
                  "type": "string",
                  "enum": [
                    "collaborate",
                    "view",
                    "none"
                  ]
                }
              },
              "required": [
                "resourceId",
                "role"
              ],
              "additionalProperties": false
            },
            "maxItems": 1000
          },
          "dashboardRoles": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "resourceId": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "role": {
                  "type": "string",
                  "enum": [
                    "collaborate",
                    "view",
                    "none"
                  ]
                }
              },
              "required": [
                "resourceId",
                "role"
              ],
              "additionalProperties": false
            },
            "maxItems": 1000
          }
        }
      }
    },
    "limits": {
      "apitoken": {
        "type": "number"
      },
      "application": {
        "type": "number"
      },
      "applicationkey": {
        "type": "number"
      },
      "dashboard": {
        "type": "number"
      },
      "datatable": {
        "type": "number"
      },
      "device": {
        "type": "number"
      },
      "devicerecipe": {
        "type": "number"
      },
      "experiencedomain": {
        "type": "number"
      },
      "experienceendpoint": {
        "type": "number"
      },
      "experiencegroup": {
        "type": "number"
      },
      "experienceslug": {
        "type": "number"
      },
      "experienceuser": {
        "type": "number"
      },
      "experienceversion": {
        "type": "number"
      },
      "experienceview": {
        "type": "number"
      },
      "file": {
        "type": "number"
      },
      "flow": {
        "type": "number"
      },
      "solution": {
        "type": "number"
      },
      "integration": {
        "type": "number"
      },
      "webhook": {
        "type": "number"
      },
      "dataTTL": {
        "type": "number"
      },
      "member": {
        "type": "number"
      },
      "payload": {
        "type": "number"
      }
    },
    "summary": {
      "type": "object",
      "properties": {
        "apiTokenCount": {
          "type": "number"
        },
        "appCount": {
          "type": "number"
        },
        "keyCount": {
          "type": "number"
        },
        "dashCount": {
          "type": "number"
        },
        "dataTableCount": {
          "type": "number"
        },
        "deviceCount": {
          "type": "number"
        },
        "deviceRecipeCount": {
          "type": "number"
        },
        "experienceDomainCount": {
          "type": "number"
        },
        "experienceEndpointCount": {
          "type": "number"
        },
        "experienceGroupCount": {
          "type": "number"
        },
        "experienceSlugCount": {
          "type": "number"
        },
        "experienceUserCount": {
          "type": "number"
        },
        "experienceVersionCount": {
          "type": "number"
        },
        "experienceViewCount": {
          "type": "number"
        },
        "fileCount": {
          "type": "number"
        },
        "flowCount": {
          "type": "number"
        },
        "memberCount": {
          "type": "number"
        },
        "pendingInviteCount": {
          "type": "number"
        },
        "payloadCount": {
          "title": "Payload Counts",
          "description": "Schema for the result of a payload count request",
          "type": "object",
          "properties": {
            "mqttOut": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "mqttIn": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "dataTable": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "deviceState": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "deviceCommand": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "webhook": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "timer": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "event": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "virtualButton": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "deviceConnect": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "deviceDisconnect": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "endpoint": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            },
            "integration": {
              "type": "object",
              "patternProperties": {
                ".*": {
                  "type": "number"
                }
              }
            }
          }
        },
        "solutionCount": {
          "type": "number"
        },
        "integrationCount": {
          "type": "number"
        },
        "webhookCount": {
          "type": "number"
        }
      }
    },
    "planId": {
      "type": "string",
      "maxLength": 1024
    },
    "billingEmail": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "subscriptionStatus": {
      "type": "string",
      "enum": [
        "trialing",
        "active",
        "past_due",
        "canceled",
        "unpaid"
      ]
    },
    "currentPeriodStart": {
      "type": "string",
      "format": "date-time"
    },
    "currentPeriodEnd": {
      "type": "string",
      "format": "date-time"
    },
    "isEnterprise": {
      "type": "boolean"
    },
    "iconColor": {
      "type": "string"
    }
  }
}
```

<small></small>

### Example <a name="organization-example"></a>

```json
{
  "id": "575ed6e87ae143cd83dc4aa8",
  "orgId": "575ed6e87ae143cd83dc4aa8",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Organization",
  "description": "My organization description",
  "members": [
    {
      "userId": "575ed70c7ae143cd83dc4aa9",
      "firstName": "Example",
      "lastName": "Name",
      "email": "example@losant.com",
      "role": "admin"
    },
    {
      "userId": "575ef90f7ae143cd83dc4aad",
      "firstName": "Other View",
      "lastName": "Only User",
      "email": "viewer@losant.com",
      "role": "view"
    }
  ],
  "summary": {
    "appCount": 2,
    "dashCount": 1,
    "solutionCount": 0,
    "deviceCount": 12,
    "flowCount": 3,
    "webhookCount": 0,
    "keyCount": 2,
    "deviceRecipeCount": 0
  }
}
```

<br/>
## Organization Invitation Action

Schema for the body of a request to accept or reject an invitation

### Schema <a name="organization-invitation-action-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "token": {
      "type": "string",
      "minLength": 1
    },
    "accept": {
      "type": "boolean"
    }
  },
  "additionalProperties": false,
  "required": [
    "email",
    "token",
    "accept"
  ]
}
```

<small></small>

### Example <a name="organization-invitation-action-example"></a>

```json
{
  "email": "invitedUser@losant.com",
  "token": "the_invitation_token",
  "accept": true
}
```

<br/>
## Organization Invitation Information

Schema for information about an invitation

### Schema <a name="organization-invitation-information-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "orgName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "role": {
      "type": "string",
      "enum": [
        "admin",
        "edit",
        "collaborate",
        "view",
        "none"
      ]
    },
    "inviteDate": {
      "type": "string",
      "format": "date-time"
    },
    "ttl": {
      "type": "number"
    }
  }
}
```

<small></small>

### Example <a name="organization-invitation-information-example"></a>

```json
{
  "orgName": "My Organization",
  "email": "invitedUser@losant.com",
  "role": "edit",
  "inviteDate": "2016-05-13T04:00:00.000Z",
  "ttl": 4233600000
}
```

<br/>
## Organization Invitation Post

Schema for the body of a request to send an invitation

### Schema <a name="organization-invitation-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "role": {
      "type": "string",
      "enum": [
        "admin",
        "edit",
        "collaborate",
        "view",
        "none"
      ]
    },
    "applicationRoles": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "resourceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "role": {
            "type": "string",
            "enum": [
              "collaborate",
              "view",
              "none"
            ]
          }
        },
        "required": [
          "resourceId",
          "role"
        ],
        "additionalProperties": false
      },
      "maxItems": 1000
    },
    "dashboardRoles": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "resourceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "role": {
            "type": "string",
            "enum": [
              "collaborate",
              "view",
              "none"
            ]
          }
        },
        "required": [
          "resourceId",
          "role"
        ],
        "additionalProperties": false
      },
      "maxItems": 1000
    }
  },
  "additionalProperties": false,
  "required": [
    "email",
    "role"
  ]
}
```

<small></small>

### Example <a name="organization-invitation-post-example"></a>

```json
{
  "email": "invitedUser@losant.com",
  "role": "edit"
}
```

<br/>
## Organization Invitation Result

Schema for the result of accepting/rejecting an invitation

### Schema <a name="organization-invitation-result-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "accepted": {
      "type": "boolean"
    },
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="organization-invitation-result-example"></a>

```json
{
  "accepted": true,
  "orgId": "575ed6e87ae143cd83dc4aa8"
}
```

<br/>
## Organization Invitations

Schema for an array of pending invitations to an Organization

### Schema <a name="organization-invitations-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "id": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "email": {
        "type": "string",
        "format": "email",
        "maxLength": 1024
      },
      "role": {
        "type": "string",
        "enum": [
          "admin",
          "edit",
          "collaborate",
          "view",
          "none"
        ]
      },
      "applicationRoles": {
        "type": "array",
        "items": {
          "type": "object",
          "properties": {
            "resourceId": {
              "type": "string",
              "pattern": "^[A-Fa-f\\d]{24}$"
            },
            "role": {
              "type": "string",
              "enum": [
                "collaborate",
                "view",
                "none"
              ]
            }
          },
          "required": [
            "resourceId",
            "role"
          ],
          "additionalProperties": false
        },
        "maxItems": 1000
      },
      "dashboardRoles": {
        "type": "array",
        "items": {
          "type": "object",
          "properties": {
            "resourceId": {
              "type": "string",
              "pattern": "^[A-Fa-f\\d]{24}$"
            },
            "role": {
              "type": "string",
              "enum": [
                "collaborate",
                "view",
                "none"
              ]
            }
          },
          "required": [
            "resourceId",
            "role"
          ],
          "additionalProperties": false
        },
        "maxItems": 1000
      },
      "inviteDate": {
        "type": "string",
        "format": "date-time"
      },
      "ttl": {
        "type": "number"
      },
      "hasExpired": {
        "type": "boolean"
      }
    }
  }
}
```

<small></small>

### Example <a name="organization-invitations-example"></a>

```json
[
  {
    "id": "575ed71e7ae143cd83dc4aaa",
    "email": "invitedUser@losant.com",
    "role": "edit",
    "inviteDate": "2016-05-13T04:00:00.000Z",
    "ttl": 4233600000,
    "hasExpired": true
  }
]
```

<br/>
## Organization Member Patch

Schema for the body of a request to modify an Organization member

### Schema <a name="organization-member-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "userId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "role": {
      "type": "string",
      "enum": [
        "admin",
        "edit",
        "collaborate",
        "view",
        "none"
      ]
    },
    "applicationRoles": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "resourceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "role": {
            "type": "string",
            "enum": [
              "collaborate",
              "view",
              "none"
            ]
          }
        },
        "required": [
          "resourceId",
          "role"
        ],
        "additionalProperties": false
      },
      "maxItems": 1000
    },
    "dashboardRoles": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "resourceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "role": {
            "type": "string",
            "enum": [
              "collaborate",
              "view",
              "none"
            ]
          }
        },
        "required": [
          "resourceId",
          "role"
        ],
        "additionalProperties": false
      },
      "maxItems": 1000
    }
  },
  "additionalProperties": false,
  "required": [
    "userId"
  ]
}
```

<small></small>

### Example <a name="organization-member-patch-example"></a>

```json
{
  "userId": "575ef90f7ae143cd83dc4aad",
  "role": "view"
}
```

<br/>
## Organization Patch

Schema for the body of an Organization modification request

### Schema <a name="organization-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "planId": {
      "type": "string",
      "maxLength": 1024
    },
    "billingEmail": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "cardToken": {
      "type": "string",
      "maxLength": 1024
    },
    "iconColor": {
      "type": "string"
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="organization-patch-example"></a>

```json
{
  "name": "My Updated Organization",
  "description": "Description of my updated organization"
}
```

<br/>
## Organization Post

Schema for the body of an Organization creation request

### Schema <a name="organization-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "planId": {
      "type": "string",
      "maxLength": 1024
    },
    "billingEmail": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "cardToken": {
      "type": "string",
      "maxLength": 1024
    },
    "iconColor": {
      "type": "string"
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```

<small></small>

### Example <a name="organization-post-example"></a>

```json
{
  "name": "My New Organization",
  "description": "Description of my new organization"
}
```

<br/>
## Organizations

Schema for a collection of Organizations

### Schema <a name="organizations-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Organization",
        "description": "Schema for a single Organization",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "orgId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "solutionsEnabled": {
            "type": "boolean"
          },
          "members": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "userId": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "firstName": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 1024
                },
                "lastName": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 1024
                },
                "email": {
                  "type": "string",
                  "format": "email",
                  "maxLength": 1024
                },
                "avatarUrl": {
                  "type": "string",
                  "format": "url"
                },
                "role": {
                  "type": "string",
                  "enum": [
                    "admin",
                    "edit",
                    "collaborate",
                    "view",
                    "none"
                  ]
                },
                "applicationRoles": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "resourceId": {
                        "type": "string",
                        "pattern": "^[A-Fa-f\\d]{24}$"
                      },
                      "role": {
                        "type": "string",
                        "enum": [
                          "collaborate",
                          "view",
                          "none"
                        ]
                      }
                    },
                    "required": [
                      "resourceId",
                      "role"
                    ],
                    "additionalProperties": false
                  },
                  "maxItems": 1000
                },
                "dashboardRoles": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "resourceId": {
                        "type": "string",
                        "pattern": "^[A-Fa-f\\d]{24}$"
                      },
                      "role": {
                        "type": "string",
                        "enum": [
                          "collaborate",
                          "view",
                          "none"
                        ]
                      }
                    },
                    "required": [
                      "resourceId",
                      "role"
                    ],
                    "additionalProperties": false
                  },
                  "maxItems": 1000
                }
              }
            }
          },
          "limits": {
            "apitoken": {
              "type": "number"
            },
            "application": {
              "type": "number"
            },
            "applicationkey": {
              "type": "number"
            },
            "dashboard": {
              "type": "number"
            },
            "datatable": {
              "type": "number"
            },
            "device": {
              "type": "number"
            },
            "devicerecipe": {
              "type": "number"
            },
            "experiencedomain": {
              "type": "number"
            },
            "experienceendpoint": {
              "type": "number"
            },
            "experiencegroup": {
              "type": "number"
            },
            "experienceslug": {
              "type": "number"
            },
            "experienceuser": {
              "type": "number"
            },
            "experienceversion": {
              "type": "number"
            },
            "experienceview": {
              "type": "number"
            },
            "file": {
              "type": "number"
            },
            "flow": {
              "type": "number"
            },
            "solution": {
              "type": "number"
            },
            "integration": {
              "type": "number"
            },
            "webhook": {
              "type": "number"
            },
            "dataTTL": {
              "type": "number"
            },
            "member": {
              "type": "number"
            },
            "payload": {
              "type": "number"
            }
          },
          "summary": {
            "type": "object",
            "properties": {
              "apiTokenCount": {
                "type": "number"
              },
              "appCount": {
                "type": "number"
              },
              "keyCount": {
                "type": "number"
              },
              "dashCount": {
                "type": "number"
              },
              "dataTableCount": {
                "type": "number"
              },
              "deviceCount": {
                "type": "number"
              },
              "deviceRecipeCount": {
                "type": "number"
              },
              "experienceDomainCount": {
                "type": "number"
              },
              "experienceEndpointCount": {
                "type": "number"
              },
              "experienceGroupCount": {
                "type": "number"
              },
              "experienceSlugCount": {
                "type": "number"
              },
              "experienceUserCount": {
                "type": "number"
              },
              "experienceVersionCount": {
                "type": "number"
              },
              "experienceViewCount": {
                "type": "number"
              },
              "fileCount": {
                "type": "number"
              },
              "flowCount": {
                "type": "number"
              },
              "memberCount": {
                "type": "number"
              },
              "pendingInviteCount": {
                "type": "number"
              },
              "payloadCount": {
                "title": "Payload Counts",
                "description": "Schema for the result of a payload count request",
                "type": "object",
                "properties": {
                  "mqttOut": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "mqttIn": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "dataTable": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "deviceState": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "deviceCommand": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "webhook": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "timer": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "event": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "virtualButton": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "deviceConnect": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "deviceDisconnect": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "endpoint": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  },
                  "integration": {
                    "type": "object",
                    "patternProperties": {
                      ".*": {
                        "type": "number"
                      }
                    }
                  }
                }
              },
              "solutionCount": {
                "type": "number"
              },
              "integrationCount": {
                "type": "number"
              },
              "webhookCount": {
                "type": "number"
              }
            }
          },
          "planId": {
            "type": "string",
            "maxLength": 1024
          },
          "billingEmail": {
            "type": "string",
            "format": "email",
            "maxLength": 1024
          },
          "subscriptionStatus": {
            "type": "string",
            "enum": [
              "trialing",
              "active",
              "past_due",
              "canceled",
              "unpaid"
            ]
          },
          "currentPeriodStart": {
            "type": "string",
            "format": "date-time"
          },
          "currentPeriodEnd": {
            "type": "string",
            "format": "date-time"
          },
          "isEnterprise": {
            "type": "boolean"
          },
          "iconColor": {
            "type": "string"
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    }
  }
}
```

<small></small>

### Example <a name="organizations-example"></a>

```json
{
  "items": [
    {
      "id": "575ed6e87ae143cd83dc4aa8",
      "orgId": "575ed6e87ae143cd83dc4aa8",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Organization",
      "description": "My organization description",
      "members": [
        {
          "userId": "575ed70c7ae143cd83dc4aa9",
          "firstName": "Example",
          "lastName": "Name",
          "email": "example@losant.com",
          "role": "admin"
        },
        {
          "userId": "575ef90f7ae143cd83dc4aad",
          "firstName": "Other View",
          "lastName": "Only User",
          "email": "viewer@losant.com",
          "role": "view"
        }
      ],
      "summary": {
        "appCount": 2,
        "dashCount": 1,
        "solutionCount": 0,
        "deviceCount": 12,
        "flowCount": 3,
        "webhookCount": 0,
        "keyCount": 2,
        "deviceRecipeCount": 0
      }
    }
  ],
  "count": 1,
  "totalCount": 2,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc"
}
```

<br/>
## Password Reset Finish

Schema for the body of a request to complete the reset password flow

### Schema <a name="password-reset-finish-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "token": {
      "type": "string",
      "minLength": 1
    },
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048,
      "pattern": "^(?=.*[A-Z])(?=.*[^A-z0-9])(?=.*[0-9])(?=.*[a-z]).{8,}$"
    },
    "solutionId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "required": [
    "token",
    "email",
    "password"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="password-reset-finish-example"></a>

```json
{
  "token": "the_password_reset_token",
  "email": "example@losant.com",
  "password": "the new password"
}
```

<br/>
## Password Reset Input

Schema for the body of a request to start the reset password flow

### Schema <a name="password-reset-input-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "solutionId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "required": [
    "email"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="password-reset-input-example"></a>

```json
{
  "email": "example@losant.com"
}
```

<br/>
## Password Reset Response

Schema for result of a successful password reset

### Schema <a name="password-reset-response-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "success": {
      "type": "boolean",
      "enum": [
        true
      ]
    },
    "accountIsLocked": {
      "type": "boolean"
    },
    "twoFactorAuthEnabled": {
      "type": "boolean"
    }
  }
}
```

<small></small>

### Example <a name="password-reset-response-example"></a>

```json
{
  "success": true,
  "accountIsLocked": false,
  "twoFactorAuthEnabled": false
}
```

<br/>
## Payload Counts

Schema for the result of a payload count request

### Schema <a name="payload-counts-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "mqttOut": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "mqttIn": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "dataTable": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "deviceState": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "deviceCommand": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "webhook": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "timer": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "event": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "virtualButton": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "deviceConnect": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "deviceDisconnect": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "endpoint": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    },
    "integration": {
      "type": "object",
      "patternProperties": {
        ".*": {
          "type": "number"
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="payload-counts-example"></a>

```json
{
  "timer": {
    "timer.flow": 19772
  },
  "deviceState": {
    "flow.flow": 5215,
    "device.mqtt": 1244049
  },
  "mqttOut": {
    "device.mqtt": 12
  },
  "webhook": {
    "public.rest": 1713284
  },
  "deviceConnect": {
    "device.mqtt": 1016
  },
  "deviceDisconnect": {
    "device.mqtt": 1016
  }
}
```

<br/>
## Recent Item

Schema for the body of a request to add a recent item

### Schema <a name="recent-item-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "itemType": {
      "type": "string",
      "enum": [
        "application",
        "device",
        "flow",
        "dashboard",
        "organization"
      ]
    },
    "parentId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "itemId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "required": [
    "itemType",
    "itemId"
  ]
}
```

<small></small>

### Example <a name="recent-item-example"></a>

```json
{
  "itemType": "device",
  "parentId": "575ec8687ae143cd83dc4a97",
  "itemId": "575ecf887ae143cd83dc4aa2"
}
```

<br/>
## Recent Item List

Schema for an array of recent items

### Schema <a name="recent-item-list-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "itemType": {
      "type": "string",
      "enum": [
        "application",
        "device",
        "flow",
        "dashboard",
        "organization"
      ]
    },
    "parentId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "items": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="recent-item-list-example"></a>

```json
{
  "itemType": "application",
  "items": [
    {
      "id": "575ec8687ae143cd83dc4a97",
      "name": "My Application"
    },
    {
      "id": "575efbcc7ae143cd83dc4aae",
      "name": "My Other Application"
    }
  ]
}
```

<br/>
## Resource Transfer

Schema for the body of a resource transfer request

### Schema <a name="resource-transfer-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "destinationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "destinationType": {
      "type": "string",
      "enum": [
        "user",
        "organization"
      ]
    },
    "applicationIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "dashboardIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "solutionIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "strict": {
      "type": "boolean"
    }
  },
  "additionalProperties": false,
  "required": [
    "destinationId",
    "destinationType"
  ]
}
```

<small></small>

### Example <a name="resource-transfer-example"></a>

```json
{
  "destinationId": "575ed6e87ae143cd83dc4aa8",
  "destinationType": "organization",
  "applicationIds": [
    "575ec8687ae143cd83dc4a97"
  ]
}
```

<br/>
## Solution

Schema for a single Solution

### Schema <a name="solution-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "solutionId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "slug": {
      "type": "string",
      "minLength": 4,
      "maxLength": 63,
      "pattern": "^[0-9a-z-]*$"
    },
    "allowSelfDeletion": {
      "type": "boolean"
    },
    "allowSelfEmailChange": {
      "type": "boolean"
    },
    "passwordReset": {
      "type": "object",
      "properties": {
        "allowPasswordReset": {
          "type": "boolean"
        },
        "emailSubject": {
          "type": "string",
          "maxLength": 255
        },
        "emailBody": {
          "type": "string",
          "maxLength": 32767
        },
        "emailFrom": {
          "type": "string",
          "format": "email",
          "maxLength": 1024
        }
      }
    },
    "summary": {
      "type": "object",
      "properties": {
        "solutionUserCount": {
          "type": "number"
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="solution-example"></a>

```json
{
  "id": "57955788124b37010084c053",
  "solutionId": "57955788124b37010084c053",
  "orgId": "575ed6e87ae143cd83dc4aa8",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Solution",
  "slug": "my_solution",
  "allowSelfDeletion": false,
  "allowSelfEmailChange": false,
  "summary": {
    "solutionUserCount": 0
  }
}
```

<br/>
## Solution Me

Schema for information about the currently authenticated solution user

### Schema <a name="solution-me-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "solutionUserId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "passwordLastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "lastLogin": {
      "type": "string",
      "format": "date-time"
    },
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "companyName": {
      "type": "string",
      "maxLength": 1024
    },
    "title": {
      "type": "string",
      "maxLength": 1024
    },
    "phoneNumber": {
      "type": "string",
      "maxLength": 1024
    },
    "location": {
      "type": "string",
      "maxLength": 1024
    },
    "url": {
      "type": "string",
      "maxLength": 1024
    },
    "forcePasswordResetOnNextLogin": {
      "type": "boolean"
    },
    "fullName": {
      "type": "string"
    },
    "twoFactorAuthEnabled": {
      "type": "boolean"
    },
    "avatarUrl": {
      "type": "string",
      "format": "url"
    },
    "accessRestrictions": {
      "type": "object",
      "properties": {
        "dashboardIds": {
          "type": "array",
          "items": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "maxItems": 1000
        }
      }
    },
    "recentDashboards": {
      "title": "Recent Item List",
      "description": "Schema for an array of recent items",
      "type": "object",
      "properties": {
        "itemType": {
          "type": "string",
          "enum": [
            "application",
            "device",
            "flow",
            "dashboard",
            "organization"
          ]
        },
        "parentId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "items": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "name": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            }
          }
        }
      }
    },
    "solution": {
      "id": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "slug": {
        "type": "string",
        "pattern": "^[0-9a-z_-]{1,255}$"
      },
      "name": {
        "type": "string",
        "minLength": 1,
        "maxLength": 255
      },
      "allowSelfDeletion": {
        "type": "boolean"
      },
      "allowSelfEmailChange": {
        "type": "boolean"
      }
    }
  }
}
```

<small></small>

### Example <a name="solution-me-example"></a>

```json
{
  "id": "566116085df4b701000258e3",
  "solutionUserId": "566116085df4b701000258e3",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "passwordLastUpdated": "2016-06-13T04:00:00.000Z",
  "email": "example@solutionuser.com",
  "firstName": "Example",
  "lastName": "Name",
  "companyName": "Losant IoT, Inc.",
  "url": "https://www.losant.com",
  "twoFactorAuthEnabled": false,
  "fullName": "Example Name",
  "solution": {
    "id": "57955788124b37010084c053",
    "slug": "my_solution",
    "name": "My Solution",
    "allowSelfDeletion": false,
    "allowSelfEmailChange": false
  }
}
```

<br/>
## Solution Patch

Schema for the body of a Solution modification request

### Schema <a name="solution-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "slug": {
      "type": "string",
      "pattern": "^[0-9a-z_-]{1,255}$"
    },
    "allowSelfDeletion": {
      "type": "boolean"
    },
    "allowSelfEmailChange": {
      "type": "boolean"
    },
    "passwordReset": {
      "type": "object",
      "properties": {
        "allowPasswordReset": {
          "type": "boolean"
        },
        "emailSubject": {
          "type": "string",
          "maxLength": 255
        },
        "emailBody": {
          "type": "string",
          "maxLength": 32767
        },
        "emailFrom": {
          "type": "string",
          "format": "email",
          "maxLength": 1024
        }
      },
      "additionalProperties": false
    },
    "additionalProperties": false
  }
}
```

<small></small>

### Example <a name="solution-patch-example"></a>

```json
{
  "name": "My Updated Solution",
  "allowSelfDeletion": true
}
```

<br/>
## Solution Post

Schema for the body of a Solution creation request

### Schema <a name="solution-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "slug": {
      "type": "string",
      "pattern": "^[0-9a-z_-]{1,255}$"
    },
    "allowSelfDeletion": {
      "type": "boolean"
    },
    "allowSelfEmailChange": {
      "type": "boolean"
    },
    "passwordReset": {
      "type": "object",
      "properties": {
        "allowPasswordReset": {
          "type": "boolean"
        },
        "emailSubject": {
          "type": "string",
          "maxLength": 255
        },
        "emailBody": {
          "type": "string",
          "maxLength": 32767
        },
        "emailFrom": {
          "type": "string",
          "format": "email",
          "maxLength": 1024
        }
      },
      "additionalProperties": false
    },
    "required": [
      "name",
      "slug"
    ],
    "additionalProperties": false
  }
}
```

<small></small>

### Example <a name="solution-post-example"></a>

```json
{
  "name": "My New Solution",
  "slug": "my_new_solution"
}
```

<br/>
## Solution User

Schema for a single Solution User

### Schema <a name="solution-user-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "solutionUserId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "solutionId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "passwordLastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "lastLogin": {
      "type": "string",
      "format": "date-time"
    },
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "companyName": {
      "type": "string",
      "maxLength": 1024
    },
    "title": {
      "type": "string",
      "maxLength": 1024
    },
    "phoneNumber": {
      "type": "string",
      "maxLength": 1024
    },
    "location": {
      "type": "string",
      "maxLength": 1024
    },
    "url": {
      "type": "string",
      "maxLength": 1024
    },
    "forcePasswordResetOnNextLogin": {
      "type": "boolean"
    },
    "fullName": {
      "type": "string"
    },
    "twoFactorAuthEnabled": {
      "type": "boolean"
    },
    "avatarUrl": {
      "type": "string",
      "format": "url"
    },
    "tokenCutoff": {
      "type": "string",
      "format": "date-time"
    },
    "accessRestrictions": {
      "type": "object",
      "properties": {
        "dashboardIds": {
          "type": "array",
          "items": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "maxItems": 1000
        }
      }
    }
  }
}
```

<small></small>

### Example <a name="solution-user-example"></a>

```json
{
  "id": "566116085df4b701000258e3",
  "solutionUserId": "566116085df4b701000258e3",
  "solutionId": "57955788124b37010084c053",
  "orgId": "575ed6e87ae143cd83dc4aa8",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "passwordLastUpdated": "2016-06-13T04:00:00.000Z",
  "lastLogin": "2016-06-13T04:00:00.000Z",
  "email": "example@solutionuser.com",
  "firstName": "Example",
  "lastName": "Name",
  "forcePasswordResetOnNextLogin": false,
  "fullName": "Example Name",
  "twoFactorAuthEnabled": false,
  "avatarUrl": "https://example.avatar.url/is_here.png",
  "accessRestrictions": {
    "dashboardIds": [
      "575ece2b7ae143cd83dc4a9b",
      "575ece2b7ae143cd83dc4a9c"
    ]
  }
}
```

<br/>
## Solution User Credentials

Schema for the body of a Solution User authentication request

### Schema <a name="solution-user-credentials-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "solutionId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048
    },
    "twoFactorCode": {
      "type": "string",
      "maxLength": 2048
    },
    "tokenTTL": {
      "type": "integer",
      "minimum": 0
    }
  },
  "required": [
    "solutionId",
    "email",
    "password"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="solution-user-credentials-example"></a>

```json
{
  "solutionId": "57955788124b37010084c053",
  "email": "example@solutionuser.com",
  "password": "this is the password"
}
```

<br/>
## Solution User Patch

Schema for the body of a Solution User modification request

### Schema <a name="solution-user-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "companyName": {
      "type": "string",
      "maxLength": 1024
    },
    "title": {
      "type": "string",
      "maxLength": 1024
    },
    "phoneNumber": {
      "type": "string",
      "maxLength": 1024
    },
    "location": {
      "type": "string",
      "maxLength": 1024
    },
    "url": {
      "type": "string",
      "maxLength": 1024
    },
    "forcePasswordResetOnNextLogin": {
      "type": "boolean"
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048,
      "pattern": "^(?=.*[A-Z])(?=.*[^A-z0-9])(?=.*[0-9])(?=.*[a-z]).{8,}$"
    },
    "twoFactorAuthKey": {
      "type": "string",
      "minLength": 52,
      "maxLength": 52
    },
    "tokenCutoff": {
      "type": "string",
      "format": "date-time"
    },
    "accessRestrictions": {
      "type": "object",
      "properties": {
        "dashboardIds": {
          "type": "array",
          "items": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "maxItems": 1000
        },
        "additionalProperties": false
      }
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="solution-user-patch-example"></a>

```json
{
  "password": "aNewUserPassword",
  "forcePasswordResetOnNextLogin": true
}
```

<br/>
## Solution User Post

Schema for the body of a Solution User creation request

### Schema <a name="solution-user-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "companyName": {
      "type": "string",
      "maxLength": 1024
    },
    "title": {
      "type": "string",
      "maxLength": 1024
    },
    "phoneNumber": {
      "type": "string",
      "maxLength": 1024
    },
    "location": {
      "type": "string",
      "maxLength": 1024
    },
    "url": {
      "type": "string",
      "maxLength": 1024
    },
    "forcePasswordResetOnNextLogin": {
      "type": "boolean"
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048,
      "pattern": "^(?=.*[A-Z])(?=.*[^A-z0-9])(?=.*[0-9])(?=.*[a-z]).{8,}$"
    },
    "twoFactorAuthKey": {
      "type": "string",
      "minLength": 52,
      "maxLength": 52
    },
    "tokenCutoff": {
      "type": "string",
      "format": "date-time"
    },
    "accessRestrictions": {
      "type": "object",
      "properties": {
        "dashboardIds": {
          "type": "array",
          "items": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "maxItems": 1000
        },
        "additionalProperties": false
      }
    }
  },
  "required": [
    "email",
    "firstName",
    "lastName",
    "password"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="solution-user-post-example"></a>

```json
{
  "email": "example@solutionuser.com",
  "firstName": "Example",
  "lastName": "Name",
  "password": "aUserPassword",
  "accessRestrictions": {
    "dashboardIds": [
      "575ece2b7ae143cd83dc4a9b",
      "575ece2b7ae143cd83dc4a9c"
    ]
  }
}
```

<br/>
## Solution Users

Schema for a collection of Solution Users

### Schema <a name="solution-users-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Solution User",
        "description": "Schema for a single Solution User",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "solutionUserId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "solutionId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "orgId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "passwordLastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "lastLogin": {
            "type": "string",
            "format": "date-time"
          },
          "email": {
            "type": "string",
            "format": "email",
            "maxLength": 1024
          },
          "firstName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "lastName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "companyName": {
            "type": "string",
            "maxLength": 1024
          },
          "title": {
            "type": "string",
            "maxLength": 1024
          },
          "phoneNumber": {
            "type": "string",
            "maxLength": 1024
          },
          "location": {
            "type": "string",
            "maxLength": 1024
          },
          "url": {
            "type": "string",
            "maxLength": 1024
          },
          "forcePasswordResetOnNextLogin": {
            "type": "boolean"
          },
          "fullName": {
            "type": "string"
          },
          "twoFactorAuthEnabled": {
            "type": "boolean"
          },
          "avatarUrl": {
            "type": "string",
            "format": "url"
          },
          "tokenCutoff": {
            "type": "string",
            "format": "date-time"
          },
          "accessRestrictions": {
            "type": "object",
            "properties": {
              "dashboardIds": {
                "type": "array",
                "items": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "maxItems": 1000
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "solutionId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="solution-users-example"></a>

```json
{
  "items": [
    {
      "id": "566116085df4b701000258e3",
      "solutionUserId": "566116085df4b701000258e3",
      "solutionId": "57955788124b37010084c053",
      "orgId": "575ed6e87ae143cd83dc4aa8",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "passwordLastUpdated": "2016-06-13T04:00:00.000Z",
      "lastLogin": "2016-06-13T04:00:00.000Z",
      "email": "example@solutionuser.com",
      "firstName": "Example",
      "lastName": "Name",
      "forcePasswordResetOnNextLogin": false,
      "fullName": "Example Name",
      "twoFactorAuthEnabled": false,
      "avatarUrl": "https://example.avatar.url/is_here.png",
      "accessRestrictions": {
        "dashboardIds": [
          "575ece2b7ae143cd83dc4a9b",
          "575ece2b7ae143cd83dc4a9c"
        ]
      }
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "solutionId": "57955788124b37010084c053",
  "orgId": "575ed6e87ae143cd83dc4aa8"
}
```

<br/>
## Solutions

Schema for a collection of Solutions

### Schema <a name="solutions-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Solution",
        "description": "Schema for a single Solution",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "solutionId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "orgId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "slug": {
            "type": "string",
            "minLength": 4,
            "maxLength": 63,
            "pattern": "^[0-9a-z-]*$"
          },
          "allowSelfDeletion": {
            "type": "boolean"
          },
          "allowSelfEmailChange": {
            "type": "boolean"
          },
          "passwordReset": {
            "type": "object",
            "properties": {
              "allowPasswordReset": {
                "type": "boolean"
              },
              "emailSubject": {
                "type": "string",
                "maxLength": 255
              },
              "emailBody": {
                "type": "string",
                "maxLength": 32767
              },
              "emailFrom": {
                "type": "string",
                "format": "email",
                "maxLength": 1024
              }
            }
          },
          "summary": {
            "type": "object",
            "properties": {
              "solutionUserCount": {
                "type": "number"
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="solutions-example"></a>

```json
{
  "items": [
    {
      "id": "57955788124b37010084c053",
      "solutionId": "57955788124b37010084c053",
      "orgId": "575ed6e87ae143cd83dc4aa8",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Solution",
      "slug": "my_solution",
      "allowSelfDeletion": false,
      "allowSelfEmailChange": false,
      "summary": {
        "solutionUserCount": 0
      }
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "orgId": "575ed6e87ae143cd83dc4aa8"
}
```

<br/>
## Success

Schema for reporting a successful operation

### Schema <a name="success-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "success": {
      "type": "boolean",
      "enum": [
        true
      ]
    }
  }
}
```

<small></small>

### Example <a name="success-example"></a>

```json
{
  "success": true
}
```

<br/>
## Time Series Data

Schema for the result of a time series query

### Schema <a name="time-series-data-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "start": {
      "type": "string",
      "format": "date-time"
    },
    "end": {
      "type": "string",
      "format": "date-time"
    },
    "resolution": {
      "type": "number"
    },
    "aggregation": {
      "type": "string",
      "enum": [
        "FIRST",
        "LAST",
        "COUNT",
        "MAX",
        "MIN",
        "MEDIAN",
        "MEAN",
        "SUM",
        "STD_DEV",
        "NONE"
      ]
    },
    "devices": {
      "type": "object",
      "patternProperties": {
        "^[A-Fa-f\\d]{24}$": {
          "type": "object",
          "properties": {
            "name": {
              "type": "string",
              "minLength": 1,
              "maxLength": 255
            },
            "points": {
              "type": "array",
              "items": {
                "type": "object",
                "properties": {
                  "time": {
                    "type": "string",
                    "format": "date-time"
                  },
                  "data": {
                    "type": "object",
                    "patternProperties": {
                      "^[0-9a-zA-Z_-]{1,255}$": {
                        "type": [
                          "number",
                          "string",
                          "boolean"
                        ]
                      }
                    },
                    "additionalProperties": false
                  }
                },
                "additionalProperties": false,
                "required": [
                  "data",
                  "time"
                ]
              }
            }
          },
          "additionalProperties": false,
          "required": [
            "name",
            "points"
          ]
        }
      },
      "additionalProperties": false
    }
  },
  "additionalProperties": false,
  "required": [
    "start",
    "end",
    "resolution",
    "aggregation",
    "devices"
  ]
}
```

<small></small>

### Example <a name="time-series-data-example"></a>

```json
{
  "start": "2016-06-15T03:50:00.000Z",
  "end": "2016-06-15T04:00:00.000Z",
  "resolution": 300000,
  "aggregation": "MEAN",
  "devices": {
    "575ecf887ae143cd83dc4aa2": {
      "name": "My Device",
      "points": [
        {
          "time": "2016-06-15T03:50:00.000Z",
          "data": {
            "voltage": 10.3
          }
        },
        {
          "time": "2016-06-15T03:55:00.000Z",
          "data": {
            "voltage": 12.7
          }
        }
      ]
    },
    "575ef5c97ae143cd83dc4aac": {
      "name": "My Other Device",
      "points": [
        {
          "time": "2016-06-15T03:50:00.000Z",
          "data": {
            "voltage": 10.3
          }
        },
        {
          "time": "2016-06-15T03:55:00.000Z",
          "data": {
            "voltage": 12.7
          }
        }
      ]
    }
  }
}
```

<br/>
## Time Series Query

Schema for the body of a time series query request

### Schema <a name="time-series-query-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "start": {
      "type": "number"
    },
    "end": {
      "type": "number"
    },
    "duration": {
      "type": "number"
    },
    "resolution": {
      "type": "number"
    },
    "aggregation": {
      "type": "string",
      "enum": [
        "FIRST",
        "LAST",
        "COUNT",
        "MAX",
        "MIN",
        "MEDIAN",
        "MEAN",
        "SUM",
        "STD_DEV",
        "NONE"
      ]
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[0-9a-zA-Z_-]{1,255}$"
      }
    },
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      },
      "maxItems": 100
    },
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "maxItems": 1000
    },
    "limit": {
      "type": "number"
    },
    "order": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ],
      "default": "asc"
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="time-series-query-example"></a>

```json
{
  "end": 0,
  "duration": 600000,
  "resolution": 300000,
  "aggregation": "MEAN",
  "attributes": [
    "voltage"
  ],
  "deviceTags": [
    {
      "key": "floor",
      "value": "8"
    }
  ]
}
```

<br/>
## User Credentials

Schema for the body of a User authentication request

### Schema <a name="user-credentials-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048
    },
    "twoFactorCode": {
      "type": "string",
      "maxLength": 2048
    },
    "requestedScopes": {
      "type": "array",
      "uniqueItems": true,
      "items": {
        "oneOf": [
          {
            "oneOf": [
              {
                "type": "string",
                "enum": [
                  "all.Application",
                  "all.Application.read",
                  "all.Device",
                  "all.Device.read",
                  "application.*",
                  "applicationApiToken.*",
                  "applicationApiTokens.*",
                  "applicationKey.*",
                  "applicationKeys.*",
                  "data.*",
                  "dataTable.*",
                  "dataTables.*",
                  "dataTableRow.*",
                  "dataTableRows.*",
                  "device.*",
                  "deviceRecipe.*",
                  "deviceRecipes.*",
                  "devices.*",
                  "edgeDeployments.*",
                  "event.*",
                  "events.*",
                  "experience.*",
                  "experienceDomain.*",
                  "experienceDomains.*",
                  "experienceEndpoint.*",
                  "experienceEndpoints.*",
                  "experienceGroup.*",
                  "experienceGroups.*",
                  "experienceSlug.*",
                  "experienceSlugs.*",
                  "experienceUser.*",
                  "experienceUsers.*",
                  "experienceVersion.*",
                  "experienceVersions.*",
                  "experienceView.*",
                  "experienceViews.*",
                  "integration.*",
                  "integrations.*",
                  "file.*",
                  "files.*",
                  "flow.*",
                  "flows.*",
                  "flowVersion.*",
                  "flowVersions.*",
                  "webhook.*",
                  "webhooks.*",
                  "application.archiveData",
                  "application.backfillArchiveData",
                  "application.debug",
                  "application.delete",
                  "application.get",
                  "application.mqttPublishMessage",
                  "application.mqttSubscriptionStream",
                  "application.patch",
                  "application.payloadCounts",
                  "applicationApiToken.delete",
                  "applicationApiToken.get",
                  "applicationApiToken.patch",
                  "applicationApiTokens.get",
                  "applicationApiTokens.post",
                  "applicationKey.delete",
                  "applicationKey.get",
                  "applicationKey.patch",
                  "applicationKeys.get",
                  "applicationKeys.post",
                  "data.lastValueQuery",
                  "data.timeSeriesQuery",
                  "dataTable.addColumn",
                  "dataTable.delete",
                  "dataTable.get",
                  "dataTable.patch",
                  "dataTable.removeColumn",
                  "dataTableRow.delete",
                  "dataTableRow.get",
                  "dataTableRow.patch",
                  "dataTableRows.get",
                  "dataTableRows.post",
                  "dataTableRows.query",
                  "dataTableRows.export",
                  "dataTableRows.delete",
                  "dataTableRows.truncate",
                  "dataTables.get",
                  "dataTables.post",
                  "device.commandStream",
                  "device.debug",
                  "device.delete",
                  "device.export",
                  "device.get",
                  "device.getCommand",
                  "device.getCompositeState",
                  "device.getLogEntries",
                  "device.getState",
                  "device.patch",
                  "device.removeData",
                  "device.sendCommand",
                  "device.sendState",
                  "device.setConnectionStatus",
                  "device.stateStream",
                  "deviceRecipe.bulkCreate",
                  "deviceRecipe.delete",
                  "deviceRecipe.get",
                  "deviceRecipe.patch",
                  "deviceRecipes.get",
                  "deviceRecipes.post",
                  "devices.detailedSummary",
                  "devices.export",
                  "devices.get",
                  "devices.post",
                  "devices.sendCommand",
                  "edgeDeployments.get",
                  "edgeDeployments.release",
                  "edgeDeployments.remove",
                  "edgeDeployments.replace",
                  "event.delete",
                  "event.get",
                  "event.patch",
                  "events.get",
                  "events.mostRecentBySeverity",
                  "events.patch",
                  "events.post",
                  "experience.delete",
                  "experience.bootstrap",
                  "experienceDomain.delete",
                  "experienceDomain.get",
                  "experienceDomain.patch",
                  "experienceDomains.get",
                  "experienceDomains.post",
                  "experienceEndpoint.delete",
                  "experienceEndpoint.get",
                  "experienceEndpoint.patch",
                  "experienceEndpoints.get",
                  "experienceEndpoints.post",
                  "experienceEndpoints.stats",
                  "experienceGroup.delete",
                  "experienceGroup.get",
                  "experienceGroup.patch",
                  "experienceGroups.detailedSummary",
                  "experienceGroups.get",
                  "experienceGroups.post",
                  "experienceSlug.delete",
                  "experienceSlug.get",
                  "experienceSlug.patch",
                  "experienceSlugs.get",
                  "experienceSlugs.post",
                  "experienceUser.delete",
                  "experienceUser.get",
                  "experienceUser.patch",
                  "experienceUsers.detailedSummary",
                  "experienceUsers.get",
                  "experienceUsers.post",
                  "experienceVersion.delete",
                  "experienceVersion.get",
                  "experienceVersion.patch",
                  "experienceVersions.get",
                  "experienceVersions.post",
                  "experienceView.debug",
                  "experienceView.delete",
                  "experienceView.get",
                  "experienceView.patch",
                  "experienceViews.debug",
                  "experienceViews.detailedSummary",
                  "experienceViews.get",
                  "experienceViews.post",
                  "file.get",
                  "file.patch",
                  "file.move",
                  "file.delete",
                  "files.get",
                  "files.post",
                  "flow.debug",
                  "flow.delete",
                  "flow.clearStorageEntries",
                  "flow.get",
                  "flow.getStorageEntries",
                  "flow.log",
                  "flow.patch",
                  "flow.pressVirtualButton",
                  "flow.setStorageEntry",
                  "flows.get",
                  "flows.getByVersion",
                  "flows.import",
                  "flows.post",
                  "flowVersion.delete",
                  "flowVersion.get",
                  "flowVersion.log",
                  "flowVersion.patch",
                  "flowVersions.get",
                  "flowVersions.post",
                  "integration.delete",
                  "integration.get",
                  "integration.patch",
                  "integrations.get",
                  "integrations.post",
                  "webhook.delete",
                  "webhook.get",
                  "webhook.patch",
                  "webhooks.get",
                  "webhooks.post"
                ]
              },
              {
                "type": "string",
                "enum": [
                  "all.Organization",
                  "all.Organization.read",
                  "applications.*",
                  "auditLog.*",
                  "auditLogs.*",
                  "dashboard.*",
                  "dashboards.*",
                  "org.*",
                  "solution.*",
                  "solutions.*",
                  "solutionUser.*",
                  "solutionUsers.*",
                  "applications.get",
                  "applications.post",
                  "auditLog.get",
                  "auditLogs.get",
                  "dashboard.patch",
                  "dashboard.delete",
                  "dashboards.get",
                  "dashboards.post",
                  "org.get",
                  "org.patch",
                  "org.delete",
                  "org.pendingInvites",
                  "org.inviteMember",
                  "org.revokeInvite",
                  "org.modifyMember",
                  "org.removeMember",
                  "org.payloadCounts",
                  "org.invoices",
                  "org.currentCard",
                  "org.chargeDetails",
                  "org.transferResources",
                  "solutionUser.get",
                  "solutionUser.patch",
                  "solutionUser.delete",
                  "solutionUsers.get",
                  "solutionUsers.post",
                  "solution.get",
                  "solution.patch",
                  "solution.delete",
                  "solutions.get",
                  "solutions.post"
                ]
              }
            ]
          },
          {
            "type": "string",
            "enum": [
              "all.User",
              "all.User.read",
              "me.*",
              "orgs.*",
              "me.get",
              "me.patch",
              "me.delete",
              "me.verifyEmail",
              "me.changePassword",
              "me.enableTwoFactorAuth",
              "me.disableTwoFactorAuth",
              "me.disconnectGithub",
              "me.connectGithub",
              "me.disconnectTwitter",
              "me.connectTwitter",
              "me.addRecentItem",
              "me.fetchRecentItems",
              "me.payloadCounts",
              "me.transferResources",
              "orgs.get",
              "orgs.post"
            ]
          }
        ]
      }
    },
    "tokenTTL": {
      "type": "integer",
      "minimum": 0
    }
  },
  "required": [
    "email",
    "password"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="user-credentials-example"></a>

```json
{
  "email": "example@losant.com",
  "password": "this is the password"
}
```

<br/>
## User Post

Schema for the body of a User creation request

### Schema <a name="user-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "companyName": {
      "type": "string",
      "maxLength": 1024
    },
    "title": {
      "type": "string",
      "maxLength": 1024
    },
    "phoneNumber": {
      "type": "string",
      "maxLength": 1024
    },
    "location": {
      "type": "string",
      "maxLength": 1024
    },
    "url": {
      "type": "string",
      "maxLength": 1024
    },
    "oauth": {
      "type": "object",
      "properties": {
        "service": {
          "type": "string"
        },
        "accessToken": {
          "type": "string"
        }
      },
      "required": [
        "service",
        "accessToken"
      ]
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048,
      "pattern": "^(?=.*[A-Z])(?=.*[^A-z0-9])(?=.*[0-9])(?=.*[a-z]).{8,}$"
    },
    "acceptTerms": {
      "enum": [
        "on"
      ]
    },
    "hsToken": {
      "type": "string",
      "maxLength": 1024
    },
    "iotJourneyStage": {
      "type": "string",
      "maxLength": 1024
    },
    "requestedScopes": {
      "type": "array",
      "uniqueItems": true,
      "items": {
        "oneOf": [
          {
            "oneOf": [
              {
                "type": "string",
                "enum": [
                  "all.Application",
                  "all.Application.read",
                  "all.Device",
                  "all.Device.read",
                  "application.*",
                  "applicationApiToken.*",
                  "applicationApiTokens.*",
                  "applicationKey.*",
                  "applicationKeys.*",
                  "data.*",
                  "dataTable.*",
                  "dataTables.*",
                  "dataTableRow.*",
                  "dataTableRows.*",
                  "device.*",
                  "deviceRecipe.*",
                  "deviceRecipes.*",
                  "devices.*",
                  "edgeDeployments.*",
                  "event.*",
                  "events.*",
                  "experience.*",
                  "experienceDomain.*",
                  "experienceDomains.*",
                  "experienceEndpoint.*",
                  "experienceEndpoints.*",
                  "experienceGroup.*",
                  "experienceGroups.*",
                  "experienceSlug.*",
                  "experienceSlugs.*",
                  "experienceUser.*",
                  "experienceUsers.*",
                  "experienceVersion.*",
                  "experienceVersions.*",
                  "experienceView.*",
                  "experienceViews.*",
                  "integration.*",
                  "integrations.*",
                  "file.*",
                  "files.*",
                  "flow.*",
                  "flows.*",
                  "flowVersion.*",
                  "flowVersions.*",
                  "webhook.*",
                  "webhooks.*",
                  "application.archiveData",
                  "application.backfillArchiveData",
                  "application.debug",
                  "application.delete",
                  "application.get",
                  "application.mqttPublishMessage",
                  "application.mqttSubscriptionStream",
                  "application.patch",
                  "application.payloadCounts",
                  "applicationApiToken.delete",
                  "applicationApiToken.get",
                  "applicationApiToken.patch",
                  "applicationApiTokens.get",
                  "applicationApiTokens.post",
                  "applicationKey.delete",
                  "applicationKey.get",
                  "applicationKey.patch",
                  "applicationKeys.get",
                  "applicationKeys.post",
                  "data.lastValueQuery",
                  "data.timeSeriesQuery",
                  "dataTable.addColumn",
                  "dataTable.delete",
                  "dataTable.get",
                  "dataTable.patch",
                  "dataTable.removeColumn",
                  "dataTableRow.delete",
                  "dataTableRow.get",
                  "dataTableRow.patch",
                  "dataTableRows.get",
                  "dataTableRows.post",
                  "dataTableRows.query",
                  "dataTableRows.export",
                  "dataTableRows.delete",
                  "dataTableRows.truncate",
                  "dataTables.get",
                  "dataTables.post",
                  "device.commandStream",
                  "device.debug",
                  "device.delete",
                  "device.export",
                  "device.get",
                  "device.getCommand",
                  "device.getCompositeState",
                  "device.getLogEntries",
                  "device.getState",
                  "device.patch",
                  "device.removeData",
                  "device.sendCommand",
                  "device.sendState",
                  "device.setConnectionStatus",
                  "device.stateStream",
                  "deviceRecipe.bulkCreate",
                  "deviceRecipe.delete",
                  "deviceRecipe.get",
                  "deviceRecipe.patch",
                  "deviceRecipes.get",
                  "deviceRecipes.post",
                  "devices.detailedSummary",
                  "devices.export",
                  "devices.get",
                  "devices.post",
                  "devices.sendCommand",
                  "edgeDeployments.get",
                  "edgeDeployments.release",
                  "edgeDeployments.remove",
                  "edgeDeployments.replace",
                  "event.delete",
                  "event.get",
                  "event.patch",
                  "events.get",
                  "events.mostRecentBySeverity",
                  "events.patch",
                  "events.post",
                  "experience.delete",
                  "experience.bootstrap",
                  "experienceDomain.delete",
                  "experienceDomain.get",
                  "experienceDomain.patch",
                  "experienceDomains.get",
                  "experienceDomains.post",
                  "experienceEndpoint.delete",
                  "experienceEndpoint.get",
                  "experienceEndpoint.patch",
                  "experienceEndpoints.get",
                  "experienceEndpoints.post",
                  "experienceEndpoints.stats",
                  "experienceGroup.delete",
                  "experienceGroup.get",
                  "experienceGroup.patch",
                  "experienceGroups.detailedSummary",
                  "experienceGroups.get",
                  "experienceGroups.post",
                  "experienceSlug.delete",
                  "experienceSlug.get",
                  "experienceSlug.patch",
                  "experienceSlugs.get",
                  "experienceSlugs.post",
                  "experienceUser.delete",
                  "experienceUser.get",
                  "experienceUser.patch",
                  "experienceUsers.detailedSummary",
                  "experienceUsers.get",
                  "experienceUsers.post",
                  "experienceVersion.delete",
                  "experienceVersion.get",
                  "experienceVersion.patch",
                  "experienceVersions.get",
                  "experienceVersions.post",
                  "experienceView.debug",
                  "experienceView.delete",
                  "experienceView.get",
                  "experienceView.patch",
                  "experienceViews.debug",
                  "experienceViews.detailedSummary",
                  "experienceViews.get",
                  "experienceViews.post",
                  "file.get",
                  "file.patch",
                  "file.move",
                  "file.delete",
                  "files.get",
                  "files.post",
                  "flow.debug",
                  "flow.delete",
                  "flow.clearStorageEntries",
                  "flow.get",
                  "flow.getStorageEntries",
                  "flow.log",
                  "flow.patch",
                  "flow.pressVirtualButton",
                  "flow.setStorageEntry",
                  "flows.get",
                  "flows.getByVersion",
                  "flows.import",
                  "flows.post",
                  "flowVersion.delete",
                  "flowVersion.get",
                  "flowVersion.log",
                  "flowVersion.patch",
                  "flowVersions.get",
                  "flowVersions.post",
                  "integration.delete",
                  "integration.get",
                  "integration.patch",
                  "integrations.get",
                  "integrations.post",
                  "webhook.delete",
                  "webhook.get",
                  "webhook.patch",
                  "webhooks.get",
                  "webhooks.post"
                ]
              },
              {
                "type": "string",
                "enum": [
                  "all.Organization",
                  "all.Organization.read",
                  "applications.*",
                  "auditLog.*",
                  "auditLogs.*",
                  "dashboard.*",
                  "dashboards.*",
                  "org.*",
                  "solution.*",
                  "solutions.*",
                  "solutionUser.*",
                  "solutionUsers.*",
                  "applications.get",
                  "applications.post",
                  "auditLog.get",
                  "auditLogs.get",
                  "dashboard.patch",
                  "dashboard.delete",
                  "dashboards.get",
                  "dashboards.post",
                  "org.get",
                  "org.patch",
                  "org.delete",
                  "org.pendingInvites",
                  "org.inviteMember",
                  "org.revokeInvite",
                  "org.modifyMember",
                  "org.removeMember",
                  "org.payloadCounts",
                  "org.invoices",
                  "org.currentCard",
                  "org.chargeDetails",
                  "org.transferResources",
                  "solutionUser.get",
                  "solutionUser.patch",
                  "solutionUser.delete",
                  "solutionUsers.get",
                  "solutionUsers.post",
                  "solution.get",
                  "solution.patch",
                  "solution.delete",
                  "solutions.get",
                  "solutions.post"
                ]
              }
            ]
          },
          {
            "type": "string",
            "enum": [
              "all.User",
              "all.User.read",
              "me.*",
              "orgs.*",
              "me.get",
              "me.patch",
              "me.delete",
              "me.verifyEmail",
              "me.changePassword",
              "me.enableTwoFactorAuth",
              "me.disableTwoFactorAuth",
              "me.disconnectGithub",
              "me.connectGithub",
              "me.disconnectTwitter",
              "me.connectTwitter",
              "me.addRecentItem",
              "me.fetchRecentItems",
              "me.payloadCounts",
              "me.transferResources",
              "orgs.get",
              "orgs.post"
            ]
          }
        ]
      }
    },
    "tokenTTL": {
      "type": "integer",
      "minimum": 0
    }
  },
  "anyOf": [
    {
      "required": [
        "email",
        "firstName",
        "lastName",
        "password",
        "acceptTerms"
      ]
    },
    {
      "required": [
        "email",
        "firstName",
        "lastName",
        "oauth",
        "acceptTerms"
      ]
    }
  ]
}
```

<small></small>

### Example <a name="user-post-example"></a>

```json
{
  "email": "example@losant.com",
  "firstName": "Example",
  "lastName": "Name",
  "companyName": "Losant IoT, Inc.",
  "url": "https://www.losant.com",
  "password": "the new password",
  "acceptTerms": "on"
}
```

<br/>
## Virtual Button Press

Schema for the body of a request to press a Workflow virtual button

### Schema <a name="virtual-button-press-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "key": {
      "type": "string"
    },
    "payload": {},
    "meta": {},
    "flowVersion": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    }
  },
  "required": [
    "key"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="virtual-button-press-example"></a>

```json
{
  "key": "575ed18f7ae143cd83dc4aa6-SJaEw_dV",
  "payload": {
    "some": "data"
  }
}
```

<br/>
## Webhook

Schema for a single Webhook

### Schema <a name="webhook-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "webhookId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "token": {
      "type": "string",
      "minLength": 1
    },
    "responseCode": {
      "type": "integer",
      "minimum": 100,
      "maximum": 599
    },
    "verificationType": {
      "type": "string",
      "enum": [
        "facebook",
        "fitbit",
        "none",
        "twilio",
        "alexa"
      ]
    },
    "verificationCode": {
      "type": "string",
      "maxLength": 32767
    },
    "waitForReply": {
      "type": "boolean"
    },
    "basicAuthUsername": {
      "type": "string",
      "maxLength": 255
    },
    "basicAuthPassword": {
      "type": "string",
      "maxLength": 255
    }
  }
}
```

<small></small>

### Example <a name="webhook-example"></a>

```json
{
  "id": "575ed78e7ae143cd83dc4aab",
  "webhookId": "575ed78e7ae143cd83dc4aab",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Webhook",
  "token": "the_webhook_token",
  "responseCode": 200
}
```

<br/>
## Webhook Patch

Schema for the body of a Webhook modification request

### Schema <a name="webhook-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "responseCode": {
      "type": "integer",
      "minimum": 100,
      "maximum": 599
    },
    "verificationType": {
      "type": "string",
      "enum": [
        "facebook",
        "fitbit",
        "none",
        "twilio",
        "alexa"
      ]
    },
    "verificationCode": {
      "type": "string",
      "maxLength": 32767
    },
    "waitForReply": {
      "type": "boolean"
    },
    "basicAuthUsername": {
      "type": "string",
      "maxLength": 255
    },
    "basicAuthPassword": {
      "type": "string",
      "maxLength": 255
    }
  },
  "additionalProperties": false
}
```

<small></small>

### Example <a name="webhook-patch-example"></a>

```json
{
  "name": "My Updated Webhook",
  "responseCode": 201
}
```

<br/>
## Webhook Post

Schema for the body of a Webhook creation request

### Schema <a name="webhook-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "responseCode": {
      "type": "integer",
      "minimum": 100,
      "maximum": 599
    },
    "verificationType": {
      "type": "string",
      "enum": [
        "facebook",
        "fitbit",
        "none",
        "twilio",
        "alexa"
      ]
    },
    "verificationCode": {
      "type": "string",
      "maxLength": 32767
    },
    "waitForReply": {
      "type": "boolean"
    },
    "basicAuthUsername": {
      "type": "string",
      "maxLength": 255
    },
    "basicAuthPassword": {
      "type": "string",
      "maxLength": 255
    }
  },
  "required": [
    "name"
  ],
  "additionalProperties": false
}
```

<small></small>

### Example <a name="webhook-post-example"></a>

```json
{
  "name": "My New Webhook"
}
```

<br/>
## Webhooks

Schema for a collection of Webhooks

### Schema <a name="webhooks-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Webhook",
        "description": "Schema for a single Webhook",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "webhookId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "token": {
            "type": "string",
            "minLength": 1
          },
          "responseCode": {
            "type": "integer",
            "minimum": 100,
            "maximum": 599
          },
          "verificationType": {
            "type": "string",
            "enum": [
              "facebook",
              "fitbit",
              "none",
              "twilio",
              "alexa"
            ]
          },
          "verificationCode": {
            "type": "string",
            "maxLength": 32767
          },
          "waitForReply": {
            "type": "boolean"
          },
          "basicAuthUsername": {
            "type": "string",
            "maxLength": 255
          },
          "basicAuthPassword": {
            "type": "string",
            "maxLength": 255
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```

<small></small>

### Example <a name="webhooks-example"></a>

```json
{
  "items": [
    {
      "id": "575ed78e7ae143cd83dc4aab",
      "webhookId": "575ed78e7ae143cd83dc4aab",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Webhook",
      "token": "the_webhook_token",
      "responseCode": 200
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
