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
