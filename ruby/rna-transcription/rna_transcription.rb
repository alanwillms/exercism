class Complement
  VERSION = 2

  def self.of_dna(strand)
    validate strand, /[^GCTA]/
    strand.tr('GCTA', 'CGAU')
  end

  def self.of_rna(strand)
    validate strand, /[^CGAU]/
    strand.tr('CGAU', 'GCTA')
  end

  private
    def self.validate(strand, invalid_matcher)
      if invalid_nucleotides = strand[invalid_matcher]
        invalid_nucleotides = invalid_nucleotides.split(//).uniq.join(', ')
        raise ArgumentError.new("Invalid nucleotides: #{invalid_nucleotides}")
      end
    end
end