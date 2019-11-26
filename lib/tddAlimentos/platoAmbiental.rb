class PlatoAmbiental < Plato

    attr_reader :gei, :terrain

    def initialize (name, alimentos = [], gramos = [])
        super(name, alimentos, gramos)

        @gei = calc_gei
        @terrain = calc_terrain
    end

    def calc_gei
        datos = @food.collect { |x| x.gei }
        gramos = @quantities.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...datos.size
            result += datos[i] * gramos[i]
        end
        result
    end

    def calc_terrain
        datos = @food.collect { |x| x.terrain }
        gramos = @quantities.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...datos.size
            result += datos[i] * gramos[i]
        end
        result
    end

end