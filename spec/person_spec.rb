require 'rspec'

require_relative 'spec_helper'

RSpec.describe Person do
  subject(:person) { Person.new(20, name: 'John Doe', parent_permission: true) }

  describe '#initialize' do
    it 'should set the age' do
      expect(person.age).to eq(20)
    end

    it 'should set the name' do
      expect(person.name).to eq('John Doe')
    end

    it 'should set parent_permission to true by default' do
      expect(person.parent_permission).to be true
    end

    it 'should set a random ID' do
      expect(person.id).to be_a(Integer)
    end

    it 'should set rentals to an empty array' do
      expect(person.rentals).to eq([])
    end
  end

  describe '#of_age?' do
    it 'should return true if the age is 18 or older' do
      person = Person.new(18)
      expect(person.of_age?).to be true
    end

    it 'should return false if the age is under 18' do
      person = Person.new(17)
      expect(person.of_age?).to be false
    end
  end

  describe '#add_rental' do
    it 'should add the rental to the rentals array' do
      # tomorrow
    end

    it 'should set the rental\'s person to self' do
      # tomorrow
    end
  end
end
