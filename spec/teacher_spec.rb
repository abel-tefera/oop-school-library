require_relative '../teacher'

describe Teacher do
  context 'With correct paramenters' do
    it 'should create a teacher with given name' do
      teacher = Teacher.new(40, 'Nathan', 'BsC')
      expect(teacher.name).to eq('Nathan')
      expect(teacher.specialization).to eq('BsC')
    end
    it 'should create a teacher who can use service' do
      teacher = Teacher.new(24, 'Mr. Wick', 'BsC')
      expect(teacher.can_use_service?).to eq(true)
    end
  end
end
