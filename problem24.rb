def perms(n)
  n.downto(1).inject(:*)
end

def number_at_variation(array, variation)
  answer = []
  remainder = variation - 1
  iterations = array.count - 1

  i = 0
  while i < iterations
    perms = perms(array.count - 1)
    answer << array[remainder / perms]
    remainder = remainder - array.index(answer[i]) * perms
    array.delete(answer[i])
    i = i + 1
  end
  
  answer << array[0]
  answer.join
end

number_at_variation [0,1,2,3,4,5,6,7,8,9], 1000000