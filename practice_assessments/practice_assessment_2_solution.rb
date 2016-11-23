
def greatest_common_factor(first_number, second_number)
  first_number_factors = get_factors(first_number)
  second_number_factors = get_factors(second_number)
  max_factor = 1

  first_number_factors.each do |first_factor|
    if second_number_factors.include?(first_factor) && first_factor > max_factor
      max_factor = first_factor
    end
  end

  max_factor
end

def get_factors(number)
  factors = []

  (1..number).each do |number_to_divide_by|
    factors.push(number_to_divide_by) if number % number_to_divide_by == 0
  end

  factors
end

# ------------------------------------------------------------------------------

def panoramic_pairs(landmarks)
  pairs = []

  landmarks.each_with_index do |landmark, index|
    if index == landmarks.length - 1
      neighbor_index = 0
    else
      neighbor_index = index + 1
    end

    neighbor = landmarks[neighbor_index]
    pairs.push([landmark, neighbor])
  end

  pairs
end

# ------------------------------------------------------------------------------

def two_degrees_away(facebook, name)
  two_degree_friends = []
  first_degree_friends = facebook[name]

  first_degree_friends.each do |first_degree_friend|
    second_degree_friends = facebook[first_degree_friend]

    second_degree_friends.each do |second_degree_friend|
      if second_degree_friend != name && !first_degree_friends.include?(second_degree_friend)
        two_degree_friends.push(second_degree_friend)
      end
    end
  end

  two_degree_friends
end

# ------------------------------------------------------------------------------

def assign_pods(students, pods)
  assigned_pods = {}
  pod_index = 0

  pods.each {|pod| assigned_pods[pod] = []}

  students.each do |student|
    current_pod = pods[pod_index]
    if assigned_pods[current_pod].length == 4
      pod_index += 1
      current_pod = pods[pod_index]
    end

    assigned_pods[current_pod].push(student)
  end

  assigned_pods
end

# ------------------------------------------------------------------------------

def remove_letter_a(words)
  non_a_words = []

  words.each do |word|
    word_without_a = ""

    word.each_char do |char|
      word_without_a += char unless char == "a"
    end

    non_a_words.push(word_without_a)
  end

  non_a_words
end
