require_relative '../TrimmerDecorator'
require_relative '../CapitalizeDecorator'
class NameFixer
  def fix(name)
    corrected = CapitalizeDecorator.new(name).correct_name
    TrimmerDecorator.new(corrected).correct_name
  end
end
