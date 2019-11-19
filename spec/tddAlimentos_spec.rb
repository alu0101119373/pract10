RSpec.describe TddAlimentos do

  before (:all) do
    @cowMeat = Alimento.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
    @lambMeat = Alimento.new("Carne de Cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
    @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
    @cheese = Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
    @lentils = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
    @milk = Alimento.new("Leche de Vaca", 3.3, 4.8, 3.2, 3.2, 8.9)

    # Datos para las pruebas con Node y List
    @head = Node.new(1, nil, nil)
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
    
    it "existen los carbohidratos para el alimento" do
      expect(@cowMeat.carbohydrates).to eq(0.0)
      expect(@lambMeat.carbohydrates).to eq(0.0)
      expect(@chocolate.carbohydrates).to eq(47.0)
      expect(@cheese.carbohydrates).to eq(1.3)
    end
  
    it "existen los lípidos para el alimento" do
      expect(@cowMeat.lipids).to eq(3.1)
      expect(@lambMeat.lipids).to eq(17.0)
      expect(@chocolate.lipids).to eq(30.0)
      expect(@cheese.lipids).to eq(33.0)
    end

    it "existe el GEI para los alimentos" do
      expect(@cowMeat.gei).to eq(50.0)
      expect(@lambMeat.gei).to eq(20.0)
      expect(@chocolate.gei).to eq(2.3)
      expect(@cheese.gei).to eq(11.0)
    end

    it "existe el uso de terreno por año para los alimentos" do
      expect(@cowMeat.terrain).to eq(164.0)
      expect(@lambMeat.terrain).to eq(185.0)
      expect(@chocolate.terrain).to eq(3.4)
      expect(@cheese.terrain).to eq(41.0)
    end
  end

  context "probando métodos adicionales" do
    it "se puede obtener el alimento formateado" do
      expect(@cowMeat.to_s).to eq("Nombre: Carne de Vaca\nProteínas (g): 21.1\nCarbohidratos (g): 0.0\nLípidos (g): 3.1\nGEI (kgCO2eq): 50.0\nTerreno (m2 año): 164.0\n")
      expect(@lambMeat.to_s).to eq("Nombre: Carne de Cordero\nProteínas (g): 18.0\nCarbohidratos (g): 0.0\nLípidos (g): 17.0\nGEI (kgCO2eq): 20.0\nTerreno (m2 año): 185.0\n")
      expect(@chocolate.to_s).to eq("Nombre: Chocolate\nProteínas (g): 5.3\nCarbohidratos (g): 47.0\nLípidos (g): 30.0\nGEI (kgCO2eq): 2.3\nTerreno (m2 año): 3.4\n")
      expect(@cheese.to_s).to eq("Nombre: Queso\nProteínas (g): 25.0\nCarbohidratos (g): 1.3\nLípidos (g): 33.0\nGEI (kgCO2eq): 11.0\nTerreno (m2 año): 41.0\n")
    end

    it "se puede obtener el valor calórico del alimento" do    
      expect(@cowMeat.energetic_value.round(2)).to eq(112.3)
      expect(@lambMeat.energetic_value.round(2)).to eq(225.0)
      expect(@chocolate.energetic_value.round(2)).to eq(479.2)
      expect(@cheese.energetic_value.round(2)).to eq(402.2)
    end

    it "se puede obtener el impacto ambiental diario de un hombre de 20-39 años" do
      expect((5.09 * @chocolate.gei + @lentils.gei + 1.06 * @milk.gei).round(2)).to eq(15.5)
      expect((5.09 * @chocolate.terrain + @lentils.terrain + 1.06 * @milk.terrain).round(2)).to eq(30.14)
    end

    it "se puede obtener el impacto ambiental diario de una mujer de 20-39 años" do
      expect((4 * @chocolate.gei + 6 * @milk.gei).round(2)).to eq(28.4)
      expect((4 * @chocolate.terrain + 6 * @milk.terrain).round(2)).to eq(67.0)
    end
  end

  context "probando la estructura Node y la clase List" do
    it "debe existir un nodo de la lista con sus datos, su siguiente y su previo" do
      expect(@head.value).to eq(1)
      expect(@head.next).to eq(nil)
      expect(@head.next).to eq(nil)
    end
  
  end

end
