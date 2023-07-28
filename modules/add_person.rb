require_relative './char_to_bool'

module AddPerson
    include Convert
    def add_student(age, name)
        print "Has parent permission? [Y/N]: "
        STDOUT.flush
        par_perm = char_to_bool(gets.chomp)
        student = Student.new(age, name, par_perm)
    end

    def add_teacher(age, name)
        print "Specialization: "
        STDOUT.flush
        specialty = gets.chomp
        teacher = Teacher.new(age, name, specialty)
    end
end

