require 'set'

def get_path
    gets.strip
end

def get_s_path path
    "/" + path.join('/')
end

class Solution

    def initialize
        @n, @m = 0, 0
        @dirs = Set.new
        @files = Set.new
    end

    def input
        @n, @m = gets.split(' ').map {|v| v.to_i}
        @n.times {|| add_file get_path }
        @n != 0 || @m != 0
    end

    def add_index_html s_path
        s_path += "index.html" if s_path[-1, 1] == "/"
        path = s_path.split('/')[1..-1]
        s_path += "/index.html" if path[-1, 1][0] == ".." || path[-1, 1][0] == "."
        s_path
    end

    def convert s_path
        s_path.split('/')[1..-1]
    end

    def is_invalid_subdir path
        cur = []
        path.pop
        path.any? {|item|
            if item == ".."
                cur.pop
            elsif item != "."
                cur.push item
            end
            s_cur = get_s_path cur
            ! @dirs.include? s_cur 
        }
    end

    def is_invalid_file path
        s_path = get_s_path path
        puts "s_path = #{s_path}, #{@files.include? s_path}"
        ! @files.include? s_path
    end

    def is_over path
        depth = 0
        path.any? {|item|
            if item == ".."
                depth -= 1
            elsif item != "."
                depth += 1
            end
            depth < 0
        }
    end

    def query a, b
        a = add_index_html a
        b = add_index_html b
        puts "a = #{a}, b = #{b}"
        path1, path2 = convert(a), convert(b)
        return :NOT_FOUND if is_over(Array.new(path1)) || is_over(Array.new(path2))
        return :NOT_FOUND if is_invalid_subdir(Array.new(path1)) || is_invalid_subdir(Array.new(path2))
        return :NOT_FOUND if is_invalid_file(Array.new(path1)) || is_invalid_file(Array.new(path2))
        puts "path1 = #{path1}, path2 = #{path2}"
        return :YES
    end

    def output result
        if result == :NOT_FOUND
            puts "not found"
        elsif result == :YES
            puts "yes"
        else
            puts "no"
        end
        puts ""
    end

    def add_file s_path
        path = convert s_path
        s_filepath = get_s_path path
        @files.add s_filepath
        path.pop

        cur = []
        path.each {|item|
            if item == ".."
                cur.pop
            elsif item != "."
                cur.push item
            end
            s_path = get_s_path cur
            @dirs.add s_path
        }
    end

    def fetch_query
        @m.times {|| output query get_path, get_path }
    end

end

s = Solution.new
while s.input do
    s.fetch_query
end

