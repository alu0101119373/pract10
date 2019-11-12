RSpec.describe TddAlimentos do

  before (:all) do
    @cowMeat = Alimento.new("Carne de Vaca");
    @lambMeat = Alimento.new("Carne de Cordero");
    @chocolate = Alimento.new("Chocolate");
    @cheese = Alimento.new("Queso");
  end

  it "has a version number" do
    expect(TddAlimentos::VERSION).not_to be nil
  end

  context "probando los atributos de la clase Alimento" do
    it "existe un nombre para el alimento" do
      expect(@cowMeat.name).to eq("Carne de Vaca")
      expect(@lambMeat.name).to eq("Carne de Cordero")
      expect(@chocolate.name).to eq("Chocolate")
      expect(@cheese.name).to eq("Queso")
    end
  end

end
