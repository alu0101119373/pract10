require 'markup'

# = alimento.rb
#
# Autor::   Himar Manuel Barquín Carrasco
# Web::     https://github.com/ULL-ESIT-LPP-1920/tdd-alu0101119373
#
# == Descripción
#
# Clase que representa un alimento, con la información de las proteínas, carbohidratos, lípidos, gases de efecto invernadero y metros cuadrados de tierra consumida que provoca producir el alimento.
# == Métodos
# * to_s
# * energetic_value
# * <=>
class Alimento
  
  include Comparable

  attr_reader :name, :protein, :carbohydrates, :lipids, :gei, :terrain

  # Constructor de la clase Alimento
  # Parámetros::
  # * name: Nombre del alimento
  # * protein: Proteínas del alimento
  # * carbohydrates: Carbohidratos del alimento
  # * lipids: Lípidos del alimento
  # * gei: Gases de Efecto Invernadero que se producen al producir el alimento
  # * terrain: Terreno que se usa para la producción del alimento
  def initialize (name, protein, carbohydrates, lipids, gei, terrain)
    @name, @protein, @carbohydrates, @lipids, @gei, @terrain = name, protein, carbohydrates, lipids, gei, terrain
  end

  # Imprime la información del alimento
  # Devuelve::
  # Cadena de texto con la información del alimento
  def to_s
    "Nombre: #{@name}\nProteínas (g): #{@protein}\nCarbohidratos (g): #{@carbohydrates}\nLípidos (g): #{@lipids}\nGEI (kgCO2eq): #{@gei}\nTerreno (m2 año): #{@terrain}\n"
  end

  # Calcula el valor energético del alimento
  # Devuelve::
  # Valor decimal con el valor energético
  def energetic_value
    4 * @protein + 4 * @carbohydrates + 9 * @lipids
  end

  # Nos permite comparar alimentos por su valor energético
  # Parámetros::
  # * another: Otro plato que se compara con el invocante
  # Devuelve::
  # 'true' si la comparación es verdadera. 'false' en otro caso
  def <=> (another)
    self.energetic_value <=> another.energetic_value
  end

end
