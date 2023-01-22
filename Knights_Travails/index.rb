require 'pry-byebug'

class Node
    attr_accessor :x, :y, :children, :root
    def initialize(x,y,root=nil)
        @x = (x>7 || x < 0) ? nil : x
        @y = (y>7 || y < 0) ? nil : y
        @root = root
    end

    def calc_children
        @children = [Node.new(@x + 1, @y + 2, self), Node.new(@x-1, @y + 2, self), Node.new(@x+2,@y+1, self), Node.new(@x-2, @y+1, self), Node.new(@x+2, @y-1, self),
        Node.new(@x-2, @y-1, self), Node.new(x+1,y-2, self), Node.new(x-1,y-2, self)]
    end

    def check_match(node)
        if (self.x == node.x) && (self.y == node.y)
            return true
        else
            return false
        end
    end

    def check_valid
        return (@x == nil || @y == nil) ? false : true
    end
end

def calc_move(root,x,y)
    return if root == nil
    q = []
    q.push(root)
    binding.pry
    while !q.empty?
        current = q[0]
        if current.check_valid
            current.calc_children
            if current.check_match(Node.new(x,y))
                # Print the path taken by traversing the root variable
                puts "#{x},#{y}"
                while current.root != nil
                    puts "#{current.root.x},#{current.root.y}"
                    current = current.root
                end
                break
            end #check if pos is a match and then terminate
            current.children.each {|node| q << node if node.check_valid} #check if the node we add to the list is valid and add it if it is
        end 
        q.shift()
    end
end

n = Node.new(3,3)
calc_move(n,5,7)
