# string_calculator.rb
class StringCalculator
  class << self

		def add(numbers)
			return 0 if numbers.empty?
			numbers.split(',').map(&:to_i).sum
		end
  end
end

