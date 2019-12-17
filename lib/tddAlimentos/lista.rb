require 'markup'

# = Node
#
# Autor::   Himar Manuel Barquín Carrasco
# Web::     https://github.com/ULL-ESIT-LPP-1920/tdd-alu0101119373
#
# == Descripción
#
# Estructura que representa un nodo. Contiene la información del valor que almacena, el nodo siguiente y el nodo previo
Node = Struct.new(:value, :next, :prev)

# = lista.rb
#
# Autor::   Himar Manuel Barquín Carrasco
# Web::     https://github.com/ULL-ESIT-LPP-1920/tdd-alu0101119373
#
# == Descripción
#
# Clase que representa una lista, utilizando una estrucutura llamada *Node* que contiene la información del valor de ese nodo, junto a su nodo predecesor y su nodo antecesor. Además, la lista dispone de una cabeza, una cola, y un valor que representa el tamaño. De esta manera, la clase List es tipo LIFO (cola).
#
# == Métodos
# * empty?
# * to_s
# * to_rs
# * insert
# * insert_tail
# * insert_more
# * extract
# * extract_tail
# * each

class List

    include Enumerable

    attr_reader :head, :tail, :size

    # Constructor de la clase List
    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    # Comprueba si la lista está vacía
    # Devuelve::
    # 'true' si la lista está vacía. 'false' en otro caso
    def empty?
        @size == 0
    end

    # Muestra la lista desde la cabeza
    # Devuelve::
    # Cadena de texto con los elementos de la lista
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
    
    # Muestra la lista desde la cola
    # Devuelve::
    # Cadena de texto con los elementos de la lista en orden inverso
    def to_rs
        str = "["
        aux = @tail
        while aux != nil do
            str += aux.value.to_s
            aux = aux.prev
            if aux != nil
                str += ","
            end
        end
        str += "]"
        str
    end

    # Inserta un valor por la cabeza
    # Parámetro::
    # * valor: Valor a insertar
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

    # Inserta un valor por la cola
    # Parámetro::
    # * valor: Valor a insertar
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

    # Inserta un conjunto de elementos en la cabeza
    # Parámetro::
    # * arr: Array de elementos a insertar
    def insert_more (arr)
        arr.reverse_each  do |value|
            self.insert(value)
        end
    end

    # Extrae el elemento en la cabeza
    # Devuelve::
    # Valor extraído
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

    # Extrae el elemento en la cola de la lista
    # Devuelve::
    # Valor extraído
    def extract_tail ()
        aux = nil
        if @head == @tail
            aux = @head
            @head = nil
            @tail = nil
        else
            aux = @tail
            @tail = @tail.prev
            @tail.next = nil
            aux.prev = nil
        end
        aux.value
    end

    # Permite que la clase List sea enumerable, lo que nos deja utilizar métodos como max(), min(), reverse_each(), collect(), etc
    def each
        nodo = @head
        while nodo != nil
            yield nodo.value
            nodo = nodo.next
        end
    end
end
