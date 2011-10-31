module Wristwatch
  class Dispatch
    include Enumerable

    def initialize(tasks, schedule)
      @tasks = tasks
      @schedule = schedule
    end

    def list
      @schedule.inject([]) {|list, interval| list += @tasks[interval] }
    end

    def each
      list.each {|item| yield item }
    end

    def execute
      list.each(&:call)
    end
  end
end
