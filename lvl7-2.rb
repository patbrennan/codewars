require 'pry'
# While developing a website, you detect that some of the members have troubles logging in. Searching through the code you find that all logins ending with a "_" make problems. So you want to write a function that takes an array of pairs of login-names and e-mails, and outputs an array of all login-name, e-mails-pairs from the login-names that end with "_".

# If you have the input-array:

# [ [ "foo", "foo@foo.com" ], [ "bar_", "bar@bar.com" ] ]
# it should output

# [ [ "bar_", "bar@bar.com" ] ]

# iterate through array
# if last character of first value in each array = "_"
# add that array to a new array of logins
# return the array

def find_logins(logins)
  logins.select { |pair| /[_]\z/.match(pair[0]) }
end

find_logins([[ "foo_", "foo@foo.com" ], [ "bar", "bar@bar.com" ] ]) # => first one only

# Create a method that accepts an array of names, and returns an array of each name with its first letter capitalized.

# example

# cap_me(['jo', 'nelson', 'jurie']) # returns ['Jo', 'Nelson', 'Jurie']
# cap_me(['KARLY', 'DANIEL', 'KELSEY']) # returns ['Karly', 'Daniel', 'Kels
names = ['KARLY', 'DANIEL', 'KELSEY']

def cap_me(array)
  array.map { |name| name.downcase.capitalize }
end

cap_me(names)

# Longest Palindrome
# Find the length of the longest substring in the given string s that is the same in reverse.
# As an example, if the input was “I like racecars that go fast”, the substring (racecar) length would be 7.
# If the length of the input string is 0, return value must be 0.

# Example:
# "a" -> 1 
# "aab" -> 2  
# "abcde" -> 1
# "zzbaabcd" -> 4
# "" -> 0
def palindrome?(word)
  word == word.reverse
end
# start at beginning of string
#   add each subsequent character to the test substring
#   Test whether the substring is a palindrome
#   if true, compare length to stored variable length
#   if larger, set stored variable to that length, otherwise move on to next iteration
# start at the next position in the string, following same logic above
# return the stored variable length
# nested iterators?

def longest_palindrome(string)
  string_arr = string.split("")
  longest = 0
  substring = ""

  while string_arr.length > 0
    string_arr.each do |char|
      substring << char
      palindrome?(substring) && substring.length > longest ? longest = substring.length : next
    end

    string_arr.shift
    substring = ""
  end
  
  longest
end

longest_palindrome("zzbaabcd")

# Other possible solution: each_cons(n) starts at the beginning & returns value w/n consecutive items in an array.
def longest_palindrome s
  return 0 if s.empty?
  (s.length).downto(1).each do | i |
    s.split("").each_cons(i).map do |c|
      return c.count if c == c.reverse
    end
  end
end

# Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

def sum_pair(ints, sum)
end

# Story
# Peter lives on a hill, and he always moans about the way to his home. "It's always just up. I never get a rest". But you're pretty sure that at least at one point Peter's altitude doesn't rise, but fall. To get him, you use a nefarious plan: you attach an altimeter to his backpack and you read the data from his way back at the next day.
# Task
# You're given a list of compareable elements:
# heights = [Integers or Floats]
# Your job is to check whether for any x all successors are greater or equal to x.
# is_monotone([1,2,3]) == True
# is_monotone([1,1,2]) == True
# is_monotone([1])     == True
# is_monotone([3,2,1]) == False
# is_monotone([3,2,2]) == False
# If the list is empty, Peter has probably removed your altimeter, so we cannot prove him wrong and he's still right:
# isMonotone([])     == True

def is_monotone(heights)
  x = heights.shift
  monotone = true
  
  heights.each do |num|
    if num < x
      monotone = false
      break
    end
    x = heights.shift
  end

  monotone
end

is_monotone([])
is_monotone([1,2,3]) # => true
is_monotone([1,1,2])
is_monotone([1])
is_monotone([3,2,1]) # => false
is_monotone([3,2,2]) # => false

# refactoring:
def is_monotone2(heights)
  return true if heights.empty? || heights.all? { |num| num == heights.first }
  heights.index(heights.max) < (heights.length - 1) ? false : true
end

is_monotone2([])
is_monotone2([1,2,3]) # => true
is_monotone2([1,1,2])
is_monotone2([1])
is_monotone2([3,2,1]) # => false
is_monotone2([3,2,2]) # => false

# BEST PRACTICE (I feel dumb now...)
def is_monotone(heights)
  heights == heights.sort 
end