require_relative 'spec_helper'

describe TrimmerDecorator do
  context 'Trimer is working as expected' do
    it 'Trims names longer than 10 chars' do
      trimmer = TrimmerDecorator.new('Ezequielpablo')

      result = trimmer.correct_name

      expect(result).to eq 'Ezequielpa'
    end
    it 'Names no longeer than 10 chars stay the same' do
      trimmer = TrimmerDecorator.new('Pablo')

      result = trimmer.correct_name

      expect(result).to eq 'Pablo'
    end
  end
end
