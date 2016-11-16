
# Sign Tweakers
# ------------------------------------------------------------------------------
# Given a perfectly respectable business sign, determine if pranksters George
# and Harold can make a vandalized sign out of it using the same or fewer letters.
# Ignore capitalization and punctuation.

def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_letter_counts = Hash.new(0)
  vandalized_letter_counts = Hash.new(0)

  normal_sign.split.each do |word|
    word.each_char { |letter| normal_letter_counts[letter.downcase] += 1 }
  end

  vandalized_sign.split.each do |word|
    word.each_char { |letter| vandalized_letter_counts[letter.downcase] += 1 }
  end

  vandalized_letter_counts.each do |letter, letter_count|
    return false if normal_letter_counts[letter] < letter_count
  end

  true
end



# Repeated Number Ranges
# ------------------------------------------------------------------------------
# Given a list of numbers, give the start and end indices each time a number shows
# up multiple times in a row.
#

def repeated_number_ranges(numbers)
  ranges = []
  current_index = 0
  start_index = nil

  # start walking
  # set the start index when the next number is the same
  # reset the start index when the next number is different

  while current_index < numbers.length
    if numbers[current_index + 1] == numbers[current_index]
      start_index = current_index if start_index.nil?
    else
      if !start_index.nil? # i.e., if the start index isn't nil and the numbers switched
        ranges.push([start_index, current_index])
        start_index = nil
      end
    end

    current_index += 1
  end

  ranges
end



# Time Sums
# ------------------------------------------------------------------------------
# Return an array of all the minutes of the day whose digits sum to N.
#
# Use military time, so 1:00 PM is really 13:00 PM.
# ------------------------------------------------------------------------------

def time_sums(n)
  times = []
  hour = 0
  until hour == 24
    minutes = 0

    until minutes == 60
      hour_sum = hour.to_s.split("").map(&:to_i).inject(&:+)
      minutes_sum = minutes.to_s.split("").map(&:to_i).inject(&:+)
      sum = hour_sum + minutes_sum

      padded_hours = hour.to_s.split("")
      padded_minutes = minutes.to_s.split("")

      padded_hours.unshift("0") until padded_hours.length == 2
      padded_minutes.unshift("0") until padded_minutes.length == 2

      times.push(padded_hours.join("") + ":" + padded_minutes.join("")) if sum == n

      minutes += 1
    end
    hour += 1
  end

  times
end



# Fall and Winter Birthdays
# ------------------------------------------------------------------------------
# Given a list of students and what month their birthday is, return all the pairs
# of students whose birthdays both fall in the second half of the year.  Months
# are numbers, and assume that July (month 7) and later is the second half of
# the year.
#
# Only count pairs once, and work from the beginning of the list to the end.
#

def fall_and_winter_birthdays(students_with_birthdays)
  second_half_birthday_pairs = []

  students_with_birthdays.each_with_index do |first_student_with_birthday, index|
    first_student = first_student_with_birthday.first
    first_birthday = first_student_with_birthday.last
    rest_of_students = students_with_birthdays[index + 1...students_with_birthdays.length]

    rest_of_students.each do |second_student_with_birthday|
      second_student = second_student_with_birthday.first
      second_birthday = second_student_with_birthday.last

      if first_birthday >= 7 && second_birthday >= 7
        second_half_birthday_pairs.push([first_student, second_student])
      end
    end
  end

  second_half_birthday_pairs
end



# Care Bear Summary
# ------------------------------------------------------------------------------
# You have a calendar of hugs that care bears made (given as a list of
# names by care bears).  Some of them have hugged multiple
# times in a row.
#
# Return a hash where the keys are the care bears and the values are an array
# of all of the start and end days of their hugging streaks.
#
# Days are the index of the calendar array.

def care_bear_summary(calendar_of_hugs)
  final_care_bear_summary = {}
  current_hugger = nil
  start_day = 0

  calendar_of_hugs.each_with_index do |hugger, day|
    if hugger != current_hugger #new hugger
      if day >= 2 #we don't care if the hugger changed on day 0 (from nil) or 1
        yesterdays_hugger = current_hugger # we haven't changed the current_hugger yet
        check_if_end_of_hugging_streak(yesterdays_hugger, calendar_of_hugs, start_day, day, final_care_bear_summary)
      end

      current_hugger = hugger
      start_day = day
    else
      check_if_last_day_hugging_streak(calendar_of_hugs, start_day, day, current_hugger, final_care_bear_summary)
    end
  end

  final_care_bear_summary
end


def check_if_end_of_hugging_streak(yesterdays_hugger, calendar_of_hugs, start_day, day, final_care_bear_summary)
    multiple_hugs_happened = multiple_hugs_happened?(calendar_of_hugs, start_day, day, yesterdays_hugger)
    yesterday = day - 1
    last_streak = [start_day, yesterday]

    summarize(final_care_bear_summary, yesterdays_hugger, last_streak) if multiple_hugs_happened
end

def check_if_last_day_hugging_streak(calendar_of_hugs, start_day, day, current_hugger, final_care_bear_summary)
  last_day = day == calendar_of_hugs.length - 1

  if last_day
    multiple_hugs_happened = multiple_hugs_happened?(calendar_of_hugs, start_day, day + 1, current_hugger)
    last_streak = [start_day, day]

    summarize(final_care_bear_summary, current_hugger, last_streak) if multiple_hugs_happened
  end
end

def multiple_hugs_happened?(calendar_of_hugs, start_day, day, yesterdays_hugger)
  guy_two_days_ago = calendar_of_hugs[day - 2]
  guy_two_days_ago == yesterdays_hugger
end

def summarize(final_care_bear_summary, hugger, last_streak)
  final_care_bear_summary[hugger] ||= []
  final_care_bear_summary[hugger].push(last_streak)
end
