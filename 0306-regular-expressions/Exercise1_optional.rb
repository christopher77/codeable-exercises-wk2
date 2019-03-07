def validate_usr(username)
    /^[a-z\d_]{4,16}$/ === username
end