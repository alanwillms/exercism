class Trinary
  def initialize(trinary)
    @trinary = trinary.match(/[^012]/) ? '0' : trinary
  end

  def to_decimal
    @trinary.reverse.chars.each_with_index.map do |char, exponent|
      char.to_i * 3 ** exponent
    end.reduce(&:+)
  end
end
