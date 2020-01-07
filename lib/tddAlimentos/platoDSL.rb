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