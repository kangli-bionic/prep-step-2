# Methods

The `include?` method returns a boolean indicating whether its argument is a key
in the hash. `has_key?` and `key?` are synonyms of `include?`. The `has_value?`
method returns a boolean indicating whether its argument is a _value_ in the
hash. `value?` is a synonym of `has_value?`.

```ruby
a_hash_is_like_a_dictionary = {
  "Wittgenstein"=> "The power of language to make everything look the same
    which appears in its crassest form in the dictionary",
  Nabokov: "The reader should have a dictionary."
}

a_hash_is_like_a_dictionary.include?("Wittgenstein") #=> true
a_hash_is_like_a_dictionary.has_value?("Arthur the Aardvark") #=> false
```

The `keys` method returns an array of all the keys in its receiver. The `values`
method returns an array of all the values. The `length` method returns the
number of key-value pairs.

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
