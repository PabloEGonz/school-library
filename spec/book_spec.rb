require_relative 'spec_helper'

describe Book do
  context 'Access the class attributes' do
    it 'Calling the book.title should return the title' do
      book = Book.new('Harry Potter', 'JK')
      title = book.title
      expect(title).to eq 'Harry Potter'
    end
    it 'Calling the book.author should return the author' do
      book = Book.new('GoT', 'George RR Martin')
      title = book.author
      expect(title).to eq 'George RR Martin'
    end
  end

  context 'Adding a rental to the existing book' do
    it 'Creates a rental and access the rental date' do
      book = Book.new('Got', 'George')
      person = Student.new(id: 1, age: 15, name: 'Max', parent_permission: true)
      date = '2020-12-12'

      book.add_rental(date, person)

      expect(book.rentals[0].date).to eq '2020-12-12'
    end

    it 'Creates a rental and access the person name' do
      book = Book.new('Got', 'George')
      person = Student.new(id: 100, age: 25, name: 'Mary', parent_permission: true)
      date = '2022-10-10'

      book.add_rental(date, person)

      expect(book.rentals[0].person.name).to eq 'Mary'
    end

    it 'Creates a rental and access the person name' do
      book = Book.new('Got', 'George')
      person = Student.new(id: 10, age: 30, name: 'Larry', parent_permission: false)
      date = '2023-08-10'

      book.add_rental(date, person)

      expect(book.rentals[0].book.author).to eq 'George'
    end
  end
end
