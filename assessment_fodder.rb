
def remove_nth_letter(string, n)
  string[0...n] + string[(n + 1)..-1]
end

def substring?(long_string, short_string)
  long_string.include?(short_string)
end

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

  results << chunk #add the last chunk, regardless of its length
end


# ------------------------------------------------------------------------------
# First Last Indicies

def first_last_indices(str)
  answer = {}

  str.each_char do |c|
    first_index  = first_occurence(str, c)
    last_index  = last_occurence(str, c)
    answer[c] = [first_index]
    answer[c] << last_index if last_index != first_index
  end

  answer
end

def first_occurence(str, c)
  str.index(c)
end

def last_occurence(str, c)
  str.length - str.reverse.index(c) - 1
end

# ------------------------------------------------------------------------------
# At least N Factors

# ------------------------------------------------------------------------------

def anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end

def anagrams(string, array)
  array.select do |word|
    anagram?(word, string)
  end
end

# ****************************************************************************

# ****************************************************************************

def count_adjacent_sums(array, n)
  count = 0
  idx = 0

  while idx < (array.length - 1) # only loop until the second to last index
    if array[idx] + array[idx + 1] == n # if we've found a pair..
      count += 1
      idx += 2 # increase idx by 2 because we can't double-count elements
    else
      idx += 1
    end
  end

  count
end

# ****************************************************************************

def latinify(word)
  vowels = "aeiou".chars
  until vowels.include?(word[0].downcase)
    word = word[1..-1] + word[0]
  end
  word + "ay"
end

def pig_latin(sentence)
  words = sentence.split
  words.map! { |word| latinify(word) }
  words.join(" ")
end

# Define a method that accepts a phrase and a letter as arguments. Your method should
# remove the first instance of that letter
def delete_first_letter(phrase, letter)

end
