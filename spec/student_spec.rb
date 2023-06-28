require_relative '../student'

describe Student do
  context 'With correct paramenters' do
    it 'should create a student with correct name' do
      new_student = Student.new(nil, 60, 'Brozovik')
      expect(new_student.name).to eq('Brozovik')
    end
    it 'should create a student with correct age' do
      new_student = Student.new(nil, 80, 'Christopher')
      expect(new_student.age).to eq(80)
    end
    it 'should create a student who plays hooky' do
      new_student = Student.new(nil, 14, 'Loki')
      expect(new_student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
