require_relative '../models/Teacher'
require_relative '../models/Student'

class PersonCreator
  def add_student(age:, name:)
    Student.new(age, name: name)
  end

  def add_teacher(age:, name:, can_use_services: true, specialization: 'General')
    Teacher.new(age, name: name, can_use_services: can_use_services, specialization: specialization)
  end
end
