def catch_sign_change(arr)
    arr.each_cons(2).select{|a, b| (a > -1 && b < 0) || (a < 0 && b > -1) }.size
end