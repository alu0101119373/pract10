class Plato
    attr_reader :name, :food, :quantities

    def initialize (name, alimentos = [], gramos = [])
        @name = name

        @food = List.new
        @food.insert_more(alimentos)

        @quantities = List.new
        @quantities.insert_more(gramos)
    end
end