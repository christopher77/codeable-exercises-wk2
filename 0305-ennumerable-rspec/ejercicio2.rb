def separar(array)
    a= array.partition{|number| number>0}
  [a[0].length,a[1].sum]
end

puts separar([1,-3,2,-4,-7]).inspect