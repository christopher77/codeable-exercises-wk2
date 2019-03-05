def scramble(str, arr)
    palabra=str.split("")
    orden = Array.new(arr.length,"")
    palabra.each.with_index do |value, index|
      orden[arr[index]]= value
    end
    orden.join("")
  end  