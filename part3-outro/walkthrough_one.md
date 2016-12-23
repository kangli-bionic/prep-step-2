# Walkthrough

<iframe src="https://player.vimeo.com/video/196825780?rel=0&autoplay=1" width="100%" height="400px" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" style="line-height: 1.6em;" rel="line-height: 1.6em;"></iframe>


## Solutions

```ruby
def anagrams?(str1, str2)
  str1.chars.sort == str2.chars.sort
  
end

def isogram_matcher(isogram1, isogram2)
  idx_match = 0
  letter_match = 0

  isogram1.chars.each_index do |i|
    if isogram1[i] == isogram2[i]
      idx_match += 1
    elsif isogram2.include?(isogram1[i])
      letter_match += 1
    end
  end

  [idx_match, letter_match]
end

def panoramic_pairs(landmarks)
  pairs = []

  landmarks.each_with_index do |landmark, idx|
    next_landmark = landmarks[idx + 1] || landmarks[0] # The || landmarks[0] allows us to wrap!
    pairs << [landmark, next_landmark]
  end

  pairs
end

def xbonacci(starting_sequence, n)
  result = starting_sequence
  num_to_sum = starting_sequence.length

  if n <= starting_sequence.length
    return starting_sequence[0...n]
  end

  until result.length == n
    last_n_numbers = result[-num_to_sum..-1]
    sum = last_n_numbers.reduce(:+)
    result << sum
  end

  result
end
```
