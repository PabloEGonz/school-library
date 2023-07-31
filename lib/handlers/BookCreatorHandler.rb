require_relative '../models/Book'

class BookCreator
    def create_book(title, author)
    Book.new(title, author)
    end
end