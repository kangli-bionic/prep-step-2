# Hash Quiz

```ruby
animals = {
  "silly" => "pugilistic kangaroo",
  "sillier" => "kooky koala",
  "silliest" => "Tiresius the neighborhood pterodactyl",
  0 => "nihilophobia-inducing number"
}
```

<quiz>
  <question>
      <p>What does <code>animals[0]</code> return?</p>
      <answer><code>"pugilistic kangaroo"</code></answer>
      <answer><code>"kooky koala"</code></answer>
      <answer><code>"Tiresius the neighborhood pterodactyl"</answer>
      <answer correct><code>"nihilophobia-inducing number"</code></answer>
      <answer><code>nil</code></answer>
      <explanation>In a hash, one accesses the value corresponding to a key with <code>[key]</code>. In <code>animals</code>, the key <code>0</code> corresponds to the value <code>"nihilophobia-inducing number"</code>. Therefore <code>animals[0]</code> returns <code>"nihilophobia-inducing number"</code>.</explanation>
  </question>
</quiz>

<quiz>
  <question>
    <p>What does <code>animals["unsilly"]</code> return?</p>
      <answer><code>"pugilistic kangaroo"</code></answer>
      <answer><code>"kooky koala"</code></answer>
      <answer><code>"Tiresius the neighborhood pterodactyl"</answer>
      <answer><code>"nihilophobia-inducing number"</code></answer>
      <answer correct><code>nil</code></answer>
      <explanation>Accessing a nonexistent key in a hash without a default value returns <code>nil</code>. <code>animals</code> does not have the key <code>"unsilly"</code> and lacks a default value. Therefore <code>animals["unsilly"]</code> returns <code>nil</code>.</explanation>
  </question>
</quiz>

<quiz>
  <question>
    <p>How might one add the value "Lucy the lucky lemur" to <code>animals</code>?</p>
    <answer><code>animals.values << "Lucy the lucky lemur"</code></answer>
    <answer correct><code>animals["Lucy uses her luck to justify her gambling addiction"] = "Lucy the lucky lemur"</code></answer>
    <answer><code>animals["Lucy the lucky lemur"] = true</code></answer>
    <answer><code>animals += "Lucy the lucky lemur"</code></answer>
    <explanation>The syntax for adding a key-value pair to a hash is to assign a value to a hereto nonexistent key. <code>animals["Lucy uses her luck to justify her gambling addiction"] = "Lucy the lucky lemur"</code> is therefore correct. The first choice appends the string <code>"Lucy the lucky lemur"</code> to an array of the values of <code>animals</code>, but it does not affect the hash <code>animals</code> itself. The third choice adds </code>"Lucy the Lucky lemur"</code> as a <em>key</em> with the value <code>true</code>. The syntax for the fourth option applies to array concatenation, among other things, and is inapplicable to hashes.</explanation>
  </question>
</quiz>

<quiz>
  <question>
    <p>What does <code>animals.key?("silliest")</code> return?</p>
      <answer><code>["silly", "sillier", "silliest", 0]</code></answer>
      <answer><code>["pugilistic kangaroo", "kooky koala", "Tiresius the neighborhood pterodactyl", "nihilophobia-inducing number"]</code></answer>
      <answer><code>false</code></answer>
      <answer correct><code>true</code></answer>
      <explanation>The <code>key?</code> method returns a boolean indicating whether its argument is a key in the hash. <code>"silliest"</code> is a key in the hash <code>animals</code>. Therefore <code>animals.key?("silliest")</code> returns <code>true</code>. </explanation>
  </question>
</quiz>

<quiz>
  <question>
    <p>What does <code>animals.value?("boringest bear")</code> return?</p>
      <answer><code>["silly", "sillier", "silliest", 0]</code></answer>
      <answer><code>["pugilistic kangaroo", "kooky koala", "Tiresius the neighborhood pterodactyl", "nihilophobia-inducing number"]</code></answer>
      <answer correct><code>false</code></answer>
      <answer><code>true</code></answer>
      <explanation>The <code>val?</code> method returns a boolean indicating whether its argument is a value in the hash. <code>"boringest bear"</code> is not a value in the hash <code>animals</code>. Therefore <code>animals.value?("boringest bear")</code> returns <code>false</code>. </explanation>
  </question>
</quiz>

<quiz>
  <question>
    <p>What does <code>animals.keys</code> return?</p>
      <answer correct><code>["silly", "sillier", "silliest", 0]</code></answer>
      <answer><code>["pugilistic kangaroo", "kooky koala", "Tiresius the neighborhood pterodactyl", "nihilophobia-inducing number"]</code></answer>
      <answer><code>[["silly", "pugilistic kangaroo"], ["sillier", "kooky koala"], ["silliest", "Tiresius the neighborhood pterodactyl"], [0, "nihilophobia-inducing number"]]</code></answer>
      <answer><code>true</code></answer>
      <explanation>The <code>keys</code> method returns an array of the keys of its receiver. <code>["silly", "sillier", "silliest", 0]</code> is therefore correct.</explanation>
  </question>
</quiz>

<quiz>
  <question>
    <p>What does <code>animals.values</code> return?</p>
      <answer><code>["silly", "sillier", "silliest", 0]</code></answer>
      <answer correct><code>["pugilistic kangaroo", "kooky koala", "Tiresius the neighborhood pterodactyl", "nihilophobia-inducing number"]</code></answer>
      <answer><code>[["silly", "pugilistic kangaroo"], ["sillier", "kooky koala"], ["silliest", "Tiresius the neighborhood pterodactyl"], [0, "nihilophobia-inducing number"]]</code></answer>
      <answer><code>true</code></answer>
      <explanation>The <code>values</code> method returns an array of the values of its receiver. <code>["pugilistic kangaroo", "kooky koala", "Tiresius the neighborhood pterodactyl", "nihilophobia-inducing number"]</code> is therefore correct.</explanation>
  </question>
</quiz>

<quiz>
  <question>
    <p>What does <code>animals.length == 5</code> return?</p>
      <answer><code>["silly", "sillier", "silliest", 0]</code></answer>
      <answer><code>["pugilistic kangaroo", "kooky koala", "Tiresius the neighborhood pterodactyl", "nihilophobia-inducing number"]</code></answer>
      <answer correct><code>false</code></answer>
      <answer><code>true</code></answer>
      <explanation>When invoked upon a hash, the <code>length</code> method returns the number of key-value pairs. <code>animals</code> has four key-value pairs. Therefore <code>animals.length == 5</code> returns <code>false</code>.</explanation>
  </question>
</quiz>


  ```ruby
    def top_two_silliest(hash)
      hash.sort_by {|k, v| k.to_s.length}[-2..-1]
    end
  ```

<quiz>
  <question>
    <p>What does <code>top_two_silliest(animals)</code> return?</p>
      <answer><code>["sillier", "silliest"]</code></answer>
      <answer><code>["kooky koala", "Tiresius the neighborhood pterodactyl"]</code></answer>
      <answer><code>{"sillier" => "kooky koala", "silliest" => "Tiresius the neighborhood pterodactyl"}</code></answer>
      <answer correct><code>[["sillier", "kooky koala"], ["silliest", "Tiresius the neighborhood pterodactyl"]]</code></answer>
      <explanation>With a hash as the receiver, <code>sort_by</code> returns a nested array of [<em>key</em>,
      <em>value</em>] arrays in the order specified by its block. <code>animals.sort_by {|k, v| k.to_s.length}</code> returns <code>[[0, "nihilophobia-inducing number"], ["silly", "pugilistic kangaroo"], ["sillier", "kooky koala"], ["silliest", "Tiresius the neighborhood pterodactyl"]]</code>. <code>top_two_silliest</code> returns the last two elements of this array: <code>["sillier", "kooky koala"], ["silliest", "Tiresius the neighborhood pterodactyl"]</code>.</explanation>
  </question>
</quiz>

  ```ruby
  animals = Hash.new("All animals are silly by default.")
  animals["Lately Lucy's been down on her luck"] = false
  animals["unsilly"] #=> ?
  ```

<quiz>
  <question>
    <p>What does <code>animals["unsilly"]</code> return?</p>
      <answer><code>nil</code></answer>
      <answer correct><code>"All animals are silly by default"</code></answer>
      <answer><code>false</code></answer>
      <answer><code>true</code></answer>
      <explanation>Passing <code>"All animals are silly by default."</code> as the argument to Hash.new sets <code>"All animals are silly by default."</code> as the hash's default argument. Accessing an nonexistent key like <code>"unsilly"</code> therefore returns <code>"All animals are silly by default."</code>.</explanation>
  </question>
</quiz>
