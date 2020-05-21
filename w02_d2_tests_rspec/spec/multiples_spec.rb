require_relative '../lib/multiple.rb'

describe "the is_multiple_of_3_or_5? method" do
  it "should return TRUE when an integer is a multiple of 3 or 5" do
    expect(is_multiple_of_3_or_5?(3)).to eq(true)
    expect(is_multiple_of_3_or_5?(5)).to eq(true)
    expect(is_multiple_of_3_or_5?(51)).to eq(true)
    expect(is_multiple_of_3_or_5?(45)).to eq(true)
  end

  it "should return FALSE when an integer is NOT a multiple of 3 or 5" do
    expect(is_multiple_of_3_or_5?(1)).to eq(false)
    expect(is_multiple_of_3_or_5?(13)).to eq(false)
    expect(is_multiple_of_3_or_5?(43)).to eq(false)
    expect(is_multiple_of_3_or_5?(68)).to eq(false)
  end
end

describe "the sum_of_3_or_5_multiples" do
  it "should return the result when it is possible" do
    expect(sum_of_3_or_5_multiples(7)).to eq(14)
    expect(sum_of_3_or_5_multiples(11)).to eq(33)
    expect(sum_of_3_or_5_multiples(10)).to eq(23)
    expect(sum_of_3_or_5_multiples(200)).to eq(9168)
  end

  it "should return false when it is not a good variable" do
    expect(sum_of_3_or_5_multiples(-1)).to eq("What are you doing, you stupid! I need integer, so start AGAIN!!")
    expect(sum_of_3_or_5_multiples("I'm stupid")).to eq("What are you doing, you stupid! I need integer, so start AGAIN!!")
    expect(sum_of_3_or_5_multiples(1.3)).to eq("What are you doing, you stupid! I need integer, so start AGAIN!!")
  end
end
