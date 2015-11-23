class Raindrops
  VERSION = 1
  FACTORS = {3 => 'Pling', 5 => 'Plang', 7 => 'Plong'}

  def self.convert(number)
    raindrops = FACTORS.select do |factor|
      number % factor == 0
    end
    raindrops.empty? ? number.to_s : raindrops.values.join
  end
end