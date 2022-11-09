class Knight
  attr_accessor :x, :y

  def initialize
    @x = [1, 2, 1, -1, -2, -2, 2, -1]
    @y = [2, 1, -2, 2, -1, 1, -1, -2]
  end
end

def knight_moves(initial, destination)
  knight = Knight.new

  x = knight.x
  y = knight.y
  
  square_queue = [initial]
  visited = []
  path_taken = []

  while !square_queue.empty?
    curr_coord = square_queue.shift
    visited << curr_coord
    x_q = curr_coord[0]
    y_q = curr_coord[1]

    if x_q == destination[0] && y_q == destination[1]
      return path_taken
    else
      x.zip(y).each do |xx, yy|
        new_coord = []

        sum_x = xx + x_q 
        sum_y = yy + y_q
        if ((sum_x).positive? && (sum_y).positive?) && ((sum_x) <= 7 && (sum_y) <= 7)
          visited.any?([sum_x,sum_y]) || square_queue.any?([sum_x, sum_y]) ? next : new_coord.push((sum_x), (sum_y))

          square_queue << new_coord
        end
      end
    end
  end
end

p knight_moves([3,3], [4,3])