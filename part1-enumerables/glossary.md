# Glossary

* Enumerables - A set of methods that traverse or sort collections (ranges, arrays, hashes).


## Enumerable Methods

* `all?` - Passes each element in its receiver to a given block; returns `true` if the block never returns a falsey value (otherwise it returns `false`).
* `any?` - Passes each element in its receiver to a given block; returns `true` if the block ever returns a truthy value (otherwise it returns `false`).
* `count` - With no arguments: returns the number of elements in its receiver; with one argument: returns the number of elements in its receiver equal to its argument; with a block: returns the number of items in its receiver that, when passed to the block, return a truthy value.
* `each_with_index` - Calls the given block with two arguments--the item and the item's index--once for each element in the method's receiver.
* `map` - Returns a new array that's the result of executing its given block once for each element in its receiver.
* `none?` - Passes each element in its receiver to a given block; returns `true` if the block never returns a truthy value (otherwise it returns `false`).
* `reduce` - Combines all elements of its receiver by applying a binary operation, specified by a block or a symbol that names a method or operator; synonymous with `inject`.
* `reject` - Returns a collection containing all the elements in its receiver for which the given block returns a falsey value.
* `select` - Returns a collection containing all the elements in its receiver for which the given block returns a truthy value.
* `sort_by` - Sorts its receiver by the return values of its elements when they are passed to the given block and returns an array in that order.
* `with_index` - A chainable method that allows the block given to `map` or `each_char` to receive indices as well as receiver elements.
