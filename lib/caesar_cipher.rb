class Cipher
    # Input 

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
        
    if num > 26
        num = num % 26
    end

    # End of input

    # Create alphabet hashes

        lowercase_counter = 1
        lowercase_abc_array = []

        26.times do |x|
            lowercase_abc_array.push((x+97).chr)
        end

        lowercase_hash = lowercase_abc_array.reduce(Hash.new(0)) do |letter,code|
            letter[code] = lowercase_counter
            lowercase_counter += 1
            letter
        end
        
        uppercase_counter = 1
        uppercase_abc_array = []
        
        26.times do |x|
            uppercase_abc_array.push((x+65).chr)
        end

        uppercase_hash = uppercase_abc_array.reduce(Hash.new(0)) do |letter,code|
            letter[code] = uppercase_counter
            uppercase_counter += 1
            letter
        end

    # End of creating alphabet hashes

    # Convert input into cipher code

        input_arr = str.split('')
    
        output_arr = []

        final_output = input_arr.each do |letter|

            low_hash_index = lowercase_hash[letter] + num
            upper_hash_index = uppercase_hash[letter] + num

            # Allows for numbers over 26
            if low_hash_index > 26
                low_hash_index = low_hash_index % 26
            end
            if upper_hash_index > 26
                upper_hash_index = upper_hash_index % 26
            end

            # Searches hashes for a matching uppercase or lowercase letter and adds results to final array.
            if lowercase_hash.invert[lowercase_hash[letter]] == letter
                output_arr.push(lowercase_hash.invert[low_hash_index])
            elsif uppercase_hash.invert[uppercase_hash[letter]] == letter
                output_arr.push(uppercase_hash.invert[upper_hash_index])
            else 
                output_arr.push(letter)
            end
        
        end

    # End of converting input into cipher code

    puts output_arr.join('')

end 