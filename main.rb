require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'book'

person_uno = Student.new(20, 'francisco')
person_dos = Student.new(18, 'Ana')
libro_uno = Book.new('hello World', 'author hello')
libro_dos = Book.new('hello Moon', 'meeeeeee')
renta_uno = Rental.new('2022-03-15', libro_uno, person_uno)
renta_dos = Rental.new('2022-03-15', libro_dos, person_uno)

person_uno.rentals.each{|rental| p [rental.book.title, rental.person.name] }



