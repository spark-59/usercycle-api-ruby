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
      #  client.event.create('john.smith@example.com', 'signed_up', :first_name => 'John', :last_name => 'Smith'
      #
      def create(identity, action, properties={})
        options = { :body => {
                    :identity => identity,
                    :action => action,
                    :properties => properties }}
        @client.class.post('/events.json', options)
      end
    end
  end
end