res = []
stack = []
while "" != ( line = gets ) do
    line = line.chomp
    if line == "quit"
        break
    end
    if line[1] == 'u'
        stack.push(line[-1]) 
    else
        res.push stack[-1]
        stack.pop
    end
end

res.each {|v|
    puts v
}
