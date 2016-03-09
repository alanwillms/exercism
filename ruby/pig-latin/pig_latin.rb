class PigLatin
  def self.translate(english)
    english.split.map { |word| translate_word(word) }.join(' ')
  end

  private

  def self.translate_word(english)
    if english =~ /^(thr|sch|[a-z]qu)/i
      english[3, english.size - 3] + english[0, 3] + 'ay'
    elsif english =~ /^(qu|ch|th)/i
      english[2, english.size - 2] + english[0, 2] + 'ay'
    elsif english =~ /^(yt|xr|[aeiou])/i
      english + 'ay'
    else
      english[1, english.size - 1] + english[0] + 'ay'
    end
  end
end
