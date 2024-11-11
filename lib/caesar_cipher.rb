# No-state class that ciphers and deciphers messages
class CaesarCipher
  def self.cipher(phrase, shift = 0)
    return '' if phrase == ''

    phrase.split('').map do |char|
      (char.ord + shift).chr
    end.join('')
  end
end
