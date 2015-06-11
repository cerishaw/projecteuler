def triangle_number(num)
  num * (num + 1) / 2
end

def pentagonal_number(num)
  #n(3n−1)/2
  num * (3 * num - 1) / 2
end

def hexagonal_number(num)
  #Hn=n(2n−1)
  num * (2 * num - 1)
end

def pentagonal_match(result, start_num)
  num = start_num
  pent_number = pentagonal_number(num)
  while pent_number < result
    num += 1
    pent_number = pentagonal_number(num)
  end
  if pent_number == result
    num
  else
    -1
  end
end

def triangular_match(result, start_num)
  num = start_num
  tri_number = triangle_number(num)
  while tri_number < result
    num += 1
    tri_number = triangle_number(num)
  end
  if tri_number == result
    num
  else
    -1
  end
end

def hex_pent_pair(start)
  num = start
  hex_number = hexagonal_number(num)
  pent_match = pentagonal_match(hex_number, num)
  tri_match = -1
  while pent_match == -1 || tri_match == -1
    num += 1
    hex_number = hexagonal_number(num)
    pent_match = pentagonal_match(hex_number, num)
    tri_num = pent_match == -1 ? num : pent_match
    tri_match = triangular_match(hex_number, tri_num)
  end
  puts "Hn(n=#{num}), Pn(n=#{pent_match}), Tn(n=#{tri_match}) Result = #{hex_number}"
end