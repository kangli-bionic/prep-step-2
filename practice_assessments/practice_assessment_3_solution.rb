
def in_all_strings?(long_strings, short_string)
  long_strings.all? do |long_string|
    long_string.include?(short_string)
  end
end

# ------------------------------------------------------------------------------

def biodiversity_index(specimens)
  population_size = Hash.new(0)
  specimens.each do |specimen|
    population_size[specimen] += 1
  end

  number_of_species = specimens.uniq.length
  smallest_population_size = population_size.values.min
  largest_population_size = population_size.values.max

  number_of_species ** 2 * smallest_population_size / largest_population_size
end

# ------------------------------------------------------------------------------

def for_fs_sake(string)
  words = string.split
  min_f_distance = nil
  min_f_word = ""

  words.each do |word|
    current_f_distance = find_f_distance(word)
    if current_f_distance && (min_f_distance.nil? || current_f_distance < min_f_distance)
      min_f_distance = current_f_distance
      min_f_word = word
    end
  end

  min_f_word
end

def find_f_distance(word)
  index_at_end = word.length - 1
  index = index_at_end
  punctuation = ["!", ".", "?", "'", ","]
  punctuation_count = 0

  until index < 0
    letter = word[index]
    punctuation_count += 1 if punctuation.include?(letter)

    break if letter == "f" || letter == "F"
    index -= 1
  end

  if index >= 0
    index_at_end - index - punctuation_count
  else
    nil
  end
end

# ------------------------------------------------------------------------------

def censor(sentence, curse_words)
  words = sentence.split(" ")

  asterisked_words = words.map do |word|
    if curse_words.include?(word.downcase)
      asterisked_word(word)
    else
      word
    end
  end

  asterisked_words.join(" ")
end

def asterisked_word(word)
  asterisked_array = word.split("")
  asterisked_array.map! do |letter|
    if ["a", "e", "i", "o", "u"].include?(letter)
      "*"
    else
      letter
    end
  end

  asterisked_array.join("")
end
