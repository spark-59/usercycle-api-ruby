require 'httparty'
require 'usercycle/version'
require 'usercycle/event'
require 'usercycle/cohort'
require 'usercycle/person'

module Usercycle
  class Client
    include HTTParty
    include Event
    include Cohort
    include Person

    attr_accessor :api_key
    attr_accessor :options

    format :json
    default_timeout 10

    def initialize(key, host = nil)
      host ||= "api.usercycle.com/api/v1"
      host = "http://" + host unless host[/http(s)\:\/\//]

      @api_key = key
      @options = {:headers => {'X-Usercycle-API-Key' => @api_key},
                  :base_uri => host}
    end
  end
end
