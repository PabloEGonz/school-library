require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './book'
require './classroom'
require './rentals'
require './student'

class Person < Nameable

  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end


  def can_use_services?
    if of_age? && @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end



b2 = Classroom.new('B2')
puts b2.label
# b2.add_student(student)