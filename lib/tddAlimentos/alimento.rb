class Alimento
  
  attr_reader :name, :protein, :carbohydrates, :lipids, :gei

  def initialize (name, protein, carbohydrates, lipids, gei)
    @name, @protein, @carbohydrates, @lipids, @gei = name, protein, carbohydrates, lipids, gei
  end

end
