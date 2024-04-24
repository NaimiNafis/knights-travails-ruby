# frozen_string_literal: true

class KnightMoves
  def initialize
    @chess_board = Array.new(8) { Array.new(8) }
    @moves = [[1, 2], [2, 1], [2, -1], [1, -2],
              [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  end

  def find_path(start, goal)
    return 'Please type the correct x and y coordinate' unless start.is_a?(Array) && goal.is_a?(Array)

    queue = [start]
    visited = { start => true }
    node_before = { start => nil }

    until queue.empty?
      current = queue.shift

      return build_path(current, node_before, start) if current == goal

      @moves.each do |x, y|
        next_node = [x + current[0], y + current[1]]

        next unless is_valid?(next_node) && !visited[next_node]

        visited[next_node] = true
        node_before[next_node] = current
        queue.push(next_node)
      end
    end
  end

  private

  def is_valid?(position)
    x, y = position
    x.between?(0, 7) && y.between?(0, 7)
  end

  def build_path(node, node_before, start)
    path = []

    while node != start
      path.unshift(node)
      node = node_before[node]
    end
    path.unshift(start)
    puts "You made it in #{path.size - 1} moves!  Here's your path:"
    path.each_with_index { |move, index| puts "#{index}: #{move.inspect}" }
  end
end

knight = KnightMoves.new
knight.find_path([0, 0], [6, 6])
