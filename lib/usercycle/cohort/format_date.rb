module Usercycle
  module Cohort
    class FormatDate
      def initialize(date)
        @date = date
      end

      def get
        @date.strftime("%Y-%m-%d")
      end
    end
  end
end
