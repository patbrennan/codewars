# Consider a sequence u where u is defined as follows:

# The number u(0) = 1 is the first one in u.
# For each x in u, then y = 2 * x + 1 and z = 3 * x + 1 must be in u too.
# There are no other numbers in u.
# Ex: u = [1, 3, 4, 7, 9, 10, 13, 15, 19, 21, 22, 27, ...]

# 1 gives 3 and 4, then 3 gives 7 and 10, 4 gives 9 and 13, then 7 gives 15 and 22 and so on...

# Task:
# Given parameter n the function dbl_linear (or dblLinear...) returns the element u(n) of the ordered (with <) sequence u.

# Example:
# dbl_linear(10) should return 22
require "pry"
def dbl_linear(n)
  u = [1]
  x = Proc.new { |num| 2 * num + 1 }
  y = Proc.new { |num| 3 * num + 1 }

  u.each do |num|
    break if u.index(num) > n*1.1
    u << x.call(num) << y.call(num)
  end

  u.sort!.uniq!
  u[n]
end

def dbl_linear2(n)
  u = [1]

  u.each do |num|
    break if u.index(num) > n*1.1
    u << (2*num + 1) << (3*num + 1)
  end

  u.sort!.uniq!
  u[n]
end

def time
  start = Time.now

  dbl_linear(10)
  dbl_linear(20)
  dbl_linear(30)
  dbl_linear(50)

  finish = Time.now

  puts "Execute: #{finish - start} seconds."
end

def time2
  start = Time.now

  dbl_linear2(10)
  dbl_linear2(20)
  dbl_linear2(30)
  dbl_linear2(50)

  finish = Time.now

  puts "Execute: #{finish - start} seconds."
end

# puts dbl_linear(10)
# puts "-------"
# puts dbl_linear(20)
# puts "-------"
# puts dbl_linear(30)
# puts "-------"
# puts dbl_linear(50)
# puts "-------"

time()
time2()