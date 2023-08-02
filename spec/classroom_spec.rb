require_relative 'spec_helper'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Test room')
    @student = Student.new(id: 1, age: 20, name: 'Test student')
  end

  it 'initializes with correct attributes' do
    expect(@classroom.label).to eq('Test room')
    expect(@classroom.students).to eq([])
  end

  it "adds student to the classroom's students" do
    @classroom.add_student(@student)
    expect(@classroom.students).to include(@student)
  end

  it 'assigns the classroom to the added student' do
    @classroom.add_student(@student)
    expect(@student.classroom).to eq(@classroom)
  end
end
