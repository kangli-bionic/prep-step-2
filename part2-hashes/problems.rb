# Write a method, `#word_lengths(string)` that, given a sentence, returns a hash of each of the words and their lengths.


    # word_lengths("hello my good good pal") =
    #   { 'hello' => 5, 'my' => 2, 'good' => 4, 'pal' => 3 }

# Write a method, `#uniq(array)` that returns an array with only the unique values in the array. (Hint: use a hash!) Don't use the `Array#uniq` method here.

  # ```ruby
  #   uniq([1, 1, 2, 3])          # ==> [2, 3]
  #   uniq([1, 3, 4, 3, 2, 5, 4]) # ==> [1, 2, 5]
  # ```

# Write a method, `#greatest_key_by_val(hash)` that takes in a hash with any keys but only integers for values, and returns the key with the largest value.

  # ```ruby
  #   greatest_key_by_val({ "a" => 5, "b" => 6, "c" => 3 }) # ==> "b"
  # ```

# FOR PREVIOUS CHAPTER:


# EASY
def word_lengths(str)

end

def greatest_key_by_val(hash)

end

def update_inventory(older, newer)
  newer.each do |key, value|
    older[key] = value
  end

  older
end

def letter_counts(word)
  count = Hash.new(0)

  word.each_char do |char|
    count[char] += 1
  end

  count
end


# MEDIUM

def uniq(arr)

end

def evens_and_odds(numbers)
  count = {"even" => 0, "odd" => 0}

  numbers.each do |number|
    count["even"] += 1 if number.even?
    count["odd"] += 1 if number.odd?
  end

  count
end

def most_common_vowel(string)
  vowels = %w(a e i o u)
  counts = Hash.new(0) # Give the hash a default value of 0

  string.each_char do |character|
    counts[character] += 1 if vowels.include?(character)
  end

  most_common = "a"
  vowels.each do |vowel|
    most_common = vowel if counts[vowel] > counts[most_common]
  end

  most_common
end

def fall_and_winter_birthdays(students_with_birthdays)
  students = students_with_birthdays.select do |student, month|
    month >= 7
  end

  names = students.keys
  result = []

  0.upto(names.length - 1) do |idx1|
    ((idx1 + 1)...names.length).each do |idx2|
      result << [ names[idx1], names[idx2] ]
    end
  end

  result
end

# ****************************************************************************

# ****************************************************************************




# HARD

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

def can_tweak_sign?(normal_sign, vandalized_sign)
end

def character_count(str)

end
