require_relative 'BaseDecorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable[0...10]
  end
end
