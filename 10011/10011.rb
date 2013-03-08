require 'scanf'

def output list
    list.each_with_index {|a,i|
        print a
        if i + 1 < list.size
            print " "
        end
    }
    print "\n"
end

while ( n = gets.to_i ) != 0 do
    output gets.split.reverse
end
