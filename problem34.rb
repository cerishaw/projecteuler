def factorial(n)
  return 1 if n == 0
  n.downto(1).inject(:*)
end

def digits(n)
  n.to_s.split("").map{|s| s.to_i}
end

def digit_factorial_sum(n)
  ds = digits(n)
  sum = ds.map { |d| factorial(d) }.inject(:+)
end

def compare(x, y)
  if x == y
    0
  elsif x > y
    1
  else
    -1
  end
end

def num_check(digits)
  equal_digit_sums = []
  arr = []
  (digits).times do
    arr << 0
  end
  pos = digits * (-1)
  loop_arr(pos, arr, equal_digit_sums)
  equal_digit_sums.inject(:+)
end

def loop_arr(pos, arr, equal_digit_sums)
  if pos == -1
    while arr[pos] < 10
      centre(arr, equal_digit_sums)
      arr[-1] += 1
    end
  else
    while arr[pos] < 10
      loop_arr(pos + 1, arr, equal_digit_sums)
      arr[pos + 1] = 0
      arr[pos] += 1
    end
  end
end

def centre(arr, equal_digit_sums)
  num = arr.join.to_i
  result = compare(num, digit_factorial_sum(num))
  if result < 0
    arr[-1] = 9
  elsif result == 0
    equal_digit_sums << num
  end
end
