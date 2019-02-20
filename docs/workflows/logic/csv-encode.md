---
flowclass:
  - Application
  - Experience
  - Edge 1.6.0
description: Learn more about the Losant CSV Encode Node.
---

# CSV Encode Node

The CSV Encode Node allows a workflow to encode an object array on the payload into a CSV String.

![CSV Encode Node](/images/workflows/logic/csv-encode-node.png "CSV Encode Node")

## Configuration

There are four main parts to the configuration of this node...

### Input Path

This required field specifies the payload path where the object array to be encoded is located.

![CSV Encode Node Input](/images/workflows/logic/csv-encode-node-input.png "CSV Encode Node Input")

### CSV Headers

There are three different ways to control the headers of the encoded CSV string - "Object Keys", "Individual Fields", and "Payload Path". The last two settings allow you to customize what headers will appear in the output CSV string, while the first setting is a simpler default.

**Note:** This setting will only exclude or repeat headers. It will not replace or rename any headers from the input objects.

![CSV Encode Node Headers](/images/workflows/logic/csv-encode-node-header.png "CSV Encode Node Headers")

* **Object Keys:** The default option. The CSV Encode Node will read all the keys of the **first** given object and include all of them as headers for the encoded CSV string.

* **Individual Fields:** Provide up to 10 [string templates](/workflows/accessing-payload-data/#string-templates) that will each be included as a header. Any object keys not included here will be excluded from the output.

* **Payload Path:** Specify a payload path that contains an array of headers to include. Any object keys not included in the array will be excluded from the output.

### Format Configuration

![CSV Encode Node Config](/images/workflows/logic/csv-encode-node-config.png "CSV Encode Node Config")

This section contains four fields that specify the format for the encoded CSV string:

* **Record Delimiter:** (Optional) This is the character used to separate rows of data.

* **Delimiter:** (Optional) A [string template](/workflows/accessing-payload-data/#string-templates) to override the delimiter. This character is used to separate columns of data. Must be a single character. Leave blank to default to comma (,)

* **Quote:** (Optional) A string template to override the quote character. Must be a single character. Leave blank to default to double-quote (")

* **Escape:** (Optional) A string template to override the escape character. Must be a single character. Leave blank to default to double-quote (")

### Result Path

This required field specifies the payload path where the encoded CSV string will be placed.

![CSV Encode Node Result](/images/workflows/logic/csv-encode-node-result.png "CSV Encode Node Result")

## Output

In this particular instance, the workflow will encode the object array at the `data.in` path and place the resulting CSV string at `data.csvString`

So, for the following input payload...

```json
{
...
  "data": {
   "in": [
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

the CSV Encode node would give the following output payload.

```json
{
...
  "data": {
    "csvString": "Food,Drink\nBurger,Soda\nTaco,Water\n",
    "in": [
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
