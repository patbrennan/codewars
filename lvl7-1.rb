# We want to know the index of the vowels in a given word, for example, there are two vowels in the word super (the second and fourth letters).

# So given a string "super", we should return a list of [2, 4].

def vowel_indices(str)
  indecies = []
  str.downcase.each_char do |letter| 
    indecies << (str.downcase.index(letter) + 1) if "aeiouy".include?(letter)
  end

  indecies
end

def vowel_indices(str)
  indices = []
  word = str.downcase.split("")
  index = 1
  
  word.each do |letter|
    indices << index if "aeiouy".include?(letter)
    index += 1
  end

  indices
end

p vowel_indices("supEr dUper")
p vowel_indices("supercalifragilisticexpialidocious")
p vowel_indices("Implied")
p vowel_indices("narboonnee")

# Solution:
def vowel_indices2(word)
  ind = []
  word.downcase.split("").each_with_index {|e, i| ind << i + 1 if e =~ /[aeiouy]/}
  ind
end

# Write a generic function chainer that takes a starting value, and an array of functions to execute on it (array of symbols for ruby).

# The input for each function is the output of the previous function (except the first function, which takes the starting value as it's input). Return the final value after execution is complete.

def add num
  num + 1
end

def mult num
  num * 30 
end

# chain(2, [:add, :mult])
# #=> returns 90

def chain(num, methods)
  new = num
  methods.each { |method| new = method(new) }
  new
end

chain(2, [:add, :mult])

# Whaaaaaaaaaaaaaaaaat? Solution:

def chain(value, functions)
  functions.reduce(value) { |value, function| send(function, value) }
end

def chain(input, fs)
   # implement the "chain" function
   #each defined method can be passed as a symbol to another method
   #For example def foo(a) puts a end can be passed to another method
   #that accepts a method as an argument:
   #def calling_method(the_method) send(the_method) end
   #Now to pass method foo to calling_method, we write:
   #calling_method(:foo). When method foo was defined, a symbol
   #representation of it, :foo, was also defined and we can use it
   #to refer to method foo when needed
   fs.each {|the_method| input = send(the_method, input)}
   input
end

# Write a function insertDash(num) that will insert dashes ('-') between each two odd numbers in num. For example: if num is 454793 the output should be 4547-9-3. Don't count zero as an odd number.

def insert_dash(num)
  arr = num.to_s.split("")
  index = 0
  
  while index < arr.length do
    if arr[index].to_i.odd? && arr[index + 1].to_i.odd?
      arr[index] += "-"
    end
    index += 1
  end
  
  arr.join("")
end

insert_dash(4556779)

# Best practice:
def insert_dash(num)
  num.to_s.gsub(/(?<=[13579])([13579])/, '-\1')
end

# In this little assignment you are given a string of space separated numbers, and have to return the highest and lowest number.

# Example:

# high_and_low("1 2 3 4 5")  # return "5 1"
# high_and_low("1 2 -3 4 5") # return "5 -3"
# high_and_low("1 9 3 4 -5") # return "9 -5"
# Notes:

# All numbers are valid Int32, no need to validate them.
# There will always be at least one number in the input string.
# Output string must be two numbers separated by a single space, and highest number is first.

def high_low(str)
  arr = str.split(" ").map! { |n| n.to_i }
  arr.max.to_s + " " + arr.min.to_s
end

high_low("1 2 -3 4 5")