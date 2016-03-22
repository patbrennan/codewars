# Create a function that returns the lowest product of 4 consecutive numbers in a given string of numbers.
# This should only work if the number has 4 digits of more. If not, return "Number is too small".

# Example

# lowest_product("123456789")--> 24 (1x2x3x4)
# lowest_product("35") --> "Number is too small"

def lowest_product(input)
    if input.length < 4
      "Number is too small"
    else
      a = input.split("").sort
      a.map! { |n| n.to_i }
      product = 1
      a[0..3].each { |n| product *= n }
      p product
    end
end

lowest_product("192837465") # => 24
lowest_product("95228393655") # => (2x3x5x6) = 180
