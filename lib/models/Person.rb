require_relative '../Nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :id
  attr_reader :parent_permission

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(rental)
    rentals << rental
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
