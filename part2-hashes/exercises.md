# Hash Exercises

0. Write a method, `#word_lengths(string)` that, given a sentence, returns a hash of each of the words and their lengths.

  ```ruby
    word_lengths("hello my good good pal") =
      { 'hello' => 5, 'my' => 2, 'good' => 4, 'pal' => 3 }
  ```

0. Write a method, `#uniq(array)` that returns an array with only the unique values in the array. (Hint: use a hash!) Don't use the `Array#uniq` method here.

  ```ruby
    uniq([1, 1, 2, 3])          # ==> [2, 3]
    uniq([1, 3, 4, 3, 2, 5, 4]) # ==> [1, 2, 5]
  ```

0. Write a method, `#greatest_key_by_val(hash)` that takes in a hash with any keys but only integers for values, and returns the key with the largest value.

  ```ruby
    greatest_key_by_val({ "a" => 5, "b" => 6, "c" => 3 }) # ==> "b"
  ```

```ruby
def update_inventory(older, newer)
  newer.each do |key, value|
    older[key] = value
  end

  older
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


def letter_counts(word)
  count = Hash.new(0)

  word.each_char do |char|
    count[char] += 1
  end

  count
end

def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_count = character_count(normal_sign)
  vandalized_count = character_count(vandalized_sign)

  vandalized_count.all? do |character, count|
    normal_count[character.downcase] >= count
  end
end

def character_count(string)
  count = Hash.new(0)

  string.each_char do |char|
    next if char == " "
    count[char.downcase] += 1
  end

  count
end


def repeated_number_ranges(numbers)
  ranges = []
  start_index = nil

  # start walking
  # set the start_index when we're at the beginning of a range
  # when we reach the end of a range, add the range to the list and reset the start_index

  numbers.each_with_index do |el, idx|
    next_el = numbers[idx + 1]
    if el == next_el
      start_index = idx if start_index.nil?
    elsif !start_index.nil? # i.e., if the start index isn't nil and the numbers switched
      ranges.push([start_index, idx])
      start_index = nil
    end
  end

  ranges
end

# ****************************************************************************

def time_sums(n)
  all_times = ("00:00".."23:59") # Ruby doesn't know we're using times so it will give us 00:60 - 00:99 also
  all_times = all_times.select { |time| time[-2..-1] < "60" } # get rid of the 00:60 - 00:99s

  all_times.select do |time|
    digit_sum(time) == n
  end
end

def digit_sum(time)
  time.chars.reduce(0) do |sum, char|
    sum + char.to_i # note that ":".to_i is just 0, so it has no effect
  end
end

# ****************************************************************************

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
```
