require 'spec_helper'

describe Wristwatch::Dispatch do
  let(:schedule) { Wristwatch::Schedule.new }
  let(:tasks) { {
      :daily   => ["daily_task_1", "daily_task_2", "daily_task_3"],
      :monthly => ["monthly_task"],
      :weekly  => ["weekly_task_1", "weekly_task_2"]
  } }
  before(:each) do
    schedule.stub(:intervals).and_return([:daily, :weekly])
  end

  subject { Wristwatch::Dispatch.new(tasks, schedule) }

  its(:list) { should eql ["daily_task_1", "daily_task_2", "daily_task_3", "weekly_task_1", "weekly_task_2"] }

  describe "#execute" do
    let(:proc_1) { "a proc" }
    let(:proc_2) { "another proc" }
    before(:each) do
      subject.stub(:list).and_return([proc_1, proc_2])
    end

    it "executes each proc in the dispatch in order" do
      proc_1.should_receive(:call)
      proc_2.should_receive(:call)
      subject.execute
    end
  end
end
