require 'scanf'

def input
    if ! ( line = gets )
        return false
    end
    list = line.scanf "%d %d"
    $n = list[0]
    $x = list[1]
    if $n == 0 && $x == 0
        return false
    end
    return true
end

def solve
    res = 0
    (1..$n).each do |i|
        (i+1..$n).each do |j|
            (j+1..$n).each do |k|
                if i == j || j == k || k == i
                    next
                end
                if i + j + k == $x
                    res += 1
                end
            end
        end
    end
    return res
end

while input do
    puts solve
end

