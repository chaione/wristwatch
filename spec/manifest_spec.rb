require 'spec_helper'

describe Wristwatch::Manifest do
  describe "building tasks from a file" do
    before(:each) do
      subject.stub(:instructions).and_return( <<-RUBY

daily "A daily job" do
  "contents of a daily job"
end

hourly "An hourly job" do
  "contents of an hourly job"
end

hourly "Another hourly job" do
  "contents of another hourly job"
end

RUBY
      )
      subject.should_receive(:build_task).exactly(3).times
      subject.build
    end

    it { should have_key(:daily) }
    it { should have_key(:hourly) }

    it "should have two tasks in the hourly array" do
      subject[:hourly].should have(2).tasks
    end

  end
end
