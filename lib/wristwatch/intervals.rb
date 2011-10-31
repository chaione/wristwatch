module Wristwatch
  module Intervals
    def hourly
      true
    end

    def bi_hourly
      now.hour.divisible_by?(2)
    end

    def quarter_hourly
      now.hour.divisible_by?(6)
    end

    def bi_daily
      now.hour.divisible_by?(12)
    end

    def daily
      now.hour.eql?(0)
    end

    def weekly
      daily and now.wday.eql?(0)
    end

    def bi_weekly
      daily and ( now.day.eql?(1) or now.day.eql?(15) )
    end

    def monthly
      daily and now.day.eql?(1)
    end

    def bi_monthly
      daily and monthly and now.month.divisible_by?(2, 1)
    end

    def quarterly
      daily and monthly and now.month.divisible_by?(3, 1)
    end

    def semiannually
      daily and monthly and now.month.divisible_by?(6, 1)
    end

    def annually
      daily and monthly and now.month.eql?(1)
    end
  end
end
