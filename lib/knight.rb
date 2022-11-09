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
    x = coordinate[0]
    y = coordinate[1]
    return nil if x.negative? || y.negative?
    return nil if x > 7 || y > 7
    
    start = ActionNode.new(coordinate)

    start.add_child(create_action_graph([(x + 1), (y + 2)]))

    
    start
  end
end

k = Knight.new([5,5])

puts 'Start'
p k.start
puts 'Child'
p k.start.child

def knight_moves(initial_pos, target)
  possible_actions = Knight.new(initial_pos)
end