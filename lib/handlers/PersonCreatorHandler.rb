require_relative '../models/Teacher'
require_relative '../models/Student'

class PersonCreator
  def add_student(age:, name:, can_use_services: true)
    Student.new(age: age, name: name, parent_permission: can_use_services)
  end

  def add_teacher(age:, name:, specialization:)
    Teacher.new(age: age, name: name, specialization: specialization)
  end
end
