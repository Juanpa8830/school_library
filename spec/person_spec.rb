require_relative '../person'
require_relative '../rental'
require_relative '../student'

describe Person do
  person = Person.new(28, 'f20f4d7c-f3ac-48e4-a4e6-098e4acf5ae8', 'raul')
  young_person = Student.new(15, 'Francisco', 'f20f4d7c')
  book = Book.new('Hello world', 'author')
  rental = Rental.new('2023/03/23', book, person)

  context 'When testing Person Class' do
    it 'should create an object from Person class' do
      expect(person).to be_instance_of(Person)
      expect(person.name).to eq 'raul'
      expect(person.age).to eq 28
    end
  end

  context 'When testing correct_name method from Person class' do
    it 'should return the correct name of the person' do
      expect(person.correct_name).to eq 'raul'
      expect(young_person.correct_name).to eq 'Francisco'
    end
  end

  context 'When testing can_use_services? method' do
    it 'should return true if age is greater or equals to 18 or have parent permission' do
      expect(person.can_use_services?).to be true
    end
  end

  context 'When testing can_use_service method' do
    it 'should return true if age is is greater or equals to 18 or have parent permission' do
      expect(young_person.can_use_services?).to be true
    end
  end

  context 'When testing add_rental method' do
    it 'should return array of rentals' do
      person.add_rental(rental)
      expect(person.rentals.size).to eq 1
    end
  end

  context 'When testing the to_json method in class Person' do
    it 'should create an JSON file of a hash created with a Person attribute ' do
      expected_json =
        '{"class":"Student","id":"f20f4d7c","name":"Francisco","age":15,"parent_permission":true}'
      person_to_json = young_person.to_json
      expect(person_to_json).to eq expected_json
    end
  end
end
