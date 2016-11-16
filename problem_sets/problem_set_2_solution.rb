
# update the older inventory with the newer inventory. Add any new items to the
# hash and replace the values for items that already exist.

def inventory_hash(older, newer)
  newer.each do |key, value|
    older[key] = value
  end
  older
end

puts "---------inventory hash-------"
march = {rubies: 10, emeralds: 14, diamonds: 2}
april = {emeralds: 27, moonstones: 5}
puts inventory_hash(march, april) == {rubies: 10, emeralds: 27, diamonds: 2, moonstones: 5}

# *********************
def redact_five_letter_words(string)
end

puts "\nRedact five letter words:\n" + "*" * 15 + "\n"
puts redact_five_letter_words("one two three four five six seven eight") == "one two ##### four five six ##### #####"
puts redact_five_letter_words("we the people in order to form a more perfect union establish justice ensure domestic tranquility") == "we the people in ##### to form a more perfect ##### establish justice ensure domestic tranquility"


# *********************
# Write a function that take an array of numbers and returns a hash of the
# number of even numbers and of odd numbers.

def evens_and_odds(numbers)
end

#Test - Get these all true, look at the format of the return value
puts "\nEvens and odds:\n" + "*" * 15 + "\n"
puts evens_and_odds([1,3])['even'] ==  0
puts evens_and_odds([1,3])['odd'] ==  2

puts evens_and_odds([2,4])['even'] == 2
puts evens_and_odds([2,4])['odd'] == 0

puts evens_and_odds([]) == {'even' => 0, 'odd' => 0}
puts evens_and_odds([1,2,3]) == {'even' => 1, 'odd' => 2}


# *********************
#write a function primes that an arguement n and returns the first n primes
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

puts "\nPrimes:\n" + "*" * 15 + "\n"
puts primes(0) == []
puts primes(1) == [2]
puts primes(2) == [2,3]
puts primes(6) == [2,3,5,7,11,13]


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






#Write a function delete_first_letter that takes a phrase and a letter to hide and removes
#the first instances of that letter
def delete_first_letter(phrase, letter)
  (0...phrase.length).each do |index|
    if phrase[index] == letter
      phrase[index] = ""
      break
    end
  end
  phrase
end

puts "\nHide Letter\n" + "*" * 15 + "\n"
puts delete_first_letter("abc", "d") == "abc"
puts delete_first_letter("abc", "b") == "ac"
puts delete_first_letter("hello, my name is Tevy", "e") == "hllo, my name is Tevy"



#write a function largest_sum_pair that takes an array of intergers and returns the
#2 unique indices whose elements sum to the largest number. Formatted [earlier_index, later_index]

def largest_sum_pair(array)
  indices = [0,1]
  (0...array.length).each do |index1|
    (index1 + 1...array.length).each do |index2|
      indices = [index1, index2] if array[index1] + array[index2] > array[indices[0]] + array[indices[1]]
    end
  end
  indices
end

puts "\nLargest Sum Pair:\n" + "*" * 15 + "\n"
puts largest_sum_pair([1,2,3,4,5]) == [3,4]
puts largest_sum_pair([3,2,1,0,1,2,3]) == [0,6]
puts largest_sum_pair([-2,-1,-1,-2,-3]) == [1,2]




# ************************************
# Write a method that takes a string of words separated by spaces and returns the most common vowel.  If more than one vowel has that count,
# return the one that occurs earliest in the alphabet.  For our purposes, count "y" as a vowel.
# Assume all letters are lower case.
# NB too challenging? Do they know string.count?

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

puts "\nMost Common Vowel"
puts most_common_vowel("we the people in order to form a more perfect union establish justice ensure domestic tranquility") == "e"
puts most_common_vowel("cat dog octopus spider") == "o"
