require_relative '../student'
require_relative '../classroom'

describe ClassRoom do
  context 'With valid paramenters' do
    it 'should assign a new student to a classroom' do
      student = Student.new(nil, 24, 'Abel')
      classroom = ClassRoom.new('Crypto101')
      classroom.add_students(student)
      expect(classroom.students[0].name).to eq('Abel')
      expect(student.classroom.label).to eq('Crypto101')
    end
  end
end
