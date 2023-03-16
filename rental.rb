require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.add_rental(self)  

    @person = person
    person.add_rental(self)  
  end
end
