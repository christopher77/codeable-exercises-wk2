def stress(word)
    index_block_text = /(ic|sion|tion|ious|ty|al|ise|ate)$/ =~ word
    if /^([3-9]|1[0-1])/ === word && index_block_text != nil
        number_syllable_stressed = -1
        syllable_stressed = "pen"
        if /(ty|al|ise|ate)$/ === word
            number_syllable_stressed = -2 
            syllable_stressed = "ante-pen"
        end
        word[index_block_text..(word.length - 1)] = syllable_stressed
        word[0...index_block_text] = (word[0...index_block_text].to_i + number_syllable_stressed).to_s
        word
    else
        "invalid word"
    end
end

