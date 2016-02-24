class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(words)
    words.select { |word| anagram? word.downcase }
  end

  private

  def anagram?(other_word)
    other_word != @word &&
      other_word.size == @word.size &&
      other_word.chars.sort == @word.chars.sort
  end
end
