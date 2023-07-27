require './nameable'
require './base_decorator'
require './capitalize_decorator'
require './trimmer_decorator'
require './book'
require './classroom'
require './rentals'
require './student'
require './person'

b3 = Classroom.new('B3')
student = Student.new(22, 'Max')
student2 = Student.new(18, 'Mike')
b3.add_student(student)
b3.add_student(student2)
student3 = Student.new(19, 'Lilly', b3)

got = Book.new('GoT', 'George')

rent = Rental.new('Feb-20-2020', got, student)
puts student3.classroom.label;
puts rent.date
puts got.rentals.map { |r| r.person.name }
puts b3.students.map { |s| s.name }
