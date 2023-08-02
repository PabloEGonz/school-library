require_relative '../App'
require_relative 'ExitHandler'

class OptionHandler
  def initialize(app)
    @app = app
  end

  def handle_option(option)
    case option
    when 1 then @app.list_all_books
    when 2 then @app.list_all_people
    when 3 then @app.create_person
    when 4 then @app.create_book
    when 5 then @app.create_rental
    when 6 then @app.list_rentals_from_person_id
    when 7
      exit_handler = ExitHandler.new
      exit_handler.handle_choice(@app, option)
    else
      puts 'Invalid option. Please try again!'
    end
  end
end
