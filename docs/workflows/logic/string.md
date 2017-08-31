# String Node

The String Node allows for manipulating string values on your workflow payloads.

![String Node](/images/workflows/logic/string-node.png "String Node")

## Configuration

Every String Node takes three required values:

*   **Source Template** -  A [string template](/workflows/accessing-payload-data/#string-templates) resolving to a string value on your payload.
*   **Choose an Operation** - The operation to perform on the string. Depending on the value selected here, additional configuration may be required. (See below.)
*   **Result Path** -  A [payload path](/workflows/accessing-payload-data/#payload-paths) for where the result of the string operation should be stored on your payload. This value will also be a string unless noted per operation.

## Valid Operations

The String Node supports the following operations, with additional configuration required if noted (in all cases, extra configuration options take [string templates](/workflows/accessing-payload-data/#string-templates)):

### Concatenate

Add a new value onto the end of the source string. Extra configuration:

*   **Additional String** - The value to concatenate onto the source string.

### Replace All Occurrences

Find all occurrences of a substring within the source string and replace them with a string of your choosing. Extra configuration:

*   **Match String** - The value to find and to ultimately replace.
*   **Replacement String** - The value to insert in place of the matched substring. Leave the value blank to replace with nothing.

### Replace First Occurrence

Find just the first occurrence of a substring within the source string and replace it with a string of your choosing. Extra configuration:

*   **Match String** - The value to find and to ultimately replace.
*   **Replacement String** - The value to insert in place of the matched substring. Leave the value blank to replace with nothing.

### Split

Split the source string into an array of strings, breaking on a character(s) of your choosing. The value placed at the **Result Path** will be an array when using this operation. Extra configuration:

*   **Separator Character(s)** - The delimiter on which the string should be split. This is commonly a pipe `|`, comma `,` or semicolon `;` but it can be anything you choose.

### To Lowercase

Convert all uppercase characters in the source string into lowercase characters.

### To Number

Cast the source string to a number. If the string cannot be converted to a number, the value placed at the **Result Path** will be `null`; otherwise it will be a number.

### To Uppercase

Convert all lowercase characters in the source string into uppercase characters.

### Trim

Remove all whitespace at the front and back ends of the source string.

### Trim End

Remove all whitespace at the back end of the source string.

### Trim Start

Remove all whitespace at the front end of the string.

### Truncate

Shorten a string to a character length of your choosing. Extra configuration:

*   **Max String Length** - The maximum number of characters before the source string is truncated, **including the length of the Ellipsis Character(s)**. If the source string length is less than or equal to this value, or if the string template provided here fails to cast to a number, the source string will not be changed.
*   **Ellipsis Character(s)** - If and only if the string is truncated, characters entered here will be appended to the end of the string.
