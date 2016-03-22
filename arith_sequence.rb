def arithmetic_sequence_sum(a, r, n)
  sum = 0
  
  while n > 0
    sum += a + (n - 1)*r
    n -= 1
  end
  sum
end

p arithmetic_sequence_sum(2, 2, 10) # => 110

def arithmetic_sequence_sum2(a, r, n)
  sum = a + (n - 1)*r
  n -= 1
  sum += arithmetic_sequence_sum2(a, r, n) until n <= 0
  sum
end

p arithmetic_sequence_sum2(2, 2, 10) # => 110