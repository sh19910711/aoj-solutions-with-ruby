require 'scanf'

list = gets.scanf "%d %d %d"
a = list[0]
b = list[1]
C = list[2] / 180.0 * Math::PI
S = 0.5 * a * b * Math.sin( C )
h = b * Math.sin( C )
c = Math.sqrt( a * a + b * b - 2 * a * b * Math.cos(C) )
L = a + b + c

p S
p L
p h

