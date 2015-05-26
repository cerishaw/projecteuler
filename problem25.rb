def next_fibbonacci_num(term1, term2)
  term1 + term2
end

def digit_count(number)
  number.to_s.split("").count
end

def fibbonacci_sequence(limit)
  f1 = 1
  f2 = 1
  index = 3
  next_term = next_fibbonacci_num(f1, f2)
  while digit_count(next_term) < limit
    f1 = f2
    f2 = next_term
    index += 1
    next_term = next_fibbonacci_num(f1, f2)
  end
  index
end