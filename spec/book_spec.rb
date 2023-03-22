require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Book do
  context 'When testing the Book_class' do
    it "should create an object instance of the class Book with title = 'La Iliada', author = 'Homero'" do
      book = Book.new('La Iliada', 'Homero')
      expect(book).to be_instance_of(Book)
      expect(book.title).to eq 'La Iliada'
      expect(book.author).to eq 'Homero'
    end
  end

  context 'When testing the add_rental method in class Book' do
    it 'should add a rental object to the @rentals array in Book class' do
      book = Book.new('La Iliada', 'Homero')
      bookdos = Book.new('hola', 'autor')
      person = Person.new(30, 'xxx2', 'Juan')
      persondos = Person.new(25, 'xxx3', 'Pedro')
      rental = Rental.new('2022-05-08', book, person)
      rentaldos = Rental.new('2023-04-08', bookdos, persondos)
      book.add_rental(rental)
      book.add_rental(rentaldos)
      expect(book.rentals.size).to eq 2
    end
  end

  context 'When testing the to_json method in class Book' do
    it 'should create an JSON file of a hash created with a book attribute ' do
      book = Book.new('La Iliada', 'Homero')
      expected_json = '{"title":"La Iliada","author":"Homero"}'
      book_to_json = book.to_json
      expect(book_to_json).to eq expected_json
    end
  end
end
