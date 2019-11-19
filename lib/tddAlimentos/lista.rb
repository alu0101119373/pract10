Node = Struct.new(:value, :next, :prev)

class List
    attr_reader :head, :tail, :size

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end
end
