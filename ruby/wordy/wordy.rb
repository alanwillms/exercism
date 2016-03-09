class WordProblem
  def initialize(problem)
    @equation = (problem)
      .gsub('plus', '+')
      .gsub('minus', '-')
      .gsub('multiplied', '*')
      .gsub('divided', '/')
      .gsub(/[^0-9\+\-\/\*]/, '')
      .gsub('++', '+')
      .gsub('+-', '-')
      .gsub('-+', '-')
      .gsub('--', '+')

    unless @equation =~ /[\+\-\/\*]/ && @equation =~ /[0-9]/
      raise ArgumentError.new('Invalid problem')
    end
  end

  def answer
    value = 0

    ('+' + @equation).scan /([\+\-\/\*])(\-{0,1}\d{1,})/ do |matches|
      operator, number = *matches
      value = value.send(operator.to_sym, number.to_i)
    end

    value
  end
end
