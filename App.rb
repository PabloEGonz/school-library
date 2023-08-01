require_relative 'lib/managers/PeopleManager'
require_relative 'lib/managers/BookManager'
require_relative 'lib/managers/RentalManager'
require 'json'

class App
  def initialize
    @books_manager = BookManager.new
    @people_manager = PeopleManager.new
    @rental_manager = RentalManager.new(@books_manager, @people_manager)
    load_data
  end

  def list_all_books
    @books_manager.list_books
  end

  def list_all_people
    @people_manager.list_all_people
  end

  def create_person
    @people_manager.create_person
  end

  def create_book
    @books_manager.add_book
  end

  def create_rental
    @rental_manager.create_rental
  end

  def list_rentals_from_person_id
    @rental_manager.list_rentals_from_person_id
  end

  def save_data
    save_people
    save_books
  end

  def load_data
    load_people
    load_books
  end

  private

  def load_people
    if File.exist?('people.json')
      puts 'Loading people data...'
      people_data = JSON.parse(File.read('people.json'))
      @people_manager.load_people(people_data)
      puts 'People data loaded successfully!'
    else
      puts 'People data file not found. Starting with an empty people list.'
    end
  end

  def load_books
    if File.exist?('books.json')
      puts 'Loading books data...'
      books = JSON.parse(File.read('books.json'))
      @books_manager.load_books(books)
      puts 'Books data loaded successfully!'
    else
      puts 'Books data file not found. Starting with an empty people list.'
    end
  end

  def save_people
    @people_manager.save_people_data
  end

  def save_books
    @books_manager.save_books_data
  end
end
