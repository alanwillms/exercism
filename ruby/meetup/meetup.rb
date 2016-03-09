class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    is_weekday = "#{weekday}?".to_sym
    day_step = 1
    first_day = 1

    if schedule == :last
      day_step = -1
      first_day = -1
    end

    date = Date.new(@year, @month, first_day)
    schedule_test = case schedule
      when :teenth then -> (date) { date.day > 12 }
      when :second then -> (date) { date.day - 7 > 0 }
      when :third then -> (date) { date.day - 14 > 0 }
      when :fourth then -> (date) { date.day - 21 > 0 }
      else -> (date) { true }
    end

    date += day_step until date.send(is_weekday) && schedule_test.call(date)
    date
  end
end
