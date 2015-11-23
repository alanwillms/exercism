class Prime
  def self.nth(nth)
    raise ArgumentError.new('nth must be a positive number') unless nth > 0
    number = 1
    nth.times do
      number = number.next_prime
    end
    number
  end
end

class Integer
  def next_prime
    return 2 if self < 2
    step = self.even? ? 1 : 2
    number = self + step
    number.prime? ? number : number.next_prime
  end

  def prime?
    return true if (2..3).cover? self
    return false if self <= 1 || self % 2 == 0 || self % 3 == 0
    i = 5
    while i ** 2 <= self do
      return false if self % i == 0 || self % (i + 2) == 0
      i += 6
    end
    true
  end
end
