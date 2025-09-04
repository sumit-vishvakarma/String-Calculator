# spec/string_calculator_spec.rb
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    context "given empty string" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

		context "given '1' " do
			it "returns 1" do
				expect(StringCalculator.add("1")).to eq(1) 
			end 
		end

		context "given '1,5' " do
			it "returns 6" do
				expect(StringCalculator.add("1,5")).to eq(6) 
			end 
		end
  end
end