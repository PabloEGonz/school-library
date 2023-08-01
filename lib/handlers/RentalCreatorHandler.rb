class RentalHandler
  def create_rental(date, book, person)
    Rental.new(date, book, person)
  end

  def list_rentals_from(array)
    array.map { |rental| puts "Date: #{rental['date']}, Book '#{rental['book_title']}' by #{rental['book_author']}" }
  end
end
