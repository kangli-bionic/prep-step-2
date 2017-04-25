# Primer (Num Consecutive Elements)

<iframe src="https://player.vimeo.com/video/209984086?rel=0&autoplay=1" width="100%" height="400px" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" style="line-height: 1.6em;" rel="line-height: 1.6em;"></iframe>


```ruby
def num_consecutive_elements(arr)
  count = 0

  i = 0
  while i < arr.length

    if arr[i] == arr[i+1]
      count = count + 1
    end

    i = i + 1
  end

  count
end
```
