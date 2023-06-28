require_relative '../person'

describe Person do
  context 'Test for creating persons' do
    it 'should create a person with correct name' do
      new_person = Person.new(150, 'Keanu', true)
      expect(new_person.name).to eq('Keanu')
    end
    it 'should create a person with correct age' do
      new_person = Person.new(150, 'Keanu', false)
      expect(new_person.age).to eq(150)
    end
    it 'should create a person with correct parent permission' do
      new_person = Person.new(150, 'Keanu', false)
      expect(new_person.parent_permission).to eq(false)
    end
  end
end
