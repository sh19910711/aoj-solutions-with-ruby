require 'scanf'

def input
    if ! ( line = gets )
        return false
    end
    list = line.scanf("%d %d %d")
    $m = list[0]
    $f = list[1]
    $r = list[2]
    if $m == -1 && $f == -1 && $r == -1
        return false
    end
    return true
end

def solve
    sum = $m + $f
    if $m == -1 || $f == -1
        return "F"
    elsif sum >= 80
        return "A"
    elsif sum >= 65
        return "B"
    elsif sum >= 50
        return "C"
    elsif sum >= 30 && $r >= 50
        return "C"
    elsif sum >= 30
        return "D"
    end
    return "F"
end

while input
    puts solve
end
