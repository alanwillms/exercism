class FoodChain
  VERSION = 2

  def self.song
    Song.new(self.new).to_s + "\n"
  end

  def animals
    @animals ||= %w(fly spider bird cat dog goat cow horse)
  end

  def top
    @animals.last
  end

  def bottom
    @animals.first
  end

  def under(animal)
    animals[0, animals.index(animal)].reverse
  end
end

class Song
  attr_reader :chain

  def initialize(chain)
    @chain = chain
  end

  def to_s
    chain.animals.map { |animal| create_strophe(animal) }.join("\n\n")
  end

  private

  def create_strophe(animal)
    sentences = swallowed_now(animal) + swallowed_before(animal)
    sentences << "I don't know why she swallowed the #{chain.bottom}. Perhaps she'll die." unless animal == chain.top
    sentences.join("\n")
  end

  def swallowed_now(animal)
    ["I know an old lady who swallowed a #{animal}.", exclamations[animal]].compact
  end

  def swallowed_before(animal)
    return [] if animal == chain.top || animal == chain.bottom
    chain.under(animal).map do |previous_animal|
      sentence = "She swallowed the #{animal} to catch the #{previous_animal}" + complements[previous_animal].to_s
      animal = previous_animal
      sentence += '.'
    end
  end

  def complements
    @complements ||= {'spider' => ' that wriggled and jiggled and tickled inside her'}
  end

  def exclamations
    @exclamations ||= {
      'spider' => 'It wriggled and jiggled and tickled inside her.',
      'bird' => 'How absurd to swallow a bird!',
      'cat' => 'Imagine that, to swallow a cat!',
      'dog' => 'What a hog, to swallow a dog!',
      'goat' => 'Just opened her throat and swallowed a goat!',
      'cow' => 'I don\'t know how she swallowed a cow!',
      'horse' => 'She\'s dead, of course!',
    }
  end
end
