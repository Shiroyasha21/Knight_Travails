require_relative 'lib/knight'
require_relative 'lib/board'

# Find the shortest path to the square destination
def knight_moves(initial, destination)
  arr = []

  tree = create_tree(initial)
  path = breadth_first(tree, destination)

  puts "You made it in 3 moves! Here's your path: "
  path.each { |el| p el}
end

# Create the tree from possible moves of Knight
def create_tree(root)
  knight = Knight.new
  board = Board.new

  x = knight.x
  y = knight.y
  queue = [root]
  dequeue = []

  # Continue the loop if it's in the board
  until queue.empty?

    curr_x = queue[0][0]
    curr_y = queue[0][1]
    dequeue << queue.shift

    root_node = BoardNode.new(dequeue[-1])
    board.add_node(root_node)

    x.zip(y).each do |xx, yy|
      sum_x = xx + curr_x
      sum_y = yy + curr_y
      new_move = [sum_x, sum_y]

      next if sum_x.negative? || sum_y.negative? || (sum_x > 3) || (sum_y > 3)
      next unless dequeue.none?(new_move) && queue.none?(new_move)

      # Add the new move and edge
      new_node = BoardNode.new(new_move)
      board.add_node(new_node)
      board.add_edge(root_node.value, new_node.value)

      # Add the new move to the queue
      queue << new_move

    end
  end
  board
end

# Traverse the tree
def breadth_first(tree)

end

