require "pry"
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

text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nec consectetur risus. Cras vel urna a tellus dapibus consequat. Duis bibendum tincidunt viverra. Ph asellus dictum efficitur sem quis porttitor. Mauris luctus auctor diam id ultrices. Praesent laoreet in enim ut placerat. Praesent a facilisis turpis."

puts format_(text, 50)
puts "-----------"
puts format_(text, 30)

def format_2(text, width)
  text.scan(/(.{1,#{width}})(?: |$)/).join("\n")
end

# (.{1,#{width}}) => any character, from 1 to "n" times.
# (?:) => group the following items, but don't capture them.
# '<space>|$' => followed by a space or end of the line.

puts "----- FORMAT 2 -----"
puts format_2(text, 50)
puts "-----------"
puts format_2(text, 30)
