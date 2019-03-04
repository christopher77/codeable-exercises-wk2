require "http"
require "json"

api1= HTTP.get("https://cat-fact.herokuapp.com/facts/random/")

api2 = HTTP.get("https://aws.random.cat/meow")

puts "HECHOS SOBRE UN GATO"
puts "------------------------------"
puts JSON.parse(api1.to_s)["text"]
puts "Imagen"
puts "------------------"
puts JSON.parse(api2.to_s)["file"]


