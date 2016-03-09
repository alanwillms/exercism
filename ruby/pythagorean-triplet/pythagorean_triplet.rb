class Triplet
  def initialize(a, b, c)
    @a, @b, @c = a, b, c
  end

  def sum
    @a + @b + @c
  end

  def product
    @a * @b * @c
  end

  def pythagorean?
    @a ** 2 + @b ** 2 == @c ** 2
  end

  def self.where(min_factor: 1, max_factor: 10, sum: nil)
    min_factor.upto(max_factor).to_a.combination(3).map do |a, b, c|
      triplet = new(a, b, c)
      next unless triplet.pythagorean?
      next unless sum.nil? || triplet.sum == sum
      triplet
    end.compact
  end
end
