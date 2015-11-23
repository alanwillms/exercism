class Phrase
  VERSION = 1

  def initialize(sentence)
    @sentence = sentence
  end

  def word_count
    @sentence
      .downcase
      .scan(/\b[\w\']+\b/)
      .each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
  end
end
