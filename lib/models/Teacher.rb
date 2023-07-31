require_relative 'Person'

class Teacher < Person
  attr_reader :can_use_services, :specialization

  def initialize(age, name: 'Unknown', can_use_services: true, specialization: 'General')
    super(age, name: name)
    @specialization = specialization
  end
end
