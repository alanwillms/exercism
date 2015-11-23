class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(number)
    (1...number).select { |number| multiple? number }.reduce(0, :+)
  end

  def self.to(number)
    new(3, 5).to(number)
  end

  private

  def multiple?(number)
    @factors.any? { |factor| number % factor == 0 }
  end
end
