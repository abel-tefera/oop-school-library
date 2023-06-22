require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_persons
    @persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization, parent_permission: true)
    @persons << teacher
    puts 'Person (teacher) created successfully'
  end

  def create_student
    print 'Age: '
    age = Integer(gets.chomp)
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'n'
      student = Student.new(nil, age, name, parent_permission: false)
      @persons << student
    when 'y'
      student = Student.new(nil, age, name, parent_permission: true)
      @persons << student
    else
      'Invalid!'
    end

    puts 'Person (student) created successfully'
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
    return if @books.empty? || @persons.empty?

    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    selected_book = Integer(gets.chomp)

    puts 'Select a person from the following list by number (not ID)'
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age} "
    end

    selected_person = Integer(gets.chomp)

    print 'Date: '
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
    puts '7 - Exit'
  end
end
