class Queens
  attr_reader :black, :white

  def initialize(queens = {})
    @black = queens[:black] || [7, 3]
    @white = queens[:white] || [0, 3]

    raise ArgumentError.new('Queens cannot occupy same space') if @black == @white
  end

  def attack?
     same_row? || same_column? || same_diagonal?
  end

  def to_s
    8.times.map do |row|
      8.times.map do |column|
        if row == @black[0] && column == @black[1]
          'B'
        elsif row == @white[0] && column == @white[1]
          'W'
        else
          '_'
        end
      end.join(' ')
    end.join("\n")
  end

  private

  def same_row?
    @white[0] == @black[0]
  end

  def same_column?
    @white[1] == @black[1]
  end

  def same_diagonal?
    (@white[0] - @black[0]).abs == (@white[1] - @black[1]).abs
  end
end
