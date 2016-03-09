class Cipher
  attr_reader :key

  def initialize(key = nil)
    raise ArgumentError.new('Invalid key') if key && (key =~ /[^a-z]/ || key.empty?)
    @key = key || default_key
  end

  def encode(plaintext)
    translate_chars(plaintext, :encode)
  end

  def decode(ciphertext)
    translate_chars(ciphertext, :decode)
  end

  private

  def default_key
    ('a'..'z').to_a.join
  end

  def translate_chars(source, action)
    source
      .chars
      .each_with_index
      .map { |char, index| move_char(index, char, action) }
      .join
  end

  def move_char(index, char, action)
    signal = (action == :encode ? -1 : 1)
    displacement = (signal * 'a'.ord) + (-signal * @key[index].ord)
    ordinal = char.ord + displacement

    if ordinal > 'z'.ord
      ordinal -= 26
    elsif ordinal < 'a'.ord
      ordinal += 26
    end

    ordinal.chr
  end
end
