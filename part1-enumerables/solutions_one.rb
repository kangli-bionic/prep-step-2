# EASY

def get_evens(arr)
  arr.select { |element| element.even? }
end

def calculate_doubles(arr)
  arr.map {|el| el * 2}
end

def calculate_doubles!(arr)
  arr.map! {|el| el * 2}
end

def array_sum_with_index(arr)
  sum = 0

  arr.each_with_index do |number, index|
    sum += (number * index )
  end

  sum
end


# MEDIUM

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


# HARD

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

def products_except_me(numbers)
  numbers.map.with_index do |num, idx|
    sub_array = numbers[0...idx] + numbers[(idx + 1)..-1]
    array_product(sub_array)
  end
end

def array_product(array)
  array.reduce(:*)
end


## TEST SUITE ##

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

puts "\nget_evens:\n" + "*" * 15 + "\n"
test_get_evens([1,2,3,4,5], [2,4])
test_get_evens([1,3], [])
puts "\ncalculate_doubles:\n" + "*" * 15 + "\n"
test_calculate_doubles([1,2,3], [2,4,6])
test_calculate_doubles([], [])
puts "\ncalculate_doubles!:\n" + "*" * 15 + "\n"
test_calculate_doubles!([1,2,3], [2,4,6])
test_calculate_doubles([], [])
puts "\narray_sum_with_index:\n" + "*" * 15 + "\n"
test_array_sum_with_index([2, 9, 7], 23)
test_array_sum_with_index([0, 0], 0)
puts "\nprice_is_right:\n" + "*" * 15 + "\n"
test_price_is_right([200, 2350, 1400, 1600], 1599, 1400)
test_price_is_right([950, 850, 1000, 1], 1300, 1000)
puts "\nat_least_n_factors:\n" + "*" * 15 + "\n"
test_at_least_n_factors([1, 3, 10, 16], 5, [16])
test_at_least_n_factors([1, 3, 10, 16], 2, [3,10,16])
puts "\nordered_vowel_words:\n" + "*" * 15 + "\n"
test_ordered_vowel_words(["era", "are", "ear"], ["are"])
test_ordered_vowel_words(["hey", "wassup", "hello"], ["hey", "wassup", "hello"])
puts "\nproducts_except_me:\n" + "*" * 15 + "\n"
test_products_except_me([2, 3, 4], [12, 8, 6])
test_products_except_me([1, 2, 3, 5], [30, 15, 10, 6])

puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0
