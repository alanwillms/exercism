class Allergies
  def initialize(score)
    @score = score
  end

  def allergic_to?(stuff)
    @score & allergies_scores[stuff] > 0
  end

  def list
    allergies_scores.select { |stuff, score| allergic_to? stuff }.keys
  end

  private

  def allergies_scores
    @@allergies_scores ||= {
      'eggs' => 1,
      'peanuts' => 2,
      'shellfish' => 4,
      'strawberries' => 8,
      'tomatoes' => 16,
      'chocolate' => 32,
      'pollen' => 64,
      'cats' => 128
    }
  end
end
