class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(last_number)
    return 0 if last_number <= 0
    numbers = 1..last_number
    multiples = []
    numbers.each do |number|
      if !has_multiple_in?(number, numbers) && is_multiple_of?(number, @factors)
        multiples << number
      end
    end
    if multiples.size > 0
      multiples.reduce(&:+)
    else
      0
    end
  end

  def has_multiple_in?(number, range)
    range.each do |match|
      if match > number && match % number == 0
        return true
      end
    end
    false
  end

  def is_multiple_of?(number, range)
    range.each do |match|
      return true if number == match
      return true if number > match && number % match == 0
    end
    false
  end

  def self.to(number)
    self.new(3, 5).to(number)
  end
end

# 10
#
# 0
# 1
# 2
# 3
#
#
# 6
# 8
# 9
# = 23
