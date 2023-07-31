require_relative 'lib/managers/PeopleManager'

class App
  def initialize
    @books = []
    @people_manager = PeopleManager.new
  end

  def list_all_people
    @people_manager.list_all_people
  end

  def create_person
    @people_manager.create_person
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts 'The book was added succesfully!'
    @books.push(book)
  end

  def create_rental
    puts 'Select a book from the following list'
    @books.map.with_index do |book, i|
      puts "(#{i + 1}) #{book.title} by #{book.author}"
    end
    book = @books[gets.chomp.to_i - 1]
    puts 'Select a person from the following list by number (not ID)'
    @people.map.with_index do |person, i|
      puts "(#{i + 1}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    person = @people[gets.chomp.to_i - 1]
    print 'Date: '
    date = gets.chomp
    Rental.new(date, book, person)
    puts 'The rental was added succesfully!'
  end

  def list_retals_from
    print 'ID of the person: '
    id = gets.chomp.to_i
    i = @people.find_index { |p| p.id == id }
    person = @people[i]
    person.rentals.map { |rental| puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" }
  end

  def exit
    puts 'See you soon!'
  end
end
