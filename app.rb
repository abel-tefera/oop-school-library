require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'create_persons'
require 'json'

class App
  attr_accessor :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def read_file(file)
    if File.exist?("db/#{file}.json")
      File.read("db/#{file}.json")
    else
      empty_json = [].to_json
      File.write("db/#{file}.json", empty_json)
      empty_json
    end
  end

  def generate_saved_data
    books = JSON.parse(read_file('books'))
    persons = JSON.parse(read_file('persons'))
    rentals = JSON.parse(read_file('rentals'))

    books.each do |book|
      @books << Book.new(book['title'], book['author'])
    end

    persons.each do |person|
      @persons << if person['type'] == 'Teacher'
                    Teacher.new(person['age'], person['name'], person['specialization'], parent_permission: true)
                  else
                    Student.new(nil, person['age'], person['name'], parent_permission: person['parent_permission'])
                  end
    end

    rentals.each do |rental|
      rentee = @persons.select { |person| person.name == rental['renter'] }
      rented_book = @books.select { |book| book.title == rental['rented_book'] }
      @rentals << Rental.new(rental['date'], rented_book[0], rentee[0])
    end
  end

  def save_books
    books_to_save = []

    @books.each do |book|
      books_to_save << { 'title' => book.title, 'author' => book.author }
    end

    File.write('db/books.json', JSON.pretty_generate(books_to_save))
  end

  def save_persons
    persons_to_save = []

    @persons.each do |person|
      if person.instance_of?(::Teacher)
        persons_to_save << { 'type' => 'Teacher', 'id' => person.id, 'name' => person.name, 'age' => person.age,
                             'specialization' => person.specialization }
      elsif person.instance_of?(::Student)
        persons_to_save << { 'type' => 'Student', 'id' => person.id, 'name' => person.name, 'age' => person.age,
                             'parent_permission' => person.parent_permission }
      end
    end

    File.write('db/persons.json', JSON.pretty_generate(persons_to_save))
  end

  def save_rentals
    rentals_to_save = []

    @rentals.each do |rental|
      rentals_to_save << { 'renter' => rental.person.name, 'rented_book' => rental.book.title,
                           'date' => rental.date }
    end

    File.write('db/rentals.json', JSON.pretty_generate(rentals_to_save))
  end

  def save_and_exit
    puts 'Data has been saved! Thank you for using this app!'

    save_books

    save_persons

    save_rentals

    exit
  end

  def list_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_persons
    @persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    selected_person_type = Integer(gets.chomp)
    case selected_person_type
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    if @books.empty?
      puts 'Please create a book first'
      return
    elsif @persons.empty?
      puts 'Please create at least one person first'
      return
    end

    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    selected_book = Integer(gets.chomp)

    puts 'Select a person from the following list by number (not ID)'
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age} "
    end

    selected_person = Integer(gets.chomp)

    print 'Date (MM/DD/YYYY)): '
    selected_date = gets.chomp.to_s

    rented = Rental.new(selected_date, @books[selected_book], @persons[selected_person])
    @rentals << rented

    puts 'Rental created successfully'
  end

  def list_rental
    print 'Enter the Person ID: '
    person_id = Integer(gets.chomp)
    @rentals.each do |rent|
      if rent.person.id == person_id
        puts "Date: #{rent.date}, Book: \"#{rent.book.title}\" written by #{rent.book.author}"
      end
    end
  end

  def invalid_option
    puts 'Invalid option'
  end

  def options
    puts 'Please choose an option from the following: '
    puts '1 - List all books'
    puts '2 - List all persons'
    puts '3 - Create a person (teacher or student)'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Save & Exit'
  end
end
