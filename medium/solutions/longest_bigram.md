# Longest Bigram

```ruby
def longest_bigram(sentence)
  words = sentence.split
  longest_bigram = ''

  i = 0
  while i < words.length - 1 # next word would be nil if we iterated through the end of the array, hence the - 1
                             # nil.length would throw an error
    current_word = words[i]
    next_word = words[i+1]

    if current_word.length + next_word.length > longest_bigram.length - 1 # subtract 1 so as not to count the space
      longest_bigram = current_word + ' ' + next_word
    end

    i = i + 1
  end

  longest_bigram
end

```
