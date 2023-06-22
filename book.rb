class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rentals(person, date)
    Rental.new(date, self, person)
  end

  attr_accessor :title, :author
end
