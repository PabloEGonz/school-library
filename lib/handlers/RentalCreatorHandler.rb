class RentalHandler
    def create_rental(date, book, person)
      Rental.new(date, book, person)
    end
  
    def list_rentals_from(person)
      person.rentals.map { |rental| puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" }
    end
  end
  