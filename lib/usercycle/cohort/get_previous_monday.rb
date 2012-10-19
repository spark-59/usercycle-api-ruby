module Usercycle
  module Cohort
    class GetPreviousMonday
      def initialize(date)
        @date = date
      end

      def get
        day_of_week = @date.wday
        if day_of_week == 0
          return @date - 6*24*3600
        elsif day_of_week == 1
          return @date 
        else
          return @date - (day_of_week-1)*24*3600
        end
      end
    end
  end
end
