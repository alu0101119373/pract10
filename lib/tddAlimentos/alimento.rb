class Alimento
  
  attr_reader :name, :protein, :carbohydrates, :lipids, :gei, :terrain

  def initialize (name, protein, carbohydrates, lipids, gei, terrain)
    @name, @protein, @carbohydrates, @lipids, @gei, @terrain = name, protein, carbohydrates, lipids, gei, terrain
  end

end
