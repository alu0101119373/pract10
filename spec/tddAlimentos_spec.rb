RSpec.describe TddAlimentos do

  before (:all) do
    @cowMeat = Alimento.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
    @lambMeat = Alimento.new("Carne de Cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
    @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
    @cheese = Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
    @eggs = Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
    @lentils = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
    @milk = Alimento.new("Leche de Vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
    @beer = Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
  end

  before (:each) do
    # Datos para las pruebas con Node y List
    @head = Node.new(1, nil, nil)
    @tail = Node.new(4, nil, nil)
    @list = List.new
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
  
    it "debe existir una lista con su cabeza y su cola" do
      expect(@list.head).to eq(nil)
    end

    it "se puede obtener el tamaño de la lista" do
      expect(@list.size).to eq(0)
    end

    it "se puede comprobar si la lista esta vacia" do
      expect(@list.empty?).to eq(true)
    end

    it "se puede imprimir la lista" do
      expect(@list.to_s).to eq("[]")
    end

    it "se puede insertar un elemento en la lista" do
      @list.insert(1)
      @list.insert(3)
      expect(@list.head.value).to eq(3)
      expect(@list.tail.value).to eq(1)
    end

    it "se puede insertar un elemento al final de la lista" do
      @list.insert_tail(7)
      expect(@list.tail.value).to eq(7)
    end

    it "se pueden insertar varios elementos en la lista" do
      @list.insert_more([3,4,5])
      expect(@list.to_s).to eq("[3,4,5]")
    end

    it "se puede extraer el primer elemento de la lista" do
      @list.insert_more([2,3,5,7,11])
      value = @list.extract()
      expect(value).to eq(2)
      expect(@list.to_s).to eq("[3,5,7,11]")
    end

    it "se puede extraer el ultimo elemento de la lista" do
      @list.insert_more([3,5,6,8,9,1])
      value = @list.extract_tail()
      expect(value).to eq(1)
      expect(@list.to_s).to eq("[3,5,6,8,9]")
    end
    
    it "se puede imprimir la lista al reves" do
      @list.insert_more([1,2,3,4,5])
      expect(@list.to_rs).to eq("[5,4,3,2,1]")
    end
  end

  context "probando la lista con determinadas dietas de alimentos" do
    it "calcula correctamente el impacto ambiental de la dieta española" do
      @list.insert_more([@cowMeat, @chocolate, @lentils, @eggs, @beer, @beer, @beer, @milk, @milk, @milk])
      
      # Recorremos la lista para calcular el impacto ambiental
      terrain = 0
      gei = 0
      aux = @list.head
      while aux != nil do
        terrain += aux.value.terrain
        gei += aux.value.gei

        # Avanzamos en la lista
        aux = aux.next
      end

      expect(terrain.round(2)).to eq(203.86)
      expect(gei.round(2)).to eq(67.22)
    end

    it "calcula correctamente el impacto ambiental de la dieta vasca" do
      @list.insert_more([@chocolate, @chocolate, @lentils, @lentils, @lentils])
      
      # Recorremos la lista para calcular el impacto ambiental
      terrain = 0
      gei = 0
      aux = @list.head
      while aux != nil do
        terrain += aux.value.terrain
        gei += aux.value.gei

        # Avanzamos en la lista
        aux = aux.next
      end

      expect(terrain.round(2)).to eq(17.0)
      expect(gei.round(2)).to eq(5.8)
    end
  end

end
