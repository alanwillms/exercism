class Fixnum
  def to_roman
    if self < 1 || self > 3000
      return ''
    end

    digits = self.to_s.chars.map(&:to_i)
    [
      digit_to_roman(digits.pop, 'I', 'V', 'X'),
      digit_to_roman(digits.pop, 'X', 'L', 'C'),
      digit_to_roman(digits.pop, 'C', 'D', 'M'),
      digit_to_roman(digits.pop, 'M', '', '')
    ].reverse.join
  end

  private

  def digit_to_roman(number, char_for_one, char_for_five, char_for_ten)
    if (1..3).cover? number
      char_for_one * number
    elsif number == 4
      char_for_one + char_for_five
    elsif (5..8).cover? number
      char_for_five + (char_for_one * (number - 5))
    elsif number == 9
      char_for_one + char_for_ten
    else
      ''
    end
  end
end
