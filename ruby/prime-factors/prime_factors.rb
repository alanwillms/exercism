require 'prime'

class PrimeFactors
  def self.for(number)
    prime_generator = Prime::Generator23.new
    factors = []
    if number > 1
      prime = prime_generator.next
      while number > 1 do
        if number % prime == 0
          factors << prime
          number = number / prime
        else
          prime = prime_generator.next
        end
      end
    end
    factors
  end
end
