# `reduce`

`reduce` is by far the most difficult enumerable to learn. Luckily your teacher is a professional! `reduce` can be invoked in three ways:

  1. With one argument, a symbol that names a binary method or operator (e.g., `:+`, which takes two operands, or `:lcm`, which has a receiver and an argument).
  2. With a block and without an argument. The block has two parameters: an accumulator and the current element.
  3. With a block and with one argument that's a default accumulator. The block has two parameters: an accumulator and the current element.

Let's examine each case.


## With a Symbol

What do these invocations of `reduce` do? How do the array elements contribute
to the return value?

```ruby
[1, 2].reduce(:+) #=> 3
[1, 2].reduce(:*) #=> 2

[1, 2, 3].reduce(:+) #=> 6
[1, 2, 3].reduce(:*) #=> 6
```

When we pass `:+`, the return value is the _sum_ of all the elements in the
array; when we pass `:*`, the return value is the _product_ of all the elements
in the array. Each element in the receiver is passed to the method specified in
the argument, but how exactly? In what order? For `[1, 2, 3].reduce(:+)`, the
Ruby interpreter executes these steps under the hood:

  1. The interpreter stores the first element in the array as an accumulator.
  2. The interpreter invokes the `+` operator because its name was passed as the argument. The accumulator (`1`) is the receiver and the next element in the array (`2`) is the argument (i.e., `1 + 2` or `1.+(2)`).
  3. The interpreter reassigns the accumulator to the return value of the addition in step 2 (`3`).
  4. The interpreter invokes the `+` operator again with the accumulator (`3`) as the receiver and the next element in the array (`3`) as the argument (i.e., `3 + 3` or `3.+(3)`).
  5. The interpreter reassigns the accumulator to the return value of the addition in step 4 (`6`).
  6. Because the array has no remaining elements, the interpreter returns the accumulator, `6`.

This method performs the same steps and is functionally equivalent:

```ruby
  def my_sum(arr)
    accumulator = arr.first # store first element as accumulator

    arr.each_index do |idx|
      next if idx == 0 # skip first element: it's already the accumulator
      accumulator += arr[idx] #increment accumulator by current element
    end

    accumulator
  end
```


## With a Block, Without an Argument
