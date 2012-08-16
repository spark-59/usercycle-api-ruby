require 'helper'

describe Usercycle::Cohort::GetPreviousMonday do
  
  context "Passing in a Sunday" do
    Given(:date) do
      # August 12, 2012 was a Sunday
      Usercycle::Cohort::GetPreviousMonday.new( Time.new(2012,8,12)).monday
    end
    Then { date.day.should == 6 }
    Then { date.wday.should == 1 } 
  end

  context "Passing in a Monday" do
    Given(:date) do
      # August 13, 2012 was a Monday
      Usercycle::Cohort::GetPreviousMonday.new(Time.new(2012,8,13)).monday
    end
    Then { date.day.should == 13 }
    Then { date.wday.should == 1 } 
  end

  context "Passing in a Tuesday" do
    Given(:date) do
      # August 14, 2012 was a Tuesday
      Usercycle::Cohort::GetPreviousMonday.new(Time.new(2012,8,14)).monday
    end
    Then { date.day.should == 13 }
    Then { date.wday.should == 1 } 
  end

  context "Passing in a Wednesday" do
    Given(:date) do
      # August 15, 2012 was a Wednesday
      Usercycle::Cohort::GetPreviousMonday.new(Time.new(2012,8,15)).monday
    end
    Then { date.day.should == 13 }
    Then { date.wday.should == 1 } 
  end
end

