require_relative '../book'

describe Book do
  context 'With valid paramenters' do
    it 'should create a book with given title' do
      new_book = Book.new('Harry Potter', 'JK Rowling')
      expect(new_book.title).to eq('Harry Potter')
    end
    it 'should create a book with given author' do
      new_book = Book.new('Harry Potter', 'JK Rowling')
      expect(new_book.author).to eq('JK Rowling')
    end
  end
end
