require_relative 'spec_helper'

describe Rental do
    before(:each) do
      @book = Book.new("Test book", "Test author")
      @person = Person.new(20, name: "Test person") 
      @rental = Rental.new(Date.today, @book, @person)
    end
  
    it "initializes with correct attributes" do
      expect(@rental.date).to eq(Date.today)
      expect(@rental.book).to eq(@book)
      expect(@rental.person).to eq(@person)
    end
  
    it "adds rental to the book's rentals" do
      expect(@book.rentals).to include(@rental)
    end
  
    it "adds rental to the person's rentals" do
      expect(@person.rentals).to include(@rental)
    end
  end
