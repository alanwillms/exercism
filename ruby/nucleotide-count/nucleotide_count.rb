class Nucleotide
  def initialize(strand)
    raise ArgumentError.new('DNA contains invalid nucleotides') if strand =~ /[^ATCG]/
    @strand = strand
  end

  def count(strand)
    regex = Regexp.new(strand)
    @strand.scan(regex).size
  end

  def histogram
    histogram = {}
    ['A', 'T', 'C', 'G'].each { |nucleotide| histogram[nucleotide] = count(nucleotide) }
    histogram
  end

  def self.from_dna(strand)
    self.new(strand)
  end
end
