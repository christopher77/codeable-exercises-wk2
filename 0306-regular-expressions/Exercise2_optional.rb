#Solution 1
def head_smash(arr)
    return "This isn\'t the gym!!" if arr.is_a? Numeric
    return "Gym is empty" if arr.length == 0
    arr.map do |value|
      new_value = value.split("").map do |character|
                    character == 'O' ? " " : character
                  end
      new_value.join("")
    end
end

#Solution 2
def head_smash(arr)
    return "This isn\'t the gym!!" if arr.is_a? Numeric
    return "Gym is empty" if arr.length == 0
    arr.map { |value| value.gsub(/O/, " ") }
end
