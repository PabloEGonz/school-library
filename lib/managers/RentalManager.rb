require_relative '../handlers/RentalCreatorHandler'
require_relative '../../ui/inputValidator'

class RentalManager
  def initialize(book_manager, people_manager)
    @book_manager = book_manager
    @people_manager = people_manager
    @rental_handler = RentalHandler.new
    @validator = Validator.new
    @get_data = GetData.new
    @rentals = []
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

    rental = Rental.new(date, book, person)
    @rentals << {
      'date' => rental.date,
      'book_title' => rental.book.title,
      'book_author' => rental.book.author,
      'person_id' => rental.person.id
    }
    puts 'The rental was added succesfully!'
  end

  def list_rentals_from_person_id
    print 'ID of the person: '
    id = gets.chomp.to_i
    person = @rentals.select { |rental| rental['person_id'] == id }

    if person.empty?
      puts "No rentals found under ID #{id}"
    else
      @rental_handler.list_rentals_from(person)
    end
  end

  def load_rentals_data(path)
    rentals = @get_data.load_data(path, 'rentals')
    return unless rentals

    @rentals = rentals
  end

  def save_rentals_data
    File.write('rentals.json', JSON.pretty_generate(@rentals))
  end
end
