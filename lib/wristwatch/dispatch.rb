module Wristwatch
  class Dispatch

    def initialize(tasks, schedule)
      @tasks = tasks
      @schedule = schedule
    end

    def list
      @schedule.inject([]) {|list, interval| list += @tasks[interval] if @tasks[interval]; list }
    end

    def execute
      list.each(&:call)
    end
  end
end
