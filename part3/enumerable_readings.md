# Enumerables

The Enumerable module contains a set of methods called **enumerables** that
primarily traverse collections (ranges, arrays, and hashes). We'll concern
ourselves with arrays until the next chapter, when we'll study hashes. You can
already replicate the behavior of every enumerable, but these methods offer
elegant solutions to common problems.


## `all?`, `none?`, `any?`

Here's how you might check whether every integer in an array is even using what
you've learned:

```ruby
def all_even?(arr)
  arr.each {|int| return false if int.odd?}
  true
end
```

The `all?` enumerable provides a more elegant and idiomatic implementation:

```ruby
def all_even?(arr)
  arr.all? {|int| int.even?}
end
```

The `all?` method passes each element in its receiver to a given block. The
method returns `true` if the block never returns a falsey value; otherwise it
returns `false`.

The `all?` method has two cousins:
  * `none?` passes each element in its receiver to a given block. The method returns `true` if the block _never returns a truthy value_; otherwise it returns `false`.
  * `any?` passes each element in its receiver to a given block. The method returns `true` if the block _ever returns a truthy value_; otherwise it returns `false`.

```ruby
def none_even?(arr)
  # arr.all? {|int| int.odd?} is equivalent
  arr.none? {|int| int.even?}
end

def any_even?(arr)
  arr.any? {|int| int.even?}
end
```


## `map`

Already tired of setting up result arrays and shoveling elements inside? What
about having to awkwardly modify arrays with `each_index`? The `map` enumerable
returns a new array that's the result of executing its given block once for each
element in its receiver:

```ruby
simpleton = [1, 2, 3]
simpleton.map {|int| int*2} #=> [2,4,6]
simpleton #=> [1, 2, 3]
```

The `map` method has a dangerous version (`map!`) that modifies its receiver:

```ruby
about_to_be_slightly_less_simpleton = [1, 2, 3]
about_to_be_slightly_less_simpleton.map! {|int| int**2 #=> [1, 4, 9]
about_to_be_slightly_less_simpleton #=> [1, 4, 9]
```


## `count`

Recall that the `count` method has two variations for arrays. It can take no
argument, where it's synonymous with `length`, or it can take one argument,
where it returns the number of elements equal to that argument. But `count` is
more various still! When given a block, `count` returns the number of items
that, when passed to that block, return a truthy value.

```ruby
[1, 2, 3, 4, 5].count #=> 5
[1, 2, 3, 4, 5].count(2) #=> 1
[1, 2, 3, 4, 5].count {|int| int.odd?} #=> 3
```


## `select` and `reject`

Like `map`, `select` returns a new array, and like `all?`, `none?`, and `any?`,
it evaluates each element in its receiver for truthiness. `select` returns an
array containing all the elements of its receiver for which the given block
returns a truthy value. `reject` does the opposite: it returns an array
containing all the elements of its receiver for which the given block returns a
_falsey_ value. Both `select` and `reject` have dangerous versions that modify
their receivers (`select!` and `reject!`).

```ruby
  array_of_terms = ["The blab of the pave", "tires of carts",
      "sluff of boot-soles", "talk of the promenaders",
      "The heavy omnibus", 'the driver with his interrogating thumb']

  array_of_terms.select {|t| t.length > 20} #=> ["talk of the promenaders", "the driver with his interrogating thumb"]
  array_of_terms.reject {|t| t.length > 20} #=> ["The blab of the pave", "tires of carts", "sluff of boot-soles", "The heavy omnibus"]

  # WELCOME TO THE DANGER ZONE
  array_of_terms.select! {|t| t.length > 20} #=> ["talk of the promenaders", "the driver with his interrogating thumb"]
  array_of_terms #=> ["talk of the promenaders", "the driver with his interrogating thumb"]
```







Checkout the [Enumerable Documentation][enum-docs]. **Bookmark this page!** Look at the "Methods" column on the left-hand side.

The `Enumerable` module contains a set of methods that are 'mixed in' to various other classes. You don't have to understand how this works, but you need to know where and how to use `Enumerable` methods.

The `Enumerable` methods are *extremely* useful methods that can be used with ruby collections. All of the following can use `Enumerable` methods:
  * Arrays
  * Ranges
  * Hashes

Generally, if the object has an `#each` method, then it probably has access to the `Enumerable` module.

For example, let's say you have an array of integers and you want to double each value. There's a handy `Enumerable` method we can use, called `#map`:

  ```ruby
    [1, 2, 3].map { |el| el * 2 } # ==> [2, 4, 6]
  ```

### Code Blocks

Code blocks used with `Array` and `Range` `Enumerable` methods use a single argument, but code blocks used with `Hash` and `Enumerable` methods use two arguments: one for keys and one for values.

  ```ruby
    [1, 2, 3].select { |el| ... }          # ==> single argument in code block
    (0...100).select { |el| ... }          # ==> single argument in code block
    {"a" => "b"}.select { |key, val| ... } # ==> two arguments in code block
  ```

---

## Useful Methods

#### `#map`
  Returns an array with each element in the original collection is "mapped" by the given code block

  ```ruby
    squares = (1..5).map { |el| el ** 2 } # ==> [1, 4, 9, 16, 25]
  ```

#### `#select`
  Returns a new collection but only with the elements whose code block evaluated to `true`

  ```ruby
    dictionary = {
      "apple" => "fruit",
      "ant" => "a bug",
      "banana" => "yellow fruit",
      "cat" => "fluffy animal"
    }

    a_words = dictionary.select do |key, val|
      key.start_with?("a")
    end

    p a_words # ==> { "apple" => "fruit", "ant" => "a bug"}
  ```

#### `#reject`
  Returns a new collection but omits the the elements whose code block evaluated to `true`

  ```ruby
    no_tens = (1..100).reject do |el|
      el % 10 == 0
    end
  ```

#### `#any?`
  Returns `true` / `false` based on whether *any* of the elements in the collection force the code block to evaluate `true`

  ```ruby
    words = ["pan", "pot", "spatula", "knife", "fork"]
    words.any? { |kitchen_item| kitchen_item == "knife" } # ==> true

    # At least one of the words is "knife"
  ```

#### `#all?`
  Returns `true` / `false` based on whether *all* of the elements in the collection force the code block to evaluate `true`

  ```ruby
    objects = [2, 4, 9, "5", 6]
    objects.all? { |obj| obj.is_a?(Integer) }
    # ==> false

    # Not all of the objects are Integers
  ```

#### `#none?`
  Returns `true` / `false` based on whether *none* of the elements in the collection force the code block to evaluate `true`

  ```ruby
    numbers = [12, 14, 16, 23]
    objects.none? { |n| n < 10 } # ==> true

    # None of the numbers are less than 10
  ```

#### `#count`
  Counts the number of elements that evaluate `true` for a particular code block

  ```ruby
    [1, 4, 5, 4, 3, 5, 6, 7].count { |n| n.even? } # ==> 3

    # There are 3 even numbers in the array
  ```


#### `#with_index`
  Some enumerable methods are chainable with the `#with_index` method. Let's say we wanted to map an array to a new value where `n` \~\~> `n * index(n)`

  We could accomplish this using the `#with_index` method.

  ```ruby
    result = [1, 5, 6, 8].map.with_index do |el, idx|
      el * idx
    end

    result # ==> [0, 5, 12, 24]
  ```


**Try these in pry!**

[documentation]: http://ruby-doc.org/core-2.3.1/Enumerable.html
