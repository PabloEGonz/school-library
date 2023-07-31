class BookList
  def initialize(array)
    @books = array
  end

  def list_all_books
    @books.map { |_book| puts book_info(_book) }
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
