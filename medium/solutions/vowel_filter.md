# Vowel Filter

```ruby
def disemvowel(str)
  vowels = ['a', 'e', 'i', 'o', 'u']
  new_str = ""
  i = 0
  while i < str.length
    char = str[i]

    if !(vowels.include?(char.downcase) && i.odd?)
      new_str << char
    end

    i = i + 1 # to keep the index odd
  end

  new_str
end
```
