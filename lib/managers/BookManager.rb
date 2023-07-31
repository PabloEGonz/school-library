require '../handlers/BookListHandler'
class BookManager
  def initialize
    @books = []
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts 'The book was added succesfully!'
    @books << book
  end

  def list_all_books
    @books.map { |_book| puts book_info }
  end

  def list_book_with_idx
    @books.map.with_index do |book, i|
      puts "(#{i + 1}) #{book_info(book)}"
    end
  end

  private

  def book_info(book)
    " - #{book.title} by #{book.author}"
  end
end
