
require_relative '../trim_decorator'
require_relative '../person'

describe TrimmerDecorator do
  person = Person.new(23, 'msbmav', 'Sashaaaaaaaaaaaaaaaaaaa')
  context 'When testing correct_name method' do
    it 'returns name with a size = 10 characters' do
      long_name = TrimmerDecorator.new(person)
      expect(long_name.correct_name).to eql('Sashaaaaaa')
    end
  end
end