
def generate (n)
    $P = Array.new(n, false)
    i = 3
    until i > n
        $P[i] = true
        i += 2
    end
    i = 3
    $P[2] = true
    until i > n
        if ! $P[i]
            i += 2
            next
        end
        j = i + i
        until j > n do
            $P[j] = false
            j += i
        end
        i += 2
    end
end

def is_prime (n)
    return $P[n] ? 1 : 0
end

def solve (n)
    return ->() {
        res = 0
        (n+1).times {|v| res += is_prime(v) }
        res
    }.call
end

generate 1000000 
while s = gets do
    n = s.to_i
    p solve n
end
