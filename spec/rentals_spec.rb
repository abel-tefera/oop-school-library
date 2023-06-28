require_relative '../student'
require_relative '../rental'
require_relative '../book'

describe Rental do
  context 'Check if person is able to rent book' do
    it 'should create a student and a book to rent' do
      student = Student.new(nil, 36, 'Tyler')
      book = Book.new('Extraction', 'Sam')
      rentals = Rental.new('06/16/2023', book, student)
      expect(rentals.person.name).to eq('Tyler')
      expect(rentals.book.author).to eq('Sam')
      expect(student.rentals[0].book.title).to eq('Extraction')
    end
  end
end
