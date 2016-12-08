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

One declares an hash with curly braces. `{}` is an empty hash, i.e., a hash of
length zero. One can store key-value pairs in a hash by separating them with
commas and enclosing them in curly braces. Each key points to its value via the
**hash rocket** (`=>`). This hash is equivalent to `["a", "b", "c", "d"]`:

```ruby
# Declaration
simple_hash = {0=>"a", 1=>"b", 2=>"c", 3=>"d"}

# Access
simple_hash[0] #=> "a"
simple_hash[99] #=> nil (this key doesn't exist)
```

Accessing values in a hash using keys has the same bracket syntax as accessing
values in an array using indices. The syntax for hash assignment is also
equivalent:

```ruby
simple_hash = {0=>"a", 1=>"b", 2=>"c", 3=>"d"}
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
operation using array indices! Much of the magic of hashes derives from the fact
that the keys are arbitrary and may be of any data type. The only constraint is
that all keys must be unique. If two `5` keys point to different values, the
Ruby interpreter won't know which value to access. In practice, the interpreter
overwrites the earlier key-value pair if a later key-value pair with an
equivalent key is provided.

```ruby
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










# Introduction to Arrays

A **data structure** is a format for organizing and storing data. Data
structures allow one to represent, access, and manipulate a collection of data.
A classic example of a data structure is the **array**, an ordered,
zero-indexed collection of objects.


## Declaration

In Ruby one declares an array with square brackets. `[]` is an empty array,
i.e., an array of length zero. One can store items in an array by separating
them with commas and enclosing them in square brackets. Any object or
combination of objects (including other arrays) can be stored in an array.

```ruby
empty_array = []
int_array = [1,2,3]
str_array = ["str1", "str2", ""]
mixed_array = [1, false, :sym, "str", nil]
nested_array = [[]]
```

Although Ruby permits heterogeneous arrays, it's generally preferable to
maintain a single data type throughout the array, ensuring predictability when
accessing or manipulating the array. An array that includes another array is
called a **nested** or **two-dimensional** array.
