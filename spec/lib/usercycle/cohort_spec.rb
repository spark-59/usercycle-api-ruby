require 'helper'

describe Usercycle::Cohort do

  describe '#get_daily' do
    before do
      stub_get("cohorts/daily/2012-08-13.json?count=4").
             with(:headers => {'X-Usercycle-Api-Key'=>'key'}).
             to_return(:status => 200,
                       :body => "{ \"cohort\": \"2012-08-13T00:00:00-05:00\", \"type\": \"AARRR\" }",
                       :headers => {})
    end

    context do
      Given(:client) { Usercycle::Client.new('key') }
      Given(:response) { client.cohort.get_daily(Time.new(2012,8,13)) }
      Then { response.body.should_not be_empty }
    end
  end

  describe '#get_weekly' do
    before do
      stub_get("cohorts/weekly/2012-08-13.json?count=4").
             with(:headers => {'X-Usercycle-Api-Key'=>'key'}).
             to_return(:status => 200,
                       :body => "{ \"cohort\": \"2012-08-13T00:00:00-05:00\", \"type\": \"AARRR\" }",
                       :headers => {})
    end

    context do
      Given(:client) { Usercycle::Client.new('key') }
      Given(:response) { client.cohort.get_weekly(Time.new(2012,8,13)) }
      Then { response.body.should_not be_empty }
    end
  end

  describe '#get_monthly' do
    before do
      stub_get("cohorts/monthly/2012-08-01.json?count=4").
             with(:headers => {'X-Usercycle-Api-Key'=>'key'}).
             to_return(:status => 200,
                       :body => "{ \"cohort\": \"2012-08-01T00:00:00-05:00\", \"type\": \"AARRR\" }",
                       :headers => {})
    end

    context do
      Given(:client) { Usercycle::Client.new('key') }
      Given(:response) { client.cohort.get_monthly(Time.new(2012,8,13)) }
      Then { response.body.should_not be_empty }
    end
  end

end

