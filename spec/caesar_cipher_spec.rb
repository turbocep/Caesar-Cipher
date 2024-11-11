require_relative '../lib/caesar_cipher'

describe CaesarCipher do
  describe '.cipher' do
    context 'when empty string is given as phrase' do
      it 'returns empty string' do
        phrase = ''
        result = CaesarCipher.cipher(phrase, 2)
        expect(result).to eq('')
      end
    end
    # Testing that different shifts respond
    context 'when alphabet is given as phrase' do
      context 'when shift is 0' do
        it 'returns input phrase' do
          phrase = 'abcdefghijklmnopqrstuvwxyz'
          shift = 0
          result = CaesarCipher.cipher(phrase, shift)
          expect(result).to eq(phrase)
        end
      end
      context 'when shift is 1' do
        it 'returns input phrase' do
          phrase = 'abcd'
          shift = 1
          result = CaesarCipher.cipher(phrase, shift)
          expect(result).to eq('bcde')
        end
      end
      context 'when shift is -1' do
        it 'returns input phrase' do
          phrase = 'bcde'
          shift = -1
          result = CaesarCipher.cipher(phrase, shift)
          expect(result).to eq('abcd')
        end
      end
      context 'when shift is 5' do
        it 'returns input phrase' do
          phrase = 'abcdefg'
          shift = 5
          result = CaesarCipher.cipher(phrase, shift)
          expect(result).to eq('fghijkl')
        end
      end
    end
  end
end
