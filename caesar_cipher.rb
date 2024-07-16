# frozen_string_literal: true

def caesar_cipher(unencrypted_message, cipher_shift)
  # Need to create a valid letter library that can be accessed with indexes.
  # #ord to go to number. #chr to go to character.
  unencrypted_message.split('').map do |letter|
    letter_code = if letter == ' '
                    32
                  else
                    letter.ord
                  end
    # Checks if letter is valid lowercase.
    if letter_code >= 65 && letter_code <= 90
      letter_code = letter.ord
      # Checks if shifted letter exceeds lowercase range.
      if (letter_code + cipher_shift) > 90
        (letter_code + cipher_shift - 26).chr
      else
        (letter_code + cipher_shift).chr
      end
    # Checks if letter is uppercase.
    elsif letter_code >= 97 && letter_code <= 122
      if (letter_code + cipher_shift) > 122
        (letter_code + cipher_shift - 26).chr
      else
        (letter_code + cipher_shift).chr
      end
    else
      letter
    end
  end.join('')
end

p caesar_cipher('abcdefghijklmnopqrstuvwxyz', 2)
