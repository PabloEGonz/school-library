require './rentals'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  @@books = []
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @@books.push(self)
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def self.getBooks
    @@books
  end
end
