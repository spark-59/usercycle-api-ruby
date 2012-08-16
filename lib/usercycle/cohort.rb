require 'timeout'
require 'usercycle/cohort/get_previous_monday'
require 'usercycle/cohort/get_first_of_month'

module Usercycle
  module Cohort
    
    def cohort
      @cohort ||= Cohort.new self
    end
    
    class Cohort
      
      def initialize(client)
        @client = client
      end
      
      # Get daily cohort data
      #
      #  client = Usercycle::Client.new(API_KEY)
      #  client.cohort.get_daily(start_date, [count])
      #
      def get_daily(start_date, count = 4)
        date = formatted_date(start_date)
        @client.class.get("/cohorts/daily/#{date}.json?count=#{count}")
      end

      # Get weekly cohort data
      #
      #  client = Usercycle::Client.new(API_KEY)
      #  client.cohort.get_weekly(start_date, [count])
      #
      def get_weekly(start_date, count = 4)
        date = formatted_date(Usercycle::Cohort::GetPreviousMonday.new(start_date).monday)
        @client.class.get("/cohorts/weekly/#{date}.json?count=#{count}")
      end

      # Get monthly cohort data
      #
      #  client = Usercycle::Client.new(API_KEY)
      #  client.cohort.get_monthly(start_date, [count])
      #
      def get_monthly(start_date, count = 4)
        date = formatted_date(Usercycle::Cohort::GetFirstOfMonth.new(start_date).get)
        @client.class.get("/cohorts/monthly/#{date}.json?count=#{count}")
      end

      private

      def formatted_date(date)
        date.strftime("%Y-%m-%d")
      end
    end
  end
end

