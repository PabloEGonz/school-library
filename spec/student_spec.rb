require 'rspec'

require_relative 'spec_helper'

describe Student do
  let(:student) { Student.new(id: 1, age: 15, name: 'Alice', parent_permission: true) }

  describe '#initialize' do
    it 'sets the id correctly' do
      expect(student.id).to eq(1)
    end

    it 'sets the age correctly' do
      expect(student.age).to eq(15)
    end

    it 'sets the name correctly' do
      expect(student.name).to eq('Alice')
    end

    it 'sets the default parent_permission correctly' do
      expect(student.parent_permission).to be_truthy
    end

    it 'allows overriding the default parent_permission' do
      student_no_permission = Student.new(id: 2, age: 16, name: 'Jaanis', parent_permission: false)
      expect(student_no_permission.parent_permission).to be_falsey
    end
  end

  describe '#classroom=' do
    let(:classroom) { double('Classroom', students: []) }

    it 'updates the classroom' do
      expect { student.classroom = classroom }.to change {
                                                    student.instance_variable_get(:@classroom)
                                                  }.from(nil).to(classroom)
    end

    it 'removes itself from the previous classroom students list' do
      old_classroom = double('Old Classroom', students: [student])
      student.instance_variable_set(:@classroom, old_classroom)

      allow(old_classroom.students).to receive(:delete).with(student)
      student.classroom = classroom
    end
  end

  describe '#play_hooky' do
    it 'returns the hooky message' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#can_use_services?' do
    context 'when student is of age' do
      let(:student) { Student.new(id: 3, age: 18, name: 'Morse', parent_permission: false) }

      it 'returns true' do
        expect(student.can_use_services?).to be_truthy
      end
    end

    context 'when student is not of age but has parent permission' do
      it 'returns true' do
        expect(student.can_use_services?).to be_truthy
      end
    end

    context 'when student is not of age and does not have parent permission' do
      let(:student) { Student.new(id: 666, age: 16, name: 'Chelsea', parent_permission: false) }

      it 'returns false' do
        expect(student.can_use_services?).to be_falsey
      end
    end
  end
end
