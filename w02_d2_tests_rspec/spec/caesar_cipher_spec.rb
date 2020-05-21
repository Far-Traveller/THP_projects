require relative '../lib/caesar_cipher.rb'

describe "the caesar_cipher method" do 
  it "should return another letter than the one asked" do
    expect(caesar_cipher("A", 5)).to eq("E")
  end
end