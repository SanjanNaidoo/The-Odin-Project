class Node
    attr_accessor :value, :left, :right
    def initialize(val)
        @value = val
        @left = nil
        @right = nil
    end
end


class Tree
    attr_accessor :root
    def initialize(arr)
        @root = build_tree(arr.sort)
        @arr = arr
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def insert(val)
        @arr << val
        @root = build_tree(@arr.sort)
    end

    def delete(val)
        @arr.delete(val)
        @root = build_tree(@arr.sort)
    end

    def level_order(root = @root)
        return if root == nil
        result = []
        q = []
        q.push(root)
        while (!q.empty?)
            current = q[0]
            result << yield(current.value)
            q.push(current.left) if current.left
            q.push(current.right) if current.right
            q.shift
        end
        return result
    end

end

def build_tree(arr)
    if arr[0] == nil
        return nil
    end

    #find middle index and make it the root
    mid = (arr.length) / 2
    root = Node.new(arr[mid])

    #call recursively left subtree
    root.left = build_tree(arr[0...mid])

    #call recursively right subtree
    root.right = build_tree(arr[mid+1..-1])

    return root
end