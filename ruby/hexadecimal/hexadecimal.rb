class Hexadecimal
  def initialize(number)
    @number = number.match(/[^0-9a-fA-F]/) ? '0' : number.downcase
  end

  def to_decimal
    @number.reverse.chars.each_with_index.map do |char, exponent|
      char_to_decimal(char) * 16 ** exponent
    end.reduce(&:+)
  end

  private

  def char_to_decimal(char)
    return char.ord - 'a'.ord + 10 if char =~ /[a-z]/
    char.to_i
  end
end
