def remove_nth_letter(string, n)
  string[0...n] + string[(n + 1)..-1]
end

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

  results << chunk #add the last chunk, regardless of length
end

def product_punctuation(str)
  assorted_punctuation = [".", ",", ";", "?", "!"]
  punctuation_counts = Hash.new(0)

  str.chars.each do |ch|
    if assorted_punctuation.include?(ch)
      punctuation_counts[ch] += 1
    end
  end

  punctuation_counts.values.reduce(:*)
end

def latinize(word)
  vowels = "aeiou".chars
  until vowels.include?(word[0].downcase)
    word = word[1..-1] + word[0]
  end
  word + "ay"
end

def pig_latin(sentence)
  words = sentence.split
  words.map! { |word| latinify(word) }
  words.join(" ")
end
