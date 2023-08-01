require_relative '../handlers/PeopleListHandler'
require_relative '../handlers/PersonCreatorHandler'
require_relative '../../ui/inputValidator'

class PeopleManager
  def initialize
    @people = []
    @person_creator = PersonCreator.new
    @people_lister = PeopleListHandler.new(@people)
    @Validator = Validator.new
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp.to_i
    print 'Age: '
    age_s = gets.chomp
    until @Validator.number(age_s)
      puts 'Please enter a valid age (numeric value): '
      age_s = gets.chomp
    end
    age = age_s.to_i
    print 'Name: '
    name = gets.chomp

    case person_type
    when 1
      if age < 18
        puts 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp.downcase
        until @Validator.boolean(parent_permission)
          puts 'Please enter a valid value  [Y/N]: '
          parent_permission = gets.chomp.downcase
        end
      end
      @people.push(@person_creator.add_student(age: age, name: name, parent_permission: parent_permission))
    when 2
      puts 'Specialization: '
      specialization = gets.chomp.strip
      @people.push(@person_creator.add_teacher(age: age, name: name, specialization: specialization))
    else
      puts 'Invalid person type. Use (1) for student or (2) for teacher.'
    end
    puts "\nPerson was created successfully"
  end

  def list_all_people
    @people_lister.list_all_people
  end

  def list_all_people_with_index
    @people_lister.list_all_people_with_index
  end

  def get_person_by_id(id)
    @people.find { |person| person.id == id }
  end

  def get_person_by_index(index)
    @people[index]
  end
end
