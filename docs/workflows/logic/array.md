---
flowclass:
  - Application
  - Experience
  - Edge 1.0.0
description: Learn more about the Losant Array Node.
---

# Array Node

The Array Node allows a workflow to perform operations against an array on the payload.

![Array Node](/images/workflows/logic/array-node.png "Array Node")

## Configuration

Array Nodes are configured by first specifying a payload path to an array on the payload. This will be the array that the node will operate on. If nothing exists at the given payload path, then an empty array will be created at that location. If a string exists at the given payload path, that string will be treated as an array of characters for the purposes of the array operation, but when the operation is completed, it will be left as a string on the payload.

If the operation modifies the original array, you can specify a destination path where the altered array will be stored.

![Array Node Configuration](/images/workflows/logic/array-node-config.png "Array Node Configuration")

Once you have configured the array that the node will operate on, then you can choose and configure one of the following operations to perform.

### Compact

The compact operation takes no arguments, and will remove all falsey values from the provided array. The values `false`, `null`, `0`, `undefined`, `NaN` and 0-length strings are falsey.

### Flatten

The flatten operation takes no arguments and will recursively flatten the provided array. This means that an array like `[1, [2, [3], 4], [5]]` will become the array `[1, 2, 3, 4, 5]`.

### Index Of

The index of operation takes two arguments. The first is a templateable value to search for in the array. The second is a payload path, for the result of that search. If the value is found, the index of the first instance of that value in the array will be placed at that path, otherwise -1 will be placed there.

### Insert At

The insert at operation is used to insert an item at a spot in the array, and it takes two arguments. The first is a templatable value to insert into the array. The second is a templatable array index. Negative numbers are acceptable, and will operate from the end of the array instead of the beginning.

### Length

The length operation just calculates the length of the array. It takes one argument, a payload path where the length of the array will be placed.

### Lookup At

The lookup at operation is used to lookup the element at a particular index in the array. It takes two arguments, the first of which is a templatable array index. Negative numbers are acceptable, and will operate from the end of the array instead of the beginning. The second argument is a payload path where the element at that index will be placed. If the index is outside the bounds of the array, the element will be `undefined`.

### Pop

The pop operation is used to pull off the last element in the array. It takes one (optional) argument, a payload path where that element should be placed. If the array has no items, the element will be `undefined`.

### Push

The push operation is used to add an element to the end of the array. It takes one argument, a templatable value which will be the element to append.

### Remove At

The remove at operation is used to remove am item at a particular index in the array. It takes two arguments, the first of which is a templatable array index. Negative numbers are acceptable, and will operate from the end of the array instead of the beginning. The second argument is optional, and is a payload path where the removed element will be placed. If the index was not within the bounds of the array, the removed element will be `undefined`.

### Replace At

The replace at operation is used to replace an element at a particular index in the array. It takes three arguments, the first of which is a templatable value that will be used as the replacement element. The second is a templatable array index. Negative numbers are acceptable, and will operate from the end of the array instead of the beginning. The third argument is optional, and is a payload path where the replaced element will be placed. If the index was not within the bounds of the array, the replaced element will be `undefined` (but the replacement element.will still be added to the array at that index).

### Reverse

The reverse operation takes no arguments, and does exactly what it says. It reverses the order of the elements in the array.

### Shift

The shift operation is used to pull off the first element in the array. It takes one (optional) argument, a payload path where that element should be placed. If the array has no items, the element will be `undefined`.

### Unshift

The unshift operation is used to add an element to the beginning of the array. It takes one argument, a templatable value which will be the element to prepend.

### Concat

The concat operation is used to combine the elements of two arrays. It takes one argument, a templatable value which will be the array to be concatted.
