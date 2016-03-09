class Translation
  def self.of_codon(codon)
    PROTEINS_CODONS[codon]
  end

  def self.of_rna(strand)
    strand.chars.each_slice(3).map(&:join).each_with_object([]) do |codon, proteins|
      return proteins if STOP_CODONS.include? codon
      raise InvalidCodonError.new unless PROTEINS_CODONS.keys.include? codon
      proteins << of_codon(codon)
    end
  end

  private

  PROTEINS_CODONS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP',
  }
  STOP_CODONS = %w(UAA UAG UGA)
end

class InvalidCodonError < ArgumentError
end
