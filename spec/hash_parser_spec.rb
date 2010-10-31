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
      parser.parse_string = '{:foo => "bar"}'
      condensed_string = parser.condense_string
      condensed_string.should == '{:foo=>"bar"}'
    end

    it "should not condense hash values with spaces" do
      parser.parse_string = '{:foo => "bar baz"}'
      condensed_string = parser.condense_string
      condensed_string.should == '{:foo=>"bar baz"}'
    end

  end

  context "stripper" do

    it "should strip curly and quote marks braces" do
      parser.parse_string = '{:foo => "bar"}'
      stripped_string = parser.strip_string
      stripped_string.should == 'foo => bar'
    end

  end

  context "parser" do

    let(:parser) { HashParser.new }

    it "should parse a hash string with a single value" do
      parser.parse_string = '{:foo => "bar"}'
      parser.parse["foo"].should match("bar")
    end

    it "should parse a hash string with multiple values" do
      parser.parse_string = '{:foo => "bar", :baz => "qux"}'
      parser.parse["foo"].should match("bar")
      parser.parse["baz"].should match("qux")
    end

  end

end
