# string_calculator.rb
class StringCalculator
  class << self

		def add(numbers)
			return 0 if numbers.empty?

      nums =
        if numbers.start_with?("//")
          delimiter, numbers = numbers.split("\n", 2)
          delimiter = delimiter[2..-1]

					if delimiter.start_with?("[")
						delimiters = delimiter.scan(/\[(.*?)\]/).flatten
            regex = Regexp.union(delimiters)
            numbers.split(regex).map(&:to_i)
					else
						numbers.split(delimiter).map(&:to_i)
					end

        else
          numbers.split(/,|\n/).map(&:to_i)
        end

      check_negatives(nums)
      nums.reject{|n| n > 1000}.sum
		end
		private

    def check_negatives(nums)
      negatives = nums.select { |n| n < 0 }
      raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
    end
	end	
end

