require 'timeout'

module Usercycle
  module Event
    
    def event
      @event ||= Event.new self
    end
    
    class Event
      
      def initialize(client)
        @client = client
      end
      
      # List events by identity
      #
      #  client = Usercycle::Client.new(API_KEY)
      #  client.event.find_by_identity('john.smith@example.com')
      #
      def find_by_identity(identity, options={})
        @client.class.get("/events.json?identity=#{identity}", options)
      end

      # Creating an event
      #
      #  client = Usercycle::Client.new(API_KEY)
      #  client.event.create('john.smith@example.com', 'signed_up',
      #                      { first_name: 'John', last_name: 'Smith' }, DateTime.now)
      #
      def create(identity, action_name, properties={}, occurred_at = nil)
        options = { :body => {
                    :identity => identity,
                    :action_name => action_name,
                    :properties => properties,
                    :occurred_at => occurred_at }}
        begin
          timeout(3) do
            @client.class.post('/events.json', options)
          end
        rescue SocketError
        rescue Timeout::Error
        rescue Errno::ECONNREFUSED
          false
        rescue => e
          if defined?(Rails.logger)
            Rails.logger.error e.inspect
          end
          false
        end
      end

      # Getting an event
      #
      # client = Usercycle::Client.new(API_KEY)
      # client.event.get(uuid)
      #
      def get(uuid)
        @client.class.get("/events/#{uuid}.json")
      end
    end
  end
end
