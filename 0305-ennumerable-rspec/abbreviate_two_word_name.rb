def abbrev_name(name)
    first_letters = name.split(" ")
    first_letters.map{|value| value[0]}.join(".").upcase
end