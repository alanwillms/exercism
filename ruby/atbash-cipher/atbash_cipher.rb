class Atbash
  def self.encode(string)
    string
      .downcase
      .tr(alphabet, alphabet.reverse)
      .gsub(/[^a-z0-9]/, '')
      .scan(/.{1,5}/)
      .join(' ')
  end

  private

  def self.alphabet
    @@alphabet ||= ('a'..'z').to_a.join
  end
end
