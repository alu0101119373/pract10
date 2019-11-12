class Alimento
  
  attr_reader :name, :protein, :carbohydrates

  def initialize (name, protein, carbohydrates)
    @name, @protein, @carbohydrates = name, protein, carbohydrates
  end

end
