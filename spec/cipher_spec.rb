#spec/cipher_spec.rb
require 'caesar_cipher.rb'

describe Cipher do
    describe '#convert_to_cipher' do 
        context 'when input is abc and shift is 2' do
            it "shifts letters by 2 places" do
                expect(Cipher.new.convert_to_cipher('abc', 2)).to eq("cde")
            end
        end    

        context 'when input has capital/lowercase letters' do 
            it "returns the proper case" do
                expect(Cipher.new.convert_to_cipher('Happy Birthday', 2)).to eq("Jcrra Dktvjfca")
            end
        end
        
        context 'when input has punctuation' do
            it "does't change punctuation" do
                expect(Cipher.new.convert_to_cipher('Happy Birthday, Jim!', 2)).to eq("Jcrra Dktvjfca, Lko!")
            end
        end

        context 'when shift_by is greater than 26' do 
            it "loops back around to the proper sequence" do 
                expect(Cipher.new.convert_to_cipher('Happy Birthday', 28)).to eq("Jcrra Dktvjfca")
            end
        end
    end
end