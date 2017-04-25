# Num Prime Factors

```ruby
def factors(n)
  factors = []
  potential_factor = 1
  while potential_factor < n + 1 # we want to include the number itself|
    if n % potential_factor == 0
      factors << potential_factor
    end

    potential_factor = potential_factor + 1
  end
  factors
end

def prime?(n)
  if n <= 1
    return false
  end

  potential_factor = 2
  while potential_factor < n
    if n % potential_factor == 0
      # we've encountered a factor between 1 and the number itself
      # therefore the number cannot be prime
      return false
    end

    potential_factor = potential_factor + 1
  end

  true # we've exhausted all potential factors; the number is prime
end

def num_prime_factors(n)
  factors_arr = factors(n)
  num_primes = 0

  i = 0
  while i < factors_arr.length
    if prime?(factors_arr[i])
      num_primes = num_primes + 1
    end 

    i = i + 1
  end

  num_primes
end
```
