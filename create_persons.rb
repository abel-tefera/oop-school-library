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