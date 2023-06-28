require_relative 'nameable'

class Person < Nameable
  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..99_999)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age, :rentals
  attr_reader :id, :parent_permission

  def can_use_service?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    age >= 18
  end
end
