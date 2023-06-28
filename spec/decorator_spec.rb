require_relative '../person'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'patrick') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe 'Capitalization Decorator Test' do
    it 'should capitalize a person\'s name' do
      expect(decorator.correct_name).to eq('Patrick')
    end
  end
end

describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe 'Trimmer Decorator Test' do
    it 'trims the name down if it\'s longer than 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('LordBendtner')

      expect(decorator.correct_name).to eq('LordBendtn')
    end
  end
end
