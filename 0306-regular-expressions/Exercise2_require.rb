def validate_code(code)
    /^[1-3]/.match(code.to_s) != nil
end