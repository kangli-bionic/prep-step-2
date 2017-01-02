# Hashes

A **hash** is a collection of key-value pairs with unique keys. One can also
imagine arrays as a collection of key-value pairs, where the keys are the
indices. One accesses a value in an array _via its key_, i.e., with its index.
Consider `["a", "b", "c", "d"]`:

| Key | Value |
|---|---|
| 0 | "a" |
| 1 | "b" |
| 2 | "c" |
| 3 | "d" |


## Declaration, Access, Assignment

One declares a hash with curly braces. `{}` is an empty hash, i.e., a hash of
length zero. One can store key-value pairs in a hash by separating them with
commas and enclosing them in curly braces. Each key points to its value via the
**hash rocket** (`=>`). This hash is equivalent to `["a", "b", "c", "d"]`:

```ruby
# Declaration
simple_hash = {0=>"a", 1=>"b", 2=>"c", 3=>"d"}

# Access
simple_hash[0] #=> "a"
```

Accessing values in a hash using keys has the same bracket syntax as accessing
values in an array using indices. Accessing a nonexistent key returns `nil`:

```ruby
simple_hash = {0=>"a", 1=>"b", 2=>"c", 3=>"d"}
simple_hash[:mr_monkey_pants] #=> nil
```

The syntax for hash assignment is also the same as array assignment:

```ruby
simple_hash = {0=>"a", 1=>"b", 2=>"c", 3=>"d"}

# Assignment
simple_hash[0] = "z"

simple_hash #=> {0=>"z", 1=>"b", 2=>"c", 3=>"d"}
```

One adds new key-value pairs to a hash by assigning a value to a hereto
nonexistent key:

```ruby
increasingly_less_simple_hash = {0=>"z", 1=>"b", 2=>"c", 3=>"d"}
increasingly_less_simple_hash[5] = "w"
increasingly_less_simple_hash #=> {0=>"z", 1=>"b", 2=>"c", 3=>"d", 5=>"w"}
```

So far you may be wondering what all the hubbub is about. We can do all these
operations using array indices! Much of the magic of hashes derives from the fact
that the keys are arbitrary and may be of any data type. The only constraint is
that all keys must be unique. If two `5` keys pointed to different values, the
Ruby interpreter wouldn't know which value to access. In practice, the interpreter
overwrites the earlier key-value pair when one provides another key-value pair
with an equivalent key.

```ruby
# The formatting is purely for legibility.
nerdy_hash = {
  "fibonacci_numbers" => [0, 1, 1, 2, 3, 5],
  :pre_socratics => ["Thales", "Xenophanes", "Diogenes", "Heraclitus", "Pythagoras"],
  true => "Ruby first appeared in 1995."
}
```

One can use an alternative syntax for declaring key-value pairs if the keys are
symbols. Simply append a colon to the end of the symbol and remove its initial
colon. No hash rocket needed.

```ruby
nerdy_take_two = {
  fibonacci_numbers: [0, 1, 1, 2, 3, 5],
  pre_socratics: ["Thales", "Xenophanes", "Diogenes", "Heraclitus", "Pythagoras"],
  true: "Ruby first appeared in 1995."
}

nerdy_take_two[:true] #=> "Ruby first appeared in 1995."
```
