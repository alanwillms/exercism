class BeerSong
  VERSION = 2 # Required by Exercism

  def lyrics
    verses(99, 0)
  end

  def verses(from, to)
    (to..from).to_a.reverse.map { |number| verse(number) }.join("\n")
  end

  def verse(amount)
    count_bottles_on_the_wall(amount) + take_bottle_from_the_wall(amount)
  end

  private

  def count_bottles_on_the_wall(amount)
    count_bottles(amount).capitalize + " on the wall, " + count_bottles(amount) + ".\n"
  end

  def take_bottle_from_the_wall(current_amount)
    new_amount = current_amount == 0 ? 99 : current_amount - 1
    take_one_from(current_amount) + ", " + count_bottles(new_amount) + " on the wall.\n"
  end

  def count_bottles(amount)
    return 'no more bottles of beer' if amount == 0
    return '1 bottle of beer' if amount == 1
    "#{amount} bottles of beer"
  end

  def take_one_from(current_amount)
    return 'Take it down and pass it around' if current_amount == 1
    return 'Go to the store and buy some more' if current_amount == 0
    'Take one down and pass it around'
  end
end
