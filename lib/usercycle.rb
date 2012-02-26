require "httparty"
require "usercycle/version"
require "usercycle/event"


module Usercycle
  
  class Client
    
    def initialize(key)
      @api_key = key
      self.class.headers 'X-Usercycle-API-Key' => @api_key
    end
    
    include HTTParty
    include Event

    base_uri "https://api.usercycle.com/api/v1"
    format :json
  end
end
