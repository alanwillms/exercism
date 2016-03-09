class Triangle
  def initialize(a, b, c)
    @a, @b, @c = a, b, c
    raise TriangleError.new unless valid?
  end

  def kind
    if sides.uniq.size == 1
      :equilateral
    elsif sides.uniq.size == 3
      :scalene
    else
      :isosceles
    end
  end

  private

  def valid?
    sides.all? { |side| side > 0 } &&
      @a + @b > @c &&
      @a + @c > @b &&
      @b + @c > @a
  end

  def sides
    [@a, @b, @c]
  end
end

class TriangleError < StandardError
end
