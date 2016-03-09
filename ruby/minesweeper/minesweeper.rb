class Board
  def initialize(from)
    @from = from
    raise ValueError.new unless valid?
  end

  def transform
    board = @from.map(&:chars)
    board.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        next unless cell == ' '
        nearby_bombs = count_bombs_around(row_index, column_index)
        board[row_index][column_index] = "#{nearby_bombs}" if nearby_bombs > 0
      end
    end
    board.map(&:join)
  end

  def self.transform(from)
    new(from).transform
  end

  private

  def count_bombs_around(row_index, column_index)
    board = @from.map(&:chars)
    bombs = 0

    (row_index-1..row_index+1).each do |row|
      (column_index-1..column_index+1).each do |column|
        bombs += 1 if board[row][column] == '*'
      end
    end

    bombs
  end

  def valid?
    rows_have_same_length? && borders_are_correct? && only_has_valid_characters?
  end

  def rows_have_same_length?
    @from.map(&:size).uniq.size == 1
  end

  def borders_are_correct?
    rows = @from.map(&:chars)

    return false unless valid_horizontal_border?(rows.shift)
    return false unless valid_horizontal_border?(rows.pop)

    rows.each { |row| return false unless valid_vertical_border?(row) }

    true
  end

  def valid_horizontal_border?(row)
    '+' == row.pop && '+' == row.shift && '-' == row.uniq.join
  end

  def valid_vertical_border?(row)
    row.shift == '|' && row.pop == '|'
  end

  def only_has_valid_characters?
    not @from
      .flatten
      .join
      .match /[^\+\|\-\*\s]/
  end
end

class ValueError < ArgumentError
end
