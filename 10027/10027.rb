n = gets.to_i
p1 = 0
p2 = 0
n.times do
    ret = lambda{ |list|
        a = list[0]
        b = list[1]
        if a < b
            return 1
        elsif a == b
            return 0
        else
            return -1
        end
    }.call gets.split(" ")

    if ret == 1
        p2 += 3
    elsif ret == 0
        p1 += 1
        p2 += 1
    else
        p1 += 3
    end
end

printf "%d %d\n", p1, p2

