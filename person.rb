require 'securerandom'

require_relative 'nameable'
require_relative 'rental'
require 'json'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission
  attr_reader :id, :rentals

  def initialize(age, id = SecureRandom.uuid, name = 'Unknown', parent_permission: true)
    super()
    @id = id
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

  def to_json(*_args)
    hash = { class: self.class, id:@id, name: @name, age: @age, parent_permission: @parent_permission }
    hash.to_json
  end

  private

  def of_age?
    @age >= 18
  end
  end
