require_relative '../models/Teacher'
require_relative '../models/Student'

class PersonCreator
  def add_student(age, name)
    Student.new(age, name)
  end

  def add_teacher(age, name)
    Teacher.new(age, name)
  end
end
