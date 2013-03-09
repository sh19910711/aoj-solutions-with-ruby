while line = gets do
    ->(l){
        a = l[0]
        b = l[1]
        c = l[2]
        d = l[3]
        e = l[4]
        f = l[5]
        delta = 1.0 / ( a * e - b * d );
        x = ( e * c - b * f ) * delta
        y = ( a * f - d * c ) * delta
        printf "%.3f %.3f\n", x+1e-9, y+1e-9
    }.call line.split(' ').map(&:to_f)
end
