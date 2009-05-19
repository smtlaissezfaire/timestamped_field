require File.dirname(__FILE__) + "/../spec_helper"

module TimestampedBoolean
  describe Version do
    it "should have the string as 0.0.1" do
      TimestampedBoolean::Version::STRING.should == "0.0.1"
    end
  end
end
