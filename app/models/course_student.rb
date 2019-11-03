class CourseStudent < ApplicationRecord
  validates_presence_of :grade

  belongs_to :course
  belongs_to :student
end
