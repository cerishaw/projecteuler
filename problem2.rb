def fibonacci_sequence(seq, max)
  while next_in_sequence(seq) < max do
    seq.push next_in_sequence(seq)
  end
  seq
end

def next_in_sequence(seq)
  seq[-1] + seq[-2]
end

def even?(x)
  x % 2 == 0
end

def sum_of_evens(array)
  total = 0
  array.each do |x|
    total+= x if even?(x)
  end
  total
end

fib1 = fibonacci_sequence([1,2], 100)
fib2 = fibonacci_sequence([1,2], 4000000)

sum_of_evens(fib1)
sum_of_evens(fib2)