require 'spec_helper'

describe Wristwatch::Schedule do
  before(:each) { Time.stub!(:now).and_return(time) }

  context "whenever" do
    let(:time) { Time.new }
    it {should be_hourly}
    its(:intervals) {should include(:hourly)}
  end

  context "on even hours" do
    let(:time) { Time.new(2011, 3, 3, 2) }
    it {should be_bi_hourly}
    its(:intervals) {should include(:bi_hourly)}
  end

  describe "quarter-daily" do
    [6, 18].each do |hour|
      context "at #{hour} o'clock daily" do
        let(:time) {Time.new(2011, 3, 3, hour) }
        its(:intervals) { should eql [:hourly, :bi_hourly, :quarter_hourly]}
        it {should be_quarter_hourly }
      end
    end
  end

  describe "bi-daily" do
    context "at 12 o'clock daily" do
      let(:time) {Time.new(2011, 3, 3, 12) }
      its(:intervals) { should eql [:hourly, :bi_hourly, :quarter_hourly, :bi_daily]}
      it {should be_bi_daily }
    end
  end

  context "at midnight" do
    let(:time) { Time.new(2011, 3, 3) }
    its(:intervals) { should eql [:hourly, :bi_hourly, :quarter_hourly, :bi_daily, :daily]}
    it {should be_daily}
  end

  context "on Sunday" do
    let(:time) { Time.new(2011, 3, 6) }
    its(:intervals) { should eql [:hourly, :bi_hourly, :quarter_hourly, :bi_daily, :daily, :weekly] }
    it { should be_weekly }
  end

  context "on the 15th of the month" do
    let(:time) { Time.new(2011, 3, 15) }
    its(:intervals) { should eql [:hourly, :bi_hourly, :quarter_hourly, :bi_daily, :daily, :bi_weekly] }
    it { should be_bi_weekly }
  end

  context "monthly" do
    let(:time) { Time.new(2011, 2, 1) }
    its(:intervals) { should eql [:hourly, :bi_hourly, :quarter_hourly, :bi_daily, :daily, :bi_weekly, :monthly ] }
    it { should be_monthly }
  end

  context "bi-monthly" do
    let(:time) { Time.new(2011, 3, 1) }
    its(:intervals) { should eql [:hourly, :bi_hourly, :quarter_hourly, :bi_daily, :daily, :bi_weekly, :monthly, :bi_monthly ] }
    it { should be_bi_monthly }
  end

  describe "quarterly" do
    [4, 10].each do |month|
      context "on month #{month}" do
        let(:time) { Time.new(2011, month, 1) }
        its(:intervals) { should eql [:hourly, :bi_hourly, :quarter_hourly, :bi_daily, :daily, :bi_weekly, :monthly, :quarterly] }
        it { should be_quarterly }
      end
    end
  end

  describe "semiannually" do
    let(:time) { Time.new(2011, 7, 1) }
    its(:intervals) { should eql [:hourly, :bi_hourly, :quarter_hourly, :bi_daily, :daily, :bi_weekly, :monthly, :bi_monthly, :quarterly, :semiannually] }
    it { should be_semiannually }
  end

  describe "annually" do
    let(:time) { Time.new(2011, 1, 1) }
    its(:intervals) { should eql [:hourly, :bi_hourly, :quarter_hourly, :bi_daily, :daily, :bi_weekly, :monthly, :bi_monthly, :quarterly, :semiannually, :annually] }
    it { should be_annually }
  end
end
