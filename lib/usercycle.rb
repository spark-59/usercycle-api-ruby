require 'httparty'
require 'usercycle/version'
require 'usercycle/event'
require 'usercycle/cohort'

module Usercycle
  class Client
    include HTTParty
    include Event
    include Cohort
    
    attr_accessor :api_key
    attr_accessor :options
    
    format :json
    default_timeout 10
    
    def initialize(key, host = nil)
      @api_key = key
      @options = {}
      @options[:headers] = {'X-Usercycle-API-Key' => @api_key}
      @options[:base_uri] = host || "http://api.usercycle.com/api/v1"
    end
  end
end
