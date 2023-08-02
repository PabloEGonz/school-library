require_relative 'spec_helper'

class Fake < Decorator
  def correct_name
    'Yay!'
  end
end

describe Decorator do
  context 'Decorator is without any other class' do
    it 'It raises error' do
      name = Decorator.new('pablo')

      expect { name.correct_name }.to raise_error(NotImplementedError)
    end
  end
  context 'Decorator is inherited to other class which has the method' do
    it 'It returns what is in the method' do
      name = Fake.new('pablo')
      result = name.correct_name
      expect(result).to eq 'Yay!'
    end
  end
end
