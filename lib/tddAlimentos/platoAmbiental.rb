class PlatoAmbiental < Plato

    attr_reader :gei, :terrain

    def initialize (name, alimentos = [], gramos = [])
        super(name, alimentos, gramos)

        @gei = calc_gei
        @terrain = calc_terrain
    end

    def to_s
        result = ""

        result += super.to_s
        result += "\nGEI: #{@gei.round(2)} kgCO2eq"
        result += "\nTerreno: #{@terrain.round(2)} m2 / año"
    end

    def nutritional_footprint
        kcal_impact = 0
        if @vct < 670
            kcal_impact = 1
        elsif @vct > 830
            kcal_impact = 3
        else
            kcal_impact = 2
        end

        gei_impact = 0
        if @gei < 800
            gei_impact = 1
        elsif @gei > 1200
            gei_impact = 3
        else
            gei_impact = 2
        end

        (kcal_impact + gei_impact) / 2.0
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