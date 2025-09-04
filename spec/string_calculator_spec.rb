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

		context "given '1,5,3,1' " do
			it "returns 10" do
				expect(StringCalculator.add("1,5,3,1")).to eq(10) 
			end 
		end

		context "given '1\n2,3' " do
			it "returns 6" do
				expect(StringCalculator.add("1\n2,3")).to eq(6) 
			end 
		end

		context "given '//;\n1;2'" do
			it "returns 3 using custom delimiter" do
				expect(StringCalculator.add("//;\n1;2")).to eq(3)
			end
		end

		context "when string contains negative numbers" do
			it "raises with all negatives" do
				expect { StringCalculator.add("1,-2,-3") }
					.to raise_error(RuntimeError, "negatives not allowed: -2, -3")
			end
		end

		context "ignores numbers greater than 1000" do
			it { expect(StringCalculator.add("2,1001")).to eq(2) }
			it { expect(StringCalculator.add("1002,2")).to eq(2) }
		end

		context "given '//[*]\n1**2**3'" do
			it "returns 6" do
				expect(StringCalculator.add("//[*]\n1**2**3")).to eq(6)
			end
		end

		context "given '//[*][%]\n1**2**3'" do
			it "returns 6" do
				expect(StringCalculator.add("//[*][%]\n1**2**3")).to eq(6)
			end
		end

		context ".GetCalledCount" do
      it "returns the number of times Add was invoked" do
        StringCalculator.instance_variable_set(:@add_count, 0)
        StringCalculator.add("1")
        StringCalculator.add("2,3")
        expect(StringCalculator.get_called_count).to eq(2)
      end
    end
  end
end