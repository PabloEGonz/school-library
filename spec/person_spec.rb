require 'rspec'

require_relative 'spec_helper'

describe Person do
  let(:person) { Person.new(14, name: 'John Smith', parent_permission: false) }

  describe '#initialize' do
    it 'creates a new Person object' do
      expect(person).to be_an_instance_of(Person)
    end

    it 'has a valid ID' do
      expect(person.id).to be_between(1, 1000)
    end

    it 'sets the name correctly' do
      expect(person.name).to eq('John Smith')
    end

    it 'sets the age correctly' do
      expect(person.age).to eq(14)
    end

    it 'initializes rentals as an empty array' do
      expect(person.rentals).to be_an_instance_of(Array)
      expect(person.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    context 'when person is of age' do
      let(:person) { Person.new(100, name: 'Old John', parent_permission: true) }

      it 'returns true' do
        expect(person.can_use_services?).to be_truthy
      end
    end

    context 'when person is not of age but has parent permission' do
      let(:person) { Person.new(16, name: 'Jennifer Ruby', parent_permission: true) }

      it 'returns true' do
        expect(person.can_use_services?).to be_truthy
      end
    end

    context 'when person is not of age and does not have parent permission' do
      let(:person) { Person.new(16, name: 'Alice Malber', parent_permission: false) }

      it 'returns false' do
        expect(person.can_use_services?).to be_falsey
      end
    end
  end

  describe '#correct_name' do
    it 'returns the correct name stored in instance' do
      expect(person.correct_name).to eq('John Smith')
    end
  end

  describe '#add_rental' do
    let(:rental) { double('Rental') }

    it 'adds the rental to the rentals array and sets the person attribute of the rental' do
      expect(rental).to receive(:person=).with(person)
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe 'private method #of_age?' do
    it 'returns true when age is 18 or above' do
      adult_person = Person.new(100, name: 'Old John', parent_permission: true)
      expect(adult_person.send(:of_age?)).to be_truthy
    end

    it 'returns false when age is below 18' do
      underage_person = Person.new(15, name: 'Young John', parent_permission: true)
      expect(underage_person.send(:of_age?)).to be_falsey
    end
  end
end
