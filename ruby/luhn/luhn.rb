class Luhn
  def initialize(number)
    @digits = number.to_s.chars.map &:to_i
  end

  def addends
    @addends ||= @digits.reverse.each_with_index.map do |digit, index|
      if index.odd?
        digit *= 2
        digit -= 9 if digit >= 10
      end
      digit
    end.reverse
  end

  def checksum
    @checksum ||= addends.reduce(&:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    check_digit = Luhn.new(number * 10).checksum % 10
    check_digit = 10 - check_digit unless check_digit == 0
    "#{number}#{check_digit}".to_i
  end
end
