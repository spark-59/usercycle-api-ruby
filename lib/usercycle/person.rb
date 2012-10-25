module Usercycle
  module Person
    def person
      @person ||= Person.new self
    end

    class Person
      def initialize(client)
        @client = client
      end

      def find_by_id(id, options={})
        @client.class.get("/people.json?id=#{id}", @client.options.merge(options))
      end

      def find_by_identity(identity, options={})
        @client.class.get("/people.json?identity=#{identity}", @client.options.merge(options))
      end
    end
  end
end
