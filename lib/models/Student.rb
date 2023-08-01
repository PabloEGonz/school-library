require_relative 'Person'

class Student < Person
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(id:, age:, name:, parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @id = id
  end

  def classroom=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom&.students&.<< self
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
