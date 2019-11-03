require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :course_students}
    it {should have_many(:courses).through(:course_students)}
  end

  describe 'instance methods' do
    it 'can calculate grade for a specific course' do
      history = Course.create(name: 'History')
      andy = Student.create(name: 'Andy Dwyer')
      CourseStudent.create(course_id: history.id, student_id: andy.id, grade: 2.4)

      expect(andy.grade(history.id)).to eq(2.4)
    end
  end
end
