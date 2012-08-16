require 'helper'

describe Usercycle::Cohort::GetFirstOfMonth do
  
  context "Passing in the first" do
    Given(:date) do
      Usercycle::Cohort::GetFirstOfMonth.new( Time.new(2012,8,1)).get
    end
    Then { date.day.should == 1 }
  end

  context "Passing in a later date" do
    Given(:date) do
      Usercycle::Cohort::GetFirstOfMonth.new( Time.new(2012,8,13)).get
    end
    Then { date.day.should == 1 }
  end
end

