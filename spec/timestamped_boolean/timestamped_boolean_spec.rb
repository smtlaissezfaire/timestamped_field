require File.dirname(__FILE__) + "/../spec_helper"

describe TimestampedBoolean do
  before do
    @now = Time.now
    Time.stub!(:now).and_return @now
  end

  def new_object(&block)
    klass = Class.new do
      include TimestampedBoolean

      attr_accessor :foo_changed_at
      attr_accessor :bar_changed_at
    end

    klass.instance_eval(&block)
    klass.new
  end

  it "should add a accessor to a class" do
    obj = new_object do
      timestamped_boolean :foo
    end

    obj.foo = true
    obj.foo.should be_true
  end

  it "should add the correct accessor" do
    obj = new_object do
      timestamped_boolean :bar
    end

    obj.bar = true
    obj.bar.should be_true
  end

  it "should set the 'changed_at' column to the current timestamp" do
    obj = new_object do
      timestamped_boolean :foo
    end

    obj.foo = true
    obj.foo_changed_at.should == @now
  end
end
