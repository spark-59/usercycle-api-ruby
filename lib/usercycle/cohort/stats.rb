require 'usercycle/cohort/format_date'
require 'usercycle/cohort/get_previous_monday'
require 'usercycle/cohort/get_first_of_month'

module Usercycle
  module Cohort
    module Stats
      def stats
        @stats ||= Stats.new @client
      end

      class Stats
        def initialize(client)
          @client = client
        end

        # Get daily cohort data
        #
        #  client = Usercycle::Client.new(API_KEY)
        #  client.cohort.get_daily(start_date, [count])
        #
        def get_daily(start_date, count = 4)
          date = Usercycle::Cohort::FormatDate.new(start_date).get
          @client.class.get("/cohorts/daily/#{date}.json?count=#{count}", @client.options)
        end

        # Get weekly cohort data
        #
        #  client = Usercycle::Client.new(API_KEY)
        #  client.cohort.get_weekly(start_date, [count])
        #
        def get_weekly(start_date, count = 4)
          date = Usercycle::Cohort::FormatDate.new(Usercycle::Cohort::GetPreviousMonday.new(start_date).get).get
          @client.class.get("/cohorts/weekly/#{date}.json?count=#{count}", @client.options)
        end

        # Get monthly cohort data
        #
        #  client = Usercycle::Client.new(API_KEY)
        #  client.cohort.get_monthly(start_date, [count])
        #
        def get_monthly(start_date, count = 4)
          date = Usercycle::Cohort::FormatDate.new(Usercycle::Cohort::GetFirstOfMonth.new(start_date).get).get
          @client.class.get("/cohorts/monthly/#{date}.json?count=#{count}", @client.options)
        end
      end
    end
  end
end

