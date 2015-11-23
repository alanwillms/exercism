class School
  VERSION = 1

  def initialize
    @grades_students = {}
  end

  def add(name, grade)
    unless @grades_students[grade]
      @grades_students[grade] = []
      @grades_students = Hash[@grades_students.sort]
    end
    @grades_students[grade].push name
    @grades_students[grade].sort!
  end

  def grade(number)
    @grades_students[number] || []
  end

  def to_h
    @grades_students
  end
end
