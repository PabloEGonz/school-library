#!/usr/bin/env ruby
require './nameable'
require './base_decorator'
require './capitalize_decorator'
require './trimmer_decorator'
require './book'
require './classroom'
require './rentals'
require './student'
require './person'
require './teacher'
require './modules/add_person'
require './app'
require './modules/print_options'
$stdout.sync = true

def main
  puts "\nWelcome to School Library App!\n\n"

  app = App.new
  option = nil
  loop do
    print_options
    option = gets.chomp.to_i
    case option
    when 1 then app.list_all_books
    when 2 then app.list_all_people
    when 3 then app.create_person
    when 4 then app.create_book
    when 5 then app.create_rental
    when 6 then app.list_retals_from
    else
      puts 'See you soon!'
      break
    end
  end
end

main
