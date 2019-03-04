require "http"
require "json"

data_taco = HTTP.get("http://taco-randomizer.herokuapp.com/random/")

headers = ["mixin", "seasoning", "base_layer", "condiment", "shell"]
json_data = JSON.parse(data_taco.to_s)

puts "PRUEBA ALGUNAS DE LAS SIGUIENTES RECETAS PARA PREPARA UNOS RICOS TACOS"
puts "-"*120
headers.each { |value| 
    puts json_data[value]["recipe"]
    puts "\nPuedes encontrar mas información en: " + json_data[value]["url"]
    puts "\n" + "-"*120
}