require 'scanf'

def solve list
    a = list[0].to_i
    b = list[1]
    c = list[2].to_i
    if b == "?"
        return false
    end
    res = 0
    if b == "+"
        res = a + c
    elsif b == "-"
        res = a - c
    elsif b == "*"
        res = a * c
    elsif b == "/"
        res = a / c
    end
    printf "%d\n", res
    return true
end

while line = gets do
    if ! solve line.scanf "%d %s %d"
        break
    end
end
