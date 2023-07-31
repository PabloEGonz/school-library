require_relative '../handlers/BookListHandler'
require_relative '../handlers/BookCreatorHandler'

class BookManager
  def initialize
    @books = []
    @book = BookCreator.new
    @list = BookList.new(@books)
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << @book.create_book(title, author)
    puts 'The book was added succesfully!'
  end

  def list_books
    @list.list_all_books
  end

  def list_books_idx
    @list.list_book_with_idx
  end

  def get_book_by_index(idx)
    @books[idx]
  end
end
