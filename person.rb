require 'securerandom'

require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def rental_list
    list = ''
    @rentals.each { |rental| list << "\n[#{rental.date} - #{rental.book.title} - #{rental.person.name}]" }
    list << "\n\n"
  end

  private

  def of_age?
    @age >= 18
  end
end
