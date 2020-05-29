class PolyTreeNode
    
    attr_reader :value, :children, :parent
    
    def initialize(value)
        @value = value
        @children = []
        @parent = nil
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
        "#<Stack:#{self.object_id} '#{self.value}'>"
    end
# require 'byebug'
    def dfs(target_value)
        
        return self if self.value == target_value 
        return nil if self.children.empty?
        self.children.each do |child| # --> node instance 
            child.dfs(target_value) 
 
        end
        
    end
end

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