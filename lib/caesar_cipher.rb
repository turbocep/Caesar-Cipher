# No-state class that ciphers and deciphers messages
class CaesarCipher
  VALID_CHARS = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x
                   y z].freeze
  def self.valid_chars_max_index
    VALID_CHARS.length - 1
  end

  def self.cipher_helper(phrase, shift, symbol)
    phrase.split('').map do |char|
      next char unless VALID_CHARS.include?(char)

      new_ord = VALID_CHARS.find_index(char) + (shift * symbol)
      if new_ord > valid_chars_max_index
        VALID_CHARS[new_ord - valid_chars_max_index - 1]
      else
        VALID_CHARS[new_ord]
      end
    end.join('')
  end

  def self.cipher(phrase, shift)
    cipher_helper(phrase, shift, 1)
  end

  def self.decipher(phrase, shift)
    cipher_helper(phrase, shift, -1)
  end
end

# Why not rewrite this with a linked list? That sounds so much easier to implement.
