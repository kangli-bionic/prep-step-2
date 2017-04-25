# Wordplay

```ruby
def wordplay(str1, str2)
  indices = []

  i = 0
  #iterate through str2
  while i < str2.length
    char = str2[i]

    # set variable to ensure we don't add multiple indices for this character
    # (in case the character occurs more than once in str2)
    already_added_index = false

    j = 0
    #iterate through str1
    while j < str1.length

      # check if current character in str1 is equal to the current char in str2
      # don't add an index if we've alredy done so for this str2 character
      if str1[j] == char && !already_added_index
        # the characters are equal: add to the result array
        indices.push(j)
        # set already_added_index to true so we don't repeat
        already_added_index = true
      end
      j = j + 1
    end

    i = i + 1
  end

  # check if every character in str2 was in str1 by checking if the length of
  # the result array is equal to the length of str2
  if indices.length == str2.length
    return indices
  end
  # we must not have added an index for at least one of the characters in str2,
  # meaning that character did not occur in str2; therefore we can return false
  false
end
```
