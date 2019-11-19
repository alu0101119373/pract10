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

    def insert (valor)
        n = Node.new(valor, nil, nil)
        if empty?
            @head = n
            @tail = n
        else
            n.next = @head
            @head.prev = n
            @head = n
        end
        @size += 1
    end

    def insert_tail (valor)
        n = Node.new(valor, nil, nil)
        if empty?
            @head = n
            @tail = n
        else
            n.prev = @tail
            @tail.next = n
            @tail = n
        end
        @size += 1
    end
end
