
def price_is_right(bids, actual_retail_price)
  actual_retail_price.downto(0) do |price|
    return price if bids.include?(price)
  end
end

# ------------------------------------------------------------------------------

def total_product_sequence(n)
  sequence = [1, 2, 3]

  return sequence[n - 1] if n < 3

  until sequence.length == n
    product_so_far = get_product(sequence)
    sequence.push(product_so_far)
  end

  sequence.last
end

def get_product(sequence)
  product = 1
  sequence.each {|number| product *= number}
  product
end


# ------------------------------------------------------------------------------

def products_except_me(numbers)
  products = []
  index = 0

  while index < numbers.length
    product_without = get_product_without(index, numbers)
    products.push(product_without)
    index += 1
  end

  products
end

def get_product_without(index, numbers)
  left_half = numbers[0...index]
  right_half = numbers[index + 1...numbers.length]
  numbers_without = left_half + right_half

  product = 1

  numbers_without.each {|number| product *= number}

  product
end

# ------------------------------------------------------------------------------

def more_than_n_factors(numbers, n)
  numbers_with_more_than_n_factors = []

  numbers.each do |number|
    factors = get_factors(number)
    if factors.length >= n
      numbers_with_more_than_n_factors.push(number)
    end
  end

  numbers_with_more_than_n_factors
end

def get_factors(number)
  factors = []

  1.upto(number) do |number_to_divide_by|
    factors.push(number_to_divide_by) if number % number_to_divide_by == 0
  end

  factors
end

# ------------------------------------------------------------------------------

def one_week_wonders(songs)
  songs_that_show_up_multiple_times = []

  songs.each_with_index do |song, index|
    next if index == songs.length - 1

    if song == songs[index + 1]
      songs_that_show_up_multiple_times.push(song)
    end
  end

  songs_that_show_up_multiple_times.uniq!

  one_time_songs = songs.select { |song| !songs_that_show_up_multiple_times.include?(song)}
  one_time_songs.uniq
end

top_hits_1 = ["Call Me Maybe", "Protect Ya Neck", "Call Me Maybe", "Protect Ya Neck", "Protect Ya Neck"]
one_week_wonders_1 = ["Call Me Maybe"]

top_hits_2 = ["Beat It", "Beat It", "Careless Whisper", "Beat It", "Baby", "Baby", "Never Gonna Give You Up", "Uptown Funk", "Uptown Funk", "Uptown Funk"]
one_week_wonders_2 = ["Careless Whisper", "Never Gonna Give You Up"]
