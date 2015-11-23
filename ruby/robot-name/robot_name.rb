class Robot
  attr_reader :name

  @@taken_names = []

  def initialize
    reset
  end

  def reset
    @name = create_name
  end

  private

  def create_name
    begin
      name = (('A'..'Z').to_a.sample(2) + (0..9).to_a.map(&:to_s).sample(3)).join
    end while @@taken_names.include? name
    name
  end
end
