require_relative '../models/Person'

class PeopleListHandler
  def initialize(people)
    @people = people
  end

  def list_all_people
    @people.each do |person|
      puts " - [#{person.class.name}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def list_all_people_with_index
    @people.each.with_index do |person, i|
      puts "(#{i + 1}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end
end
