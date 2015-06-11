def champernownes_constant(max_digits)
  digits = ""
  counter = 1
  while digits.length < max_digits
    digits += counter.to_s
    counter += 1
  end
  digits
end

digits = champernownes_constant(1000000)

digits[1] * digits[10] * digits[100] * digits[1000] * digits[10000] * digits[100000] * digits[1000000]