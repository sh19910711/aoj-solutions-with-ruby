n = gets.to_i
gets.split(" ").map{|v| v.to_i}.sort.each_with_index {|v,i|
    print v
    if i + 1 < n
        print " "
    end
}
print "\n"
