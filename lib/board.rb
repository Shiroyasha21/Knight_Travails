# The square/nodes of the board.
# Contains the coordinates as vertices and edges
class BoardNode
  attr_accessor :value, :edge

  def initialize(value)
    @value = value
    @edge = []
  end

  def add_edge(edge)
    @edge << edge
  end
end

# The chess board that has the nodes.
class Board
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_node(value)
    @nodes << BoardNode.new(value)
  end
end
