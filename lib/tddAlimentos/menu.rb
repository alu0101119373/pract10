class Menu

    attr_accessor :name, :description, :plates, :prices

    def initialize (name, &block)
        
        @name = name
        @description = ""
        @plates = []
        @prices = []

        if block_given?
            if block.arity == 1
                yield self
            else
                instance_eval(&block)
            end
        end

        @vct = (@plates.collect{ |plate| plate.vct }).sum.round(2)
        @gei = (@plates.collect{ |plate| plate.gei }).sum.round(2)
        @terrain = (@plates.collect{ |plate| plate.terrain }).sum.round(2)
        @price = @prices.sum
        
    end

    def descripcion (description)
        @description = description
    end

    def plato (options = {})
        @plates << options[:valor]
        @prices << options[:precio]
    end

    def to_s
        str = ""

        str += @name + "\n"
        str += @description + "\n\n"

        @plates.each_with_index do |plate, index|
            str += (index + 1).to_s + ". " + plate.to_s + "\nPrecio: #{@prices[index]} €\n\n"
        end

        str += "Valor calorico total del menu: #{@vct} kcal\n"
        str += "GEI del menu: #{@gei}\n"
        str += "Uso de terreno del menu: #{@terrain}\n"
        str += "Precio total del menu: #{@price} €"
    end
end