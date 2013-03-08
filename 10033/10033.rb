n = gets.to_i
res = []
stack = Array.new(n+1).map{|v| []}

while "" != ( line = gets ) do
    line = line.chomp
    if line == "quit"
        break
    end
    list = line.split(" ")
    if list[0] == "push"
        stack[list[1].to_i].push list[2]
    elsif list[0] == "pop"
        res.push stack[list[1].to_i][-1]
        stack[list[1].to_i].pop
    else
        stack[list[2].to_i].push stack[list[1].to_i][-1]
        stack[list[1].to_i].pop
    end
end

res.each{|v| puts v}

