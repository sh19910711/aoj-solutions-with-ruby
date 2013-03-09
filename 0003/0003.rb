YES = "YES"
NO = "NO"

def sq(x)
    return x * x
end

gets.to_i.times do
    puts ->(l){
        if sq(l[0]) + sq(l[1]) == sq(l[2])
            return YES
        elsif sq(l[1]) + sq(l[2]) == sq(l[0])
            return YES
        elsif sq(l[2]) + sq(l[0]) == sq(l[1])
            return YES
        end
        return NO
    }.call gets.split(' ').map(&:to_i)
end
