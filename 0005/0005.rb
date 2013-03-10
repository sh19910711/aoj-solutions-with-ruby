while line = gets do
    if line == "" then break end
    ->(a,b){printf "%d %d\n", a.gcd(b), a.lcm(b)}.call *line.split(' ').map(&:to_i)
end
