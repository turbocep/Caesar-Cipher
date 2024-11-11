# No-state class that ciphers and deciphers messages
class CaesarCipher
  VALID_CHARS = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze

  def self.cipher(phrase, shift)
    phrase.split('').map do |char|
      VALID_CHARS.include?(char.downcase) ? (char.ord + shift).chr : char
    end.join('')
  end

  def self.decipher(phrase, shift)
  end
end
