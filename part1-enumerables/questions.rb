# EASY

# Define a method that returns an array of only the even numbers in its argument (an array of integers).
def get_evens(arr)

end

# Define a method that returns the sum of all the elements in its argument (an array of numbers).
def array_sum(arr)

end

# Define a method that returns a new array of all the elements in its argument doubled. This method should *not* modify the original array.
def calculate_doubles(arr)

end

# Define a method that returns its argument with all the argument's elements doubled. This method should modify the original array.
def calculate_doubles!(arr)

end

# Define a method that returns a boolean indicating whether substring is a substring of all the long_strings (an array).
def in_all_strings?(long_strings, substring)

end

# Define a method that accepts a string of lower case words (no punctuation) and returns an array of letters that occur more than once.
def non_unique_letters(string)

end

# Define a method that returns an array of the longest two words (in order) in the method's argument. Ignore punctuation!
def longest_two_words(string)

end

# Define a method that returns the sum of each element in its argument multiplied by its index.
# array_sum_with_index([2, 9, 7]) => 23 because (2 * 0) + (9 * 1) + (7 * 2) = 0 + 9 + 14 = 23
def array_sum_with_index(arr)

end

# MEDIUM

# Define a method that returns an array of letters that do not occur in the method's argument.
def missing_letters(string)

end

# Given an array of bids and an actual retail price, return the bid closest to the actual retail price without going over that price. Assume there is always at least one bid below the retail price.
def price_is_right(bids, actual_retail_price)

end

# Given an array of numbers, return an array of those numbers that have at least n factors (including 1 and the number itself as factors).
# at_least_n_factors([1, 3, 10, 16], 5) => [16] because 16 has five factors (1, 2, 4, 8, 16) and the others have fewer than five factors.
# Consider writing a helper method num_factors
def at_least_n_factors(numbers, n)

end

def num_factors(number)

end

# Define a method that accepts two years and returns an array of the years within that range (inclusive) that have no repeated digits. Hint: helper method?
def no_repeat_years(first_yr, last_yr)

end

def no_repeat_year?(year)

end


# HARD

# Given a an array of songs at the top of the charts, return the songs that only stayed on the chart for a week at a time. Each element corresponds to a song at the top of the charts for one particular week.
# Songs CAN reappear on the chart, but if they don't appear in consecutive weeks, they're "one-week wonders."
# Suggested strategy: find the songs that appear multiple times in a row and remove them.
# You may wish to write a helper method no_repeats?
def one_week_wonders(songs)

end

def no_repeats?(song_name, songs)

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

end

def array_product(array)

end

# Define a method that accepts an array of words and returns an array of those words whose vowels appear in order. You may wish to write a helper method: ordered_vowel_word?
def ordered_vowel_words(words)

end

def ordered_vowel_word?(word)

end

# Given a string of words, return the word that has the letter "c" closest to the end of it. If there's a tie, return the earlier word. Ignore punctuation. If there's no "c", return an empty string. You may wish to write the helper methods c_distance and remove_punctuation.
def for_cs_sake(string)

end

def c_distance(word)

end

def remove_punctuation(string)

end
