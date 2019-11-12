RSpec.describe TddAlimentos do

  before (:all) do
    @cowMeat = Alimento.new;
    @lambMeat = Alimento.new;
    @chocolate = Alimento.new;
    @cheese = Alimento.new;
  end

  it "has a version number" do
    expect(TddAlimentos::VERSION).not_to be nil
  end

end
