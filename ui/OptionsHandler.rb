require_relative '../App'

class OptionHandler
  def initialize(app)
    @app = app
  end

  def handle_option(option, _app)
    case option
    when 1 then @app.list_all_books
    when 2 then @app.list_all_people
    when 3 then @app.create_person
    when 4 then @app.create_book
    when 5 then @app.create_rental
    when 6 then @app.list_rentals_from_person_id
    else
      puts 'See you soon!'
      exit
    end
  end
end
