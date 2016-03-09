class Palindromes
  attr_reader :largest, :smallest

  def initialize(options)
    @max_factor = options[:max_factor] || 99
    @min_factor = options[:min_factor] || 1
  end

  def generate
    palindromes = {}
    @min_factor.upto(@max_factor) do |factor_1|
      @min_factor.upto(@max_factor) do |factor_2|
        number = factor_1 * factor_2
        next unless palindrome?(number)
        unless palindromes[number]
          palindromes[number] = Palindrome.new(number)
          @smallest = palindromes[number] if @smallest.nil? || @smallest.value > number
          @largest = palindromes[number] if @largest.nil? || @largest.value < number
        end
        palindromes[number].add_factors factor_1, factor_2
      end
    end
  end

  private

  def palindrome?(number)
    original = number
    reversed = 0
    while number != 0
      reversed = reversed * 10 + number % 10;
      number /= 10
    end
    reversed == original
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(value)
    @value = value
    @factors = []
  end

  def add_factors(factor_1, factor_2)
    invalid_value = value != factor_1 * factor_2
    has_factors = @factors.include? [factor_2, factor_1]

    unless has_factors || invalid_value
      @factors << [factor_1, factor_2]
    end
  end
end
