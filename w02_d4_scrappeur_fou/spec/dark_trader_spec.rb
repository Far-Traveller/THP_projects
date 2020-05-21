require_relative '../lib/dark_Trader.rb'

describe "crypto_scrapper method" do
  it "should not be nil" do
    expect(crypto_scrapper).not_to be_nil
  end

    it "should return an array" do
    expect(crypto_scrapper).to be_instance_of Array
  end
end