# Bubble Sort

```ruby
def bubble_sort(arr)
  sorted = false

  while !sorted # swap elements until sorted is true
    sorted = true

    i = 0
    while i < arr.length - 1 # so we don't compare the last element with nil (nonexistant index)

      if arr[i] > arr[i + 1] # these elements are out of order; we must swap them
        larger = arr[i]
        smaller = arr[i+1]
        arr[i] = smaller
        arr[i+1] = larger

        sorted = false # we had to swap, therefore the array wasn't already sorted
      end

      i = i + 1
    end
  end

  arr
end
```
