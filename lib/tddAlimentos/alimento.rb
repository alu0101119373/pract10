class Alimento
  
  attr_reader :name, :protein, :carbohydrates, :lipids

  def initialize (name, protein, carbohydrates, lipids)
    @name, @protein, @carbohydrates, @lipids = name, protein, carbohydrates, lipids
  end

end
