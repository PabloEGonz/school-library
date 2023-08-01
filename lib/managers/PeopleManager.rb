require_relative '../handlers/PeopleListHandler'
require_relative '../handlers/PersonCreatorHandler'
require_relative '../../ui/inputValidator'

class PeopleManager
  def initialize
    @people = []
    @person_creator = PersonCreatorHandler.new
    @people_lister = PeopleListHandler.new(@people)
    @validator = Validator.new
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp.to_i
    print 'Age: '
    age_s = gets.chomp
    until @validator.number(age_s)
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
        until @validator.boolean(parent_permission)
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

  def load_people(people_data)
    puts "Loading people_data: #{people_data}"
    @people = people_data.map do |person_data|
      class_type = person_data['class']
      person =
        case class_type
        when 'Student'
          Student.new(
            id: person_data['id'],
            name: person_data['name'],
            age: person_data['age'],
            parent_permission: person_data['parent_permission']
          )
        when 'Teacher'
          Teacher.new(
            id: person_data['id'],
            age: person_data['age'],
            name: person_data['name'],
            specialization: person_data['specialization']
          )
        end

      unless person_data['classroom'].nil? || !person.respond_to?(:classroom=)
        person.classroom = person_data['classroom']
      end

      person
    end.compact
  end

  def save_people_data
    people_data = @people.map do |person|
      {
        class: person.class.name,
        id: person.id,
        name: person.name,
        age: person.age,
        parent_permission: person.parent_permission,
        rentals: person.rentals.map(&:id),
        classroom: person.respond_to?(:classroom) ? person.classroom : nil,
        specialization: person.respond_to?(:specialization) ? person.specialization : nil
      }
    end

    File.write('people.json', JSON.pretty_generate(people_data))
  end
end
