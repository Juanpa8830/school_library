require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'book'

math = Classroom.new('Matematicas')
martha = Student.new(20, 'Martha')
pedro = Student.new(15, 'Pedro')


pedro.classroom = math
martha.classroom = math

puts math.students.map(&:name)

puts martha.classroom.label
puts math.label

person_uno = Person.new(20, 'alex')
libro = Book.new('la vida es bella', 'Pierre')
rental_uno = Rental.new('2023-03-15')

libro.add_rentals(rental_uno)
puts libro.rentals.map(&:date)
rental_uno.book = libro
puts libro.rentals.map(&:date)
person_uno.add_rentals(rental_uno)

rental_uno.person = person_uno
puts person_uno.rentals.map(&:date)
