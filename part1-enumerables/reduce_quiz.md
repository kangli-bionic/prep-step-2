# `reduce` Quiz

<quiz>
  <question>
      <p>What does <code>[24, 6, 2].reduce(:/)</code> return?</p>
      <answer><code>0</code></answer>
      <answer><code>1</code></answer>
      <answer correct><code>2</code></answer>
      <answer><code>[48, 2, 0, 0]</code></answer>
      <explanation>The Ruby interpreter designates the first element in the array as the initial accumulator and successively applies the <code>/</code> operator, updating the accumulator with each iteration. This invocation of <code>reduce</code> is equivalent to <code>24 / 6 / 2</code>, which returns <code>2</code>.</explanation>
  </question>
</quiz>

<quiz>
  <question>
      <p>What does <code>[24, 6, 2].reduce {|acc, el| acc / el}</code> return?</p>
      <answer><code>0</code></answer>
      <answer><code>1</code></answer>
      <answer correct><code>2</code></answer>
      <answer><code>[48, 2, 0, 0]</code></answer>
      <explanation>This invocation of <code>reduce</code> is functionally equivalent to the previous because the block simply invokes the <code>/</code> operator.</explanation>
  </question>
</quiz>

<quiz>
  <question>
      <p>What does <code>[24, 6, 2].reduce {|acc, el| acc / el - 1}</code> return?</p>
      <answer correct><code>0</code></answer>
      <answer><code>1</code></answer>
      <answer><code>2</code></answer>
      <answer><code>[48, 2, 0, 0]</code></answer>
      <explanation>The accumulator is initially <code>24</code>. The first iteration reassigns the accumulator to <code>3</code> (<code>24 / 6 - 1</code>). The second and final iteration reassigns the accumulator to <code>0</code> (<code>3 / 2 - 1</code>). (The block decrements one on each iteration, not just the final one.) </explanation>
  </question>
</quiz>

<quiz>
  <question>
      <p>What does <code>[24, 6, 2].reduce(48) {|acc, el| acc / el}</code> return?</p>
      <answer correct><code>0</code></answer>
      <answer><code>1</code></answer>
      <answer><code>2</code></answer>
      <answer><code>[48, 2, 0, 0]</code></answer>
      <explanation>This invocation is equivalent to those of the first two questions except the initial accumulator is <code>48</code>. The first iteration reassigns the accumulator to <code>2</code> (<code>48 / 24</code>). The second reassigns the accumulator to <code>0</code> (<code>2 / 6</code>). The third and final again reassigns the accumulator to <code>0</code> (<code>0 / 2</code>).</explanation>
  </question>
</quiz>

<quiz>
  <question>
      <p>What does <code>[24, 6, 2].reduce([48]) {|acc, el| acc << acc.last / el}</code> return?</p>
      <answer><code>0</code></answer>
      <answer><code>1</code></answer>
      <answer><code>2</code></answer>
      <answer correct><code>[48, 2, 0, 0]</code></answer>
      <explanation>This invocation uses <code>[48]</code> as the initial accumulator. The first iteration reassigns the accumulator to <code>[48, 2]</code> (<code>[48] << 48 / 24</code>). The second reassigns the accumulator to <code>[48, 2, 0]</code> (<code>[48, 2] << 2 / 6</code>). The third and final reassigns the accumulator to <code>[48, 2, 0, 0]</code> (<code>[48, 2, 0] << 0 / 2</code>).</explanation>
  </question>
</quiz>
