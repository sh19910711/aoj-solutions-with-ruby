while "" != ( line = gets.chomp ) do
    if line.to_i == 0
        break
    end
    sum = 0
    line.split("").each {|v| sum += v.to_i}
    puts sum
end
