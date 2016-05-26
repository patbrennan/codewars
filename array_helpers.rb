class Array
  def square
    map { |n| n**2 }
  end

  def cube
    map { |n| n**3 }
  end

  def average
    return "NaN" if empty?
    reduce(:+) / size
  end

  def sum
    reduce(:+)
  end

  def even
    select(&:even)
  end

  def odd
    select(&:odd)
  end
end

numbers = [1, 2, 3, 4, 5]
nan = []

p numbers.square  # must return [1, 4, 9, 16, 25]
p numbers.cube   # must return [1, 8, 27, 64, 125]
p numbers.average # must return 3
p nan.average
p numbers.sum    # must return 15
p numbers.even    # must return [2, 4]
p numbers.odd    # must return [1, 3, 5]