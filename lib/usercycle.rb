require "httparty"
require "usercycle/version"
require "usercycle/event"


module Usercycle
  
  class Client
    
    def initialize(key, host = nil)
      @api_key = key
      self.class.headers 'X-Usercycle-API-Key' => @api_key
      self.class.base_uri host || "api.usercycle.com/api/v1"
    end
    
    include HTTParty
    include Event
    format :json
  end
end
