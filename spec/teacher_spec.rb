require 'rspec'

require_relative 'spec_helper'

describe Teacher do
  let(:teacher) { Teacher.new(id: 1, age: 30, name: 'John Doe', specialization: 'Math') }

  describe '#initialize' do
    it 'sets the id correctly' do
      expect(teacher.id).to eq(1)
    end

    it 'sets the age correctly' do
      expect(teacher.age).to eq(30)
    end

    it 'sets the name correctly' do
      expect(teacher.name).to eq('John Doe')
    end

    it 'sets the specialization correctly' do
      expect(teacher.specialization).to eq('Math')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be_truthy
    end
  end
end
