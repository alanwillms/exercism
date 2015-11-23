class Squares
  def initialize(numbers)
    @numbers = numbers
  end

  def square_of_sums
    (0..@numbers).inject(:+) ** 2
  end

  def sum_of_squares
    (0..@numbers).map { |n| n ** 2 }.inject(:+)
  end

  def difference
    square_of_sums - sum_of_squares
  end
end
