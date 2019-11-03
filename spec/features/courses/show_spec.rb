require 'rails_helper'

RSpec.describe 'Course show page', type: :feature do
  it 'can show course name and students ordered by grade descending' do
    history = Course.create(name: 'History')
    philosophy = Course.create(name: 'Philosophy')

    andy = Student.create(name: 'Andy Dwyer')
    april = Student.create(name: 'April Ludgate')
    tom = Student.create(name: 'Tom Haverford')
    leslie = Student.create(name: 'Leslie Knope')
    ron = Student.create(name: 'Ron Swanson')

    CourseStudent.create(course_id: history.id, student_id: andy.id, grade: 1.5)
    CourseStudent.create(course_id: history.id, student_id: april.id, grade: 3.4)
    CourseStudent.create(course_id: history.id, student_id: tom.id, grade: 2.3)
    CourseStudent.create(course_id: history.id, student_id: leslie.id, grade: 4.0)
    CourseStudent.create(course_id: philosophy.id, student_id: ron.id, grade: 0.0)

    visit "/courses/#{history.id}"

    expect(page).to have_content('History')

    within '#student-0' do
      expect(page).to have_content('Leslie Knope - 4.0')
    end

    within '#student-1' do
      expect(page).to have_content('April Ludgate - 3.4')
    end

    within '#student-2' do
      expect(page).to have_content('Tom Haverford - 2.3')
    end

    within '#student-3' do
      expect(page).to have_content('Andy Dwyer - 1.5')
    end

    expect(page).to_not have_content('Philosophy')
    expect(page).to_not have_content('Ron Swanson')
  end
end
