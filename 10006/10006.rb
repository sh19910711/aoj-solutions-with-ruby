require 'scanf'

def output( test_no, result )
    printf "Case %d: %d\n", test_no, result
end

test_no = 0
while line = gets do
    if line.to_i == 0
        break
    end
    output test_no+1, line
    test_no += 1
end
