require_relative 'Person'

class Student < Person
  attr_reader :classroom

  # rubocop:disable Style/OptionalBooleanParameter

  def initialize(age, name = 'Unknown', parent_permission = true, classroom = nil)
    super(age, name, parent_permission)
    self.classroom = classroom if classroom
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
