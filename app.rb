class App
  def initialize
    @books = []
    @people = []
  end

  def list_all_books
    @books.map { |book| puts " - #{book.title} by #{book.author}" }
  end

  def list_all_people
    @people.map do |person|
      puts " - [#{person.class.name}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    case person
    when 1
      @people.push(add_student(age, name))
    when 2
      @people.push(add_teacher(age, name))
    end
    puts "\nPerson was created succesfully"
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
