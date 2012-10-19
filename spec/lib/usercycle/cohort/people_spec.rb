require 'helper'

describe Usercycle::Cohort::People do

  describe '#get_daily' do
    before do
      stub_get("cohorts/daily/2012-08-13.json?macro=AARRR&load_people=true&event=signed_up").
             with(:headers => {'X-Usercycle-Api-Key'=>'key'}).
             to_return(:status => 200, :body => "", :headers => {})
    end

    context do
      Given(:client) { Usercycle::Client.new('key') }
      Given(:response) { client.cohort.people.get_daily(Time.new(2012,8,13)) }
      Then { response.code.should == 200 }
    end
  end

  describe '#get_weekly' do
    before do
      stub_get("cohorts/weekly/2012-08-13.json?macro=AARRR&load_people=true&event=signed_up").
             with(:headers => {'X-Usercycle-Api-Key'=>'key'}).
             to_return(:status => 200, :body => "", :headers => {})
    end

    context do
      Given(:client) { Usercycle::Client.new('key') }
      Given(:response) { client.cohort.people.get_weekly(Time.new(2012,8,13)) }
      Then { response.code.should == 200 }
    end
  end

  describe '#get_monthly' do
    before do
      stub_get("cohorts/monthly/2012-08-01.json?macro=AARRR&load_people=true&event=signed_up").
             with(:headers => {'X-Usercycle-Api-Key'=>'key'}).
             to_return(:status => 200, :body => "", :headers => {})
    end

    context do
      Given(:client) { Usercycle::Client.new('key') }
      Given(:response) { client.cohort.people.get_monthly(Time.new(2012,8,13)) }
      Then { response.code.should == 200 }
    end
  end
end

