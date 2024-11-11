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
    context 'when shift is 2' do
      let(:shift) { 2 }
      context "and 'Hello World!' is given as phrase" do
        it "returns 'Jgnnq Yqtnf!" do
          phrase = 'Hello World!'
          expect(CaesarCipher.cipher(phrase, shift)).to eq('Jgnnq Yqtnf!')
        end
      end
      context "and 'I have 5 fingers on each hand' is given as a phrase" do
        it "returns 'K jcxg 5 hkpigtu qp gcej jcpf'" do
          phrase = 'I have 5 fingers on each hand'
          out_phrase = 'K jcxg 5 hkpigtu qp gcej jcpf'
          expect(CaesarCipher.cipher(phrase, shift)).to eq(out_phrase)
        end
      end
    end
  end
  describe '.decipher' do
    context 'when empty string is given as phrase' do
      it 'returns empty string' do
        result = CaesarCipher.decipher('', 2)
        expect(result).to eq('')
      end
    end
    context 'when alphabet is given as phrase' do
      context 'when shift is 0' do
        it 'returns input phrase' do
          phrase = 'abcdefghijklmnopqrstuvwxyz'
          shift = 0
          result = CaesarCipher.decipher(phrase, shift)
          expect(result).to eq(phrase)
        end
      end
      context 'when shift is 1' do
        it 'returns input phrase' do
          phrase = 'bcde'
          shift = 1
          result = CaesarCipher.decipher(phrase, shift)
          expect(result).to eq('abcd')
        end
      end
      context 'when shift is -1' do
        it 'returns input phrase' do
          phrase = 'abcd'
          shift = -1
          result = CaesarCipher.decipher(phrase, shift)
          expect(result).to eq('bcde')
        end
      end
      context 'when shift is 5' do
        it 'returns input phrase' do
          phrase = 'fghijkl'
          shift = 5
          result = CaesarCipher.decipher(phrase, shift)
          expect(result).to eq('abcdefg')
        end
      end
    end
    context 'when shift is 2' do
      let(:shift) { 2 }
      context "and 'Hello World!' is given as phrase" do
        it "returns 'Jgnnq Yqtnf!" do
          phrase = 'Jgnnq Yqtnf!'
          expect(CaesarCipher.decipher(phrase, shift)).to eq('Hello World!')
        end
      end
      context "and 'I have 5 fingers on each hand' is given as a phrase" do
        it "returns 'K jcxg 5 hkpigtu qp gcej jcpf'" do
          phrase = 'K jcxg 5 hkpigtu qp gcej jcpf'
          out_phrase = 'I have 5 fingers on each hand'
          expect(CaesarCipher.decipher(phrase, shift)).to eq(out_phrase)
        end
      end
    end
  end
  describe '.cipher && .decipher' do
    context 'when phrase is ciphered, then deciphered' do
      it 'equals the initial phrase' do
        initial_phrase = 'Hi there! My name is Turbocep. My favorite symbol is
                          the octothorpe(#) and my favorite number is 42!'
        shift = 5
        ciphered = CaesarCipher.cipher(initial_phrase, shift)
        deciphered = CaesarCipher.decipher(ciphered, shift)
        expect(deciphered).to eq(initial_phrase)
      end
    end
  end
end
