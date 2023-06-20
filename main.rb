require_relative 'person'
require_relative 'base_decorator'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'

person = Person.new(22, 'maximilianus')
puts "Undecorated Name is '#{person.correct_name}'"
caps_name = CapitalizeDecorator.new(person)
puts "Capitalized Name is '#{caps_name.correct_name}'"
trimmed_name = TrimmerDecorator.new(caps_name)
puts "Trimmed, Capitalized Name is '#{trimmed_name.correct_name}'"
