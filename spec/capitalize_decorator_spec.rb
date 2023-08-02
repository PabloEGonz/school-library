require_relative 'spec_helper'

describe CapitalizeDecorator do
  context 'Capitalization is working as expected' do
    it 'Capitalizes the first letter' do
      name = CapitalizeDecorator.new('pablo')

      result = name.correct_name

      expect(result).to eq 'Pablo'
    end
    it 'Names already capitalized stay the same' do
      name = CapitalizeDecorator.new('Eze')

      result = name.correct_name

      expect(result).to eq 'Eze'
    end
  end
end
