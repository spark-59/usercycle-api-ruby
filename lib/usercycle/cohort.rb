require 'usercycle/cohort/stats'

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
    end
  end
end

