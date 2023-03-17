require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'person'
require_relative 'app'

# book_uno = Book.new("hola amigos", "Author1")
# book_dos = Book.new("adios señores", "Author2")
# book_tres = Book.new("y entocnes?", "Author3")
#
# person_uno = Student.new(16, "Pierre")
# person_dos = Teacher.new(16, "francisco")
# person_tres = Student.new(16, "Juan")
#
# rental_uno = Rental.new('2018-05-20', book_uno, person_uno)
# rental_dos = Rental.new('2019-06-22', book_dos, person_dos)
# rental_tres = Rental.new('2022-08-30', book_tres, person_tres)
# puts book_uno.rental_list

def main
  app = App.new
  app.start
  puts 'Thanks for using this app!'
end

main
