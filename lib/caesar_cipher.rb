class Cipher
    def input
        str = ''

        while str == ''
            puts "Hey there! Let's make a cipher! Gimme a secret code!"
                str = gets.chomp  
        end

        num = 0
        while !(num > 0)
            puts "Okay, how many places are we going to shift by?"
                num = gets.chomp.to_i
        end
        num = num % 26 if num > 26
        convert_to_cipher(str, num)
    end

    def convert_to_cipher(str, shift_by)
        input_arr = str.split('')
        shift_by = shift_by % 26 if shift_by > 26
        output_arr = []

        final_output = input_arr.each do |letter|
            character_value = letter.ord + shift_by
            if letter.ord >= 65 && letter.ord <= 90
                character_value = 65 + (character_value % 91) if character_value > 90
                letter = character_value.chr
            end
            if letter.ord >= 97 && letter.ord <= 122
                character_value = 97 + (character_value % 123) if character_value > 122
                letter = character_value.chr
            end
           
            output_arr.push(letter)
        end
        output_arr.join('')
    end
end 

cipher = Cipher.new

p cipher.input
