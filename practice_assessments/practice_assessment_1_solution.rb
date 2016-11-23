
def word_with_most_repeats(sentence)
  max_repeats = 0
  words = sentence.split
  max_repeated_word = words.first

  words.each do |word|
    number_of_repeats = get_number_of_repeats_in(word)

    if number_of_repeats > max_repeats
      max_repeats = number_of_repeats
      max_repeated_word = word
    end
  end

  max_repeated_word
end

def get_number_of_repeats_in(word)
  repeats = 0
  current_index = 0
  letter_counts = Hash.new(0)
  last_letter = nil

  until current_index == word.length
    current_letter = word[current_index]
    letter_counts[current_letter] += 1

    current_index += 1
  end

  letter_counts.count {|letter, num_occurrences| num_occurrences > 1}
end

# ------------------------------------------------------------------------------

def isogram_matcher(isogram1, isogram2)
  idx_match = 0
  letter_match = 0

  isogram1.length.times do |i|
    if(isogram1[i] == isogram2[i])
      idx_match += 1
    elsif isogram2.include?(isogram1[i])
      letter_match += 1
    end
  end

  [idx_match, letter_match]
end

# ------------------------------------------------------------------------------

def xbonacci(starting_sequence, number_of_xbonacci_numbers_to_return)
  how_many_numbers_to_sum = starting_sequence.length

  until starting_sequence.length == number_of_xbonacci_numbers_to_return
    next_xbonacci_number = sum_of_last_n_numbers(starting_sequence, how_many_numbers_to_sum)
    starting_sequence.push(next_xbonacci_number)
  end

  starting_sequence
end

def sum_of_last_n_numbers(starting_sequence, how_many_numbers_to_sum)
  sum = 0
  current_index = starting_sequence.length - 1
  end_index = starting_sequence.length - how_many_numbers_to_sum
  end_index = 0 if end_index < 0

  while current_index >= end_index
    sum += starting_sequence[current_index]
    current_index -= 1
  end

  sum
end

#------------------------------------------------------------------------------

def cupcake_solver(cupcake_counts, number_of_students_in_class)
  total_cupcakes = 0

  cupcake_counts.each do |cupcake_count|
    allotted_number = cupcake_count / number_of_students_in_class
    total_cupcakes += allotted_number
  end

  total_cupcakes
end
