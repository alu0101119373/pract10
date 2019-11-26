class Plato
    attr_reader :name, :food

    def initialize (name, alimentos = [])
        @name = name

        @food = List.new
        @food.insert_more(alimentos)
    end
end