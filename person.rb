require 'securerandom'

class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return false unless of_age? || (@parent_permission == true)

    true
  end

  private

  def of_age?
    return false unless @age >= 18

    true
  end
end
