require 'scanf'

$U = []
$P = []

def input_number 
    (gets.scanf "%d")[0]
end

def input
    n = input_number
    n.times do
        $P.push gets.scanf "%s %s"
    end
end

input

T = "SHCD"
T.split("").each do |t|
    ("1".."13").each do |v|
        $U.push [t, v]
    end
end

($U - $P).each do |p|
    printf "%s %s\n", p[0], p[1]
end

