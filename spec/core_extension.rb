require 'spec_helper'

describe Array do
  context "#all_empty?" do
    it "returns true if all element is empty" do
      expect(["", "", ""].all_empty?).to be_truthy
    end

    it "returns false if all element is not empty" do
      expect(["", 3, Object.new, :a].all_empty?).to be_falsey  
    end
  end

  context "#all_same" do
    it "returns true if all element is same" do
      expect(['Z', 'Z', 'Z'].all_same?).to be_truthy 
    end

    it "returns false if all element is not same" do
      expect([1, :name, "Arief"].all_same?).to be_falsey 
    end
  end
end
