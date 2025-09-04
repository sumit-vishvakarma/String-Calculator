# string_calculator.rb
class StringCalculator
  class << self

		def add(numbers)
			return 0 if numbers.empty?

				if numbers.start_with?("//")
					delimiter, numbers = numbers.split("\n", 2)
					delimiter = delimiter[2..]
					numbers.split(delimiter).map(&:to_i).sum
				else
					numbers.split(/,|\n/).map(&:to_i).sum
				end
			end
		end
end

