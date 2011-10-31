module Wristwatch
  class Dispatch

    def initialize(tasks, schedule)
      @tasks = tasks
      @schedule = schedule
    end

    def list
      @schedule.inject([]) {|list, interval| list += @tasks[interval] }
    end

    def execute
      list.each(&:call)
    end
  end
end
