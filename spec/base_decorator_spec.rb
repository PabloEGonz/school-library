require_relative 'spec_helper'

describe Decorator do
  context 'Decorator is without any other class' do
    it 'It raises error' do
      name = Decorator.new('pablo')

      expect { name.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
