# Primer (Fibonacci)

<iframe src="https://player.vimeo.com/video/209983529?rel=0&autoplay=1" width="100%" height="400px" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" style="line-height: 1.6em;" rel="line-height: 1.6em;"></iframe>


```ruby
def fibonacci(n)
  if n == 0
    return []
  elsif n == 1
    return [0]
  end

  fibs = [0,1]
  while fibs.length < n
    fibs << fibs[-2] + fibs[-1]
  end

  fibs
end 
```
