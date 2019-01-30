---
flowclass:
  - Application
  - Experience
  - Edge 1.5.0
description: Learn more about the Losant SQL Node.
---

# SQL

The SQL Node allows a workflow to query or update values in a SQL database and optionally store the result on the workflow payload.

Currently supported SQL database servers include [MSSQL](https://www.microsoft.com/en-us/sql-server/sql-server-2017?&OCID=AID739534_SEM_ewAKKSLf), [MySQL](https://www.mysql.com/), [PostgreSQL](https://www.postgresql.org/), and [SQLite 3](https://www.sqlite.org/) (Edge only).

![SQL Node](/images/workflows/data/SQL-node.png "SQL Node")

## Configuration

The configuration of the SQL Node can be broken down into four major sections - configuring the connection, configuring connection encryption (optional), creating the SQL query, and choosing what to do with the result.

![SQL Node Connection Configuration](/images/workflows/data/SQL-node-connection.png "SQL Node Connection Configuration")

SQL connection configuration contains up to six fields:

* **Database Management System (DBMS):** (Required) MSSQL, MySQL, PostgreSQL, or SQLite 3 (Edge only)
* **Server Address:** (Required) String or template, e.g. 127.0.0.1
* **Port Number:** (Optional) Number or template, integer between 1 and 65534
* **Username:** (Optional) String or template.
* **Password:** (Optional) String or template.
* **Database Name:** (Required) String or template.

When using a SQLite 3 DBMS the only connection option is **SQLite File**, which is a string or template pointing to an db disk file (.sqlite) or a in-memory db file (e.g. **SQLite File** = :memory:).

![SQL Node Connection Encrption](/images/workflows/data/SQL-node-encryption.png "SQL Node Connection Encrption")

Next you have the option of adding SSL/Encryption options to your SQL client connection. This is not available to SQLite connections. When "MSSQL Encrypt Option" is checked the option "encrypt=true" is set in the client connection (Note: this is required when connecting to Azure's MSSQL). Concerning MySQL and PostreSQL, if "SSL/TLS Connection" is checked "ssl=true" will be set but if the "SSL Configuration" is also filled in the object will be set for the connection. Check your SQL server configuration for the appropriate settings.

![SQL Query](/images/workflows/data/SQL-node-query.png "SQL Query")

Then an SQL query string is required to use this node in your workflow. [String templates](/workflows/accessing-payload-data/#string-templates) are supported within the query, e.g.:

```sql
SELECT * FROM {{foo.bar}}
```

![SQL Node Result](/images/workflows/data/SQL-node-result.png "SQL Node Result")

Finally, you can optionally choose to store the result of the SQL query on the payload. For queries like `INSERT` or `DELETE`, you might not care about the result, but for an query like the `SELECT` above, you almost certainly do! In this case the result of the `SELECT` is being placed at the [payload path](/workflows/accessing-payload-data/#payload-paths) `sales`. Here is an example payload after the above SQL Node has been run:

```json
{
  "sales": [
    0: {
      "sale_id": "a001",
      "customer": "DT",
      "amount": 42.00,
      "date": "01/02/2019"
    },
    1: {
      "sale_id": "a002",
      "customer": "Vogons",
      "amount": 12.34,
      "date": "01/03/2019"
    },
    2: {},
    3: {}
  ],
  "globals": { },
  "applicationName": "SQL Data",
  "flowName": "Public SQL",
  "flowId": "56c74add04d0b50100043381",
  "relayType": "user",
  "relayId": "5baa78b4ae2fb400065c2409",
  "flowVersion": "develop",
  "triggerType": "mqtt",
  "triggerId": "56c8967bb8df0f0100d629120",
  "applicationId": "568beedeb436ab01007be53d",
  "data": { },
  "time": Mon Jan 27 2019 17:26:00 GMT-0500 (EST)
}
```
