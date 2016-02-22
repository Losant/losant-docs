# Conditional Node

The conditional node allows a workflow to branch based upon a conditional expression.

![Conditional Node](/images/workflows/logic/conditional-node.png "Conditional Node")

## Configuration

Configuring a conditional node involves writing an expression that will evaluate to a true or false value.  When the expression evaluates to false for a given workflow payload, the route on the left out of the conditional node is taken.  When the expression evaluates to true, the route on the right out of the conditional node is taken.

![Conditional Node Config](/images/workflows/logic/conditional-node-config.png "Conditional Node Config")

In the above example, the workflow will take the right (or `true`) path whenever the value of the payload field `data.path` is equal to the string "/transition/up", and will take the left (or `false`) path otherwise.

For example, the following workflow payload would take the `true` path:

```json
{
  "data": {
    ...
    "path": "/transition/up",
    ...
  },
  ...
}
```

## Expression Variable Replacement

Values in the expression that are surrounded by double curly braces (`{{ value }}`) are treated as JSON paths and are evaluated against the payload to find the actual value for the evaluation of the expression.  See the workflow [JSON Path documentation](/workflows/overview/#template-fields-and-payload-paths) for more details.

## Expression Details

While the conditional expression supports a wide array of operators, it is not Javascript or even a full language on its own.  Expressions do support parentheses, standard operator precedence, a specific set of operators, a specific set of keywords, and a specific set of functions, as detailed below.

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

Expressions have support for strings and numbers, as well as the following special keywords:

*   `true` (boolean true)
*   `false` (boolean false)
*   `null` (JSON null)
*   `undefined` (JSON undefined)
*   `E` (e, approximately 2.718)
*   `PI` (π, approximately 3.14159)

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
*   `sqrt` (computes the square root of a number)
*   `log` (computes the natural logarithm of a number)
*   `log10` (computes the base 10 logarithm of a number)
*   `abs` (computes the absolute value of a number)
*   `ceil` (computes the smallest integer greater than or equal to a number)
*   `floor` (computes the largest integer less than or equal to a number)
*   `round` (rounds a number to the nearest integer)
*   `trunc` (truncates any fractional digits of a number)
*   `exp` (computes e raised to the power of the given number)

All of the above can be combined to produce powerful expressions, such as:

```javascript
sin({{ data.distance }}) >= 0.25 * PI &&
  ({{ data.open }} !== undefined || !{{ data.closed }})
```
