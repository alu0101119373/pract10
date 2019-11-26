class Plato
    attr_reader :name, :food, :quantities, :vct, :percentage_proteins, :percentage_lipids

    def initialize (name, alimentos = [], gramos = [])
        @name = name

        @food = List.new
        @food.insert_more(alimentos)

        @quantities = List.new
        @quantities.insert_more(gramos)

        @vct = calc_vct

        # Calculamos los porcentajes
        @percentage_proteins = calc_perc_proteins
        @percentage_lipids = calc_perc_lipids
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

    def calc_perc_proteins
        alimentos = @food.collect { |x| x.protein }
        gramos = @quantities.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...alimentos.size
            result += (gramos[i] * alimentos[i]) * 4
        end
        result /= @vct
    end

    def calc_perc_lipids
        alimentos = @food.collect { |x| x.lipids }
        gramos = @quantities.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...alimentos.size
            result += (gramos[i] * alimentos[i]) * 9
        end
        result /= @vct
    end
end