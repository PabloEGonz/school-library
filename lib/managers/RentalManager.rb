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

  def load_rentals_data(path)
    rentals = @get_data.load_data(path, 'rentals')
    return unless rentals
  
    rentals.each do |rental_data|
      book = @book_manager.get_book_by_id(rental_data['book_id'])
      person = @people_manager.get_person_by_id(rental_data['person_id'])
      @rental_handler.create_rental(rental_data['date'], book, person)
    end
  end
  
  def save_rentals_data
    rentals_data = @book_manager.books.flat_map do |book|
      book.rentals.map do |rental|
        {
          id: rental.id,
          date: rental.date,
          book_id: book.id,
          person_id: rental.person.id
        }
      end
    end
  
    File.write('rentals.json', JSON.pretty_generate(rentals_data))
  end

end
