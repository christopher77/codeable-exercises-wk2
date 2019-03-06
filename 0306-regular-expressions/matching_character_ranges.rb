Regex_Pattern = '^[a-z][1-9][^a-z][^A-Z][A-Z]'

print !!(gets =~ /#{Regex_Pattern}/)

