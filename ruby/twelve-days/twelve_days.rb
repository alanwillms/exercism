class TwelveDays
  VERSION = 1

  def self.song
    accumulated_gifts = []
    gifts_for_day.each_pair.map do |day_th, gift|
      accumulated_gifts.unshift gift
      sentence_for day_th, accumulated_gifts
    end.join("\n\n") + "\n"
  end

  private

  def self.sentence_for(day_th, gifts)
    gifts_clone = gifts.dup
    gifts_clone[-1] = 'and ' + gifts_clone[-1] if gifts.size > 1
    "On the #{day_th} day of Christmas my true love gave to me, " + gifts_clone.join(', ') + "."
  end

  def self.gifts_for_day
    {
      first: 'a Partridge in a Pear Tree',
      second: 'two Turtle Doves',
      third: 'three French Hens',
      fourth: 'four Calling Birds',
      fifth: 'five Gold Rings',
      sixth: 'six Geese-a-Laying',
      seventh: 'seven Swans-a-Swimming',
      eighth: 'eight Maids-a-Milking',
      ninth: 'nine Ladies Dancing',
      tenth: 'ten Lords-a-Leaping',
      eleventh: 'eleven Pipers Piping',
      twelfth: 'twelve Drummers Drumming',
    }
  end
end
