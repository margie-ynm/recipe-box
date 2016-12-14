
require('spec_helper')

describe(Recipe) do
  describe("the milk") do
    it("check if it works") do
      recipe = Recipe.create({:name => "milk", :ingredients => "blueberries", :instructions => "put blueberries in milk. Drink it."})
      expect(Recipe.all).to eq([recipe])
    end
  end
end
