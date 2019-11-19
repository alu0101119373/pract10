Node = Struct.new(:value, :next, :prev)

class List
    attr_reader :head, :tail, :size

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def empty?
        @size == 0
    end

    def to_s
        str = "["
        aux = @head
        while aux != nil do
            str += aux.value.to_s
            aux = aux.next
            if aux != nil
                str += ", "
            end
        end
        str += "]"
        str
    end
end
