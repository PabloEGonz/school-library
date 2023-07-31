require_relative 'lib/Nameable'
require_relative 'lib/base_decorator'
require_relative 'lib/capitalize_decorator'
require_relative 'lib/trimmer_decorator'
require_relative 'lib/models/Book'
require_relative 'lib/models/Classroom'
require_relative 'lib/models/Rentals'
require_relative 'lib/models/Student'
require_relative 'lib/models/Person'
require_relative 'lib/models/Teacher'
require_relative 'lib/modules/add_person'
require_relative 'app'
require_relative 'lib/modules/PrintOptions'
require_relative 'lib/handlers/PrintOptionsHandler.rb'
require_relative 'ui/OptionsHandler'

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
