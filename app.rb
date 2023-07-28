#!/usr/bin/env ruby
require './nameable'
require './base_decorator'
require './capitalize_decorator'
require './trimmer_decorator'
require './book'
require './classroom'
require './rentals'
require './student'
require './person'
require './teacher'
require './modules/add_person'


def list_all_books
  books = Book.getBooks
  books.map { |book| puts " - #{book.title} by #{book.author}" }
  list_options
end

def list_all_people
  people = Person.getPeople
  people.map { |person| puts " - [#{person.class.name}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}" }
  list_options
end

def create_person
  include AddPerson
  puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
  $stdout.flush
  person = gets.chomp.to_i
  print 'Age: '
  $stdout.flush
  age = gets.chomp.to_i
  print 'Name: '
  $stdout.flush
  name = gets.chomp
  case person
  when 1
    add_student(age, name)
  when 2
    add_teacher(age, name)
  end
  puts "\nPerson was created succesfully"
  list_options
end

def create_book
  print 'Title: '
  $stdout.flush
  title = gets.chomp
  print 'Author: '
  $stdout.flush
  author = gets.chomp
  Book.new(title, author)
  puts 'The book was added succesfully!'
  list_options
end

def create_rental
  puts 'Select a book from the following list'
  books = Book.getBooks
  books.map.with_index do |book, i|
    puts "(#{i + 1}) #{book.title} by #{book.author}"
  end
  $stdout.flush
  book = books[gets.chomp.to_i - 1]
  puts 'Select a person from the following list by number (not ID)'
  people = Person.getPeople
  people.map.with_index do |person, i|
    puts "(#{i + 1}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
  end
  $stdout.flush
  person = people[gets.chomp.to_i - 1]
  print 'Date: '
  $stdout.flush
  date = gets.chomp
  Rental.new(date, book, person)
  puts 'The rental was added succesfully!'
  list_options
end

def list_retals_from
  print 'ID of the person: '
  $stdout.flush
  people = Person.getPeople
  id = gets.chomp.to_i
  i = people.find_index { |p| p.id == id }
  person = people[i]
  person.rentals.map { |rental| puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" }
  list_options
end

def exit
  puts 'See you soon!'
end

def list_options
  print "\nPlease choose an option by entering a number:\n"
  print "1 - List all books\n2 - List all people\n3 - Create a person\n4 - Create a book\n5 - Create a rental\n6 - List all rentals for  given person id \n7 - Exit\n"
  $stdout.flush

  option = gets.chomp.to_i

  case option
  when 1
    list_all_books
  when 2
    list_all_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_retals_from
  else
    exit
  end
end
puts "\nWelcome to School Library App!\n\n"
list_options
