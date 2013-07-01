# CS-750 Assignment 3
# Eliot Friedman (Team 2)
class Course
  attr_accessor :course_name,
                :course_id

  def initialize (course_name, course_id)
    @course_name = course_name
    @course_id =course_id
  end

  def to_s; "#{course_name}: #{course_id}" end
end