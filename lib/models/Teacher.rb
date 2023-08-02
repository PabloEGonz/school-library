require_relative 'Person'

class Teacher < Person
  attr_accessor :id, :name, :age, :specialization

  def initialize(id:, age:, name:, specialization:)
    super(age, name: name)
    @id = id
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
