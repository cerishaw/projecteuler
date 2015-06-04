def distinct_powers(max_a, max_b)
  answers = []
  a_vals = 2..max_a
  b_vals = 2..max_b
  b_vals.each do |b|
    answers << a_vals.map { |a| a ** b }
  end
  answers.flatten.uniq
end