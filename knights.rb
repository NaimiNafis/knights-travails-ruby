chess_board = Array.new(8){Array.new(8)}
moves = [[1, 2], [2, 1], [2, -1], [1, -2], 
        [-1, -2], [-2, -1], [-2, 1], [-1, 2]]

def knight_moves(start, goal)
    return 'Please type the correct x and y coordinate' if !start.is_a?(Array) || !goal.is_a?(Array) 

    queue = [start]
    visited = {}
    node_before = {start => nil}
    
    while queue.empty?
        current = queue.shift # [0, 0]

        return build_path(current, node_before) if current == goal

        moves.each do |x, y|
            next_node = [x + current[0] , y + current[1]]

            if next_node.is_valid?(next_node) && !visited.include?(next_node) # true, false 
                visited.add(next_node)
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

def build_path(node, node_before)
    path = []
    
    while node_before
        path.unshift(node)
        node = node_before[node]
    end
    path
end

p knight_moves([0,0], [3,3])

=begin

arr = []
hash = { [0,0] => [2,3], [2,3] => [1,2], [1,2] => [4,6]}

ar.push(hash[[0,0]]) #[2,3]


1. Set Chess Board dimension = Array[7][7]
2. Set knight moves = [[1, 2], [2, 1], [2, -1], [1, -2], 
                        [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
3. The idea is to use BFS, queue, to keep children 

for each moves, add them to start position, 
    check if it is over chess_board dimension
        go to next element
        return nil
    if not
        push to queue
    end

let temp_move be start_position children, put them in queue

dequeue the start_position and put it in [temp_moves], run each children

if each children = goal
    then return temp_move



=end
