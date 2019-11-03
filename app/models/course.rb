class Course < ApplicationRecord
  validates_presence_of :name

  has_many :course_students
  has_many :students, through: :course_students

  def sort_course_students_by_grade
    course_students.order(grade: :desc)
  end
end
