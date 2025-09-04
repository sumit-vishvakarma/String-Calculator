# string_calculator.rb
class StringCalculator
	@add_count = 0

  class << self
		def add(numbers)
			@add_count += 1
			return 0 if numbers.empty?
			  nums = extract_numbers(numbers)
				validate_no_negatives(nums)
				sum_ignoring_large(nums)
		end

		def get_called_count
			@add_count
		end

		private

		# Step 1: Split numbers based on delimiters
    def extract_numbers(numbers)
      if numbers.start_with?("//")
        parse_custom_delimiters(numbers)
      else
        split_with_default_delimiters(numbers)
      end
    end

		# Step 2: Handle default delimiters (comma or newline)
    def split_with_default_delimiters(numbers)
      numbers.split(/,|\n/).map(&:to_i)
    end

    # Step 3: Handle custom delimiters, including multi-char and multiple delimiters
    def parse_custom_delimiters(numbers)
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter_pattern = delimiter_line[2..-1]

      if delimiter_pattern.start_with?("[")
        delimiters = delimiter_pattern.scan(/\[(.*?)\]/).flatten
        regex = Regexp.union(delimiters)
        numbers.split(regex).map(&:to_i)
      else
        numbers.split(delimiter_pattern).map(&:to_i)
      end
    end

    # Step 4: Check for negatives
    def validate_no_negatives(nums)
      negatives = nums.select { |n| n < 0 }
      raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
    end

    # Step 5: Ignore numbers > 1000 when summing
    def sum_ignoring_large(nums)
      nums.reject { |n| n > 1000 }.sum
    end
	end	
end

