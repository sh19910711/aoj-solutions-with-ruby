n = gets.to_i
res = gets.chomp
(n-1).times { res = [ res, gets.chomp ].min }
puts res
