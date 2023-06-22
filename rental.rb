class Rental
  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
    person.rentals << self
    book.rentals << self
  end

  attr_accessor :date
  attr_reader :person, :book
end
