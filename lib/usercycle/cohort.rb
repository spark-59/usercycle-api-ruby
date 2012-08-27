require 'usercycle/cohort/stats'
require 'usercycle/cohort/people'

module Usercycle
  module Cohort

    def cohort
      @cohort ||= Cohort.new self
    end

    class Cohort
      def initialize(client)
        @client = client
      end

      include Stats
      include People
    end
  end
end

