module Wristwatch
  class Task
    attr_reader :name
    def initialize(*args, &blk)
      @options = args.last.is_a?(Hash) ? args.last : {}
      @name = args[0]
      @proc = blk
    end

    def call
      puts "running '#{name}'"
      @proc.call
    end
  end
end
