class Plato
    attr_reader :name, :food, :quantities, :vct

    def initialize (name, alimentos = [], gramos = [])
        @name = name

        @food = List.new
        @food.insert_more(alimentos)

        @quantities = List.new
        @quantities.insert_more(gramos)

        @vct = calc_vct
    end

    def calc_vct
        alimentos = @food.collect { |x| x.energetic_value }
        gramos = @quantities.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...alimentos.size
            result += (gramos[i] * alimentos[i])
        end
        result
    end
end