module Usercycle
  module Cohort
    class GetFirstOfMonth
      def initialize(date)
        @date = date
      end

      def get
        Time.new(@date.year, @date.month, 1)
      end
    end
  end
end

