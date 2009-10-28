require 'gruff'

g = Gruff::Line.new
g.data("Apples", [1, 2, 3, 4, 4, 3])
g.write('graph.png')
