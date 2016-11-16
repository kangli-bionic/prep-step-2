# Write a function that takes in a word and returns the counts of each letter
# in that word.
def letter_counts(word)
end

# Tests must all print true
puts "\nLetter Counts:\n" + "*" * 15 + "\n"
puts letter_counts("hi") == { 'h' => 1, 'i' => 1 }
puts letter_counts("hello") == { 'h' => 1, 'e' => 1 , 'l' => 2, 'o' => 1}



# Write a method that takes an array of words and returns only the words that are
# anagrams of a given string.

def anagrams(string, array)
  sorted_string = string.chars.sort.join("")
  array.select do |word|
    sorted_string == word.chars.sort.join("")
  end
end

#Tests
puts "\nAnagrams:\n" + "*" * 15 + "\n"
puts anagrams("cat", ["cat"]) == ["cat"]
words = ["cat", "act", "bat", "tac"]
puts anagrams("tca", words) == ["cat", "act", "tac"]
words = ["aaa", "aa", "a"]
puts anagrams("aa", words) == ["aa"]

# ************************************
# Write a boolean function that returns true if the vowels in a given word appear in order

def ordered_vowel_word?(word)
  vowels = "aeiou".chars
  vowels_in_word = word.chars.select do |letter|
    vowels.include?(letter)
  end
  vowels_in_word == vowels_in_word.sort
end

#Tests
puts "\nOrdered Vowel Word:\n" + "*" * 15 + "\n"
puts ordered_vowel_word?("car") == true
puts ordered_vowel_word?("academy") == true
puts ordered_vowel_word?("programmer") == false
puts ordered_vowel_word?("grapefruit") == false

# ************************************
# Write a function that takes an array of words and returns the words whose vowels appear in order

def ordered_vowels(words)
  words.select do |word|
    ordered_vowel_word?(word)
  end
end

puts "\nOrdered Vowels:\n" + "*" * 15 + "\n"
puts ordered_vowels(["are"]) == ["are"]
puts ordered_vowels(["era", "are", "ear"]) == ["are"]
puts ordered_vowels(["hey", "wassup", "hello"]) == ["hey", "wassup", "hello"]
puts ordered_vowels(["firefox", "chrome", "safari", "netscape", "aeiou"]) == ["safari", "aeiou"]



# ************************************
# Write a method that takes a string of lower case words (no punctuation) and returns an array of letters that occur more
# than once.  We'll need to account for spaces, too.  Again, there are a few ways you can do this.

def non_unique_letters(string)
  counts = Hash.new(0)
  string.chars.each do |character|
    counts[character] += 1 unless character == " "
  end
  non_uniques = []
  counts.each do |letter, count|
    non_uniques << letter if count > 1
  end
  non_uniques
end

puts "\nNon-Unique Letters\n" + "*" * 15 + "\n"
puts non_unique_letters("abbbcdddde") == ["b", "d"]
puts non_unique_letters("abcde") == []
puts non_unique_letters("aabbccddee") == ["a", "b", "c", "d", "e"]



#write a function that takes a number n and returns the highest prime factor of
#that number. Hint: Helper function.

def is_prime?(number)
  return false if number < 2
  (2...number).to_a.none?{ |integer| number % integer == 0 }
end

def highest_prime_factor(n)
  number = n - 1
  while number > 0
    return number if n % number == 0 && is_prime?(number)
    number -= 1
  end
end

puts "\nHighest prime factor:\n" + "*" * 15 + "\n"
puts highest_prime_factor(4) == 2
puts highest_prime_factor(6) == 3
puts highest_prime_factor(28) == 7
puts highest_prime_factor(69842) == 743



# ************************************
# Write a function that takes two years and returns all the years within that range with no repeated digits.
# Hint: helper method?
# no_repeat_years(2010,2015) -> [2013,2014,2015]

def no_repeat_year(year)
  year_digits = year.to_s.chars
  year_digits == year_digits.uniq
end

def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).to_a.select do |year|
    no_repeat_year(year)
  end
end

puts "\nNo Repeat Years:\n" + "*" * 15 + "\n"
puts no_repeat_years(1990, 2000) == []
puts no_repeat_years(1900,1902) == [1902]
puts no_repeat_years(2016, 2020) == [2016, 2017, 2018, 2019]




# count the number of times that two adjacent numbers in an array add up to n.
# You cannot reuse a number. So count_adjacent_sums([1, 5, 1], 6) => 1

def count_adjacent_sums(array, n)
  count = 0
  counted_numbers = []

  (1...array.length).each do |index|
    number = array[index]
    number_before = array[index - 1]
    sum = number + number_before
    havent_counted_these_numbers_yet = !counted_numbers.include?(number) && !counted_numbers.include?(number_before)

    if sum == n && havent_counted_these_numbers_yet
      counted_numbers.push(number)
      counted_numbers.push(number_before)
      count += 1
    end
  end

  count
end

# Translate into pig-latin! First consonants go to the end of a word. End with "ay"
def pig_latin(sentence)
  sentence.split.map { |word| latinify(word) }.join(" ")
end

def latinify(word)
  vowels = "aeiou".chars
  until vowels.include?(word[0].downcase)
    word = word[1..-1] + word[0]
  end
  word + "ay"
end

puts "---------pig latin-------"
puts pig_latin("i speak pig latin") == "iay eakspay igpay atinlay"
puts pig_latin("throw me an aardvark") == "owthray emay anay aardvarkay"
