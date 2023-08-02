require 'rspec'

require_relative 'spec_helper'

class SomeClass < Nameable
  def correct_name
    'SomeName'
  end
end

describe SomeClass do
  context 'when using the SomeClass subclass' do
    let(:nameable_instance) { SomeClass.new }

    it 'returns the correct name' do
      expect(nameable_instance.correct_name).to eq('SomeName')
    end
  end
end
