require 'spec_helper'

describe "HashParser" do

  let(:parser) { HashParser.new }
  it "should create a new parser" do
    parser.should_not be_nil
  end

  it "should accept a string to be parsed" do
    parser.parse_string = ""
    parser.parse_string.should_not be_nil
  end

  context "condenser" do

    it "should condense a hash string" do
      condensed_string = parser.condense_string '{:foo => "bar"}'
      condensed_string.should == '{:foo=>"bar"}'
    end

    it "should not condense hash values with spaces" do
      condensed_string = parser.condense_string '{:foo => "bar baz"}'
      condensed_string.should == '{:foo=>"bar baz"}'
    end

  end

end
