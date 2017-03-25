# Remove Nth Letter

```ruby
  def remove_nth_letter(string, n)
    index_to_remove = n - 1
    left = str[0...index_to_remove] # three dots makes an exclusive range (index_to_remove is not included)
    right = str[index_to_remove+1..-1]
    left + right
  end
```
