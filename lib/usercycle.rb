require 'httparty'
require 'usercycle/version'
require 'usercycle/event'
require 'usercycle/cohort'

module Usercycle

  class Client
    attr_accessor :api_key

    def initialize(key, host = nil)
      @api_key = key
      self.class.headers 'X-Usercycle-API-Key' => @api_key
      self.class.base_uri host || "api.usercycle.com/api/v1"
    end

    include HTTParty
    include Event
    include Cohort
    format :json

    default_timeout 10
  end
end

