---
flowclass:
  - Application
  - Experience
  - Edge 1.6.0
description: Learn more about the Losant CSV Decode Node.
---

# CSV Decode Node

The CSV Decode Node allows a workflow to decode a CSV String on the payload into an object.

![CSV Decode Node](/images/workflows/logic/csv-decode-node.png "CSV Decode Node")

## Configuration

There are three main parts to the configuration of this node...

### Input Path

This required field specifies the payload path where the CSV String to be decoded is located.

![CSV Decode Node Input](/images/workflows/logic/csv-decode-node-input.png "CSV Decode Node Input")

### Format Configuration

![CSV Decode Node Config](/images/workflows/logic/csv-decode-node-config.png "CSV Decode Node Config")

This section contains four fields that specify the format of the incoming CSV String:

* **Record Delimiter:** (Optional) This is the character used to separate rows of data.

* **Delimiter:** (Optional) A [string template](/workflows/accessing-payload-data/#string-templates) to override the delimiter. This character is used to separate columns of data. Must be a single character. Leave blank to default to comma (,)

* **Quote:** (Optional) A string template to override the quote character. Must be a single character. Leave blank to default to double-quote (")

* **Escape:** (Optional) A string template to override the escape character. Must be a single character. Leave blank to default to double-quote (")

### Result Path

This required field specifies the payload path where the decoded object array will be placed.

![CSV Decode Node Result](/images/workflows/logic/csv-decode-node-result.png "CSV Decode Node Result")

## Output

In this particular instance, the workflow will decode the CSV string at the `data.csvString` path and place the resulting array of objects at `data.out`

So, for the following input payload...

```json
{
...
  "data": {
    "csvString": "Food,Drink\nBurger,Soda\nTaco,Water\n"
  }
...
}
```

the CSV Decode node would give the following output payload.

```json
{
...
  "data": {
   "csvString": "Food,Drink\nBurger,Soda\nTaco,Water\n",
   "out": [
    {
     "Drink": "Soda",
     "Food": "Burger"
    },
    {
     "Drink": "Water",
     "Food": "Taco"
    }
   ]
  }
...
}
```