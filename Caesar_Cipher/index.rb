def Caesar_Cipher(input, shift)
    for i in 0...input.length do
        char_val = input[i].ord

        (bgn, ed) = case char_val
            when 97..122 then [97, 122]
            when 65..90 then [65, 90] 
            else next
        end

        rotate = shift > 0 ? 26 : -26

        char_val += shift 
        char_val -= rotate unless char_val.between?(bgn, ed)
        input[i] = char_val.chr
    end
end

message = "iterate through characters"

Caesar_Cipher(message, 12)
puts message