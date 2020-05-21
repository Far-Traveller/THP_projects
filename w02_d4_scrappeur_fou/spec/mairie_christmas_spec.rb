require_relative '../lib/mairie_christmas.rb'

describe "get_townhall_email method" do
  it "should return an array" do
    expect(get_townhall_email(townhall_url)).to be_instance_of Array
  end

  it "should not be nil" do
    expect(get_townhall_email(townhall_url)).not_to be_nil
  end
end