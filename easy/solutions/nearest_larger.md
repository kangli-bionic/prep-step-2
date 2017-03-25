# Nearest Larger

```ruby
def nearest_larger(arr, idx)
  best_distance = arr.length
  best_i = nil

  i = 0
  while i < arr.length
    index_distance = (i - idx).abs

    if arr[i] > arr[idx]

      if index_distance < best_distance #closer than our current best
        best_distance = index_distance
        best_i = i
      end

    end

    i = i + 1
  end

  best_i
end
```
