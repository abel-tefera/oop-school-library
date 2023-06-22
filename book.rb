class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def addRental(person, date)
    Rental.new(date, self, person)
  end

  attr_accessor :title, :author, :rentals
end
