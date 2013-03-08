require 'scanf'

def input
    if ! line = gets
        return false
    end
    list = line.scanf "%d %d"
    $h = list[0]
    $w = list[1]
    return ! ( $h == 0 && $w == 0 ) 
end

def generate h, w
    res = Array.new(h).map do
        Array.new(w, false)
    end
    $h.times do |i|
        $w.times do |j|
            res[i][j] = ( i % 2 == 0 ) == ( j % 2 == 0 )
        end
    end
    return res
end

def output grid
    grid.each do |row|
        row.each do |state|
            print state ? "#" : "."
        end
        print "\n"
    end
    print "\n"
end

while input do
    output generate $h, $w
end

