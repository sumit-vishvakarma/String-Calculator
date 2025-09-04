# string_calculator.rb
class StringCalculator
  class << self

		def add(numbers)
			return 0 if numbers.empty?

      nums =
        if numbers.start_with?("//")
          delimiter, numbers = numbers.split("\n", 2)
          delimiter = delimiter[2..-1]
          numbers.split(delimiter).map(&:to_i)
        else
          numbers.split(/,|\n/).map(&:to_i)
        end

      check_negatives(nums)
      nums.sum
		end
		private

    def check_negatives(nums)
     # implemented soon..
		end
	end	
end

