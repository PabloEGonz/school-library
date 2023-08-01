require_relative 'Person'

class Teacher < Person
  attr_reader :can_use_services, :specialization

  def initialize(age:, name:, specialization:, can_use_services: true)
    super(age, name: name)
    @can_use_services = can_use_services
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
