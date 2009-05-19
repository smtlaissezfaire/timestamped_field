require File.dirname(__FILE__) + "/../spec_helper"

describe TimestampedField do
  before do
    @now = Time.now
    Time.stub!(:now).and_return @now
  end

  def new_object(&block)
    klass = Class.new do
      include TimestampedField

      attr_accessor :foo
      attr_accessor :bar

      attr_accessor :foo_changed_at
      attr_accessor :bar_changed_at

      def write_attribute(field, val)
        instance_variable_set("@#{field}", val)
      end
    end

    klass.instance_eval(&block)
    klass.new
  end

  it "should set the 'changed_at' column to the current timestamp" do
    obj = new_object do
      timestamped_field :foo
    end

    obj.foo = true
    obj.foo_changed_at.should == @now
  end

  it "should set the value of the column" do
    obj = new_object do
      timestamped_field :foo
    end

    obj.foo = true
    obj.foo.should be_true
  end

  it "should set the value of the correct column" do
    obj = new_object do
      timestamped_field :bar
    end

    obj.bar = true
    obj.bar.should be_true
  end

  it "should set the variable by calling the '=' method" do
    obj = new_object do
      timestamped_field :foo
    end

    obj.bar = true
  end

  class User < ActiveRecord::Base
    include TimestampedField
    
    timestamped_field :foo
    timestamped_field :name
  end

  it "should set the variable with a real AR instance" do
    @user = User.new

    @user.foo = true
    @user.foo.should be_true
  end
  
  it "should be able to timestamp a non-boolean column" do
    @user = User.new
    @user.name = "Foo"
    @user.name_changed_at.should == @now
  end
end
