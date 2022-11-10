require_relative 'board'

class Knight
  attr_accessor :x, :y

  def initialize
    @x = [1, 2, 1, -1, -2, -2, 2, -1]
    @y = [2, 1, -2, 2, -1, 1, -1, -2]
  end
end

def level_order(initial, destination)
  knight = Knight.new
  board = Board.new

  x = knight.x
  y = knight.y
  square_queue = [initial]
  visited = []

  until square_queue.empty?
    curr_coord = square_queue.shift
    visited << curr_coord

    board.add_node(curr_coord)

    x_q = curr_coord[0]
    y_q = curr_coord[1]

    x.zip(y).each do |xx, yy|
      new_coord = []

      sum_x = xx + x_q 
      sum_y = yy + y_q
      if sum_x == destination[0] && sum_y == destination[1]
        board.nodes[-1].add_edge([curr_coord, [sum_x, sum_y]])
        board.add_node(destination)
        return board
      elsif ((sum_x).positive? && (sum_y).positive?) && ((sum_x) <= 7 && (sum_y) <= 7)
        visited.any?([sum_x,sum_y]) || square_queue.any?([sum_x, sum_y]) ? next : new_coord.push((sum_x), (sum_y))
        board.nodes[-1].add_edge([curr_coord, new_coord])
        board.add_node(new_coord)
        square_queue << new_coord
      end
    end

  end
end

# def valid_move(move, last_move)
#   x = move[0].abs
#   y = move[1].abs
#   xx = last_move[0].abs
#   yy = last_move[1].abs

#   case [(x - xx), (y - yy)]
#   when [1,2]
#     move
#   when [2,1]
#     move
#   when [0,0]
#     move
#   end
# end

# p knight_moves([0,0], [1,2])
# p knight_moves([0,0], [3,3])
# p knight_moves([3,3], [0,0])
graph = level_order([0,0], [3,3])

p graph.nodes

