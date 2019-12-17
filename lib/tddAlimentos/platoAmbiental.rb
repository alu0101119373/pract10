require 'markup'

# = platoAmbiental.rb
#
# Autor::   Himar Manuel Barquín Carrasco
# Web::     https://github.com/ULL-ESIT-LPP-1920/tdd-alu0101119373
#
# == Descripción
#
# Clase que hereda de la clase Plato, y que incorpora los atributos gei y terreno, que nos informan de los gases de efecto invernadero y el terreno en metros cuadrados que son necesarios para producir este plato
# == Métodos
# * to_s
# * calc_vct
# * nutritional_footprint
# * calc_gei
# * calc_terrain
# * <=>

class PlatoAmbiental < Plato

    attr_reader :gei, :terrain

    # Constructor de la clase PlatoAmbiental
    # Parámetros::
    # * name: Nombre del plato
    # * alimentos: Conjunto de alimentos que componen el plato
    # * gramos: Cantidades en gramos de cada alimento del plato
    def initialize (name, alimentos = [], gramos = [])
        super(name, alimentos, gramos)

        @gei = calc_gei
        @terrain = calc_terrain
    end

    # Imprime la información de la clase Plato y le añade la información del GEI y el terreno
    # Devuelve::
    # Cadena de texto con la información del plato de la clase Plato y la información del GEI y el terreno
    def to_s
        result = ""

        result += super.to_s
        result += "\nGEI: #{@gei.round(2)} kgCO2eq"
        result += "\nTerreno: #{@terrain.round(2)} m2 / año"
    end

    # Calcula la huella nutricional del plato
    # Devuelve::
    # Valor de la huella nutricional
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

    # Calcula el gas de efecto invernadero que se produce al crear el plato
    # Devuelve::
    # GEI del plato
    def calc_gei
        datos = @food.collect { |x| x.gei }
        gramos = @quantities.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...datos.size
            result += datos[i] * gramos[i]
        end
        result
    end

    # Calcula el terreno consumido por la producción del plato
    # Devuelve::
    # Valor del terreno
    def calc_terrain
        datos = @food.collect { |x| x.terrain }
        gramos = @quantities.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...datos.size
            result += datos[i] * gramos[i]
        end
        result
    end

    # Permite la comparación de dos 'platos ambientales' mediante la huella nutricional
    # Parámetros::
    # * another: objeto PlatoAmbiental que comparar con el objeto invocante
    # Devuelve::
    # 'true' si la comparación es verdadera. 'false' en otro caso
    def <=> (another)
        self.nutritional_footprint <=> another.nutritional_footprint
    end

end