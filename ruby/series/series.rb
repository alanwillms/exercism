class Series
  def initialize(sequence)
    @numbers = sequence.split('').map(&:to_i)
  end

  def slices(size)
    raise ArgumentError.new('Slices size must not be greater than the sequence size') if size > @numbers.size
    raise ArgumentError.new('Slices size must not be greater than zero') if size <= 0

    (@numbers.size - size + 1).times.map { |start| @numbers[start, size] }
  end
end
