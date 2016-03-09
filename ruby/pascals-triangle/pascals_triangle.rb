class Triangle
  def initialize(rows_amount)
    @rows_amount = rows_amount
  end

  def rows
    @rows ||= build_rows
  end

  private

  def build_rows
    rows = []
    @rows_amount.times do |row|
      current_row = (row + 1).times.map do |column|
        if row == 0
          1
        else
          previous_row = rows[row - 1]
          first_value = column > 0 ? previous_row[column - 1] : 0
          second_value = previous_row[column].to_i

          first_value + second_value
        end
      end
      rows.push current_row.to_a
    end
    rows
  end
end
