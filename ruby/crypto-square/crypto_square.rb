class Crypto
  def initialize(plaintext)
    @plaintext = plaintext
  end

  def normalize_plaintext
    @plaintext.downcase.gsub(/[^a-z0-9]/, '')
  end

  def normalize_ciphertext
    ciphertext_segments.join(' ')
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map { |chunk| chunk.join }
  end

  def ciphertext_segments
    size.times.map do |column|
      plaintext_segments.map { |chunk| chunk[column] }.compact.join
    end
  end

  def ciphertext
    ciphertext_segments.join
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end
end
