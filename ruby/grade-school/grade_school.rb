class School
  VERSION = 1

  def initialize
    self.grades = {}
  end

  def add(name, number)
    grade(number).push(name).sort!
  end

  def grade(number)
    grades[number] ||= []
  end

  def to_h
    Hash[grades.sort]
  end

  private

  attr_accessor :grades
end
