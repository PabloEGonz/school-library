require_relative '../models/Book'

class BookCreator
  def create_book(title, author, rentals: [])
    Book.new(title, author, rentals)
  end
end
