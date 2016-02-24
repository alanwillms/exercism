class Acronym
  VERSION = 1

  def self.abbreviate(name)
    name
      .scan(/([A-Za-z])[a-z]+|([A-Z])[A-Z]{1}/)
      .to_a
      .flatten
      .compact
      .join
      .upcase
  end
end
