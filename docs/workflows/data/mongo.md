# MongoDB

The MongoDB node allows a workflow to query or update values in a [MongoDB](https://www.mongodb.com/) database and optionally store the result on the workflow payload.

![MongoDB Node](/images/workflows/data/mongodb-node.png "MongoDB Node")

## Configuration

The configuration of the MongoDB node can be broken down into 4 major sections - configuring the connection, chooising the operation, setting up the arguments, and choosing what to do with the result.

![MongoDB Node Connection Configuration](/images/workflows/data/mongodb-node-connection.png "MongoDB Node Connection Configuration")

When configuring the connection, you must provide a Mongo [Connection String URI](https://docs.mongodb.com/manual/reference/connection-string/), which must include a database name. You also choose here what collection that the node will be operating on.  Both of these fields are templatable, and so can be configured with values from the current workflow payload.  In the example above, the mongo node has been configured to connect to the `embree` database at `example.com` with the user name `user` and the password `pass`, and the node will be using the collection `alertMapping`.

![MongoDB Node Operation](/images/workflows/data/mongodb-node-operation.png "MongoDB Node Operation")

Next you will need to choose the operation that will be performed against the database.  Currently the node has support for the operations [Count](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#count), [Distinct](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#distinct), [Find](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#find), [FindOne](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#findOne), [Insert](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#insert), and [Remove](http://mongodb.github.io/node-mongodb-native/2.0/api/Collection.html#remove).  Depending on what operation you choose, the next section of configuration will change - depending on the expected arguments for the choosen operation.  In the example above, the node is configured to perform a `findOne` operation.

![MongoDB Node Arguments](/images/workflows/data/mongodb-node-arguments.png "MongoDB Node Arguments")

Depending on the choosen operation, the expected arguments here will change.  For example,
with the `findOne` operation, there are two arguments - the query itself, and any options
for the query.  In the above example, we are not passing any options, but we are passing
a templated query - searching for a document in the collection with a deviceId field that
matches the trigger id that kicked off the run of the workflow.  Most of the arguments for the various operations are expected to evaluate to JSON objects, and the node supports [EJSON](https://docs.mongodb.com/manual/reference/mongodb-extended-json/) syntax for specifying things like ObjectIDs.

![MongoDB Node Result](/images/workflows/data/mongodb-node-result.png "MongoDB Node Result")

Finally, you can optionally choose to store the result of the mongo operation on the payload.  For operations like `insert` or `remove`, you might not care about the result, but for an operation like the `findOne` above, you almost certainly do! In this case the result of the `findOne` is being placed at the JSON path `data.mongoResult`. Here is an example payload after the above MongoDB workflow node has been run:

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
  "triggerId": "56c8967bb8df0f0100d629120",
  "triggerType": "deviceId",
  "deviceTags": [
    { "key": "floor", "value": "2" },
    { "key": "location", "value": "warehouse1" }
  ],
  "flowId": "56c74add04d0b50100043381"
}
```
