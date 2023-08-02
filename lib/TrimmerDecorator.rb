require_relative 'BaseDecorator'

class TrimmerDecorator < Decorator
  def initialize(name)
    super(name)
  end
  def correct_name
    @nameable[0...10]
  end
end
