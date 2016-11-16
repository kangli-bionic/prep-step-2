
def update_inventory(older, newer)
  newer.each do |key, value|
    older[key] = value
  end
  older
end

# ****************************************************************************

def redact_five_letter_words(string)
end

# ****************************************************************************

def evens_and_odds(numbers)
end

# ****************************************************************************

def is_prime?(number)
  return false if number <= 1
  (2...number).to_a.none?{ |factor| number % factor == 0 }
end


def primes(n)
  primes = []
  number = 0
  until primes.length == n
    primes << number if is_prime?(number)
    number += 1
  end
  primes
end

# ****************************************************************************

# chunk an array into nested arrays of length n
def chunk(array, n)
  chunk = []
  results = []
  array.each do |element|
    if chunk.length == n
      results << chunk
      chunk = []
    end
    chunk << element
  end

  results << chunk
end

# ****************************************************************************

def delete_first_letter(phrase, letter)
  (0...phrase.length).each do |index|
    if phrase[index] == letter
      phrase[index] = ""
      break
    end
  end
  phrase
end

# ****************************************************************************

def largest_sum_pair(array)
  indices = [0,1]
  (0...array.length).each do |index1|
    (index1 + 1...array.length).each do |index2|
      indices = [index1, index2] if array[index1] + array[index2] > array[indices[0]] + array[indices[1]]
    end
  end
  indices
end

# ****************************************************************************

def most_common_vowel(string)
  vowels = "aeiouy".chars
  counts = Hash.new(0)
  string.each_char do |character|
    if vowels.include?(character)
      counts[character] += 1
    end
  end
  most_common = "a"
  vowels.each do |vowel|
    if counts[vowel] > counts[most_common]
      most_common = vowel
    end
  end
  most_common
end
