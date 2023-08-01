require_relative '../models/Teacher'
require_relative '../models/Student'

class PersonCreator
  def add_student(age:, name:, parent_permission: true)
    Student.new(age: age, name: name, parent_permission: parent_permission)
  end

  def add_teacher(age:, name:, specialization:)
    Teacher.new(age: age, name: name, specialization: specialization)
  end
end
