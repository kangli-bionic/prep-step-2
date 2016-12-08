# `reduce`

`reduce` is by far the most difficult enumerable to learn. Luckily your teacher
is a professional! `reduce` can be invoked in three ways:

  1. With one argument, a symbol that names a binary method or operator (e.g., `:+`, which takes two operands, or `:lcm`, which has a receiver and an argument).
  2. With a block and without an argument. The block has two parameters: an accumulator and the current element.
  3. With a block and with one argument that's the initial accumulator. The block has two parameters: an accumulator and the current element.

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
the argument, but how exactly? In what order? The order in which the elements
are passed might not matter for commutative operations like addition and
multiplication, but it certainly matters if the argument is `:/`:

```ruby
[1.0, 2.0, 3.0].reduce(:/) #=> 0.16666666666666666
[3.0, 2.0, 1.0].reduce(:/) #=> 1.5
```

Let's return to a simpler example: `[1, 2, 3].reduce(:+)`. The Ruby interpreter
executes these steps under the hood:

  1. The interpreter stores the first element in the array as an accumulator.
  2. The interpreter invokes the `+` operator because its name was passed as the argument. The accumulator (`1`) is the receiver and the next element in the array (`2`) is the argument (i.e., `1 + 2` or `1.+(2)`).
  3. The interpreter reassigns the accumulator to the return value of the addition in step 2 (`3`).
  4. The interpreter invokes the `+` operator again with the accumulator (`3`) as the receiver and the next element in the array (`3`) as the argument (i.e., `3 + 3` or `3.+(3)`).
  5. The interpreter reassigns the accumulator to the return value of the addition in step 4 (`6`).
  6. Because the array has no remaining elements, the interpreter returns the accumulator, `6`.

This method is analogous to `reduce(:+)`:

```ruby
  def my_sum(arr)
    accumulator = arr.first # store first element as accumulator

    arr.each_index do |idx|
      next if idx == 0 # skip first element: it's already the accumulator
      accumulator += arr[idx] # increment accumulator by current element
    end

    accumulator
  end
```


## With a Block, Without an Argument

These two invocations of `reduce` are functionally equivalent:

```ruby
[1, 2, 3].reduce(:+)
[1, 2, 3].reduce {|acc, el| acc + el}
```

The second invocation is more explicit. The interpreter stores the first element
of the array in the `acc` argument and adds every subsequent element in
succession. After each iteration, the interpreter reassigns `acc` to the _return
value of the block_. It returns `acc`  when no elements remain.  

Invoking `reduce` with a block gives greater control over how to reduce the
receiver. One isn't limited to binary methods or operations:

```ruby
def sum_first_and_odds(arr)
  arr.reduce do |acc, el|
    if el.odd?
      acc + el
    else
      # this else statement is necessary because otherwise the return value of
      # the block would be nil if the element is even. Thus the interpreter
      # would reassign acc to nil.
      acc
    end
  end
end

sum_first_and_odds([1, 2, 4, 5]) #=> 6
```

So far, the need to use the first element in the array as the accumulator limits
the use cases for `reduce`. What about when we want to use a counter or a result
array as the accumulator? The first element wouldn't suffice in most cases.
Enter the final way to invoke `reduce`.


## With a Block, With an Initial Accumulator




v. result array, count odds etc.
