class Say
  attr_reader :number

  def initialize(number)
    if number < 0 || number > 999_999_999_999
      raise ArgumentError.new('Number must be positive and less than a trillion')
    end
    @number = number
  end

  def in_english
    return 'zero' if number == 0
    return 'one' if number == 1
    return 'two' if number == 2
    return 'three' if number == 3
    return 'four' if number == 4
    return 'five' if number == 5
    return 'six' if number == 6
    return 'seven' if number == 7
    return 'eight' if number == 8
    return 'nine' if number == 9
    return 'ten' if number == 10

    return 'eleven' if number == 11
    return 'twelve' if number == 12
    return 'thirteen' if number == 13
    return 'fourteen' if number == 14
    return 'fifteen' if number == 15
    return 'sixteen' if number == 16
    return 'seventeen' if number == 17
    return 'eighteen' if number == 18
    return 'nineteen' if number == 19

    return 'twenty' if number == 20
    return 'thirty' if number == 30
    return 'forty' if number == 40
    return 'fifty' if number == 50
    return 'sixty' if number == 60
    return 'seventy' if number == 70
    return 'eighty' if number == 80
    return 'ninety' if number == 90

    if number > 999_999_999
      say = self.class.new(number / 1_000_000_000).in_english + ' billion'

      if number % 1_000_000_000 > 0
        say += ' ' + self.class.new(number % 1_000_000_000).in_english
      end

      return say
    end

    if number > 999_999
      say = self.class.new(number / 1_000_000).in_english + ' million'

      if number % 1_000_000 > 0
        say += ' ' + self.class.new(number % 1_000_000).in_english
      end

      return say
    end

    if number > 999
      say = self.class.new(number / 1_000).in_english + ' thousand'

      if number % 1_000 > 0
        say += ' ' + self.class.new(number % 1_000).in_english
      end

      return say
    end

    if number > 99
      say = self.class.new(number / 100).in_english + ' hundred'

      if number % 100 > 0
        say += ' ' + self.class.new(number % 100).in_english
      end

      return say
    end

    if number > 20
      return self.class.new(number - (number % 10)).in_english + '-' + self.class.new(number % 10).in_english
    end
  end
end
