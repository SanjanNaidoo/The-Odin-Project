class Node
    def initialize(value)
        @value = value
        @next_node = nil
    end

    attr_accessor :value, :next_node
end


class LinkedList
    attr_accessor :size, :head, :tail 

    def initialize(value)
        @head = Node.new(value)
        @tail = @head
        @size = 1
    end

    def append(value)
        new_node = Node.new(value)
        @tail.next_node = new_node
        @tail = new_node
        @size += 1
    end

    def prepend(value)
        temp = @head
        @head = Node.new(value)
        @head.next_node = temp
        @size += 1
    end 

    def at(index)
        node = @head.next_node
        index -= 1
        while index > 0
            node = node.next_node
            index-=1
        end
        puts node.value
    end

    def pop
        node = @head
        while node.next_node.next_node != nil
            node = node.next_node
        end
        value = node.next_node.value
        node.next_node = nil
        @tail = node
        value
    end
    
    def contains?(value)
        node = @head
        while node
            if node.value == value
                return true
            end
            node = node.next_node
        end
        return false 
    end

    def find(value)
        node = @head
        i = 0
        while node
            if node.value == value
                return i 
            end
            i+=1
            node = node.next_node
        end
        return false 
    end

    def to_s
        node = @head
        print "(#{@head.value}) -> "
        node = @head.next_node
        while node != nil
            print "(#{node.value}) -> "
            node = node.next_node
        end
        print "nil\n" 
    end
end

list = LinkedList.new(5)
list.append(3)
list.prepend(2)
list.to_s