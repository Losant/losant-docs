# Accessing Payload Data

There are a few different methods for accessing and manipulating data from workflow payloads and device data queries. Depending on the use case, you may run across a point while building your app where you're asked to supply a data reference in one of the following formats.

```json
{
  "data" : {
    "aNumberProp": 42,
    "aStringProp": "Hello world",
    "aBooleanProp": true,
    "aFalsyProp" : 0,
    "aDecimal": 123.456789,
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
    },
    "anHtmlString": "<span>Wall-E</span>"
  }
}
```

## Payload Paths

Many workflow nodes, such as the [HTTP node](/workflows/data/http/), the [Get](/workflows/data/get-value/) and [Store Value](/workflows/data/store-value/) nodes and the [Math node](/workflows/logic/math/), require users to define a payload path at which either data will be accessed for evaluation, or at which the returned result of an operation will be stored. In these cases we use **payload paths**.

Payload paths are dot-separated references to object properties, such as `foo.bar`. If any property in the chain returns `undefined`, the value of the payload path will also return undefined.

**Square brackets** wrapped around a property name can be used in a handful of cases:

*   **Accessing an array value by index**. e.g. `data.anArray.[0]` returns the first value in the array at that path.
*   Accessing a specific character of a string by index. e.g. `data.aString.[1]` returns the second letter of the string at that path.
*   Escaping payload properties that have spaces or other special characters. e.g. `data.[a silly property name]`.

### Examples

Given our example object, here is how we would reference many of the properties using payload paths:

```javascript
data.aNumberProp // 42
data.aBooleanProp // false
data.aNullProp // null
data.aJavascriptDateObject // Wed Sep 28 2016 15:40:25 GMT-0400 (EDT)

. // (returns the entire example object)

data.anArray.[1] // "Goodbye world"
data.anArray.1 // (invalid syntax)
data.anArray.[1].[2] // o (The character at index 2 of the array item at index 1)
data.anArray.[3] // { "anObjectPropInAnArray": "I'm deep!" }
data.anArray.[3].anObjectPropInAnArray // "I'm deep!"
data.anArray.[8] // (undefined. This index does not exist on the array.)

data.anObject.aNestedNumber // 56
data.anObject.aNestedArray // ["World Star!", 20, { }]
data.anObject.aNestedArray.[1] // 20

data.aNonexistentObject.aMissingProp // (undefined. "aNonExistentObject" is not a property of "data")
aNumberProp // (undefined. This is not a top-level property of our object.)
```

Payload paths **do not accept variables** within the path definition; the paths must be static references.

## String Templates

**String templates** are [Handlebars templates](http://handlebarsjs.com) – that is, they are constructed using a payload path that is wrapped in double curly brackets, such as `{{foo.bar}}`. The value at the specified path should resolve to a printable property; specifically, the value should be of the type "string", "number", "boolean" or "undefined". Objects referenced in this way will return `[object Object]`, and arrays will return as comma-concatenated strings of all array values, such as `foo,bar,42,false`.

Areas within the app that call for a string template do not necessarily have to include a variable; it is perfectly acceptable to put a static string value in place of a template.

String templates appear in a number of use places within the Losant platform; in all cases, they serve one of two purposes:

*   **Referencing payload values**, such as for setting state in the [Device State node](/workflows/outputs/device-state/)
*   **Formatting values for output**, such as in the [GPS History block's tooltip](/dashboards/gps-history/) or the [SMS node's message](/workflows/outputs/sms/).

### Escaping HTML

By default, HTML within a Handlebars helper is [escaped](http://handlebarsjs.com/#html-escaping) to prevent malformed HTML from breaking the page layout. If you wish to override this feature, put your string templates inside of triple curly brackets, e.g. `{{{aValueWithHtmlTags}}}`. You may, for example, wish to include HTML tags in the message body of the [Email node](/workflows/outputs/email).

### Conditional Block Helpers

It is possible to wrap string templates in a [block helper](http://handlebarsjs.com/block_helpers.html), such as `{{#if foo}}{{foo}}{{else}}Not set!{{/if}}`. Values in block helpers can themselves be wrapped in [subexpressions](http://handlebarsjs.com/expressions.html#subexpressions), such as `{{#eq (upper foo) 'BAR'}}They're equal!{{/eq}}`.

In addition to the [built-in Handlebars helpers](http://handlebarsjs.com/builtin_helpers.html), Losant provides a number of other helpers for use in string templates. If you have an idea for a new helper, please let us know about it in our [forums](https://forums.losant.com).

*   `{{#eq p1 p2}}`: Returns true if `p1` and `p2` are equal by shallow comparison.
*   `{{#ne p1 p2}}`: Returns true if `p1` and `p2` are not equal.
*   `{{#gt p1 p2}}`: Returns true if `p1` is greater than `p2`.
*   `{{#gte p1 p2}}`: Returns true if `p1` is greater than or equal to `p2`.
*   `{{#lt p1 p2}}`: Returns true if `p1` is less than `p2`.
*   `{{#lte p1 p2}}`: Returns true if `p1` is less than or equal to `p2`.
*   `{{#match str regExpStr}}`: Returns true if `str` matches the regular expression `regExpStr`.

### Format Helpers

Handlebars helpers can also mutate a given value in place and print the result. Losant provides the following formatting helpers:

*   `{{format val formatStr}}`:
    * If `val` is a **number**, returns the number in the [D3 format](https://github.com/d3/d3-format#locale_format) matching the `formatStr` parameter (default ',.6').
    * If `val` is a [**JavaScript Date object**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date), returns the date in the [Moment.js format](http://momentjs.com/docs/#/displaying/format/) matching the `formatStr` parameter (default 'L LTS').
    * If `val` is an **object**, returns the stringified object and ignores the `formatStr` parameter.
    * For **all other formats**, `val` is returned as a string without mutation.
*   `{{formatDate val formatStr}}`: Casts the given value as a date, and then formats it using the `formatStr` parameter (default 'L LTS').
*   `{{formatDateRelative date relativeTo}}`: Outputs a relative date value (such as "5 minutes ago").  Date is calculated relative to the `relativeTo` parameter, which defaults to the current time when not set.
*   `{{lower str}}`: Returns `str` [converted](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase) to all lowercase characters.
*   `{{upper str}}`: Returns `str` [converted](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase) to all uppercase characters.
*   `{{encodeURI str}}`: Returns `str` as an [encoded URI](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI).
*   `{{encodeURIComponent str}}`: Returns `str` as a [decoded URI component](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent).
*   `{{decodeURI str}}`: Returns `str` as a [decoded URI](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURI).
*   `{{decodeURIComponent str}}`: Returns `str` as a [decoded URI component](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURIComponent).
*   `{{jsonEncode val}}`: Returns `val` [stringified](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify).
*   `{{encodeBase64 val}}`: Treats `val` as a string, and returns the [Base64-encoded](https://developer.mozilla.org/en-US/Add-ons/SDK/High-Level_APIs/base64) version of that string ([UTF-8](https://developer.mozilla.org/en-US/docs/Glossary/UTF-8) character set).
*   `{{decodeBase64 val}}`: Treats `val` as a [Base64-encoded](https://developer.mozilla.org/en-US/Add-ons/SDK/High-Level_APIs/base64), and returns a decoded string ([UTF-8](https://developer.mozilla.org/en-US/docs/Glossary/UTF-8) character set).
*   `{{length val}}`:
    * If `val` is an **array**, returns the number of items in the array.
    * If `val` is an **object**, returns the number of keys on the object.
    * If `val` is a **string**, returns the length of the string.
    * For everything else, returns `undefined`.
*   `{{add val1 val2}}`: Casts the two values as numbers and adds them.
*   `{{subtract val1 val2}}`: Casts the two values as numbers and subtracts them.
*   `{{multiply val1 val2}}`: Casts the two values as numbers and multiplies them.
*   `{{divide val1 val2}}`: Casts the two values as numbers and divides them.
*   `{{valueByKey objArray key keyField valueField}}`: Returns the value of `valueField` on the object in the `objArray` whose value for `keyField` matches the value of `key`. The arguments `keyField` and `valueField` are optional, defaulting to the field names `key` and `value`.  If there is no match found, a blank result is returned.
*   `{{toHtml object}}`: Takes the given object and converts it to a HTML/XML document string. The object must be of the same format that the [HTML Parser node](/workflows/logic/html-parser/) outputs in JSON mode.
*   `{{gpsDistance gpsStr1 gpsStr2}}`: Takes two GPS points and returns the distance between them (in meters).
*   `{{dashboardUrl id queryParamKey1='queryParamValue1' ...}}`: Creates a link to the dashboard at the given ID (defaults to the current dashboard) and adds the optional query parameters. To pass a nested object of parameters, such as for [dashboard context](dashboards/context-variables/), include the parameter as ` ctx=(obj key1=value1 key2=value2)`. 

### Iterating Over Arrays and Objects

One very useful feature of string templates is the ability to [iterate](http://handlebarsjs.com/builtin_helpers.html#iteration) over arrays and objects using the `{{#each}}` block helper. When doing so, a few variables become available to the user in the context of the loop:

*   For arrays, `{{@index}}` returns a number corresponding to the index of the current item in the loop. One possible use of this value is to know how many times the loop has executed, and to stop executing additional code within the loop based on this value.
*   For objects, `{{@key}}` returns the name of the current key. You can use this to execute a different string template based on the current item in the loop.
*   For both arrays and object, `{{this}}` represents the current item in the loop; or, put another way, the value at `{{anArray.[@index]}}` or `{{anObject.[@key]}}`.

### Examples

Using our example object from above, let's see what each of these string templates would print ...

```handlebars
{{data.aNumberProp}} => 42
{{data.aStringProp}} => Hello world
{{data.aBooleanProp}} => true
{{data.anUndefinedProp}} => (prints nothing)
{{data.aMissingProp}} => (prints nothing)
{{data.anArray.[1]}} => Goodbye world
{{data}} => [object Object]

{{data.anHtmlString}} => &lt;span&gt;My New Post&lt;/span&gt;
{{{data.anHtmlString}}} => <span>Wall-E</span>

{{data.anArray}} => 44,Goodbye world,false,[object Object]
(all items in the array concatenated by commas)

{{data.anArray.[1].[0]}} => G
(the character at index 0 of the item at index 1 of the array)

{{data.anArray.0}} => (invalid syntax)
(0 is not a property of the array; should be [0] to access by index)

{{data.anArray.[16]}} => (prints nothing)
(index does not exist on the array.)

{{#if data.aNumberProp}}The number is {{data.aNumberProp}}{{/if}}
=> The number is 42

{{#if data.aMissingProp}}The number is {{data.aMissingProp}}{{/if}}
=> (prints nothing. The condition fails.)

{{#if data.aFalsyProp}}Truth!{{else}}Fiction!{{/if}}
=> Fiction! (0 is falsy so the condition falls to the else statement.)

{{#each data.anArray}}{{@index}}: {{this}}; {{/each}}
=> 0: 44; 1: Goodbye world; 2: false; 3: [object Object];

{{#each data.anObject}}{{@key}}: {{this}}; {{/each}}
=> aNestedArray: World Star!,20,[object Object]; aNestedNumber: 56; aNestedString: Wally World;

{{#each data.aMissingObject}}{{@key}}: {{this}} -- {{else}}No object!{{/each}}
=> No object!

{{#gt data.aNumberProp 40}}First number is greater{{/gt}}
=> First number is greater

{{#lte data.aNumberProp 10}}Second number is greater{{/gt}}
=> (prints nothing)

{{#eq data.aStringProp 'hello world'}}Equal!{{else}}Not equal{{/eq}}
=> Not equal (cases don't match)

{{#eq (lower data.aStringProp) 'hello world'}}Equal!{{else}}Not equal{{/eq}}
=> Equal! (cases match after running through the "lower" subexpression)

{{format data}} => (the stringified object)
{{format data.aDecimal ',.5'}} => 1,234.6
{{encodeURIComponent data.aStringProp}} => Hello%20world

{{#eq (format data.aJavascriptDateObject 'MMMM') 'September'}}Ba de ya!{{else}}Play something else{{/if}}
=> Ba de ya!
```

## Expressions

Sometimes it is necessary to evaluate our data and determine which of two (or many) paths to follow as a result of the evaluation, such as in the dashboard [Indicator block's expressions](/dashboards/indicator/) and the workflow [Conditional node](/workflows/logic/conditional/). In these cases we use **expressions**.

An expression is a combination of string templates and [JavaScript operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators) that forms a "JavaScript-like" expression after parsing through the Handlebars engine. The expression returns a value; depending on the use case, that value may be evaluated as [truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy) or [falsy](https://developer.mozilla.org/en-US/docs/Glossary/Falsy) to determine which branch a workflow follows (as in the [Conditional node](/workflows/logic/conditional)), or the value may be added to a payload (as in the [Math node](/workflows/logic/math)).

Any operators or functions applied to a string template within an expression should be placed outside of the string template; for example, `{{foo}} > {{bar}}` or `!{{bat}}`.

String templates used within expressions **may not use block helpers**; they may, however, use format helpers.

Note that, when doing string comparisons in expressions, it is **not** necessary to wrap any string template in quotes to "stringify" the output. The expression will be evaluated with the output of the string template serving as a variable; for example `{{foo}} === 'bar'` or `{{bat}} !== {{baz}}`.

Below are lists of operators, keywords and functions supported in expressions. If you have use cases that are not handled by these, please let us know in our [forums](https://forums.losant.com).

### Supported Operators

Expressions support the following operators:

*   `+` (addition)
*   `-` (subtraction)
*   `*` (multiplication)
*   `/` (division)
*   `%` (modulus)
*   `^` (exponentiation)
*   `==` (loose equality)
*   `===` (strict equality)
*   `!=` (loose inequality)
*   `!==` (strict inequality)
*   `>` (greater than)
*   `<` (less than)
*   `>=` (greater than or equal)
*   `<=` (less than or equal)
*   `&&` (boolean 'and')
*   `||` (boolean 'or')
*   `!` (boolean 'not')

### Supported Keywords

Expressions have support for strings and numbers, as well as the following special keywords:

*   `true` (boolean true)
*   `false` (boolean false)
*   `null` (JSON null)
*   `undefined` (JSON undefined)
*   `E` (e, approximately 2.718)
*   `PI` (π, approximately 3.14159)

### Supported Functions

Expressions also support the following functions:

*   `sin` (computes the sine of a number)
*   `cos` (computes the cosine of a number)
*   `tan` (computes the tangent of a number)
*   `asin` (computes the arcsine of a number)
*   `acos` (computes the arccosine of a number)
*   `atan` (computes the arctangent of a number)
*   `sinh` (computes the hyperbolic sine of a number)
*   `cosh` (computes the hyperbolic cosine of a number)
*   `tanh` (computes the hyperbolic tangent of a number)
*   `asinh` (computes the hyperbolic arcsine of a number)
*   `acosh` (computes the hyperbolic arccosine of a number)
*   `atanh` (computes the hyperbolic arctangent of a number)
*   `atan2` (computes the arctangent of the two variables y and x)
*   `sqrt` (computes the square root of a number)
*   `log` (computes the natural logarithm of a number)
*   `log10` (computes the base 10 logarithm of a number)
*   `abs` (computes the absolute value of a number)
*   `ceil` (computes the smallest integer greater than or equal to a number)
*   `floor` (computes the largest integer less than or equal to a number)
*   `round` (rounds a number to the nearest integer)
*   `trunc` (truncates any fractional digits of a number)
*   `exp` (computes e raised to the power of the given number)
*   `pow` (raises a number to the power of a second number)
*   `length` (computes the length of an array, object, or string)

### Examples

With the provided functions, keywords and operators, it is possible to build very complex expressions, such as ...

```
sin({{ data.distance }}) >= 0.25 * PI && ({{ data.open }} !== undefined || !{{ data.closed }})
```

Given our example object, let's see how these simpler expressions evaluate.

```javascript
{{data.aBooleanProp}} // true
{{data.aBooleanProp}} === false // false
{{data.aNumberProp}} === 'hello' // false
{{data.aFalsyProp}} == false // true
{{data.aFalsyProp}} === false // false
!!{{data.anUndefinedProp}} // false

{{data.aNumberProp}} > 20 // true
{{data.anObject.aNestedNumber}} - {{data.aNumberProp}} // 14

{{data}} && {{data.aBooleanProp}} // true
{{data.aBooleanProp}} || {{data.aFalsyProp}} // true
{{data.aBooleanProp}} && {{data.aFalsyProp}} // false

{{data.aNumberProp}} > {{data.anObject.aNestedArray.[1]}} // true
{{data.aNumberProp}} > {{data.aStringProp}} // false
{{data.aNumberProp}} < {{data.aStringProp}} // false


{{format data.aJavascriptDateObject 'MMMM'}} === 'September' // true
{{lower data.aStringProp}} === 'Hello world' // false

{{data.anObject.aNestedArray.[1]}} / 5 <= PI // false
pow({{data.aNumberProp}}, {{data.aFalsyProp}}) === 1 // true
```

## JSON Templates

In a few places within the Losant platform – such as the [Input Controls block](/dashboards/input-controls/) and [Losant API node](/workflows/data/losant-api/), it is necessary to construct JSON objects from other data. In these instances we use **JSON templates**.

JSON templates can take any of the following formats (or a combination thereof):

*   Valid, static JSON. e.g. `{"foo": "bar"}`, `[1,2,3]` or `null`
*   JSON containing block helpers around keys, values or both. e.g. `{ {{#if foo}}"bar": "bat"{{else}}"baz": "bub"{{/if}} }`
*   JSON containing string helpers for keys or values. e.g. `{"month": "{{format date 'MMMM'}}" }`
*   Standard handlebars payload references, e.g. `{{data.nestedObject.nestedArray.[1]}}`

Your entire input will run through Handlebars and the Losant-provided helpers. **After evaluation, the result must be valid JSON.** Because of this, there are a few things to keep in mind when using string templates within your JSON templates:

*   Any string value being output by a string template should be wrapped in double quotes, like so: `{ "foo": "{{data.aStringProp}}" }`.
*   Any boolean or number value being output by a string template should **not** be wrapped in quotes, unless you want the value passed as a string: `{ "foo": {{data.aNumberProp}} }`.
*   Any objects or arrays being referenced by a string helper should always use the `jsonEncode` Handlebars helper to ensure that all string values are wrapped in quotes and all objects print as valid JSON, and should be wrapped in triple curly braces to prevent escaping of characters: `{ "anObject": {{{jsonEncode data.anObjectProp}}} }` or `{ "anArray": {{{jsonEncode data.anArrayProp}}} }`.

### Examples

Again, given our example object above, these JSON templates will evaluate as follows ...

```javascript
{ "foo": "bar", "staticNumber" : 66 }
// { "foo": "bar", "staticNumber" : 66 }

{ "myArray": {{{jsonEncode data.anArray}}} }
// { "myArray": [44, "Goodbye world", false, {"anObjectPropInAnArray": "I'm deep!"} }

{ "timestamp": {{format data.aJavascriptDateObject 'x'}}, "dayOfWeek": "{{format data.aJavascriptDateObject 'dddd'}}", "capitalString": "{{upper data.aStringProp}}" }
// { "timestamp": 1475091625000, "dayOfWeek": "Wednesday", "capitalString": "HELLO WORLD"}

{ "myString": {{data.aStringProp}} }
// FAILS since the string is not wrapped in double quotes

{{{jsonEncode data.anArray}}}
// [44, "Goodbye world", false, {"anObjectPropInAnArray": "I'm deep!"}

{{data.nestedObject.nestedArray.[1]}}
// 20

{{data.nestedObject.nestedArray.[0]}}
// FAILS because the referenced value is a string, which is not valid JSON

{ {{#gt data.aNumberProp 21}}"highNumber"{{else}}"lowNumber"{{/gt}}: {{data.aNumberProp}} }
// { "highNumber": 42 }
```
