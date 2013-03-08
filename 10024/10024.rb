require 'scanf'

lambda {|list|
    x1 = list[0]
    y1 = list[1]
    x2 = list[2]
    y2 = list[3]
    p Math.hypot x2 - x1, y2 - y1 
}.call gets.scanf "%f %f %f %f"
