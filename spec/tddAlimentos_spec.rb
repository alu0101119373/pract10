RSpec.describe TddAlimentos do

  before (:all) do
    @cowMeat = Alimento.new("Carne de Vaca", 21.1);
    @lambMeat = Alimento.new("Carne de Cordero", 18.0);
    @chocolate = Alimento.new("Chocolate", 5.3);
    @cheese = Alimento.new("Queso", 25.0);
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

    it "existen las proteínas para el alimento" do
      expect(@cowMeat.protein).to eq(21.1)
      expect(@lambMeat.protein).to eq(18.0)
      expect(@chocolate.protein).to eq(5.3)
      expect(@cheese.protein).to eq(25.0)
    end
  end

end
