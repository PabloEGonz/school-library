require './person'
# rubocop:disable Style/OptionalBooleanParameter
class Teacher < Person
  def initialize(age, name, specialization, parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  # rubocop:enable Style/OptionalBooleanParameter
  def can_use_services?
    true
  end
end
