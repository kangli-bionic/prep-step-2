# Walkthrough

<iframe src="https://player.vimeo.com/video/196825547?rel=0&autoplay=1" width="100%" height="400px" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" style="line-height: 1.6em;" rel="line-height: 1.6em;"></iframe>


## Solutions

```ruby
def remove_letter_a(words)
  words.map do |word|
    word.delete("a")
  end
end


def abundant?(num)
  divisors = find_divisors(num)
  sum_divisors = array_sum(divisors)
  sum_divisors > num
end

def find_divisors(num)
  (1...num).select { |divisor| num % divisor == 0 }
end

def array_sum(array)
  array.reduce(0) { |sum, n| sum + n }
end


def greatest_common_factor(first_number, second_number)
  smaller_num = [first_number, second_number].min

  (1..smaller_num).to_a.reverse.each do |potential_factor|
    if first_number % potential_factor == 0 &&
      second_number % potential_factor == 0

        return potential_factor # the first factor to be returned is the largest
    end
  end
end


def word_with_most_repeats(sentence)
  words_and_repeats = {}
  words = sentence.split

  words.each do |word|
    words_and_repeats[word] = count_repeats(word)
  end

  largest_count = words_and_repeats.sort_by {|k,v| v}.last.last #find largest count
  # return the earlier word in the event of a tie
  words_and_repeats.select {|k,v| v == largest_count}.first.first
end

def count_repeats(word)
  uniq_letters = word.chars.uniq
  uniq_letters.count do |char|
    word.count(char) > 1
  end
end
```
