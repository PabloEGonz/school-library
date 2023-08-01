require_relative '../handlers/BookListHandler'
require_relative '../handlers/BookCreatorHandler'
require_relative '../models/GetData'

class BookManager
  def initialize
    @books = []
    @book = BookCreator.new
    @list = BookList.new(@books)
    @get_data = GetData.new
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

  def load_books(path)
    books = @get_data.load_data(path)
    if books
      books.map do |book|
        @books << @book.create_book(book['title'], book['author'], book['rentals'])
      end
    else
      puts 'Books data file not found. Starting with an empty people list.'
    end
  end

  def save_books_data
    books = @books.map do |book|
      {
        title: book.title,
        author: book.author,
        rentals: book.rentals
      }
    end
    File.write('books.json', JSON.pretty_generate(books))
  end
end
