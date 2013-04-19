require 'set'

class String
    def to_path
        self.concat 'index.html' if self != '/' && self[-1, 1] == '/'
        self.strip.split('/')[1..-1]
    end
end

class Path
    def initialize path
        @path = path
    end
    def to_s
        '/' + @path.join('/')
    end
    def to_strict_path
        sub = []
        @path.each {|item|
            if item == '..'
                sub.pop
            elsif item != '.'
                sub.push item
            end
        }
        sub
    end
end

class Solution

    def initialize
        @n = 0
        @m = 0
        @files = Set.new []
        @dirs = Set.new []
    end

    def input
        @n, @m = gets.split(' ').map {|v| v.to_i}
        @dirs.add(Path.new([]).to_s)
        @n.times {|| add_file gets.strip.to_path }
        @n != 0 || @m != 0
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
        @m.times {|| output solve gets.strip.to_path, gets.strip.to_path }
    end

    def solve path1, path2
        path1 = [] if path1 == nil
        path2 = [] if path2 == nil
        return :NOT_FOUND if ( ! check_valid_subdir(path1[0..-2]) || ! check_valid_subdir(path2[0..-2]) )
        return :NOT_FOUND if ( ! exist_file(path1) || ! exist_file(path2) )
        s_path1 = get_strict_path path1
        s_path2 = get_strict_path path2
        s_path1 == s_path2 ? :YES : :NO
    end

    def get_strict_path path
        res = Path.new(path).to_strict_path
        return res if @files.include? Path.new(res).to_s
        res.push 'index.html'
        res
    end

    def exist_file path
        strict_path = Path.new(path).to_strict_path
        return true if @files.include? Path.new(strict_path).to_s
        strict_path.push 'index.html'
        @files.include? Path.new(strict_path).to_s
    end

    def check_valid_subdir path
        sub = []
        return true if path == nil || path.empty?
        path.all? {|item|
            if item == '..'
                sub.pop
            elsif item != '.'
                sub.push item
            end
            @dirs.include?(Path.new(sub).to_s)
        }
    end

    def add_subdir path
        sub = []
        path.each {|item|
            if item == '..'
                sub.pop
            elsif item != '.'
                sub.push item
            end
            @dirs.add Path.new(sub).to_s
        }
    end

    def add_file path
        @files.add Path.new(path).to_s
        add_subdir path[0..-2]
    end
end

s = Solution.new
while s.input do
    s.fetch_query
end


