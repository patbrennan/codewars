# Write a function that removes each 9 that it is in between 7s.

# seven_ate9('79712312') => '7712312'
# seven_ate9('79797') => '777'
# Input: String Output: String

def seven_ate9(str)
  arr = str.split("").map! { |x| x.to_i }
  x = 0
  
  while x < arr.length
    if x > 0 && x <= arr.length - 2
      if arr[x] == 9
        if arr[x-1] == 7 && arr[x+1] == 7
          arr.delete_at(x)
        end
      end
    end
    x += 1
  end
  
  p arr.join.to_s
end

seven_ate9('79797')

# Calculate the sum of all the arguments passed to a function.

# Note: If any of the arguments is not a finite number the function should return false/False instead of the sum of the arguments.

# For example:

# sum(1,2,3,4)         should return 10
# sum(1, "two", 3)     should return false
# sum(1, 2, [3], NaN)  should return false

def sum_all(*nums)
  i = 0
  nums.each do |n| 
     if !n.is_a? Integer 
      false 
     else 
      i += n
     end
  end
  p i
end

sum_all(1,-32,"codewars",1076) #=> false
sum_all(1,2,3,4) #=> 10

# You have an array of numbers 1 through 10 (JS: 1 through 10 or less). The array needs to be formatted correctly for the person reading the countdown of a spaceship launch.

# Unfortunately, the person reading the countdown only knows how to read strings. After the array is sorted correctly make sure it's in a format he can understand.

# Between each number should be a space and after the final number (1) should be the word 'liftoff!'

# Example:

# # Given
# instructions = [8,1,10,2,7,9,6,3,4,5]
# # Should return
# "10 9 8 7 6 5 4 3 2 1 liftoff!"

list = [8,1,10,2,7,9,6,3,4,5]

def countdown(nums)
  nums.sort!.reverse!.push("liftoff!").join(" ")
end

countdown(list)

# In this Kata you need to will need to write two methods.

# Method 1

# The first method takes in a valid int (positive or negative) and returns the following:

# for any multiple of 3 the string "THREE",
# for any multiple of 5 the string "FIVE",
# for any multiple of both the string "BOTH",
# for all other numbers the original int.
# Method 2

# The second method takes valid ints (positive or negative) and returns a list of the values that follow the above rules.

# The first value may be greater than or less than the second and the list should increment/decrement appropriately

# For example an input of 10,13 should generate a response of ['FIVE', 11, 'THREE', 13].

# Remarks

# The Haskell variant uses Either Integer String in order to create the same behaviour as in the dynamic languages.

def getNumber(number)
    "BOTH" if number % 3 == 0 && number % 5 == 0
    "THREE" if number % 3 == 0
    "FIVE" if number % 5 == 0
    number
end

def getNumberRange(first, last)
    
    first < last ? arr = (first..last).to_a : arr = first.downto(last).to_a
    arr.map! { |x| getNumber(x) }
end

p getNumberRange(4, 12)

# Not Jaden-Cased: "How can mirrors be real if our eyes aren't real"
# Jaden-Cased:     "How Can Mirrors Be Real If Our Eyes Aren't Real"

str = "How can mirrors be real if our eyes aren't real"

class String
  def toJadenCase
    self.split.map(&:capitalize).join(" ")
  end
end

p str.toJadenCase

# Check to see if a string has the same amount of 'x's and 'o's. The method must return a boolean and be case insensitive. The string can contains any char.

# Examples input/output:

# XO("ooxx") => true
# XO("xooxx") => false
# XO("ooxXm") => true
# XO("zpzpzpp") => true // when no 'x' and 'o' is present should return true
# XO("zzoo") => false

def XO(str)
  arr = str.downcase.split("")
  x = 0
  o = 0
  
  arr.each do |i|
    if i == "x"
      x += 1
    elsif i == "o"
      o += 1
    end
  end
  
  x == o ? true : false
end

XO("ooxx")
XO("xooxx")
XO("ooxXm")
XO("zpzpzpp")
XO("zzoo")

# Best solution:
def XO2(str)
  str.downcase.count('x') == str.downcase.count('o')
end

# Teach snoopy and scooby doo how to bark using object methods. Currently only snoopy can bark and not scooby doo.

# snoopy.bark() #return "Woof"
# scoobydoo.bark() #doesn't work yet
# Use method prototypes to enable all Dogs to bark.

class Dog
  def initialize(breed)
    @breed = breed
  end
  
  def bark
    "Woof"
  end
end

snoopy = Dog.new("Beagle")
snoopy.bark

scoobydoo = Dog.new("Great Dane")
scoobydoo.bark

# Given two integers, which can be positive and negative, find the sum of all the numbers between including them too and return it. If both numbers are equal return a or b.

# Note! a and b are not ordered!

# Example: 
# get_sum(1, 0) == 1   # 1 + 0 = 1
# get_sum(1, 2) == 3   # 1 + 2 = 3
# get_sum(0, 1) == 1   # 0 + 1 = 1
# get_sum(1, 1) == 1   # 1 Since both are same
# get_sum(-1, 0) == -1 # -1 + 0 = -1
# get_sum(-1, 2) == 2  # -1 + 0 + 1 + 2 = 2

def get_sum(a,b)
  sum = 0
  a < b ? a.upto(b) { |i| sum += i } : a.downto(b) { |i| sum += i }
  sum
end

# Better solution:
def get_sum2(a,b)
  (a..b).reduce(:+) || (b..a).reduce(:+)
end

# Complete the squareSum method so that it squares each number passed into it and then sums the results together.
# For example:
# squareSum([1, 2, 2]) # should return 9

def squareSum(numbers)
  arr = numbers.map { |n| n**2 }
  arr.reduce(:+)
end

squareSum([1,2,2])

# Task
# Given an array of integers, remove the smallest value. If there are multiple elements with the same value, remove the one with a lower index. If you get an empty array/list, return an empty array/list.
# Don't change the order of the elements that are left.

# Examples
# remove_smallest([1,2,3,4,5]) = [2,3,4,5]
# remove_smallest([5,3,2,1,4]) = [5,3,2,4]
# remove_smallest([2,2,1,2,1]) = [2,2,2,1]

def remove_smallest(numbers)
  # throw NotImplementedError.new "TODO: remove_smallest"
  if numbers.empty?
    numbers
  else
    numbers.delete_at(numbers.index(numbers.min))
    numbers
  end
end