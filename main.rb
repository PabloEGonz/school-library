require_relative 'App'
require_relative 'lib/modules/PrintOptions'
require_relative 'lib/handlers/PrintOptionsHandler'
require_relative 'ui/OptionsHandler'

$stdout.sync = true

def main
  puts "\nWelcome to School Library App!\n\n"

  app = App.new
  app.load_data
  print_options_handler = PrintOptionsHandler.new(PrintOptions)
  option_handler = OptionHandler.new(app)

  loop do
    print_options_handler.print_options
    option = gets.chomp.to_i
    option_handler.handle_option(option)
  end
end

main
