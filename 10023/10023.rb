while lambda {
    s = gets
    if ! s || s.chomp == "-"
        return false
    end
    s = s.chomp
    m = gets.to_i
    m.times {
        h = gets.to_i
        s = s[h..s.length] + s[0..h-1]
    }
    puts s
    return true
}.call() do end
