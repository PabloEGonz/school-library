require_relative '../modules/PrintOptions'

class PrintOptionsHandler
  def initialize(print_options_module)
    @print_options_module = print_options_module
  end

  def print_options
    @print_options_module.print_options
  end
end
