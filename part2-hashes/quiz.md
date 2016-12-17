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
      <answer>"pugilistic kangaroo"</answer>
      <answer>"kooky koala"</answer>
      <answer><code>"Tiresius the neighborhood pterodactyl"</answer>
      <answer correct><code>"nihilophobia-inducing number"</code></answer>
      <answer>nil</answer>
      <explanation></explanation>
  </question>

  <question>
    <p>What does <code>animals["unsilly"]</code> return?</p>
      <answer>"pugilistic kangaroo"</answer>
      <answer>"kooky koala"</answer>
      <answer><code>"Tiresius the neighborhood pterodactyl"</answer>
      <answer><code>"nihilophobia-inducing number"</code></answer>
      <answer correct>nil</answer>
      <explanation></explanation>
  </question>

  <question>
    <p>How might one add the value "Lucy the lucky lemur" to <code>animals</code>?</p>
    <answer><code>animals.values << "Lucy the lucky lemur"</code></answer>
    <answer correct><code>animals["Lucy uses her luck to justify her gambling addiction"] = "Lucy the lucky lemur"</code></answer>
    <answer><code>animals["Lucy the lucky lemur"] = true</code></answer>
    <answer><code>animals += "Lucy the lucky lemur"</code></answer>
    <explanation></explanation>
  </question>

  <question>
    <p>What does <code>animals.keys</code> return?</p>
      <answer correct><code>["silly", "sillier", "silliest", 0]</code></answer>
      <answer><code>["pugilistic kangaroo", "kooky koala", "Tiresius the neighborhood pterodactyl", "nihilophobia-inducing number"]</code></answer>
      <answer><code>[["silly", "pugilistic kangaroo"], ["sillier", "kooky koala"], ["silliest", "Tiresius the neighborhood pterodactyl"], [0, "nihilophobia-inducing number"]]</code></answer>
      <answer><code>true</code></answer>
      <explanation></explanation>
  </question>

  <question>
    <p>What does <code>animals.values</code> return?</p>
      <answer><code>["silly", "sillier", "silliest", 0]</code></answer>
      <answer correct><code>["pugilistic kangaroo", "kooky koala", "Tiresius the neighborhood pterodactyl", "nihilophobia-inducing number"]</code></answer>
      <answer><code>[["silly", "pugilistic kangaroo"], ["sillier", "kooky koala"], ["silliest", "Tiresius the neighborhood pterodactyl"], [0, "nihilophobia-inducing number"]]</code></answer>
      <answer><code>true</code></answer>
      <explanation></explanation>
  </question>

  <question>
    <p>What does <code>animals.key?("silliest")</code> return?</p>
      <answer><code>["silly", "sillier", "silliest", 0]</code></answer>
      <answer><code>["pugilistic kangaroo", "kooky koala", "Tiresius the neighborhood pterodactyl", "nihilophobia-inducing number"]</code></answer>
      <answer><code>false</code></answer>
      <answer correct><code>true</code></answer>
      <explanation></explanation>
  </question>

  <question>
    <p>What does <code>animals.length == 5</code> return?</p>
      <answer><code>["silly", "sillier", "silliest", 0]</code></answer>
      <answer><code>["pugilistic kangaroo", "kooky koala", "Tiresius the neighborhood pterodactyl", "nihilophobia-inducing number"]</code></answer>
      <answer correct><code>false</code></answer>
      <answer><code>true</code></answer>
      <explanation></explanation>
  </question>

  ```ruby
    def top_two_silliest(hash)
      hash.sort_by {|k, v| k.to_s.length}[-2..-1]
    end
  ```

  <question>
    <p>What does <code>top_two_silliest(animals)</code> return?</p>
      <answer><code>["sillier", "silliest"]</code></answer>
      <answer><code>["kooky koala", "Tiresius the neighborhood pterodactyl"]</code></answer>
      <answer><code>{"sillier" => "kooky koala", "silliest" => "Tiresius the neighborhood pterodactyl"}</code></answer>
      <answer correct><code>[["sillier", "kooky koala"], ["silliest", "Tiresius the neighborhood pterodactyl"]]</code></answer>
      <explanation></explanation>
  </question>

  ```ruby
  animals = Hash.new("All animals are inherently silly.")
  animals["Lately Lucy's been down on her luck"] = false
  ```

  <question>
    <p>What does <code>animals["unsilly"]</code> return?</p>
      <answer><code>nil</code></answer>
      <answer correct><code>"All animals are inherently silly"</code></answer>
      <answer><code>false</code></answer>
      <answer><code>true</code></answer>
      <explanation></explanation>
  </question>

</quiz>
