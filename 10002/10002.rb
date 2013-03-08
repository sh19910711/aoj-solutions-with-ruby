require 'scanf'
while line = gets do
    list = line.scanf "%d %d"
    a = list[0]
    b = list[1]
    res1 = a * b
    res2 = 2 * a + 2 * b
    printf "%d %d\n", res1, res2
end
