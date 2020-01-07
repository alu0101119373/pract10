require 'pry'
require "./lib/tddAlimentos/alimento.rb"

class PlatoDSL

    attr_accessor :name, :description, :food, :gr, :vct, :gei, :terrain

    def initialize (name, &block)
    
        @name = name
        @description = ""
        @food = []
        @gr = []

        if block_given?
            if block.arity == 1
                yield self
            else
                instance_eval(&block)
            end
        end

        @vct = calc_vct
        @gei = calc_gei
        @terrain = calc_terrain

    end

    def descripcion (description)
        @description = description
    end

    def alimento (options = {})
        @food << options[:valor]
        @gr << options[:gramos]
    end

    def to_s
        str = ""

        str += @name + "\n"
        str += @description + "\n"
        str += "Ingredientes: "
        @food.each_with_index do |ingredient,index|
            str += "#{ingredient.name} (#{@gr[index]} gr.)"
            if index < (@food.size - 1)
                str += ", "
            end
        end
        str += "\nValor calorico total: " + @vct.to_s + " kcal.\n"
        str += "Uso de terreno: " + @terrain.to_s + "\n"
        str += "GEI: " + @gei.to_s
    end

    # Calcula el Valor Calórico Total del plato
    # Devuelve::
    # Valor Calórico Total del plato
    def calc_vct
        alimentos = @food.collect { |x| x.energetic_value }
        gramos = @gr.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...alimentos.size
            result += (gramos[i] * alimentos[i])
        end
        result.round(2)
    end

    # Calcula el gas de efecto invernadero que se produce al crear el plato
    # Devuelve::
    # GEI del plato
    def calc_gei
        datos = @food.collect { |x| x.gei }
        gramos = @gr.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...datos.size
            result += datos[i] * gramos[i]
        end
        result.round(2)
    end

    # Calcula el terreno consumido por la producción del plato
    # Devuelve::
    # Valor del terreno
    def calc_terrain
        datos = @food.collect { |x| x.terrain }
        gramos = @gr.collect { |x| x/100.0 }
        result = 0.0

        for i in 0...datos.size
            result += datos[i] * gramos[i]
        end
        result
    end

end

# cowMeat = Alimento.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
# lambMeat = Alimento.new("Carne de Cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
# chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
# cheese = Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
# eggs = Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
# lentils = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
# milk = Alimento.new("Leche de Vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
# beer = Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
# tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
# camarons = Alimento.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
# chicken = Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
# nut = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
# coffee = Alimento.new("Cafe", 0.1, 0.0, 0.0, 0.4, 0.3)

# hamburguesa = PlatoDSL.new("Hamburguesa") do
#     descripcion   "Hamburguesa especial de la casa"
#     alimento      :datos  =>  cowMeat,
#                   :gramos =>  100
#     alimento      :datos  =>  cheese,
#                   :gramos =>  100
#     alimento      :datos  =>  eggs,
#                   :gramos =>  20
#   end