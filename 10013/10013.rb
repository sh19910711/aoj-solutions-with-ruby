require 'scanf'

def input
    if ! ( line = gets )
        return false
    end
    list = line.scanf "%d %d"
    $h = list[0]
    $w = list[1]
    return $h > 0 || $w > 0
end

def generate
    res = Array.new($h).map do
        Array.new($w)
    end
    $h.times do |i|
        $w.times do |j|
            res[i][j] = true
        end
    end
    return res
end

def framing grid
    ($h-2).times do |i|
        ($w-2).times do |j|
            grid[i+1][j+1] = false
        end
    end
    return grid
end

def output grid
    $h.times do |i|
        $w.times do |j|
            print grid[i][j] ? "#" : "."
        end
        print "\n"
    end
    print "\n"
end

while input do
    output framing generate
end


