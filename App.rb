require_relative 'lib/managers/PeopleManager'
require_relative 'lib/managers/BookManager'
require_relative 'lib/managers/RentalManager'

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

  def exit
    puts 'See you soon!'
  end
end