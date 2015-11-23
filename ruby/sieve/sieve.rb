class Sieve
  def initialize(number)
    @range = (2..number)
  end

  def primes
    numbers = @range.to_a
    numbers.each_with_index do |current_number, index|
      numbers[index+1..-1].each do |possible_prime|
        numbers.delete possible_prime if possible_prime % current_number == 0
      end
    end
  end
end
