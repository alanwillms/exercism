class Binary
  VERSION = 1

  def initialize(sequence)
    @sequence = sequence
    raise ArgumentError.new "Invalid binary sequence: #{sequence}" if sequence.match(/[^01]/)
  end

  def to_decimal
    @sequence
      .chars
      .reverse
      .each_with_index
      .map { |bit, power| (2 ** power) if bit == '1' }
      .compact
      .reduce(&:+)
      .to_i
  end
end
