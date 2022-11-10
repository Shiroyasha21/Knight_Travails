# Create the board for the knight to traverse
class Board
  attr_reader :nodes

  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node.value] = node
  end

  def add_edge(node1, node2)
    @nodes[node1].add_edge(@nodes[node2])
    @nodes[node2].add_edge(@nodes[node1])
  end
end

# The cells of the board
class BoardNode
  attr_reader :value, :adjacent_nodes
  
  def initialize(value)
    @value = value
    @adjacent_nodes = []
  end

  def add_edge(adjacent_nodes)
    @adjacent_nodes << adjacent_nodes
  end
end