require File.dirname(__FILE__) + "/../spec_helper"

module TimestampedField
  describe Version do
    it "should have the string as 0.0.1" do
      TimestampedField::Version::STRING.should == "0.0.1"
    end
  end
end
