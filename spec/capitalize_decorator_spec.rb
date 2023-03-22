require_relative '../capitalize_decorator'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'

describe CapitalizeDecorator do
  context 'When testing the CapitalizeDecorator class' do
    it 'should capitalize a name' do
      person = Person.new(30, 'akajdcn', 'pedro')
      teacher = Teacher.new(26, 'filosophy', 'oscar', 'shcsks')
      student = Student.new(20, 'Maria', 'queceknj')
      capitalized_person = CapitalizeDecorator.new(person)
      capitalized_teacher = CapitalizeDecorator.new(teacher)
      capitalized_student = CapitalizeDecorator.new(student)
      expect(capitalized_person.correct_name).to eq 'Pedro'
      expect(capitalized_teacher.correct_name).to eq 'Oscar'
      expect(capitalized_student.correct_name).to eq 'Maria'
    end
  end
end
