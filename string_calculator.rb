# string_calculator.rb
class StringCalculator
  class << self
		def add(numbers)
			return 0 if numbers.empty?
			return numbers.to_i
		end
  end
end