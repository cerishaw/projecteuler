def even?(x)
  x % 2 == 0
end

def next_collatz_no(x)
  if even?(x)
    x/2
  else
    3 * x + 1
  end
end

def collatz_seq(x)
  seq = []
  next_no = x
  while next_no > 1
    seq << next_no
    next_no = next_collatz_no next_no
  end
  seq << 1
end

def longest_seq_start(max_iterations)
  longest_length = 1
  start_for_longest_length = max_iterations
  (2..max_iterations).to_a.reverse.each do |x|
    seq_len = collatz_seq(x).count 
    if(seq_len > longest_length)
      longest_length = seq_len  
      start_for_longest_length = x
    end
  end
  puts "A start of #{start_for_longest_length} gives a length of #{longest_length}"
end