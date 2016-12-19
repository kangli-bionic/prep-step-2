# EASY

def get_evens(arr)
  arr.select { |element| element.even? }
end

def array_sum(arr)
  arr.reduce(:+)
end

def calculate_doubles(arr)
  arr.map {|el| el * 2}
end

def calculate_doubles!(arr)
  arr.map! {|el| el * 2}
end

def in_all_strings?(long_strings, substring)
  long_strings.all? {|string| string.include?(substring)}
end

def non_unique_letters(string)
  characters = string.chars.uniq
  characters.delete(" ") # get rid of spaces!

  characters.select {|char| string.count(char) > 1}
end

def longest_two_words(string)
  string.delete!(",.;:!?")
  string.split.sort_by {|word| word.length}[-2..-1]
end

def array_sum_with_index(arr)
  sum = 0

  arr.each_with_index do |number, index|
    sum += (number * index )
  end

  sum
end


# MEDIUM

def missing_letters(string)
  alphabet = ("a".."z")
  alphabet.reject do |el|
    string.downcase.include?(el)
  end
end

def price_is_right(bids, actual_retail_price)
  lower_bids = bids.reject { |bid| bid > actual_retail_price}
  lower_bids.max
end

def at_least_n_factors(numbers, n)
  numbers.select { |number| num_factors(number) >= n }
end

def num_factors(number)
  (1..number).count { |n| number % n == 0 }
end

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

def products_except_me(numbers)
  numbers.map.with_index do |num, idx|
    sub_array = numbers[0...idx] + numbers[(idx + 1)..-1]
    array_product(sub_array)
  end
end

def array_product(array)
  array.reduce(:*)
end

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
