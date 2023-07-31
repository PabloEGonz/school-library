require_relative 'nameable'
require_relative 'base_decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'book'
require_relative 'classroom'
require_relative 'rentals'
require_relative 'student'
require_relative 'person'
require_relative 'teacher'
require_relative 'modules/add_person'
require_relative 'app'
require_relative 'modules/print_options'
require_relative 'lib/handlers/PrintOptionsHandler.rb'

$stdout.sync = true

def main
  puts "\nWelcome to School Library App!\n\n"

  app = App.new
  print_options_handler = PrintOptionsHandler.new(PrintOptions)
  option_handler = OptionHandler.new

  loop do
    print_options_handler.print_options
    option = gets.chomp.to_i
    option_handler.handle_option(option, app)
  end
end

main
