require "httparty"
require "usercycle/version"
require "usercycle/event"


module Usercycle
  
  class Client
    
    def initialize(key, host)
      @api_key = key
      self.class.headers 'X-Usercycle-API-Key' => @api_key
    end
    
    include HTTParty
    include Event

    base_uri host
    format :json
  end
end
