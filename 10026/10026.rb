require 'scanf'

while ( line = gets ) != "" do
    n = line.to_i
    if n == 0
        break
    end
    a = gets.split(" ").map {|v| v.to_i }
    avg = a.inject(0.0) {|sum, v| sum += v} / n
    dev = Math.sqrt a.inject(0.0) {|sum, v| sum += (v-avg)**2} / n
    p dev
end

