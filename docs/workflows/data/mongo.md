flowclass: Application
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant MongoDB Node.

# MongoDB

The MongoDB Node allows a workflow to query or update values in a [MongoDB](https://www.mongodb.com/) database and optionally store the result on the workflow payload.

![MongoDB Node](/images/workflows/data/mongodb-node.png "MongoDB Node")

## Configuration

The configuration of the MongoDB Node can be broken down into four major sections - configuring the connection, choosing the operation, setting up the arguments, and choosing what to do with the result.

![MongoDB Node Connection Configuration](/images/workflows/data/mongodb-node-connection.png "MongoDB Node Connection Configuration")

When configuring the connection, you must provide a Mongo [Connection String URI](https://docs.mongodb.com/manual/reference/connection-string/), which must include a database name. You also choose here what collection that the node will be operating on. Both of these fields accept [string templates](/workflows/accessing-payload-data/#string-templates), and so can be configured with values from the current workflow payload. In the example above, the MongoDB Node has been configured to connect to the `embree` database at `example.com` with the username `user` and the password `pass`, and the node will be using the collection `alertMapping`.

![MongoDB Node Operation](/images/workflows/data/mongodb-node-operation.png "MongoDB Node Operation")

Next you will need to choose the operation that will be performed against the database. Currently the node has support for the following operations:

* [Count](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#count)
* [Delete Many](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#deleteMany)
* [Delete One](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#deleteOne)
* [Distinct](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#distinct)
* [Find](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#find)
* [Find One](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#findOne)
* [Insert](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#insert)
* [Insert Many](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#insertMany)
* [Insert One](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#insertOne)
* [Remove](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#remove)
* [Update](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#update)
* [Update Many](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#updateMany)
* [Update One](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#updateOne)

![MongoDB Node Arguments](/images/workflows/data/mongodb-node-arguments.png "MongoDB Node Arguments")

Depending on the chosen operation, the expected arguments here will change. For example,
with the `findOne` operation, there are two arguments - the query itself, and any options
for the query. In the above example, we are not passing any options, but we are passing
a [JSON template](/workflows/accessing-payload-data/#json-templates) - searching for a document in the collection with a deviceId field that
matches the trigger ID that kicked off the run of the workflow. Most of the arguments for the various operations are expected to evaluate to JSON objects, and the node supports [EJSON](https://docs.mongodb.com/manual/reference/mongodb-extended-json/) syntax for specifying things like ObjectIDs.

Both the query argument and the options argument allows users to choose the method by which the value will be set: a [payload path](/workflows/accessing-payload-data/#payload-paths), a [string template](/workflows/accessing-payload-data/#string-templates) or a [JSON template](/workflows/accessing-payload-data/#json-templates).

![MongoDB Node Result](/images/workflows/data/mongodb-node-result.png "MongoDB Node Result")

Finally, you can optionally choose to store the result of the Mongo operation on the payload. For operations like `insert` or `remove`, you might not care about the result, but for an operation like the `findOne` above, you almost certainly do! In this case the result of the `findOne` is being placed at the [payload path](/workflows/accessing-payload-data/#payload-paths) `data.mongoResult`. Here is an example payload after the above MongoDB Node has been run:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "current": 10,
    "on": true,
    "mongoResult": {
      "_id": { "$oid": "576ae72d4c0c31470b856483" },
      "deviceId": { "$oid": "56c8967bb8df0f0100d629120" },
      "phoneNumber": "212 867-5309",
    }
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "56c8967bb8df0f0100d629120",
  "triggerType": "deviceId",
  "deviceTags": {
    "floor": ["2"],
    "location": ["warehouse1"]
  },
  "deviceName": "My Factory Device",
  "flowId": "56c74add04d0b50100043381",
  "flowName": "Power Usage Alert",
  "globals": { }
}
```
