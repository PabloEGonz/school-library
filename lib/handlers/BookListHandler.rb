class BookList
    def initialize(array)
        @books = array
    end

    def 
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
