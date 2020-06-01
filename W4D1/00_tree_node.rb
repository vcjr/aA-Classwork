class PolyTreeNode
    
    attr_reader :starting_pos, :children, :parent
    attr_accessor :name
    
    def initialize(starting_pos)
        @starting_pos = starting_pos
        @children = [] #viable moves to go to
        @parent = nil
        @name = ""
    end
    # a b c a <- b, c <- b, old_parent = a..... b.parent = c
    require 'byebug'
    def parent=(node)  # a.parent=(b) # 
        # debugger
        if @parent != nil
            oldparent = @parent #<--- a
            idx = oldparent.children.index(self)  # 
            oldparent.children.delete_at(idx) if idx != nil
        end
        @parent = node
        node.children << self if node != nil && !node.children.include?(self)
        
    end

    def add_child(child)
        @children << child 
        child.parent = self
    end

    def remove_child(child)
        child.parent = nil
        @children.delete_at(@children.index(child))
    end

    def inspect
        "#<Stack:#{self.object_id} '#{self.starting_pos}' '#{self.name}>'"
    end

    def dfs(target_value)
       
        return self if self.starting_pos == target_value  
        return nil if self.children.empty? # d has no children 

        self.children.each do |child| 
            result = child.dfs(target_value) 
            return result unless result.nil? || result.class == Array
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            ele = queue.shift
            return ele if ele.starting_pos = target_value
            ele.children.each do |child| # a - b c
                queue << child
            end
        end
    end
end

  



# def set_parents(nodes)
#     parent_index = 0 
#         nodes.each_with_index do |child, index|
#       next if index.zero? 
#       child.parent = nodes[parent_index] 
#       parent_index += 1 if index.even? 
#     end
# end

# nodes = ('a'..'g').map { |value| PolyTreeNode.new(value)} # 

# set_parents(nodes)
# p nodes[0].dfs('g')


# a = PolyTreeNode.new("a")
# b = PolyTreeNode.new("b")
# c = PolyTreeNode.new("c")
# b.parent = a    
# b.parent = c





# require_relative 'queue'

# class Node
#   attr_reader :value, :children
  
#   def initialize(value, children = [])
#     @value = value
#     @children = children
#   end

#   def bfs(value)
#     # How do we find node 6 with bfs? (binary-tree.png) 
#       # => 1 -> 2 -> 3 -> 4 -> 5 -> 6

#     # use a queue! (first in, first out)

#     # start with root node
#     # enqueue it's children
#     # dequeue first node in queue and check it's value against value arg
#     # if the node has the value we're looking for, return that node
#     # else, enqueue the the node's children
#     # if the queue is empty, we know we're done and never found target value
#   end

#   def dfs(value)
#     # How do we find node 10 with dfs? (binary-tree.png) 
#       # => 1 -> 2 -> 4 -> 8 -> 9 -> 5 -> 10

#     # use stack (last in, first out) and recursion!

#     # start with root node
#     # check first child 
#     # check first child's children recursively (starting with the first child's first child) all the way down the tree before moving on to root's second child
#     # each recursive call is done when we reach a leaf (node with no children)
#   end

# end

# d = Node.new('d')
# e = Node.new('e')
# f = Node.new('f')
# g = Node.new('g')
# b = Node.new('b', [d, e])
# c = Node.new('c', [f, g])
# a = Node.new('a', [b, c])