require_relative '../models/Teacher'
require_relative '../models/Student'
require 'set'

class PersonCreatorHandler
  def initialize
    @people = []
    @used_ids = Set.new
  end

  def add_student(age:, name:, parent_permission: true)
    id = generate_id
    student = Student.new(id: id, age: age, name: name, parent_permission: parent_permission)
    @people << student
    student
  end

  def add_teacher(age:, name:, specialization:)
    id = generate_id
    teacher = Teacher.new(id: id, age: age, name: name, specialization: specialization)
    @people << teacher
    teacher
  end

  private

  def generate_id
    loop do
      id = Random.rand(1..1000)
      return id unless @used_ids.include?(id)
    end
  end
end
