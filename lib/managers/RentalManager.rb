require_relative '../handlers/RentalCreatorHandler'
require_relative '../../ui/inputValidator'

class RentalManager
  def initialize(book_manager, people_manager)
    @book_manager = book_manager
    @people_manager = people_manager
    @rental_handler = RentalHandler.new
    @validator = Validator.new
  end

  def create_rental
    puts 'Select a book from the following list'
    @book_manager.list_books_idx
    book = @book_manager.get_book_by_index(gets.chomp.to_i - 1)

    puts 'Select a person from the following list by number (not ID)'
    @people_manager.list_all_people_with_index
    person = @people_manager.get_person_by_index(gets.chomp.to_i - 1)

    print 'Date: '
    date = gets.chomp
    until @validator.date(date)
      puts 'Please insert a valid date format -YYYY-MM-DD-'
      date = gets.chomp
    end
    @rental_handler.create_rental(date, book, person)
    puts 'The rental was added succesfully!'
  end

  def list_rentals_from_person_id
    print 'ID of the person: '
    id = gets.chomp.to_i
    person = @people_manager.get_person_by_id(id)

    @rental_handler.list_rentals_from(person)
  end
end
