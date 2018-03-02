flowclass: Cloud
flowclass: Edge 1.0.0
description: Learn more about the Losant HTML/XML Parser Node.

# HTML/XML Parser Node

The HTML/XML Parser Node allows you to parse an HTML or XML document string, as well as optionally run selectors against that document.

![HTML/XML Parser Node](/images/workflows/logic/html-parser-node.png "HTML/XML Parser Node")

## Configuration

The HTML/XML Parser Node has 2 distinct configuration sections - the first defining what to parse, and the second defining what to do with the result.

![HTML/XML Parser Node Config](/images/workflows/logic/html-parser-node-config.png "HTML/XML Parser Node Config")

For determining what to parse, the node needs a JSON payload path, which is expected to point at a XML or HTML document string. The node will take that document and parse it as best as possible - obviously a well formed document is preferred, but the node does attempt to deal with documents that have structural or syntax errors. By default, the node will use the entire document for the result, but a selector can be defined to reduce what is actually returned from the parsed document. The selector uses standard [CSS Selector](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors) syntax. Invalid selectors will be treated as if they match nothing in the document. Selectors that match more than one section in the document are also valid.

In the above example, the node is pulling the HTML document string from the `data.httpResult.body` path (which in this case is storing the body of a webpage retrieved by the previous [HTTP Node](/workflows/data/http/)), and applying the selector `#myDataSource` against the document (which will pull out the node that has the ID `myDataSource`).

![HTML/XML Parser Node Result](/images/workflows/logic/html-parser-node-result.png "HTML/XML Parser Node Result")

Once the node has the parsed document and has applied the selector, it needs to know where to place the result on the workflow payload, and what form that result should take. Where to place the result is just a simple JSON payload path. In the example above, the result will be placed at `data.extractedData` and will be in `Text` format.

For the form that that result will take, there are three possibilities - `Text`, `XML`, `JSON`. In all three cases the result will take the form of an array, one entry per section of the document that was selected by the CSS selector - or just an array of one item representing the entire document if there was no selector. Text output will be a string of any visible text within the selected element, concatenated together. XML output will be the string of XML that represents the selected element. JSON output will be a JSON representation of the selected element. For example, given the following sample XML document, with the selector `.edge` applied:

```XML
<ul>
  <li id="first" class="edge"><b>Item</b> number <a href="/one">One</a></li>
  <li id="second"><b>Item</b> number <a href="/two">Two</a></li>
  <li id="third" class="edge"><b>Item</b> number <a href="/three">Three</a></li>
</ul>
```

The `Text` output format would be the following:

```json
[
  "Item number One",
  "Item number Three"
]
```

The `XML` output format would be the following:

```json
[
  "<li id=\"first\" class=\"edge\"><b>Item</b> number <a href=\"/one\">One</a></li>",
  "<li id=\"third\" class=\"edge\"><b>Item</b> number <a href=\"/three\">Three</a></li>"
]
```

And the `JSON` output format would be the following:

```json
[
  { "children": [
      { "type": "element",
        "name": "li",
        "attributes": { "id": "first", "class": "edge" },
        "children": [
          { "type": "element",
            "name": "b",
            "children": [ { "type": "text", "value": "Item" } ] },
          { "type": "text", "value": " number " },
          { "type": "element",
            "name": "a",
            "attributes": { "href": "/one" },
            "children": [ { "type": "text", "value": "One" } ] }
        ]
      }
    ]
  },
  { "children": [
      { "type": "element",
        "name": "li",
        "attributes": { "id": "third", "class": "edge" },
        "children": [
          { "type": "element",
            "name": "b",
            "children": [ { "type": "text", "value": "Item" } ] },
          { "type": "text", "value": " number " },
          { "type": "element",
            "name": "a",
            "attributes": { "href": "/three" },
            "children": [ { "type": "text", "value": "Three" } ] }
        ]
      }
    ]
  }
]
```

### JSON Output Details

The JSON output can be also be passed back to the [toHtml](/workflows/accessing-payload-data/#format-helpers) handlebars helper to produce an HTML/XML document string again - which lets you parse a document to JSON, manipulate its contents, and then create a new document string with your modifications.

Currently, the JSON output is produced by the library [xml-js](https://www.npmjs.com/package/xml-js) with the following changes from their default options:

```javascript
{ compact: false,
  textKey: 'value',
  cdataKey: 'value',
  commentKey: 'value',
  elementsKey: 'children',
  alwaysChildren: true }
```

Losant uses this library because, while there is no official JSON<->XML specification, this library (when using non-compact form) is the closest to allowing lossless bidirectional conversion. The [toHtml](/workflows/accessing-payload-data/#format-helpers) handlebars helper also uses these same options above for conversion back from JSON to XML with [xml-js](https://www.npmjs.com/package/xml-js). They have a number of [examples](https://www.npmjs.com/package/xml-js#sample-conversions) showing what the conversion looks like for various samples.
