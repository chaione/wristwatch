module Wristwatch
  class Schedule
    include Intervals
    include Enumerable

    attr_reader :now

    def initialize(time = Time.now)
      @now = time
    end

    def intervals
      available_intervals.select { |interval| send(interval) }
    end

    def available_intervals
      Intervals.instance_methods
    end

    def each
      intervals.each do |interval|
        yield interval
      end
    end

    def method_missing(meth, *args, &blk)
      if meth.to_s[meth.to_s.length - 1, 1] === "?"
        begin
          send(meth[0, meth.to_s.length - 1], *args, &blk)
        rescue NoMethodError
          super(meth, *args, &blk)
        end
      else
        super(meth, *args, &blk)
      end
    end
  end
end
