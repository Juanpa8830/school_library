require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def rental_list
    list = ''
    @rentals.each { |rental| list << "(#{rental.date} | #{rental.book.title} | #{rental.person.name})" }
    list
  end
end
