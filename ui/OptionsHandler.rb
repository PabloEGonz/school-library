class OptionHandler
  def initialize
    @book_list = ListAllBooks.new
    @person_list = ListAllPeople.new
    @person_creator = CreatePerson.new
    @book_creator = CreateBook.new
    @rental_creator = CreateRental.new
  end

  def handle_option(option, app)
    case option
    when 1 then app.handle_operation(@book_list)
    when 2 then app.handle_operation(@person_list)
    when 3 then app.handle_operation(@person_creator)
    when 4 then app.handle_operation(@book_creator)
    when 5 then app.handle_operation(@rental_creator)
    when 6 then app.handle_operation(@rentals_from_list)
    else
      puts 'See you soon!'
      exit
    end
  end
end
