class ClassRoom
  def initialize(label)
    @label = label
    @students = []
  end

  def add_students(student)
    @students << student
    student.classroom = self
  end

  attr_accessor :label, :student
end
