class House
  def self.recite
    parts.size.times.map { |part| recite_until(part) }.join("\n\n") + "\n"
  end

  private

  def self.recite_until(part)
    'This is' + parts[0..part].reverse.map do |components|
      subject, action = *components
      separator = (subject == 'house' ? ' ' : "\n")
      ' the ' + subject + separator + 'that ' + action
    end.join('') + '.'
  end

  def self.parts
    @@parts ||= [
      ['house', 'Jack built'],
      ['malt', 'lay in'],
      ['rat', 'ate'],
      ['cat', 'killed'],
      ['dog', 'worried'],
      ['cow with the crumpled horn', 'tossed'],
      ['maiden all forlorn', 'milked'],
      ['man all tattered and torn', 'kissed'],
      ['priest all shaven and shorn', 'married'],
      ['rooster that crowed in the morn', 'woke'],
      ['farmer sowing his corn', 'kept'],
      ['horse and the hound and the horn', 'belonged to'],
    ]
  end
end
