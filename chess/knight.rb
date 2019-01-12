require_relative "../skeleton/lib/00_tree_node"

class KnightPathFinder

  def self.valid_moves(pos)
    moves = []

  end

  def initialize(starting)
    @starting = starting
    @root_node = PolyTreeNode.new(starting)
    @considered_positions = []
  end

  def find_path(pos)

  end

  def build_move_tree

  end

  def new_move_positions(pos)
    x, y = pos 
    positions = [
      [x+2, y+1],
      [x+2, y-1],
      [x+1, y-2],
      [x-1, y-2],
      [x-2, y-1],
      [x-2, y+1],
      [x-1, y+2],
      [x+1, y+2]
    ] 
  end 
end 
