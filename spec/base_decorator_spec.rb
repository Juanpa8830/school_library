require_relative '../base_decorator'

describe BaseDecorator do
  context 'When testing BaseDecorator Class' do
    it 'should create an object from BaseDecorator class' do
      base_dec = BaseDecorator.new('Felipe')
      expect(base_dec).to be_instance_of(BaseDecorator)
      expect(base_dec.nameable).to eq 'Felipe'
    end
  end

  context 'When testing correct_name method' do
    it 'should create an object from BaseDecorator class' do
      decorator_base = BaseDecorator.new('Felipe')
      expect(decorator_base).to be_instance_of(BaseDecorator)
      expect(decorator_base.nameable).to eq 'Felipe'
    end
  end

  let(:mock_nameable) { double('nameable') }
  subject(:decorator_base) { described_class.new(mock_nameable) }
  context 'when the nameable object returns a correct name' do
    it 'returns the correct name' do
      allow(mock_nameable).to receive(:correct_name).and_return('Juan')
      expect(decorator_base.correct_name).to eq('Juan')
    end
  end
end
