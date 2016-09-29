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
    }
  }
}
```

## Payload Paths

Many workflow nodes, such as the [HTTP node](/workflows/data/http/), the [Get](/workflows/data/get-value/) and [Store Value](/workflows/data/store-value/) nodes and the [Math node](/workflows/logic/math/), require users to define a payload path at which either data will be accessed for evaluation, or at which the returned result of an operation will be stored. In these cases we use **payload paths**.

Payload paths are dot-separated references to object properties, such as `foo.bar`. If any property in the chain returns `undefined`, the value of the payload path will also return undefined.

When accessing an array value by index, the index must be wrapped in square brackets and preceded by a dot, such as  `foo.bar.[1]`. Square brackets can also be used to access specific characters in a string value.

### Examples

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

data.aNonexistentObject.aMissingProp // (undefined. "aNonExistentObject" is not a property of "data")
aNumberProp // (undefined. This is not a top-level property of our object.)
```

Payload paths **do not accept variables** within the path definition; the paths must be static references.

## String Templates

**String templates** are constructed using a payload path that is wrapped in double curly brackets, such as `{{foo.bar}}`. The value at the specified path should resolve to a printable property; specifically, the value should be of the type "string", "number", "boolean" or "undefined". Objects referenced in this way will return `[object Object]`, and arrays will return as comma-concatenated strings of all array values, such as `foo,bar,42,false`.

String templates appear in a number of use places within the Losant platform; in all cases, they serve one of two purposes:

*   **Referencing payload values**, such as for setting state in the [Device State node](/workflows/outputs/device-state/)
*   **Formatting values for output**, such as in the [GPS History block's tooltip](/dashboards/gps-history/) or the [SMS node's message](/workflows/outputs/sms/).

In both cases, it is possible to include a Handlebars helper within the string template for mutating the referenced value. For example, `{{format time 'llll'}}`.

It is possible to wrap string templates in a [block helper](http://handlebarsjs.com/block_helpers.html), such as `{{#if foo}}{{foo}}{{else}}Not set!{{/if}}`. Values in block helpers can themselves be wrapped in [subexpressions](http://handlebarsjs.com/expressions.html#subexpressions), such as `{{#eq (upper foo) 'BAR'}}They're equal!{{/eq}}`.

In addition to the [built-in Handlebars helpers](http://handlebarsjs.com/builtin_helpers.html), Losant has provided a number of other helpers for use in string templates. If you have an idea for a new helper, please let us know about it in our [forums](https://forums.losant.com).

### Conditional Block Helpers

These helpers are used to evaluate certain conditions and print values based on that result.

*   `{{#eq p1 p2}}`: Returns true if `p1` and `p2` are equal by shallow comparison.
*   `{{#ne p1 p2}}`: Returns true if `p1` and `p2` are not equal.
*   `{{#gt p1 p2}}`: Returns true if `p1` is greater than `p2`.
*   `{{#gte p1 p2}}`: Returns true if `p1` is greater than or equal to `p2`.
*   `{{#lt p1 p2}}`: Returns true if `p1` is less than `p2`.
*   `{{#lte p1 p2}}`: Returns true if `p1` is less than or equal to `p2`.
*   `{{#match str regExpStr}}`: Returns true if `str` matches the regular expression `regExpStr`.

### Format Helpers

These helpers convert a given value to a different format of your choosing.

*   `{{format val formatStr}}`:
    * If `val` is a **number**, returns the number in the [D3 format](https://github.com/d3/d3-format#locale_format) matching the `formatStr` parameter (default ',.6').
    * If `val` is a [**JavaScript Date object**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date), returns the date in the [Moment.js format](http://momentjs.com/docs/#/displaying/format/) matching the `formatStr` parameter (default 'L LTS').
    * If `val` is an **object**, returns the stringified object and ignores the `formatStr` parameter.
    * For **all other formats**, `val` is returned as a string without mutation.
*   `{{lower str}}`: Returns `str` [converted](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase) to all lowercase characters.
*   `{{upper str}}`: Returns `str` [converted](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase) to all uppercase characters.
*   `{{encodeURI str}}`: Returns `str` as an [encoded URI](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI).
*   `{{encodeURIComponent str}}`: Returns `str` as a [decoded URI component](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent).
*   `{{decodeURI str}}`: Returns `str` as a [decoded URI](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURI).
*   `{{decodeURIComponent str}}`: Returns `str` as a [decoded URI component](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURIComponent).

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

{{data.anArray}} => 44,Goodbye world,false,[object Object]
(all items in the array concatenated by commas)

{{data.anArray.[1].[0]}} => G
(the character at index 0 of the item at index 1 of the array)

{{data.anArray.0}} => (prints nothing)
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

Remember that, when checking strings for equality in Indicator block expressions and Conditional nodes, or when including a string template in a JSON object, you'll need to wrap the string template in quotes:

## Expressions

Sometimes it is necessary to evaluate our data and determine which of two (or many) paths to follow as a result of the evaluation, such as in the dashboard [Indicator block's expressions](/dashboards/indicator/) and the workflow [Conditional node](/workflows/logic/conditional/). In these cases we use **expressions**.

An expression is a combination of string templates and [JavaScript operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators) that forms a valid JavaScript expression after parsing through the Handlebars engine. The expression returns a value, which is evaluated as [truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy) or [falsy](https://developer.mozilla.org/en-US/docs/Glossary/Falsy).

Any operators or functions applied to a string template within an expression should be placed outside of the string template; for example, `{{foo}} > {{bar}}` or `!{{bat}}`.

String templates used within expressions **may not use block helpers**; they may, however, use format helpers.

Note that, when doing string comparisons in expressions, it is **not** necessary to wrap any string template in quotes to "stringify" the output. The expression will be evaluated with the output of the template string serving as a variable; for example `{{foo}} === 'bar'` or `{{bat}} !== {{baz}}`.

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

Given our example object, let's see how these expressions evaluate.

```javascript
{{data.aNumberProp}} // true
{{data.anUndefinedProp}} // false
{{data.aBooleanProp}} // true
!{{data.aBooleanProp}} // false

{{data.aNumberProp}} === 'hello' // false
{{data.aNumberProp}} > 20 // true

{{data}} && {{data.aBooleanProp}} // true
{{data.aBooleanProp}} || {{data.aFalsyProp}} // true
{{data.aBooleanProp}} && {{data.aFalsyProp}} // false

{{data.aNumberProp}} > {{data.anObject.aNestedArray.[1]}} // true
{{data.aNumberProp}} > {{data.aStringProp}} // false
{{data.aNumberProp}} < {{data.aStringProp}} // false

{{data.aFalsyProp}} == false // true
{{data.aFalsyProp}} === false // false

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
*   JSON containing string helpers for keys or values. e.g. `{"month": {{format date 'MMMM'}} }`
*   A single reference to a property on an object whose value is an object. e.g. `{{foo.bar}}`

Your entire input will run through Handlebars and the Losant-provided helpers. **After evaluation, the result must be valid JSON.**

### Examples

Again, given our example object above, these JSON templates will evaluate as follows ...

```javascript
{ "foo": "bar", "staticNumber" : 66 }
// { "foo": "bar", "staticNumber" : 66 }

{ "myArray": {{data.anArray}} }
// { "myArray": [44, "Goodbye world", false, {"anObjectPropInAnArray": "I'm deep!"} }

{ "timestamp": {{format data.aJavascriptDateObject 'x'}}, "capitalString": "{{upper data.aStringProp}}" }
// { "timestamp": 1475091625000, "capitalString": "HELLO WORLD"}

{ "myString": {{data.aStringProp}} }
// FAILS since the string is not wrapped in double quotes

{{data.anArray}}
// [44, "Goodbye world", false, {"anObjectPropInAnArray": "I'm deep!"}

{{data.nestedObject.nestedArray.[1]}}
// 20

{{data.nestedObject.nestedArray.[0]}}
// FAILS because the referenced value is a string, which is not valid JSON

{ {{#gt data.aNumberProp 21}}"highNumber"{{else}}"lowNumber"{{/gt}}: {{data.aNumberProp}} }
// { "highNumber": 42 }
```
