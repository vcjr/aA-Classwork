require_relative '00_tree_node'

class KnightPathFinder
    Row = ("a".."h").to_a
    Col = ("1".."8").to_a
    attr_reader :considered_positions, :node
    def initialize(starting_pos)
        @node = PolyTreeNode.new(starting_pos)
        @considered_positions = [starting_pos]
        @hash = {}
    end 

    def self.valid_moves(pos)
        x, y = pos
        moves = [
            [x-1,y+2],
            [x+1,y+2],
            [x+2,y+1],
            [x+2,y-1],
            [x+1,y-2],
            [x-1,y-2],
            [x-2,y-1],
            [x-2,y+1]
        ]
        valid_moves = moves.select { |move| (move[0] < 8 && move[0] >= 0) && (move[1] < 8 && move[1] >= 0) }
    end

    def new_move_positions(pos) #filters out considered positions
        new_positions = KnightPathFinder.valid_moves(pos).select {|position| !@considered_positions.include?(position) }
        @considered_positions += new_positions
        new_positions
    end

    def build_move_tree #<- this should be a node with a given value
         queue = [@node]
        until queue.empty?
            current_node = queue.shift 
            valid_new_moves = new_move_positions(current_node.starting_pos)#returns array of all valid new moves from starting pos
            valid_new_moves.each do |move| #This is a position e.g [1,2]
            
                name = "#{Row[move[0]]}#{Col[move[1]]}"
                child = PolyTreeNode.new(move)
                @hash[name] = child
                # child.name = name
                queue << child  #<--- shovel nothing
                current_node.add_child(child)  
            end
        end
    end

    def find_path(end_pos)
        name = "#{Row[end_pos[0]]}#{Col[end_pos[1]]}"
        end_node = @hash[name]
        node_path = trace_path_back(end_node) 
        node_path.map {|node| "#{Row[node.starting_pos[0]]}#{Col[node.starting_pos[1]]}"}
        
    end

    def trace_path_back(end_node)
        result = [end_node]
        current_node = end_node # result[-1]
        until current_node.parent == nil
            current_node = current_node.parent
            result << current_node
        end     
        result.reverse # find_path(end_pos).parent will return the current position of the knight
    end


end



leftKWhite = KnightPathFinder.new([1,0])
leftKWhite.build_move_tree
p leftKWhite.find_path([7,7])



# We papa = child.parent, we need to find it's parent.
# grandpa = papa.parent  
# The parent hold it's own parent position.
# Which that parent of the parent could possibly be the current pos.


# print leftKWhite.considered_positions.count
# p leftKWhite.node.children
# ♘
# ♞

# 8,8 
# # --> offset 3 total aggregate + x not changed by 3 y not changed by 3
# 2 1 
# 2 -1
# -2 -1
# -2 1
# # 4, 4
 
# init pos = 4,4 x,y ()

# 8 7 6 5 4 3 2 1 0

# 3,6
# 5,6
# 6,5
# 6,3
# 5,2
# 3,2
# 2,3
# 2,5