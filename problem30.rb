def split_into_digits(number)
  number.to_s.split("").map{|s| s.to_i}
end

def power_sum(array, power)
  sum = 0
  array.each do |num|
    sum += num ** power
  end
  sum
end

def power_digits(power, limit)
  total = 0
  i = 10
  while i < limit
    digits = split_into_digits(i)
    sum = power_sum(digits, power)
    puts i.to_s if sum == i
    total += i if sum == i
    i += 1
  end
  sum
end