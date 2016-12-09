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
# The formatting is purely for readability.
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


## Methods

The `include?` method returns a boolean indicating whether its argument is a key
in the hash. `has_key?` and `key?` are synonyms of `include?`. The `has_value?`
method returns a boolean indicating whether its argument is a _value_ in the
hash. `value?` is a synonym of `has_value?`.

```ruby
a_hash_is_like_a_dictionary = {
  "Wittgenstein"=> "The power of language to make everything look the same which appears in its crassest form in the dictionary",
  Nabokov: "The reader should have a dictionary."
}

a_hash_is_like_a_dictionary.include?("Wittgenstein") #=> true
a_hash_is_like_a_dictionary.has_value?("Arthur the Aardvark") #=> false
```

The `keys` method returns an array of all the keys in its hash receiver. The
`values` method returns an array of all the values. The `length` method returns
the number of key-value pairs.

```ruby
shorter_example_thankfully = {
  a: 0,
  b: 1,
  c: 2
}

shorter_example_thankfully.keys #=> [:a, :b, :c]
shorter_example_thankfully.values #=> [0, 1, 2]
shorter_example_thankfully.length #=> 3
```

The `to_a` method type converts its receiver hash into a nested array of [_key_,
_value_] arrays. Conversely, one can type convert a nested array of two-element
arrays to a hash with the `to_h` method.

```ruby
hbo_shows_ranking = {
  "The Wire" => 1,
  "True Detective Season 1" => 2,
  "Westworld" => 3
}

hbo_shows_ranking.to_a #=> [["The Wire", 1], ["True Detective Season 1", 2], ["Westworld", 3]]

animated_ranking = [["South Park", 1], ["Rick and Morty", 2], ["Archer", 3]]
animated_ranking.to_h #=> {"South Park"=>1, "Rick and Morty"=>2, "Archer"=>3}
```


## Iterators

## Enumerables

## Counter Hashes

An alternative syntax for a declaring a hash is `Hash.new`. The `new` method
takes an optional argument: the default value of each key. When one tries to
access a nonexistent key in a hash with a default value, the return value is
that default value. Accessing a nonexistent key, however, does not create a new
key-value pair. Without setting a default value, accessing a nonexistent key
returns `nil`.

```ruby
# without a default value
dog_breeds = {"corgi"=>"short and sweet", "labrador"=>"labradorable"}
dog_breeds["calico"] #=> nil

# with a default value
default_cuties = Hash.new("cutie")
dog_breeds["vizsla"] #=> cutie

# accessing a nonexistent key doesn't alter the hash
dog_breeds #=> {}
```

Setting a default key is crucial for declaring a counter hash, one whose keys
are the elements in a collection and whose values are the number of occurrences
of that key in the collection.





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
