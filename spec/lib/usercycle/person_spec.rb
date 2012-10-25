require 'helper'

describe Usercycle::Person do

  describe '#find_by_identity' do
    before do
      stub_get("people.json?id=42").
        with(:headers => {'X-Usercycle-Api-Key'=>'key'}).
        to_return(:status => 200, :body => "", :headers => {})
    end

    context do
      Given(:client) { Usercycle::Client.new('key') }
      Given(:response) { client.person.find_by_id(42) }
      Then { response.code.should == 200 }
    end
  end

  describe '#find_by_identity' do
    before do
      stub_get("people.json?identity=foo@bar.com").
        with(:headers => {'X-Usercycle-Api-Key'=>'key'}).
        to_return(:status => 200, :body => "", :headers => {})
    end

    context do
      Given(:client) { Usercycle::Client.new('key') }
      Given(:response) { client.person.find_by_identity('foo@bar.com') }
      Then { response.code.should == 200 }
    end
  end
end
