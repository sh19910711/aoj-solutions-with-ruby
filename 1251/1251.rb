
class Solution

    def check_matched path
        return false
    end

    def check_valid s_path
        path = s_path.split('/')[1..-1]
        return check_matched path if path == nil

        depth = path.map {|term| term == '..' ? -1 : ( term != '.' ? 1 : 0 )}.inject(:+)
        return false if depth < 0

        cur = []
        return false if path.any? {|v|
            if v == '..'
                cur.pop
            elsif ( v != '.' )
                cur.push v
            end
            ! check_matched cur
        }

        return false
    end


    def initialize
        @n = 0
        @m = 0
        @files = []
    end

    def input
        @n, @m = gets.split(' ').map {|v| v.to_i}
        @n.times {||  gets.strip }
        @n != 0 || @m != 0
    end

    def solve path1, path2
        p check_valid path1
    end

    def output result
        case result
        when :NOT_FOUND
            puts 'not found'
        when :YES
            puts 'yes'
        when :NO
            puts 'no'
        end
    end

    def fetch_query
        @m.times {|| output solve gets.strip, gets.strip }
    end

end

s = Solution.new
while s.input do
    s.fetch_query
end


