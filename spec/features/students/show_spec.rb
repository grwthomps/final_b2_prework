require 'rails_helper'

RSpec.describe 'Student show page', type: :feature do
  it 'can show student name, courses, and grades' do
    history = Course.create(name: 'History')
    philosophy = Course.create(name: 'Philosophy')
    chemistry = Course.create(name: 'Chemistry')

    andy = Student.create(name: 'Andy Dwyer')
    april = Student.create(name: 'April Ludgate')

    CourseStudent.create(course_id: history.id, student_id: andy.id, grade: 2.4)
    CourseStudent.create(course_id: history.id, student_id: april.id, grade: 3.8)
    CourseStudent.create(course_id: philosophy.id, student_id: april.id, grade: 4.0)
    CourseStudent.create(course_id: chemistry.id, student_id: andy.id, grade: 1.5)

    visit "/students/#{andy.id}"

    expect(page).to have_content('Andy Dwyer')
    expect(page).to have_content('History - 2.4')
    expect(page).to have_content('Chemistry - 1.5')

    expect(page).to_not have_content('April Ludgate')
    expect(page).to_not have_content('Philosophy')
  end
end
