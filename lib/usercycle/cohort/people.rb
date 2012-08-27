require 'usercycle/cohort/format_date'
require 'usercycle/cohort/get_previous_monday'
require 'usercycle/cohort/get_first_of_month'

module Usercycle
  module Cohort
    module People

      def people
        @people ||= People.new @client
      end

      class People

        def initialize(client)
          @client = client
        end

        def get_daily(start_date, macro = 'AARRR')
          date = Usercycle::Cohort::FormatDate.new(start_date).get
          @client.class.get("/cohorts/daily/#{date}/people.json?macro=#{macro}")
        end

        def get_weekly(start_date, macro = 'AARRR')
          date = Usercycle::Cohort::FormatDate.new(Usercycle::Cohort::GetPreviousMonday.new(start_date).get).get
          @client.class.get("/cohorts/weekly/#{date}/people.json?macro=#{macro}")
        end

        def get_monthly(start_date, macro = 'AARRR')
          date = Usercycle::Cohort::FormatDate.new(Usercycle::Cohort::GetFirstOfMonth.new(start_date).get).get
          @client.class.get("/cohorts/monthly/#{date}/people.json?macro=#{macro}")
        end
      end
    end
  end
end

