class Garden
  def initialize(diagram, students = nil)
    self.diagram = diagram
    self.students = students || default_students
  end

  private

  attr_reader :diagram, :students

  def diagram=(raw)
    @diagram = raw.split("\n").map { |row| row.chars }
  end

  def students=(students)
    @students = students.map(&:downcase).sort.map(&:to_sym)
  end

  def plant_at(row, column)
    plant_code = diagram.dig(row, column)
    plants[plant_code]
  end

  def method_missing(method, *args)
    @students.include?(method) ? plants_for(method) : super
  end

  def plants_for(child)
    position = students.index(child) * 2
    2.times.map do |row|
      2.times.map { |column| plant_at(row, position + column) }
    end.flatten
  end

  def plants
    {'R' => :radishes, 'C' => :clover, 'G' => :grass, 'V' => :violets}
  end

  def default_students
    %w{ Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry }
  end
end
