require "pry"

def time(&block)
  start = Time.now
  block.call
  finish = Time.now
  puts "Execution time: #{start - finish} seconds."
end
# Write a function format that takes two arguments, text and width, and formats the text to fit the width.

# Your function should divide the given text into lines using newline characters. It should fit as many words into each line as possible without exceeding the given width or splitting any words between two lines. There should not be a space at the beginning or end of any line. For example, here is some text formatted with a width of 50:

# Lorem ipsum dolor sit amet, consectetur adipiscing
# elit. Aliquam nec consectetur risus. Cras vel urna
# a tellus dapibus consequat. Duis bibendum
# tincidunt viverra. Phasellus dictum efficitur sem
# quis porttitor. Mauris luctus auctor diam id
# ultrices. Praesent laoreet in enim ut placerat.
# Praesent a facilisis turpis.

def format_(text, width)
  return Proc.new do
    word_arr = text.split(" ")
    one_line = []
    all_lines = []
  
    word_arr.each do |word|
      line_length = one_line.join.length
      new_word = word == word_arr.first ? word : (" " + word)
  
      if line_length + new_word.length <= width
        one_line << new_word
      else
        all_lines << one_line.join
        one_line = [word]
      end
    end
    all_lines << one_line.join
  
    all_lines.join("\n")
  end
end

text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nec consectetur risus. Cras vel urna a tellus dapibus consequat. Duis bibendum tincidunt viverra. Ph asellus dictum efficitur sem quis porttitor. Mauris luctus auctor diam id ultrices. Praesent laoreet in enim ut placerat. Praesent a facilisis turpis."

# puts format_(text, 50)
# puts "-----------"
# puts format_(text, 30)

def format_2(text, width)
  return Proc.new do
    text.scan(/(.{1,#{width}})(?: |$)/).join("\n")
  end
end

# (.{1,#{width}}) => any character, from 1 to "n" times.
# (?:) => group the following items, but don't capture them.
# '<space>|$' => followed by a space or end of the line.

# puts "----- FORMAT 2 -----"
# puts format_2(text, 50)
# puts "-----------"
# puts format_2(text, 30)

# puts "TIMED: -------------"
# time(&format_(text, 50))
# time(&format_2(text, 50))

# You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

# For example:
# Let's say you are given the array {1,2,3,4,3,2,1}:
# Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

# Let's look at another one.
# You are given the array {1,100,50,-51,1,1}:
# Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.

def find_index(array)
  array.each_with_index do |num, idx|
    left_sum = idx == 0 ? 0 : array[0..idx - 1].reduce(:+)
    right_sum = idx == (array.length - 1) ? 0 : array[idx + 1..-1].reduce(:+)
    
    return idx if left_sum == right_sum
  end
  return -1
end

p find_index([1,2,3,4,3,2,1])
p find_index([1,100,50,-51,1,1])
p find_index([1,2,3,4,5,6])
p find_index([20,10,-80,10,10,15,35]) # => 0

# better answer: 
def find_even_index(ary)
  0.upto(ary.length).select{|l| ary[0..l].reduce(:+) == ary[l..-1].reduce(:+)}.first || -1
end