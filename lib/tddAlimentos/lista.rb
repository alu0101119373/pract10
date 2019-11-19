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
                str += ","
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

    def insert_more (arr)
        arr.reverse_each  do |value|
            self.insert(value)
        end
    end

    def extract ()
        aux = nil
        if @head == @tail
            aux = @head
            @head = nil
            @tail = nil
        else
            aux = @head
            @head = @head.next
            @head.prev = nil
            aux.next = nil
        end
        aux.value
    end
end
