require 'markup'

# = plato.rb
#
# Autor::   Himar Manuel Barquín Carrasco
# Web::     https://github.com/ULL-ESIT-LPP-1920/tdd-alu0101119373
#
# == Descripción
#
# Clase que contiene una lista de alimentos, con sus cantidades. Además, nos informa del porcentaje de proteínas, lípidos y carbohidratos en proporción a las kilocalorías totales del plato.
# == Métodos
# * to_s
# * calc_vct
# * calc_perc_proteins
# * calc_perc_lipids
# * calc_perc_carbohydrates
# * <=>
class Plato

    include Comparable

    attr_reader :name, :food, :quantities, :vct, :percentage_proteins, :percentage_lipids, :percentage_carbohydrates

    # Constructor de la clase Plato
    # Parámetros::
    # * name: Nombre del plato
    # * alimentos: Conjunto de alimentos que componen el plato
    # * gramos: Cantidades en gramos de cada alimento del plato
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
        @percentage_carbohydrates = calc_perc_carbohydrates
    end

    # Método para imprimir la información del plato
    # Devuelve::
    # Cadena de texto con la información del plato
    def to_s
        alimentos = @food.collect { |x| x.name }
        gramos = @quantities.collect { |x| x }
        result = ""

        result += "Nombre del plato: #{@name}.\nIngredientes:\n"
        for i in 0...alimentos.size
            result += "- #{alimentos[i]} (#{gramos[i]} gr)\n"
        end
        result += "Kilocalorias totales: #{self.vct} kcal"
    end

    # Calcula el Valor Calórico Total del plato
    # Devuelve::
    # Valor Calórico Total del plato
    def calc_vct
        alimentos = @food.collect { |x| x.energetic_value }
        gramos = @quantities.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...alimentos.size
            result += (gramos[i] * alimentos[i])
        end
        result
    end

    # Calcula el porcetaje de proteínas del plato
    # Devuelve::
    # Porcentaje de proteínas
    def calc_perc_proteins
        alimentos = @food.collect { |x| x.protein }
        gramos = @quantities.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...alimentos.size
            result += (gramos[i] * alimentos[i]) * 4
        end
        result /= @vct
    end

    # Calcula el porcentaje de lípidos del plato
    # Devuelve::
    # Porcentaje de lípidos
    def calc_perc_lipids
        alimentos = @food.collect { |x| x.lipids }
        gramos = @quantities.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...alimentos.size
            result += (gramos[i] * alimentos[i]) * 9
        end
        result /= @vct
    end

    # Calcula el porcentaje de carbohidratos del plato
    # Devuelve::
    # Porcentaje de carbohidratos
    def calc_perc_carbohydrates
        alimentos = @food.collect { |x| x.carbohydrates }
        gramos = @quantities.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...alimentos.size
            result += (gramos[i] * alimentos[i]) * 4
        end
        result /= @vct
    end

    # Nos permite comparar platos por su Valor Calórico Total
    # Parámetros::
    # * another: Otro plato que se compara con el invocante
    # Devuelve::
    # 'true' si la comparación es verdadera. 'false' en otro caso
    def <=> (another)
        self.vct <=> another.vct
    end
end