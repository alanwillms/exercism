class Clock
  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def +(minutes)
    add(minutes)
  end

  def -(minutes)
    add(minutes, -1)
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end

  def to_s
    @hours.to_s.rjust(2, '0') + ':' + @minutes.to_s.rjust(2, '0')
  end

  def self.at(hours, minutes = 0)
    self.new(hours, minutes)
  end

  private

  def add(minutes, multiplier = 1)
    hours = (minutes / 60) % 24
    minutes %= 60

    @hours += (hours * multiplier)
    @minutes += (minutes * multiplier)

    if @minutes < 0
      @hours -= 1
      @minutes += 60
    end

    @hours += 24 if @hours < 0
    @hours %= 24 if @hours >= 24

    self
  end
end
