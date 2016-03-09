class Series
  VERSION = 1

  def initialize(series)
    raise ArgumentError.new('Series can only contain numbers') if series =~ /\D/
    @series = series.split('')
  end

  def largest_product(size)
    raise ArgumentError.new('Size must be between 0 and series length.') unless (0..@series.size).include? size
    return 1 if size == 0
    0
      .upto(@series.size - size)
      .map { |from| @series[from, size].map(&:to_i).reduce(:*) }
      .sort
      .last
  end
end
