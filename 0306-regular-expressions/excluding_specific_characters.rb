Regex_Pattern = '^[^0-9][^aeiou][^bcDf][^(\r\n\t\f)][^AEIOU][^.\w]$'

print !!(gets =~ /#{Regex_Pattern}/)