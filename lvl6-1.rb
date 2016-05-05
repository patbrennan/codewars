# Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.
require 'pry'
# start at first index in array, 
# add each subsequent value to that index.
# if the sum equals the value, return those two numbers.
example = [3, 4, 6, 4, 11, 8]
  
# def sum_values(ints, value)
#   index = 0
#   sum_up = []
  
#   ints.each do |num|
#     ints[index].upto(ints[ints.length - 1]).each_with_index do |num, idx|
#       binding.pry      
#       if num + ints[idx + 1] == value
#         sum_up << num
#         sum_up << ints[idx + 1]
#         break
#       else
#         next
#       end
#       index += 1
#     end
#     break unless sum_up == []
#   end
  
#   p sum_up
# end

# sum_values(example, 18)
# second try:

def sum_values2(ints, value)
  arr = ints
  sum_up = [arr.shift]

  while arr.length > 0
    arr.each do |num|
      next unless sum_up[0] + num == value
      sum_up << num
      return p sum_up
    end
    sum_up = [arr.shift]
  end
end

sum_values2(example, 15)

# Your task is to write a function which returns the sum of following series upto nth term(parameter).

# Series: 1 + 1/4 + 1/7 + 1/10 + 1/13 + 1/16 +...
# Rules:

# You need to round the answer upto 2 decimal places and return it as String.
# If the given value is 0 then it should return 0.00
# You will only be given Natural Numbers as arguments.
# Examples:

# SeriesSum(1) => 1 = "1"
# SeriesSum(2) => 1 + 1/4 = "1.25"
# # SeriesSum(5) => 1 + 1/4 + 1/7 + 1/10 + 1/13 = "1.57"

def series_sum(n)
  return "0.00" if n == 0
  start = 1.0
  value = 0.0
  
  n.times do 
    value += (1.0 / start)
    start += 3.0
  end

  p "%.2f" % value
end

series_sum(5) # => "1.57"
series_sum(1) # => "1.00"

# Trolls are attacking your comment section!
# A common way to deal with this situation is to remove all of the vowels from the trolls' comments, neutralizing the threat
# Your task is to write a function that takes a string and return a new string with all vowels removed.
# For example, the string "This website is for losers LOL!" would become "Ths wbst s fr lsrs LL!".

def disemvowel(string)
  string.delete "aeiouAEIOU"
end

disemvowel("This website is for losers LOL!")

# Task

# You're given a single word. Your task is to swap the halves. If the word has an uneven length, leave the character in the middle at that position and swap the chunks around it.

# Examples
# reverse_by_center("agent") == "nteag" # center character is e
# reverse_by_center("secret")  == "retsec" # no center character

def flip_word(word)
  first_half = ""
  second_half = ""
  middle = ""
  idx = 0

 word.each_char do |letter|
    if (idx == word.length / 2) && (word.length % 2 != 0)
      middle << letter
    elsif idx <= (word.length / 2 - 1)
      first_half << letter
    elsif idx > (word.length / 2 - 1)
      second_half << letter
    end

    idx += 1
  end

  puts second_half + middle + first_half
end

flip_word("secret")
flip_word("agent")

#refactored:

def flip_word(word)
  even = word.length % 2 == 0
  center = word.length / 2
  
  first_half = word.byteslice(0..center - 1)
  second_half = word.byteslice(-center..-1)
  middle = even ? "" : word.byteslice(center)
  
  second_half + middle + first_half
end

flip_word("secret")
flip_word("agent")

# BEST ANSWER:
def flip_word(s)
  i = s.length / 2
  s[-i..-1] + s[i, s.length % 2] + s[0, i]
end