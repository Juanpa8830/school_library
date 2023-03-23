require_relative '../person'
require_relative '../rental'
require_relative '../student'
require_relative '../book'

describe Rental do
  person = Student.new(27, 'Oscar', 'f20f4d7c-f3ac-48e4-a4e6-098e4acf5ae8')
  book = Book.new('Hello World', 'Author')
  rental = Rental.new('2020/05/21', book, person)

  context 'When testing Rental Class' do
    it 'should create should create an object from Rental class' do
      expect(rental).to be_instance_of(Rental)
    end
  end

  context 'When testing the to_json method in class Rental' do
    it 'should create an JSON file of a hash created with a Rental attribute ' do
      expected_json =
        '{"date":"2020/05/21","book_title":"Hello World","person_id":"f20f4d7c-f3ac-48e4-a4e6-098e4acf5ae8"}'
      rental_to_json = rental.to_json
      expect(rental_to_json).to eq expected_json
    end
  end
end
