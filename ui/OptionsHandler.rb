require_relative '../App'

class OptionHandler
  def initialize(app)
    @app = app
  end

  def handle_option(option, app)
    case option
    when 1 then @app.list_all_books
    when 2 then @app.list_all_people
    when 3 then @app.create_person
    when 4 then app.create_book
    when 5 then app.handle_operation(@rental_creator)
    when 6 then app.handle_operation(@rentals_from_list)
    else
      puts 'See you soon!'
      exit
    end
  end
end
