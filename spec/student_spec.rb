require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @student = Student.new(28, 'Victor', 'f20f4d7c-f3ac-48e4-a4e6-098e4acf5ae8')
  end

  context 'testing methods' do
    it 'Makes a new object' do
      expect(@student).to be_instance_of(Student)
    end

    it '#play_hooky' do
      expect(@student.play_hooky).to eql('¯(ツ)/¯')
    end

    it 'add to a classroom #classroom' do
      classroom = Classroom.new('Math')
      @student.classroom = classroom
      expect(@student.classroom).to eq(classroom)
    end
  end
end
