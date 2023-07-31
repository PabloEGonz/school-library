require_relative '../handlers/PeopleListHandler'
require_relative '../handlers/PersonCreatorHandler'

class PeopleManager
  def initialize
    @people = []
    @person_creator = PersonCreator.new
    @people_lister = PeopleListHandler.new(@people)
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp.to_i

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    case person_type
    when 1
      print 'Can use services? (true or false): '
      can_use_services = gets.chomp.downcase == 'true'
      @people.push(@person_creator.add_student(age: age, name: name, can_use_services: can_use_services))
    when 2
      print 'Specialization: '
      specialization = gets.chomp.strip
      @people.push(@person_creator.add_teacher(age: age, name: name, specialization: specialization))
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
