require 'pry-byebug'

def knight_moves(start, goal)
    return 'Please type the correct x and y coordinate' if !start.is_a?(Array) || !goal.is_a?(Array) 

    chess_board = Array.new(8){Array.new(8)}
    moves = [[1, 2], [2, 1], [2, -1], [1, -2], 
             [-1, -2], [-2, -1], [-2, 1], [-1, 2]]

    queue = [start]
    visited = {}
    node_before = {start => nil}
    
    while !queue.empty?
        current = queue.shift # [0, 0]

        return build_path(current, node_before, start) if current == goal

        moves.each do |x, y|
            next_node = [x + current[0] , y + current[1]]

            if is_valid?(next_node, chess_board) && !visited.include?(next_node)
                visited[next_node] = true
                node_before[next_node] = current 
                queue.push(next_node)
            end
        end
    end

end

def is_valid?(position, chess_board)
    x, y = position
    if x.between?(0, chess_board.length) && y.between?(0, chess_board.length)
        return true
    else 
        return false
    end
end

def build_path(node, node_before, start)
    path = []
    
    while node != start
        path.unshift(node)
        node = node_before[node]
    end
    path.unshift(start)
    puts "You made it in #{path.size - 1} moves!  Here's your path:"
    path.each_with_index { |move, index| puts "#{index}: #{move}" }
end

# binding.pry
knight_moves([0,0], [6,6])
