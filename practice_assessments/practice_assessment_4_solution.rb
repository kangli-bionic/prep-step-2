def substring?(long_string, short_string)
  long_string.include?(short_string)
end


def first_occurence(str, c)
  str.index(c)
end

def last_occurence(str, c)
  str.length - str.reverse.index(c) - 1
end

def first_last_indices(str)
  answer = {}

  str.each_char do |c|
    first_index  = first_occurence(str, c)
    last_index  = last_occurence(str, c)
    answer[c] = [first_index]
    answer[c] << last_index if last_index != first_index
  end

  answer
end


def count_adjacent_sums(array, n)
  count = 0
  idx = 0

  while idx < (array.length - 1) # only loop until the second to last index
    if array[idx] + array[idx + 1] == n # if we've found a pair..
      count += 1
      idx += 2 # increase idx by 2 because we can't double-count elements
    else
      idx += 1
    end
  end

  count
end
