class OCR
  NUMBER_WIDTH = 3
  NUMBER_HEIGHT = 3

  def initialize(input)
    @input = input
  end

  def convert
    rows.map do |row|
      row.each_slice(NUMBER_WIDTH).map do |columns|
        detect_number *columns
      end.join
    end.join(',')
  end

  private

  def rows
    @rows ||= @input
      .split("\n")
      .each_slice(NUMBER_HEIGHT + 1)
      .map do |lines|
        lines
          .map { |row| row.ljust(greatest_row_width, ' ').chars }
          .transpose
          .map { |column_chars| column_chars.join[0, 3] }
      end
  end

  def greatest_row_width
    @greatest_row_width ||= [@input.split("\n").max_by(&:size).size, 3].max
  end

  def detect_number(first, second, third)
    return '0' if first == ' ||' && second == '_ _' && third == ' ||'
    return '1' if first == '   ' && second == '   ' && third == ' ||'
    return '2' if first == '  |' && second == '___' && third == ' | '
    return '3' if first == '   ' && second == '___' && third == ' ||'
    return '4' if first == ' | ' && second == ' _ ' && third == ' ||'
    return '5' if first == ' | ' && second == '___' && third == '  |'
    return '6' if first == ' ||' && second == '___' && third == '  |'
    return '8' if first == ' ||' && second == '___' && third == ' ||'
    return '9' if first == ' | ' && second == '___' && third == ' ||'
    return '7' if first == '   ' && second == '_  ' && third == ' ||'
    '?'
  end
end
