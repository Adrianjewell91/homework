require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "adrian", :titleize => "Chef adrian the Great Baker") }

  subject(:brownie) { Dessert.new("brownie", 100, chef) } #don't pass the symbol, pass chef

  describe "#initialize" do

    it "sets a type" do
      expect(brownie.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('brownie','bling',:chef)}.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient('sugar')
      expect(brownie.ingredients).to eq(['sugar'])
    end

  end

  describe "#mix!" do
    before(:each) do
      brownie.add_ingredient('sugar')
      brownie.add_ingredient('flour')
      brownie.add_ingredient('eggs')
      brownie.add_ingredient('people')
      brownie.add_ingredient('love')
      brownie.mix!
    end

    it "shuffles the ingredient array" do
#test is the array if shuffled.
      expect(brownie.ingredients.length).to eq(5)
      expect(brownie.ingredients).not_to eq(brownie.ingredients.sort)
    end

  end

  describe "#eat" do
    before(:each) do
      brownie.eat(50)
    end

    it "subtracts an amount from the quantity" do
      expect(brownie.quantity).to eq(50)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(51) }.to raise_error("not enough left!")
    end

  end

  describe "#serve" do

    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef adrian the Great Baker")
      expect(brownie.serve).to eq("Chef adrian the Great Baker has made 100 brownies!")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end

  end
end
