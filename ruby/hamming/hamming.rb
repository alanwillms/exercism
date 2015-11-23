class Hamming
  VERSION = 1

  def self.compute(strand, other_strand)
    validate_strands strand, other_strand
    compute_strands strand, other_strand
  end

  private

  def self.validate_strands(strand, other_strand)
    if strand.size != other_strand.size
      raise ArgumentError.new('The strands must have the same size.')
    end
  end

  def self.compute_strands(strand, other_strand)
    strand.each_char.zip(other_strand.each_char).count { |a, b| a != b }
  end
end
