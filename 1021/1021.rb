END_OF_TEXT = 'END_OF_TEXT'
END_OF_COMMAND = '-'

$text = []
$commands = []

def input_line s_end
    return false if ! ( s = gets )
    s = s.strip
    s == s_end ? false : s
end

def input_until s
    ->() {
        res = []
        while line = input_line(s) do
            res.push(line)
        end
        res
    }
end

$input_text = input_until END_OF_TEXT
$input_commands = input_until END_OF_COMMAND

def input
    $text = $input_text.call
    if $text.empty?
        $text = false
    end
    if $text 
        $commands = $input_commands.call
        return true
    end
    return false
end

class Editor
    def initialize
        @r = 0
        @c = 0
        @buffer = ""
    end

    def check_cursor_leftmost
        @c == 0
    end

    def check_cursor_rightmost
        @c == $text[@r].length
    end

    def has_prev_line
        @r - 1 >= 0
    end

    def has_next_line
        @r + 1 < $text.length
    end

    def delete_line k
        $text[k, 1] = []
    end

    def delete_letter k
        $text[@r][k, 1] = '' 
    end

    def move_to_leftmost 
        @c = 0
    end

    def move_to_rightmost
        @c = $text[@r].length
    end

    def move_to_up
        @r -= 1
    end

    def move_to_down
        @r += 1
    end

    def move_to_left k = 1
        @c -= k
    end

    def move_to_right k = 1
        @c += k
    end

    def command_a
        move_to_leftmost
    end

    def command_e
        move_to_rightmost
    end

    def command_p
        move_to_up if has_prev_line
        move_to_leftmost
    end

    def command_n
        move_to_down if has_next_line
        move_to_leftmost
    end

    def command_f
        if check_cursor_rightmost
            move_to_down if has_next_line
            move_to_leftmost
        else
            move_to_right
        end
    end

    def command_b
        if check_cursor_leftmost
            move_to_up if has_prev_line
            move_to_rightmost
        else
            move_to_left
        end
    end

    def command_d
        if check_cursor_rightmost
            if has_next_line
                $text[@r] += $text[@r+1]
                delete_line @r + 1
            end
        else
            delete_letter @c
        end
    end

    def command_k
        if check_cursor_rightmost
            if has_next_line
                $text[@r] += $text[@r+1]
                delete_line @r+1
                @buffer = "\n"
            end
        else
            @buffer = $text[@r][@c..$text[@r].length-1]
            $text[@r] = $text[@r][0, @c]
        end
    end

    def command_y
        if @buffer == "\n"
            tmp = $text[@r][@c..$text[@r].length-1]
            $text[@r] = $text[@r][0, @c]
            $text[@r+1, 0] = tmp
            move_to_down
            move_to_leftmost
        elsif @buffer != ''
            $text[@r][@c, 0] = @buffer
            move_to_right @buffer.length
        end
    end

    def command s
        case s
        when "a"
            command_a
        when "e"
            command_e
        when "p"
            command_p
        when "n"
            command_n
        when "f"
            command_f
        when "b"
            command_b
        when "d"
            command_d
        when "k"
            command_k
        when "y"
            command_y
        end
    end
end

def execute_command s
    $e.command s
end

def solve
    $e = Editor.new
    $commands.each {|cmd|
        execute_command cmd
    }
end

def output
    $text.map {|s| puts s}
end

while input
    solve
    output
end

