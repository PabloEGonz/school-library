def char_to_bool(char)
  if char.downcase == 'y'
    true
  elsif char.downcase == 'n'
    false
  end
end

def add_student(age, name)
  print 'Has parent permission? [Y/N]: '
  $stdout.flush
  par_perm = char_to_bool(gets.chomp)
  Student.new(age, name, par_perm)
end

def add_teacher(age, name)
  print 'Specialization: '
  $stdout.flush
  specialty = gets.chomp
  Teacher.new(age, name, specialty)
end
