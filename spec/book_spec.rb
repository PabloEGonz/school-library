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
    it 'Create a rental' do
      book = Book.new('Got', 'George')
      person = Student.new(age: 15, name: 'Max', parent_permission: false)
      date = '2020-12-12'

      book.add_rental(date, person)

      expect(book.rentals[0].date).to eq '2020-12-12'
    end
  end
end
