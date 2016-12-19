require 'byebug'
# EASY

# Define a method that returns an array of only the even numbers in its argument (an array of integers).
def get_evens(arr)
  arr.select { |element| element.even? }
end

# Define a method that returns the sum of all the elements in its argument (an array of numbers).
def array_sum(arr)
  arr.reduce(:+)
end

# Define a method that returns a new array of all the elements in its argument doubled. This method should *not* modify the original array.
def calculate_doubles(arr)
  arr.map {|el| el * 2}
end

# Define a method that returns its argument with all the argument's elements doubled. This method should modify the original array.
def calculate_doubles!(arr)
  arr.map! {|el| el * 2}
end


# Define a method that returns a boolean indicating whether substring is a substring of all the long_strings (an array).
def in_all_strings?(long_strings, substring)
  long_strings.all? {|string| string.include?(substring)}
end

# Define a method that accepts a string of lower case words (no punctuation) and returns an array of letters that occur more than once. Make sure you account for spaces!
def non_unique_letters(string)
  characters = string.chars.uniq
  characters.delete(" ") # get rid of spaces!

  characters.select {|char| string.count(char) > 1}
end

# Define a method that returns an array of the longest two words in the method's argument.
def longest_two_words(string)
  string.delete!(",.;:!?")
  string.split.sort_by {|word| word.length}[-2..-1]
end

# Define a method that returns the sum of each element in its argument multiplied by its index.
# array_sum_with_index([2, 9, 7]) => 23 because (2 * 0) + (9 * 1) + (7 * 2) = 0 + 9 + 14 = 23
def array_sum_with_index(arr)
  sum = 0

  arr.each_with_index do |number, index|
    sum += (number * index )
  end

  sum
end

# MEDIUM

# Define a method that returns an array of (lowercase) letters that do not occur in the method's argument.
def missing_letters(string)
  alphabet = ("a".."z")
  alphabet.reject do |el|
    string.downcase.include?(el)
  end
end

# Given an array of bids and an actual retail price, return the bid closest to the actual retail price without going over that price. Assume there is always at least one bid below the retail price.
def price_is_right(bids, actual_retail_price)
  lower_bids = bids.reject { |bid| bid > actual_retail_price}
  lower_bids.max
end

# Given an array of numbers, return an array of those numbers that have at least n factors (including 1 and the number itself as factors).
# at_least_n_factors([1, 3, 10, 16], 5) => [16] because 16 has five factors (1, 2, 4, 8, 16) and the others have fewer than five factors.
# Consider writing a helper method num_factors
def at_least_n_factors(numbers, n)
  numbers.select { |number| num_factors(number) >= n }
end

def num_factors(number)
  (1..number).count { |n| number % n == 0 }
end

# Define a method that accepts two years and returns an array of the years within that range (inclusive) that have no repeated digits. Hint: helper method?
def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).select do |year|
    no_repeat_year?(year)
  end
end

def no_repeat_year?(year)
  year_digits = year.to_s.chars
  year_digits == year_digits.uniq
end


# HARD

# Given a an array of songs at the top of the charts, return the songs that only stayed on the chart for a week at a time. Each element corresponds to a song at the top of the charts for one particular week.
# Songs CAN reappear on the chart, but if they don't appear in consecutive weeks, they're "one-week wonders."
# Suggested strategy: find the songs that appear multiple times in a row and remove them.
# You may wish to write a helper method no_repeats?
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

# Given an array of numbers, return an array of all the products remaining when each element is removed from the array.
# You may wish to write a helper method: array_product.

# products_except_me([2, 3, 4]) => [12, 8, 6], where:
#   12 because you take out 2, leaving 3 * 4
#   8, because you take out 3, leaving 2 * 4
#   6, because you take out 4, leaving 2 * 3

# products_except_me([1, 2, 3, 5]) => [30, 15, 10, 6], where:
#   30 because you take out 1, leaving 2 * 3 * 5
#   15, because you take out 2, leaving 1 * 3 * 5
#   10, because you take out 3, leaving 1 * 2 * 5
#   6, because you take out 5, leaving 1 * 2 * 3
def products_except_me(numbers)
  numbers.map.with_index do |num, idx|
    sub_array = numbers[0...idx] + numbers[(idx + 1)..-1]
    array_product(sub_array)
  end
end

def array_product(array)
  array.reduce(:*)
end

# Define a method that accepts an array of words and returns an array of those words whose vowels appear in order. You may wish to write a helper method: ordered_vowel_word?
def ordered_vowel_words(words)
  words.select do |word|
    ordered_vowel_word?(word)
  end
end

def ordered_vowel_word?(word)
  vowels = "aeiou".chars

  vowels_in_word = word.chars.select do |letter|
    vowels.include?(letter)
  end

  vowels_in_word == vowels_in_word.sort
end

# Given a string of words, return the word that has the letter "c" closest to the end of it. If there's a tie, return the earlier word. Ignore punctuation. If there's no "c", return an empty string. You may wish to write the helper methods c_distance and remove_punctuation.
def for_cs_sake(string)
  c_words = string.split.select { |word| word.downcase.include?("c") }
  return "" if c_words.empty?
  c_words.map! do |word|
    remove_punctuation(word)
    word
  end
  c_words.sort_by { |word| c_distance(word) }.first
end

def c_distance(word)
  word.reverse.index("c")
end

def remove_punctuation(string)
  string.delete!(",.;:!?")
end

$success_count = 0
$failure_count = 0

def deep_dup(arr)
  arr.inject([]) { |acc, el| el.is_a?(Array) ? acc << deep_dup(el) : acc << el }
end

def note_success(returned, invocation, expectation)
  puts "success: #{invocation} => #{expectation}"
  $success_count += 1
end

def note_failure(returned, invocation, expectation)
  puts "failure: #{invocation}: expected #{expectation}, returned #{returned}"
  $failure_count += 1
end

def format_args(args)
  o_args = deep_dup(args)
  o_args.map! do |arg|
    arg = prettify(arg)
    arg.class == Array ? arg.to_s : arg
  end
  o_args.join(', ')
end

def prettify(statement)
  case statement
  when Float
    statement.round(5)
  when String
    "\"#{statement}\""
  when NilClass
    "nil"
  else
    statement
  end
end

def equality_test(returned, invocation, expectation)
  if returned == expectation && returned.class == expectation.class
    note_success(returned, invocation, expectation)
  else
    note_failure(returned, invocation, expectation)
  end
end

def identity_test(returned, invocation, expectation, args)
  if returned.__id__ == args[0].__id__
    equality_test(returned, invocation, expectation)
  else
    puts "failure: #{invocation}: You did not mutate the original array!"
    $failure_count += 1
  end
end

def method_missing(method_name, *args)
  method_name = method_name.to_s
  expectation = args[-1]
  args = args[0...-1]
  if method_name.start_with?("test_")
    tested_method = method_name[5..-1]
    print_test(tested_method, args, expectation)
  else
    method_name = method_name.to_sym
    super
  end
end

def print_test(method_name, args, expectation)
  returned = self.send(method_name, *args)
  returned = prettify(returned)
  expectation = prettify(expectation)
  args_statement = format_args(args)
  invocation = "#{method_name}(#{args_statement})"
  method_name.include?("!") ? identity_test(returned, invocation, expectation, args) : equality_test(returned, invocation, expectation)
  rescue Exception => e
    puts "failure: #{invocation} threw #{e}"
    puts e.backtrace.select {|t| !t.include?("method_missing") && !t.include?("print_test")}
    $failure_count += 1
end


el_tigre = "Tyger! Tyger! burning bright In the forest of the night What immortal hand or eye Could frame thy fearful symmetry?"
el_ciervo = "Stately, plump Buck Mulligan came from the stairhead, bearing a bowl of lather on which a mirror and a razor lay crossed."

top_hits_1 = ["Call Me Maybe", "Protect Ya Neck", "Call Me Maybe", "Protect Ya Neck", "Protect Ya Neck"]
one_week_wonders_1 = ["Call Me Maybe"]

top_hits_2 = ["Beat It", "Beat It", "Careless Whisper", "Beat It", "Baby", "Baby", "Never Gonna Give You Up", "Uptown Funk", "Uptown Funk", "Uptown Funk"]
one_week_wonders_2 = ["Careless Whisper", "Never Gonna Give You Up"]

test_get_evens([1,2,3,4,5], [2,4])
test_get_evens([1,3], [])
test_array_sum([1,2,3], 6)
test_array_sum([0,0,0], 0)
test_calculate_doubles([1,2,3], [2,4,6])
test_calculate_doubles([], [])
test_calculate_doubles!([1,2,3], [2,4,6])
test_calculate_doubles([], [])
test_in_all_strings?(["leopold", "leopard", "leonine"], "leo", true)
test_in_all_strings?(["leopold", "leopard", "leonine"], "leop", false)
test_non_unique_letters("abcdbcd", ["b", "c", "d"])
test_non_unique_letters("abcde", [])
test_longest_two_words(el_ciervo, ["Mulligan", "stairhead"])
test_longest_two_words("yarg barg yaarga barga", ["barga", "yaarga"])
test_array_sum_with_index([2, 9, 7], 23)
test_array_sum_with_index([0, 0], 0)
test_missing_letters(el_tigre, ["j", "k", "p", "q", "v", "x", "z"])
test_missing_letters(("A".."Z").to_a.join, [])
test_price_is_right([200, 2350, 1400, 1600], 1599, 1400)
test_price_is_right([950, 850, 1000, 1], 1300, 1000)
test_at_least_n_factors([1, 3, 10, 16], 5, [16])
test_at_least_n_factors([1, 3, 10, 16], 2, [3,10,16])
test_no_repeat_years(1990, 2000, [])
test_no_repeat_years(2016, 2020,[2016, 2017, 2018, 2019])
test_one_week_wonders(top_hits_1, one_week_wonders_1)
test_one_week_wonders(top_hits_2, one_week_wonders_2)
test_products_except_me([2, 3, 4], [12, 8, 6])
test_products_except_me([1, 2, 3, 5], [30, 15, 10, 6])
test_ordered_vowel_words(["era", "are", "ear"], ["are"])
test_ordered_vowel_words(["hey", "wassup", "hello"], ["hey", "wassup", "hello"])
test_for_cs_sake("r is among the most menacing of sounds. That's why they call it murder and not muckduck.",  "muckduck")
test_for_cs_sake("muckduck cluck duck.", "muckduck")
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0
