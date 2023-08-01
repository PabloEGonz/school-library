require_relative 'lib/managers/PeopleManager'
require_relative 'lib/managers/BookManager'
require_relative 'lib/managers/RentalManager'
require 'json'

class App
  def initialize
    @books_manager = BookManager.new
    @people_manager = PeopleManager.new
    @rental_manager = RentalManager.new(@books_manager, @people_manager)
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
    save_rentals
  end

  def load_data
    load_people
    load_books
  end

  private

  def load_people
    @people_manager.load_people('people.json')
  end

  def load_books
    @books_manager.load_books('books.json')
  end

  def save_people
    @people_manager.save_people_data
  end

  def save_books
    @books_manager.save_books_data
  end

  def save_rentals
    @rental_manager.save_rentals_data
  end
end
