# CS-750 Assignment 3
# Eliot Friedman (Team 2)

require 'httparty'

class MyRestClient
  include HTTParty
  default_params onlyImages: 1

  def self.for(keyword)
    get('http://www.recipepuppy.com/api/', query: {q: keyword})
  end
end

puts MyRestClient.for("Chocolate")
puts MyRestClient.for("Apple Pie")
