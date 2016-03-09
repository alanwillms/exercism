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

  def saddle_points
    @saddle_points ||= find_saddle_points
  end

  private

  def find_saddle_points
    saddle_points = []
    rows.each_with_index do |row, row_index|
      row.each_with_index do |number, column_index|
        has_greater_in_same_row = row.any? { |other| other > number }
        has_lower_in_same_column = rows.map { |row| row[column_index] }.any? { |other| other < number }

        unless has_greater_in_same_row || has_lower_in_same_column
          saddle_points << [row_index, column_index]
        end
      end
    end
    saddle_points
  end
end
