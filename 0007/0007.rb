p ->(n){
    res = 100000
    n.times do
        res = ->(x){
        }.call res
    end
    return res
}.call gets.to_i
