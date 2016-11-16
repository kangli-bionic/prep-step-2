
def get_evens(array)
  array.select do |element|
    element % 2 == 0
  end
end

# ****************************************************************************

def reject_odds(array)
  array.reject do |element|
    element % 2 != 0
  end
end

# ****************************************************************************

def array_sum(array)
  array.reduce(0) do |sum, number|
    sum + number
  end
end

# ****************************************************************************

def calculate_doubles(array)
  array.map do |element|
    element * 2
  end
end

# ****************************************************************************

def calculate_doubles!(array)
  array.map! do |element|
    element * 2
  end
end

# ****************************************************************************

def array_sum_with_index(array)
  sum = 0
  array.each_with_index do |number, index|
    sum += ( number * index )
  end
  sum
end

# Remove the nth letter of the string
def remove_nth_letter(string, n)
  string[0...n] + string[n + 1..-1]
end

# ****************************************************************************

def third_greatest(array)
end

# ****************************************************************************

def longest_word(string)
end

# ****************************************************************************

def substring?(long_string, short_string)

end

# ****************************************************************************

def missing_letters(string)
  alphabet = {}
  ("a".."z").each do |letter|
    alphabet[letter] = 0
  end
  string.chars do |character|
    alphabet[character] += 1 unless character == " "
  end
  missing_letters = []
  alphabet.each do |letter, count|
    missing_letters << letter if count == 0
  end
  missing_letters
end
