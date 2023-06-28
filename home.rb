require_relative 'app'

def menu(app)
  app.options
  print 'Prompt > '
  gets.chomp.to_i
end

def manage_selection(app, option)
  tasks = {
    1 => :list_books,
    2 => :list_persons,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rental,
    7 => :exit,
    default: :invalid_option
  }

  puts 'Thank you for using this app!' if option == 7

  selection = tasks[option] || tasks[:default]
  app.send(selection)

  return unless option == 7

  exit
end

def home(app)
  puts '------------------------------'
  puts 'Welcome to School Library App!'
  puts '------------------------------'

  loop do
    manage_selection(app, menu(app))
    puts "\n"
  end
end
