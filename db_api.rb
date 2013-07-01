# CS-750 Assignment 3
# Eliot Friedman (Team 2)

require 'yaml'
require_relative 'student'
require_relative 'course'

class DbApi

  # Reads all the students from the YAML file into a class variable
  @@students = YAML::load(File.open('university_db.yml'))

  def self.students
    return @@students
  end

  def self.select_by_gender(gender)
    selected_rows = []
    students.each { |student| selected_rows << student if student.gender == gender }
    return selected_rows
  end

  def self.select_by_first_name(first_name)
    selected_rows = []
    students.each { |student| selected_rows << student if student.first_name =~ /#{first_name}/}
    return selected_rows
  end

  def self.select_by_last_name(last_name)
    selected_rows = []
    students.each { |student| selected_rows << student  if student.last_name =~ /#{last_name}/}
    return selected_rows
  end

  def self.select_by_weight_more_than(pounds)
    selected_rows = []
    students.each { |student| selected_rows << student if student.pounds.to_f > pounds}
    return selected_rows
  end
end
