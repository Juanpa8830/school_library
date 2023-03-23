require_relative '../classroom'

describe Classroom do
  context 'When testing Classroom class' do
    it 'should create a classroom object with a label a an empty students array' do
      dancing_class = Classroom.new('dancing')
      expect(dancing_class).to be_instance_of(Classroom)
      expect(dancing_class.label).to eq 'dancing'
      expect(dancing_class.students.length).to eq 0
    end
  end
  context 'When testing the add_student method from Classroom class' do
    it 'should add a student to the @students array' do
      classroom = Classroom.new('dancing')
      student = Student.new(17, 'Lucas')
      classroom.add_student(student)
      expect(classroom.students.size).to eq 1
    end
  end
end
