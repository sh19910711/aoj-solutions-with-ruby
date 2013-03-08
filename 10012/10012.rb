require 'scanf'

def input
    list = gets.scanf "%d %d"
    $h = list[0]
    $w = list[1]
    return $h > 0 || $w > 0
end

while input do
    $h.times{
        $w.times{print "#"}
        print "\n"
    }
    print "\n"
end

