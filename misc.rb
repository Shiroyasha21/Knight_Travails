# Creates node from possible moves of the knight
class ActionNode
  attr_accessor :x, :y, :value, :child

  def initialize(coordinate)
    @x = coordinate[0]
    @y = coordinate[1]
    @value = [x,y]
    @child = []
  end

  def add_child(node)
    return if node.nil?

    @child << node
  end
end

class Knight
  attr_accessor :start

  def initialize(coordinate)
    @start = create_action_graph(coordinate)
  end

  def create_action_graph(coordinate)
    start = ActionNode.new(coordinate)

    x_move = [-1, 1, 1, -1, 2, -2, -2, 2]
    y_move = [-2, 2, -2, 2, 1, -1, 1, -1]
    x = coordinate[0]
    y = coordinate[1]

    while !x_move.length.zero? && !y_move.length.zero?
      x_curr = x_move[0]
      y_curr = y_move[0]

      if (x + x_curr) > 0 && (y + y_curr) > 0
        start.add_child(ActionNode.new([(x + x_curr), (y + y_curr)]))
        x_move.shift
        y_move.shift
      end
    end
    start
  end
end

k = Knight.new([0,0])


# def knight_moves(initial, destination)
#   board_graph = Knight.new(initial)
  
# end