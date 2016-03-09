class Say
  TRILLION = 1_000_000_000_000
  BILLION = 1_000_000_000
  MILLION = 1_000_000
  THOUSAND = 1_000
  HUNDRED = 100

  NUMBER_NAMES = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',

    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',

    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety'
  }

  def initialize(number)
    if number < 0 || number >= TRILLION
      raise ArgumentError.new('Number must be positive and less than a trillion')
    end
    @number = number
  end

  def in_english
    say = []
    number = @number

    if number >= BILLION
      say << to_english(number / BILLION) + ' billion'
      number %= BILLION
    end

    if number >= MILLION
      say << to_english(number / MILLION) + ' million'
      number %= MILLION
    end

    if number >= THOUSAND
      say << to_english(number / THOUSAND) + ' thousand'
      number %= THOUSAND
    end

    if number > 0 || @number == 0
      say << to_english(number)
    end

    say.join(' ')
  end

  private

  def to_english(number)
    NUMBER_NAMES.each { |value, name| return name if number == value }

    if number >= HUNDRED
      say = to_english(number / HUNDRED) + ' hundred'
      say += ' ' + to_english(number % HUNDRED) if number % HUNDRED > 0
      return say
    end

    # Tens
    return to_english(number - (number % 10)) + '-' + to_english(number % 10)
  end
end
