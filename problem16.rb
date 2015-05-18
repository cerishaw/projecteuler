def power_digit_sum(power)
  result = 2 ** power
  digits = result.to_s.split("").map{|s| s.to_i}
  digits.inject(:+)
end