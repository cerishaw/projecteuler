def factorial_digit_sum(x)
  (1..x).inject(:*).to_s.split("").map{|s| s.to_i}.inject(:+)
end