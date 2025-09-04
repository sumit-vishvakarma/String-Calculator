# spec/string_calculator_spec.rb
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    context "given empty string" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end
  end
end