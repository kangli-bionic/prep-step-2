# Enumerables Quiz

<quiz>
  <question>
      <p>What does <code>[1, 2, 3, 4].all? {|int| int.even?}</code> return?</p>
      <answer><code>true</code></answer>
      <answer correct><code>false</code></answer>
      <answer><code>2</code></answer>
      <answer><code>[1, 4, 9, 16]</code></answer>
      <explanation>All of the receiver's elements are not odd. Therefore the return value is <code>false</code>.</explanation>
  </question>
</quiz>

<quiz>
  <question>
      <p>What does <code>[1, 2, 3, 4].none? {|int| int.even?}</code> return?</p>
      <answer><code>true</code></answer>
      <answer correct><code>false</code></answer>
      <answer><code>2</code></answer>
      <answer><code>[1, 4, 9, 16]</code></answer>
      <explanation>Some of receiver's elements are even. Therefore the return value is <code>false</code>.</explanation>
  </question>
</quiz>

<quiz>
  <question>
      <p>What does <code>[1, 2, 3, 4].any? {|int| int.even?}</code> return?</p>
      <answer correct><code>true</code></answer>
      <answer><code>false</code></answer>
      <answer><code>2</code></answer>
      <answer><code>[1, 4, 9, 16]</code></answer>
      <explanation>At least one of the receiver's elements is even. Therefore the return value is <code>true</code>.</explanation>
  </question>
</quiz>

<quiz>
  <question>
      <p>What does <code>[1, 2, 3, 4].map {|int| int ** 2}</code> return?</p>
      <answer><code>true</code></answer>
      <answer><code>false</code></answer>
      <answer><code>2</code></answer>
      <answer correct><code>[1, 4, 9, 16]</code></answer>
      <explanation>Here <code>map</code> returns a new array with each of the elements in the receiver squared.</explanation>
  </question>
</quiz>

<quiz>
  <question>
      <p>What does <code>[1, 2, 3, 4].count {|int| int.even?}</code> return?</p>
      <answer><code>true</code></answer>
      <answer><code>false</code></answer>
      <answer correct><code>2</code></answer>
      <answer><code>[1, 4, 9, 16]</code></answer>
      <explanation>Two elements in the receiver (<code>2</code> and <code>4</code>) return truthy values when passed to the block. The return value is therefore <code>2</code>.</explanation>
  </question>
</quiz>


```ruby
innocent_idiom = ["We", "were", "as", "Danes", "in", "Denmark", "all", "day", "long"]

how_long_am_i = innocent_idiom.select {|word| word.length < 3} + innocent_idiom.reject {|word| word.length < 3}
```

<quiz>
  <question>
      <p>What is the number of elements in <code>how_long_am_i</code>?</p>
      <answer correct><code>9</code></answer>
      <answer><code>6</code></answer>
      <answer><code>3</code></answer>
      <answer><code>0</code></answer>
      <explanation><code>select</code> and <code>reject</code> are complementary. <code>select</code> returns all the elements in its receiver for which the given block returns a truthy value, and <code>reject</code> returns all those that result in a falsey value. Concatenating the results of invoking both with the same block on the same receiver therefore produces exactly all the elements in that receiver: no more no less. </explanation>
  </question>
</quiz>


```ruby
def num_vowels(word)
  vowels = ["a", "e", "i", "o", "u"]
  word.chars.count {|ch| vowels.include?(ch.downcase)}
end

def order_by_num_vowels(str)
  words = str.split
  words.sort_by {|word| num_vowels(word)}
end
```

<quiz>
  <question>
      <p>What is the return_value of <code>order_by_num_vowels("Miracle bird or golden handiwork")</code>?</p>
      <answer><code>10</code></answer>
      <answer><code>["handiwork"]</code></answer>
      <answer correct><code>["bird", "or", "golden", "Miracle", "handiwork"]</code></answer>
      <answer><code>["handiwork", "Miracle", "golden", "or", "bird"]</code></answer>
      <explanation><code>order_by_num_vowels</code> sorts the words of a given string by the number of vowels in each and returns the resulting array. The correct answer is therefore <code>["bird", "or", "golden", "Miracle", "handiwork"]</code>.</explanation>
  </question>
</quiz>

```ruby
spheres = ["Moon", "Mercury", "Venus", "Sun", "Mars", "Jupiter",
           "Saturn", "Fixed Stars", "Primum Mobile"]

numbers_and_spheres = []

spheres.each_with_index do |circle, idx|
  numbers_and_spheres << "#{idx + 1}: #{circle}"
end
```

<quiz>
  <question>
      <p>What is the value of <code>numbers_and_spheres</code> at the end of the above code snippet?</p>
      <answer><code>["Moon", "Mercury", "Venus", "Sun", "Mars", "Jupiter",
                 "Saturn", "Fixed Stars", "Primum Mobile"]</code></answer>
      <answer correct><code>["1: Moon", "2: Mercury", "3: Venus", "4: Sun", "5: Mars", "6: Jupiter", "7: Saturn", "8: Fixed Stars", "9: Primum Mobile"]</code></answer>
      <answer><code>["0: Moon", "1: Mercury", "2: Venus", "3: Sun", "4: Mars", "5: Jupiter", "6: Saturn", "7: Fixed Stars", "8: Primum Mobile"]</code></answer>
      <answer><code>[0, 1, 2, 3, 4, 5, 6, 7, 8]</code></answer>
      <explanation>The above code snippet uses the <code>each_with_index</code> enumerable to populate <code>numbers_and_spheres</code> with strings containing indices incremented by one and the names of the Spheres of Heaven in Dante's <em>Paradiso</em>.</explanation>
  </question>
</quiz>
