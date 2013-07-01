# CS-750 Assignment 3
# Eliot Friedman (Team 2)

require 'yaml'
require_relative 'student'
require_relative 'course'

class DbApiBeta

  # Reads all the students from the YAML file into a class variable
  @@students = YAML::load(File.open('university_db.yml'))

  def self.method_missing(method, *args)
    # Extract desired field, resolving first/last name ambiguous naming convention
    all_fields = method.to_s.split('_')
    desired_field = all_fields.pop
    desired_field = all_fields.pop + '_' + desired_field if desired_field == "name"
    make_symbol = desired_field.to_sym
    operator = args[0]
    value = args[1]

    selected_rows = []
    @@students.each do |student|
          discriminator = student.send(make_symbol)
          # Recast discriminator as a float, if we were passed a number
          discriminator = discriminator.to_f if value.class == Fixnum
          selected_rows << student if discriminator.send(operator, value)
    end
    return selected_rows
  end
end

