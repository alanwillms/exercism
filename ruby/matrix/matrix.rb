class Matrix
  def initialize(string)
    @string = string
  end

  def rows
    @rows ||= @string.split("\n").map { |row| row.split(' ').map(&:to_i) }
  end

  def columns
    @coluns ||= rows.transpose
  end
end
