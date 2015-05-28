def terminates?(denominator)
  remainder = denominator
  while remainder % 2 == 0
    remainder = remainder / 2
  end
  while remainder % 5 == 0
    remainder = remainder / 5
  end
  remainder == 1
end

def recurring_denominators(limit)
  denoms = []
  index = 1
  while index < limit
    denoms << index unless terminates?(index)
    index += 1
  end
  denoms
end

def recurring_count(denominator)
  remainder_array = []
  remainder = 1

  remainder_array << remainder
  remainder = (remainder * 10) % denominator
  pos = 
end

def match_position(array, number)
  array.index(number)
end

