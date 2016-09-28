# Accessing Payload Data

There are a few different methods for accessing and manipulating data from workflow payloads and device data queries. Depending on the use case, you may run across a point while building your app where you're asked to supply a data reference in one of the following formats.

```json
{
  "data" : {
    "aNumberProp": 42,
    "aStringProp": "Hello world",
    "aBooleanProp": true,
    "aFalsyProp" : 0,
    "anUndefinedProp": undefined,
    "aNullProp": null,
    "aJavascriptDateObject": Wed Sep 28 2016 15:40:25 GMT-0400 (EDT),
    "anArray": [
      44,
      "Goodbye world",
      false,
      {
        "anObjectPropInAnArray": "I'm deep!"
      }
    ],
    "anObject": {
      "aNestedArray": [
        "World Star!",
        20,
        { }
      ],
      "aNestedNumber": 56,
      "aNestedString": "Wally World"
    }
  }
}
```

## Payload Paths

Many workflow nodes, such as the [HTTP node](/workflows/data/http/), the [Get](/workflows/data/get-value/) and [Store Value](/workflows/data/store-value/) nodes and the [Math node](/workflows/logic/math/), require users to define a payload path at which either data will be accessed for evaluation, or at which the returned result of an operation will be stored. In these cases we use **payload paths**.

Payload paths are dot-separated references to object properties, such as ```foo.bar```. If any property in the chain returns ```undefined```, the value of the payload path will also return ```undefined```.

When accessing an array value by index, the index must be wrapped in square brackets and preceded by a dot, such as  ```foo.bar.[1]```. Square brackets can also be used to access specific characters in a string value.

Given our example object, here is how we would reference many of the properties using payload paths:

```javascript
data.aNumberProp // 42
data.aBooleanProp // false
data.aNullProp // null
data.aJavascriptDateObject // Wed Sep 28 2016 15:40:25 GMT-0400 (EDT)

data.anArray.[1] // "Goodbye world"
data.anArray.1 // (undefined. This is looking for the property name "1" on the object "anArray".)
data.anArray.[1].[2] // o (The character at index 2 of the array item at index 1)
data.anArray.[3] // { "anObjectPropInAnArray": "I'm deep!" }
data.anArray.[3].anObjectPropInAnArray // "I'm deep!"
data.anArray.[8] // (undefined. This index does not exist on the array.)

data.anObject.aNestedNumber // 56
data.anObject.aNestedArray // ["World Star!", 20, { }]
data.anObject.aNestedArray.[1] // 20

data.aNonexistentObject.aNonexistentProperty // (undefined. "aNonExistentObject" is not a property of "data")
aNumberProp // (undefined. This is not a top-level property of our object.)
```

Payload paths **do not accept variables** within the path definition; the paths must be static references.

## Template Strings

Template strings are constructed using a payload path that is wrapped in double curly brackets, such as ```{{foo.bar}}```. The value at the specified path should resolve a printable property; specifically, the value should be of the type "string", "number", "boolean" or "undefined". Objects referenced in this way will return ```[object Object]```.

Template paths appear in a number of use cases within the Losant platform, such as:

*   **Referencing payload values**, such as for setting state in the [Device State node](/workflows/outputs/device-state/)
*   **Evaluation**, as in the dashboard [Indicator block's expressions](/dashboards/indicator/) and the workflow [Conditional node](/workflows/logic/conditional/)
*   **Formatting values for output**, such as in the [GPS History block's tooltip](/dashboards/gps-history/) or the [SMS node's message](/workflows/outputs/sms/).

In all of these cases, it is possible to include a Handlebars helper within the template string for mutating the referenced value. For example, ```{{format time 'llll'}}```.

Except when evaluating conditions, it is possible to wrap template strings in a [block helper](http://handlebarsjs.com/block_helpers.html), such as ```{{#if foo}}{{foo}}{{else}}Not set!{{/if}}```.

In addition to the [built-in Handlebars helpers](http://handlebarsjs.com/builtin_helpers.html), Losant has provided a number of other helpers for use in template strings.

If you have an idea for a new helper, please let us know about it in our [forums](https://forums.losant.com).

### Conditional Block Helpers

These helpers are used to evaluate certain conditions and print values based on that result.

*   ```{{#ne p1 p2}}```: Returns true if p1 and p2 are not equal.
*   ```{{#eq p1 p2}}```: Returns true if p1 and p2 are equal by shallow comparison.
*   ```{{#gt p1 p2}}```: Returns true if p1 is greater than p2.
*   ```{{#lt p1 p2}}```: Returns true if p1 is less than p2.
*   ```{{#gte p1 p2}}```: Returns true if p1 is greater than or equal to p2.
*   ```{{#lte p1 p2}}```: Returns true if p1 is less than or equal to p2.
*   ```{{#match str regExpStr}}```: Returns true if str matches the regular expression regExpStr.

### Format Helpers

Given a value, these helpers convert the values to readable formats of your choosing.

*   ```{{format val formatStr}}```: If val is a **number**, returns the number in the [D3 format](https://github.com/d3/d3-format#locale_format) matching the formatStr parameter (default ',.6'). If val is a [**JavaScript Date object**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date), returns the date in the [Moment.js format](http://momentjs.com/docs/#/displaying/format/) matching the formatStr parameter (default 'L LTS'). If val is an **object**, returns the stringified object and ignores the formatStr parameter. For **all other formats**, val is returned as a string without mutation.
*   ```{{lower str}}```: Returns str [converted](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase) to all lowercase characters.
*   ```{{upper str}}```: Returns str [converted](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase) to all uppercase characters.
*   ```{{encodeURI str}}```: Returns str as an [encoded URI](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI).
*   ```{{encodeURIComponent str}}```: Returns str as a [decoded URI component](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent).
*   ```{{decodeURI str}}```: Returns str as a [decoded URI](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURI).
*   ```{{decodeURIComponent str}}```: Returns str as a [decoded URI component](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURIComponent).

### Examples

Using our example object from above, let's see what each of these template strings would print ...

```javascript
{{data.aNumberProp}} // 42
{{data.aStringProp}} // Hello world
{{data.aBooleanProp}} // true

{{data.anArray}} // 44,Goodbye world,false,[object Object] (all items in the array concatenated by commas)
{{data.anArray.[1]}} // Goodbye world
{{data.anArray.[1].[0]}} // G (the character at index 0 of the item at index 1 of the array)

{{data.anArray.0}} // (prints nothing. 0 is not a property of the array; this is not how to reference an item by index.)
{{data.anArray.[16]}} // (prints nothing. Index does not exist on the array.)

{{data.anUndefinedProp}} // (prints nothing)
{{data.aNonexistentProperty}} // (prints nothing)

{{data}} // [object Object]
{{format data}} // (a stringified representation of the entire data object)

{{#if data.aNumberProp}}The number is {{data.aNumberProp}}{{/if}} // The number is 42
{{#if data.aNonexistentProperty}}The number is {{data.aNonexistentProperty}}{{/if}} // (prints nothing. The condition fails.)
{{#if data.aFalsyProp}}Truth!{{else}}Fiction!{{/if}} // Fiction! (0 is falsy so the condition falls to the else statement.)

{{#each data.anArray}}{{@index}}: {{this}} -- {{/each}} // 0: 44 -- 1: Goodbye world -- 2: false -- 3: [object Object] --
{{#each data.anObject}}{{@key}}: {{this}} -- {{/each}} // aNestedArray: World Star!,20,[object Object] -- aNestedNumber: 56 -- aNestedString: Wally World --
{{#each data.aNonExistentObject}}{{@key}}: {{this}} -- {{else}}No object!{{/each}} // No object!
```

## JSON Templates
