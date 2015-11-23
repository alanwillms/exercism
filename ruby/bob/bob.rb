class Bob
  def hey(remark)
    if remark.strip == ''
      'Fine. Be that way!'
    elsif !remark.match(/[a-z]/) && remark.match(/[A-Z]/)
      'Whoa, chill out!'
    elsif remark.end_with? '?'
      'Sure.'
    else
      'Whatever.'
    end
  end
end
