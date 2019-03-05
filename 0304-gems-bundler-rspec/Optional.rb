require "http"
require "json"

def convert_JSON (value)
    JSON.parse(value.to_s)
end

#Declare Apis
url_api_1 = "https://swapi.co/api/people/"
url_api_2 = "http://numbersapi.com/"
url_api_3 = "https://pokeapi.co/api/v2/pokemon/"

#Generate a random number from total elements in API 1
num_elements = convert_JSON(HTTP.get(url_api_1))["count"].to_i
random_number = rand(1..num_elements)

#Call APIs
fact_number = HTTP.get(url_api_2 + random_number.to_s + "/trivia/")
pokemon_number = convert_JSON(HTTP.get(url_api_3 + random_number.to_s + "/"))["name"]
star_wars_data = convert_JSON(HTTP.get(url_api_1 + random_number.to_s + "/"))
name_character = star_wars_data["name"]
films_character = star_wars_data["films"].reduce(""){ |films, value|
                    films_data = convert_JSON(HTTP.get(value))
                    films += "Episode "
                    films += films_data["episode_id"].to_s
                    films += ": "
                    films += films_data["title"]
                    films += "\n"
                }

#Show results
puts "Y el número aleatorio de ahora es el....\n\n"
puts random_number.to_s
puts "\nAlgunos importantes datos sobre este número son:\n\n"
puts "- " + fact_number
puts "\n- El personaje de Star Wars con ese número es....\n\n"
puts name_character
puts "\nQuien participó en las siguientes peliculas:\n\n"
puts films_character
puts "\n- El Pokemon quien se ubica en este número en el Pokedex es....\n\n"
puts pokemon_number.capitalize

