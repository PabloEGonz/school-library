require './person'
require './classroom'


class Student < Person

attr_accessor :clasroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @clasroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @clasroom = classroom
    classroom.students << self unless clasroom.students.include?(self)
  end
end

# student = Student.new('g1', 22, 'max')
