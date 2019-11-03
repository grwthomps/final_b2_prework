require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :course_students}
    it {should have_many(:students).through(:course_students)}
  end

  describe 'instance methods' do
    it 'can sort course_students by grade descending' do
    history = Course.create(name: 'History')

    andy = Student.create(name: 'Andy Dwyer')
    april = Student.create(name: 'April Ludgate')
    tom = Student.create(name: 'Tom Haverford')
    leslie = Student.create(name: 'Leslie Knope')

    andy_cs = CourseStudent.create(course_id: history.id, student_id: andy.id, grade: 1.5)
    april_cs = CourseStudent.create(course_id: history.id, student_id: april.id, grade: 3.4)
    tom_cs = CourseStudent.create(course_id: history.id, student_id: tom.id, grade: 2.3)
    leslie_cs = CourseStudent.create(course_id: history.id, student_id: leslie.id, grade: 4.0)

    expect(history.sort_course_students_by_grade).to eq([leslie_cs, april_cs, tom_cs, andy_cs])
    end
  end
end
