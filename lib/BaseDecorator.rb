require_relative 'Nameable'
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end
end
