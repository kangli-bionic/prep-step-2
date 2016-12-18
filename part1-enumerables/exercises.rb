def get_evens(array)
  array.select { |element| element.even? }
end

def reject_odds(array)
  array.reject { |element| element.odd? }
end

def array_sum(array)
  array.reduce(0) do |sum, number|
    sum + number
  end
end

def calculate_doubles(array)
  array.map { |element| element * 2 }
end

def calculate_doubles!(array)
  array.map! { |element| element * 2 }
end

def array_sum_with_index(array)
  sum = 0

  array.each_with_index do |number, index|
    sum += ( number * index )
  end

  sum
end

def remove_nth_letter(string, n)
  string[0...n] + string[(n + 1)..-1]
end

def longest_two_words(string)
  words = string.split
  words.sort_by { |word| word.length }[-2..-1]
end

def substring?(long_string, short_string)
  long_string.include?(short_string)
end

def missing_letters(string)
  alphabet = ("a".."z")
  alphabet.reject do |el|
    string.include?(el)
  end
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

def delete_first_letter(phrase, letter)
  phrase.each_char.with_index do |character, idx|
    if character == letter
      phrase.slice!(idx) # deletes the character at idx from phrase
      break
    end
  end

  phrase
end

def in_all_strings?(long_strings, short_string)
  long_strings.all? do |long_string|
    long_string.include?(short_string)
  end
end

# ------------------------------------------------------------------------------
# Biodiversity Index

def biodiversity_index(specimens)
  uniq_specimens = specimens.uniq
  species_count = {}

  uniq_specimens.each do |species|
    species_count[species] = specimens.count(species)
  end

  number_of_species = uniq_specimens.length
  smallest_species = species_count.values.min
  largest_species = species_count.values.max

  number_of_species ** 2 * smallest_species / largest_species
end

# ------------------------------------------------------------------------------
# For C's Sake

def for_cs_sake(string)
  c_words = string.split.select { |word| word.downcase.include?("c") }
  return "" if c_words.empty?

  c_words.map! { |word| remove_punctuation(word) }
  debugger
  c_words.min_by { |word| c_distance(word) }
end

def c_distance(word)
  word.reverse.index("c")
end

def remove_punctuation(string)
  string.delete("?,!.")
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

# Price is Right

def price_is_right(bids, actual_retail_price)
  lower_bids = bids.reject { |bid| bid > actual_retail_price}
  lower_bids.max
end

# ------------------------------------------------------------------------------
# Products Except Me

def products_except_me(numbers)
  numbers.map.with_index do |num, idx|
    sub_array = numbers[0...idx] + numbers[(idx + 1)..-1]
    array_product(sub_array)
  end
end

def array_product(array)
  array.reduce(1) { |product, n| product * n }
end

# ------------------------------------------------------------------------------
# At least N Factors

def at_least_n_factors(numbers, n)
  numbers.select { |number| num_factors(number) >= n }
end

def num_factors(number)
  (1..number).count { |n| number % n == 0 }
end

# ------------------------------------------------------------------------------
# One-week Wonders

def one_week_wonders(songs)
  uniq_songs = songs.uniq
  uniq_songs.select do |song|
    no_repeats?(song, songs)
  end
end

def no_repeats?(song_name, songs)
  songs.each_with_index do |song, idx|
    if song == song_name
      return false if song == songs[idx + 1]
    end
  end

  true
end

def anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end

def anagrams(string, array)
  array.select do |word|
    anagram?(word, string)
  end
end


def ordered_vowel_word?(word)
  vowels = "aeiou".chars

  vowels_in_word = word.chars.select do |letter|
    vowels.include?(letter)
  end

  vowels_in_word == vowels_in_word.sort
end

def no_repeat_year?(year)
  year_digits = year.to_s.chars
  year_digits == year_digits.uniq
end

def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).select do |year|
    no_repeat_year?(year)
  end
end

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
