class PhoneNumber
  def initialize(raw_number)
    @raw_number = raw_number
  end

  def number
    @number ||= valid? ? digits[-10, 10] : '0000000000'
  end

  def area_code
    number[0, 3]
  end

  def to_s
    "(#{number[0, 3]}) #{number[3, 3]}-#{number[6, 4]}"
  end

  private

  def valid?
    has_chars = /[A-Za-z]/.match(@raw_number)
    has_11_numbers_starting_with_1 = (digits.size == 11 && digits[0] == '1')
    has_10_numbers = (digits.size == 10)

    !has_chars && (has_10_numbers || has_11_numbers_starting_with_1)
  end

  def digits
    @digits ||= @raw_number.gsub(/[\D]/, '\1\2\3')
  end
end
